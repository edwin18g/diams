<?php

namespace App\Controllers;

class Dashboard extends Security_Controller {

    private $show_staff_on_staff = true;
    protected $Custom_widgets_model;

    function __construct() {
        parent::__construct();
        $this->Custom_widgets_model = model('App\Models\Custom_widgets_model');
    }

    public function index() {

        $view_data["dashboards"] = array();

        $dashboards = $this->Dashboards_model->get_details(array("user_id" => $this->login_user->id));

        if ($dashboards) {
            $view_data["dashboards"] = $dashboards->getResult();
        }

        $view_data["dashboard_type"] = "default";

        if ($this->login_user->user_type === "staff" && $this->show_staff_on_staff) {
            //admin or team member dashboard
            $staff_default_dashboard = get_setting("staff_default_dashboard");
            if ($staff_default_dashboard) {
                return $this->view($staff_default_dashboard);
            }

            $view_data["widget_columns"] = $this->make_dashboard($this->_get_admin_and_team_dashboard_data());
            $view_data["dashboard_id"] = 0;

            $this->Settings_model->save_setting("user_" . $this->login_user->id . "_dashboard", "", "user");
            return $this->template->rander("dashboards/custom_dashboards/view", $view_data);
        } else {
            // client dashboard
            $widgets = $this->_check_widgets_permissions();

            $client_default_dashboard = get_setting("client_default_dashboard");
            if ($client_default_dashboard) {
                $view_data["widget_columns"] = $this->make_dashboard(unserialize($client_default_dashboard));

                echo $this->template->rander("dashboards/custom_dashboards/view", $view_data);
            } else {
                $view_data['show_invoice_info'] = get_array_value($widgets, "show_invoice_info");
                $view_data["show_project_info"] = true; //client can view projects
                $view_data['hidden_menu'] = get_array_value($widgets, "hidden_menu");
                $view_data['client_info'] = get_array_value($widgets, "client_info");
                $view_data['client_id'] = get_array_value($widgets, "client_id");
                $view_data['page_type'] = get_array_value($widgets, "page_type");
                $view_data["custom_field_headers"] = $this->Custom_fields_model->get_custom_field_headers_for_table("projects", $this->login_user->is_admin, $this->login_user->user_type);
                $view_data["custom_field_filters"] = $this->Custom_fields_model->get_custom_field_filters("projects", $this->login_user->is_admin, $this->login_user->user_type);

                echo $this->template->rander("dashboards/client_dashboard", $view_data);
            }
        }

        $this->Settings_model->save_setting("user_" . $this->login_user->id . "_dashboard", "", "user");
    }

    private function _check_widgets_permissions() {
        if ($this->login_user->user_type === "staff" && $this->show_staff_on_staff) {
            $widgets = $this->_check_widgets_for_staffs();
        } else {
            $widgets = $this->_check_widgets_for_clients();
        }

        $plugin_widgets = array();
        $plugin_widgets = app_hooks()->apply_filters('app_filter_dashboard_widgets', $plugin_widgets);
        if ($plugin_widgets && is_array($plugin_widgets)) {
            foreach ($plugin_widgets as $plugin_widget) {
                if (is_array($plugin_widget)) {
                    $widgets[get_array_value($plugin_widget, "widget")] = true;
                }
            }
        }

        return $widgets;
    }

    private function _check_widgets_for_staffs() {
        //check which widgets are viewable to current logged in user
        $widget = array();

        $show_attendance = get_setting("module_attendance");
        $show_invoice = get_setting("module_invoice");
        $show_expense = get_setting("module_expense");
        $show_ticket = get_setting("module_ticket");
        $show_events = get_setting("module_event");
        $show_message = get_setting("module_message");
        $show_leave = get_setting("module_leave");
        $show_announcement = get_setting("module_announcement");
        $show_estimate = get_setting("module_estimate");
        $show_timesheet = get_setting("module_project_timesheet");
        $show_lead = get_setting("module_lead");

        $access_expense = $this->get_access_info("expense");
        $access_invoice = $this->get_access_info("invoice");
        $access_ticket = $this->get_access_info("ticket");
        $access_timecards = $this->get_access_info("attendance");
        $access_timesheets = $this->get_access_info("timesheet_manage_permission");
        $access_client = $this->get_access_info("client");
        $access_leads = $this->get_access_info("lead");
        $access_estiamtes = $this->get_access_info("estiamte");

        $widget["new_posts"] = get_setting("module_timeline");

        if ($show_attendance) {
            $widget["clock_in_out"] = true;
            $widget["timecard_statistics"] = true;
        }

        if ($show_events) {
            $widget["events_today"] = true;
            $widget["events"] = true;
        }

        if (get_setting("module_todo")) {
            $widget["todo_list"] = true;
        }

        //check module availability and access permission to show any widget

        if ($show_invoice && $show_expense && $access_expense->access_type === "all" && $this->can_view_invoices()) {
            $widget["income_vs_expenses"] = true;
            $widget["total_due"] = true;
        }

        if ($show_invoice && $this->can_view_invoices()) {
            $widget["invoice_statistics"] = true;
        }

        if ($show_ticket && $access_ticket->access_type) {
            $widget["ticket_status"] = true;
        }

        if ($show_attendance && $access_timecards->access_type === "all") {
            $widget["clock_status"] = true;
            $widget["members_clocked_in"] = true;
            $widget["members_clocked_out"] = true;
        }

        if ($show_ticket && ($this->login_user->is_admin || $access_ticket->access_type)) {
            $widget["new_tickets"] = true;
            $widget["open_tickets"] = true;
            $widget["closed_tickets"] = true;
            $widget["open_tickets_list"] = true;
        }

        if ($this->can_view_team_members_list()) {
            $widget["all_team_members"] = true;
        }

        if ($this->can_view_team_members_list() && $show_attendance && $access_timecards->access_type === "all") {
            $widget["clocked_in_team_members"] = true;
            $widget["clocked_out_team_members"] = true;
        }

        if ($this->can_view_team_members_list() && $show_message) {
            $widget["latest_online_team_members"] = true;
        }

        if ($show_message && ($this->login_user->is_admin || $access_client->access_type)) {
            $widget["latest_online_client_contacts"] = true;
        }

        if ($show_invoice && $this->can_view_invoices()) {
            $widget["total_invoices"] = true;
            $widget["total_payments"] = true;
            $widget["draft_invoices_value"] = true;
            $widget["invoice_overview"] = true;
        }

        if ($show_expense && $show_invoice && $this->can_view_invoices()) {
            $widget["total_due"] = true;
        }

        if ($show_timesheet && $this->login_user->is_admin) {
            $widget["all_timesheets_statistics"] = true;
        }

        if ($show_leave) {
            $widget["pending_leave_approval"] = true;
        }

        if ($this->can_manage_all_projects() && !$this->has_all_projects_restricted_role()) {
            $widget["open_projects"] = true;
            $widget["completed_projects"] = true;
        }

        if (get_setting("module_attendance") == "1" && ($this->login_user->is_admin || $access_timecards->access_type)) {
            $widget["total_hours_worked"] = true;
        }

        if (get_setting("module_project_timesheet") == "1" && ($this->login_user->is_admin || ($access_timesheets->access_type && !$this->has_all_projects_restricted_role()))) {
            $widget["total_project_hours"] = true;
        }

        if ($this->login_user->is_admin || (get_array_value($this->login_user->permissions, "can_manage_all_projects") === "1" && !$this->has_all_projects_restricted_role())) {
            $widget["active_members_on_projects"] = true;
        }

        if ($show_invoice && $this->can_view_invoices()) {
            $widget["draft_invoices"] = true;
        }

        if ($this->login_user->is_admin || $access_client->access_type) {
            $widget["total_clients"] = true;
            $widget["total_contacts"] = true;
        }

        if ($show_lead && ($this->login_user->is_admin || $access_leads->access_type)) {
            $widget["total_leads"] = true;
        }

        if ($show_estimate && ($this->login_user->is_admin || $access_estiamtes->access_type)) {
            $widget["estimate_sent_statistics"] = true;
        }

        if ($this->can_view_team_members_list() && $show_attendance && $access_timecards->access_type === "all" && $show_leave) {
            $widget["team_members_overview"] = true;
        }

        if (can_access_reminders_module()) {
            $widget["next_reminder"] = true;
        }

        if (!$this->has_all_projects_restricted_role()) {
            $widget["my_timesheet_statistics"] = get_setting("module_project_timesheet");
            $widget["open_projects_list"] = true;
            $widget["project_timeline"] = true;
            $widget["starred_projects"] = true;
            $widget["my_tasks_list"] = true;
            $widget["my_open_tasks"] = true;
            $widget["task_status"] = true;
            $widget["all_tasks_kanban"] = true;
            $widget["projects_overview"] = true;
            $widget["all_tasks_overview"] = true;
        }

        if ($show_announcement) {
            $widget["last_announcement"] = true;
        }

        //universal widgets
        $widget["sticky_note"] = true;

        return $widget;
    }

    private function _check_widgets_for_clients() {
        //check widgets permission for client users

        $widget = array();

        $options = array("id" => $this->login_user->client_id);
        $client_info = $this->Clients_model->get_details($options)->getRow();
        $hidden_menu = explode(",", get_setting("hidden_client_menus"));

        $show_invoice_info = get_setting("module_invoice");
        $show_events = get_setting("module_event");

        $widget['show_invoice_info'] = $show_invoice_info;
        $widget['hidden_menu'] = $hidden_menu;
        $widget['client_info'] = $client_info;

        if (is_object($client_info) && property_exists($client_info, "id")) {
            $widget['client_id'] = $client_info->id;
        } else {
            $widget['client_id'] = 0;
        }

        $widget['page_type'] = "dashboard";

        if ($show_invoice_info) {
            if (!in_array("projects", $hidden_menu)) {
                $widget["total_projects"] = true;
            }
            if (!in_array("invoices", $hidden_menu)) {
                $widget["total_invoices"] = true;
            }
            if (!in_array("payments", $hidden_menu)) {
                $widget["total_payments"] = true;
                $widget["total_due"] = true;
            }
        }

        if (!in_array("projects", $hidden_menu)) {
            $widget["open_projects_list"] = true;
        }

        if (get_setting("client_can_view_activity") && get_setting("client_can_view_overview")) {
            $widget["project_timeline"] = true;
        }

        if ($show_events && !in_array("events", $hidden_menu)) {
            $widget["events"] = true;
        }

        if ($show_invoice_info && !in_array("invoices", $hidden_menu)) {
            $widget["invoice_statistics"] = true;
        }

        if ($show_events && !in_array("events", $hidden_menu)) {
            $widget["events_today"] = true;
        }

        if (get_setting("module_todo")) {
            $widget["todo_list"] = true;
        }

        if (!in_array("tickets", $hidden_menu) && get_setting("module_ticket") && $this->access_only_allowed_members_or_client_contact($this->login_user->client_id)) {
            $widget["new_tickets"] = true;
            $widget["open_tickets"] = true;
            $widget["closed_tickets"] = true;
            $widget["open_tickets_list"] = true;
        }

        if (get_setting("module_announcement")) {
            $widget["last_announcement"] = true;
        }

        //universal widgets
        $widget["sticky_note"] = true;

        return $widget;
    }

    public function save_sticky_note() {
        $note_data = array("sticky_note" => $this->request->getPost("sticky_note"));
        $this->Users_model->ci_save($note_data, $this->login_user->id);
    }

    function modal_form($id = 0) {
        $view_data['model_info'] = $this->Dashboards_model->get_one($id);
        return $this->template->view("dashboards/custom_dashboards/modal_form", $view_data);
    }

    function custom_widget_modal_form($id = 0) {
        $view_data['model_info'] = $this->Custom_widgets_model->get_one($id);
        return $this->template->view("dashboards/custom_widgets/modal_form", $view_data);
    }

    function save_custom_widget() {
        $id = $this->request->getPost("id");

        if ($id) {
            $custom_widget_info = $this->_get_my_custom_widget($id);
            if (!$custom_widget_info) {
                app_redirect("forbidden");
            }
        }

        $data = array(
            "user_id" => $this->login_user->id,
            "title" => $this->request->getPost("title"),
            "content" => $this->request->getPost("content"),
            "show_title" => is_null($this->request->getPost("show_title")) ? "" : $this->request->getPost("show_title"),
            "show_border" => is_null($this->request->getPost("show_border")) ? "" : $this->request->getPost("show_border")
        );

        $save_id = $this->Custom_widgets_model->ci_save($data, $id);

        if ($save_id) {
            $custom_widgets_info = $this->Custom_widgets_model->get_one($save_id);

            $custom_widgets_data = array(
                $custom_widgets_info->id => $custom_widgets_info->title
            );

            echo json_encode(array("success" => true, "id" => $save_id, "custom_widgets_row" => $this->_make_widgets_row($custom_widgets_data), "custom_widgets_data" => $this->_widgets_row_data($custom_widgets_data), 'message' => app_lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => app_lang('error_occurred')));
        }
    }

    function show_my_dashboards() {
        $view_data["dashboards"] = $this->Dashboards_model->get_details(array("user_id" => $this->login_user->id))->getResult();
        return $this->template->view('dashboards/list/dashboards_list', $view_data);
    }

    function view($id = 0) {

        validate_numeric_value($id);

        $selected_dashboard_id = get_setting("user_" . $this->login_user->id . "_dashboard");
        if (!$id) {
            $id = $selected_dashboard_id;
        }

        $dashboard_info = $this->_get_my_dashboard($id, $this->is_staff_dashboard($id));

        if ($dashboard_info) {
            if (get_setting("disable_dashboard_customization_by_clients") && $this->login_user->user_type == "client") {
                app_redirect("forbidden");
            }

            $user_selected_dashboard = $dashboard_info->id;
            if ($this->is_staff_dashboard($id)) {
                $user_selected_dashboard = "";
            }

            $this->Settings_model->save_setting("user_" . $this->login_user->id . "_dashboard", $user_selected_dashboard, "user");

            $view_data["dashboard_info"] = $dashboard_info;
            $view_data["widget_columns"] = $this->make_dashboard(unserialize($dashboard_info->data));

            $view_data["dashboards"] = $this->Dashboards_model->get_details(array("user_id" => $this->login_user->id))->getResult();
            $view_data["dashboard_type"] = "custom";
            $view_data["dashboard_id"] = $id;

            return $this->template->rander("dashboards/custom_dashboards/view", $view_data);
        } else {
            app_redirect("dashboard"); //no dashbord selected. go to default dashboard  
        }
    }

    private function _convert_widgets_array_to_formated_obj($row_widgets = array()) {
        $dashboard_data = array();

        foreach ($row_widgets as $widgets) {

            $columns_array = get_array_value($widgets, "columns");
            $ratio = get_array_value($widgets, "ratio");
            $widget_obj = new \stdClass();

            $columns = array();
            foreach ($columns_array as $column) {
                $column_rows = array();
                foreach ($column as $widget) {
                    $inner_widget = new \stdClass();
                    $inner_widget->widget = $widget;
                    $column_rows[] = $inner_widget;
                }
                $columns[] = $column_rows;
            }

            $widget_obj->columns = $columns;
            $widget_obj->ratio = $ratio;

            $dashboard_data[] = $widget_obj;
        }
        return $dashboard_data;
    }

    private function _get_admin_and_team_dashboard_widgets() {

        $widgets = $this->_check_widgets_permissions();
        $first_row = $this->_get_first_row_of_admin_and_team_dashboard($widgets);

        $row_columns = $this->_get_second_and_third_row_of_admin_and_team_dashboard_widget_columns($widgets);
        $second_row = $this->_get_second_row_of_admin_and_team_dashboard($row_columns);
        $third_row = $this->_get_third_row_of_admin_and_team_dashboard($row_columns);

        $fourth_row = $this->_get_fourth_row_of_admin_and_team_dashboard($widgets);
        $fifth_row = $this->_get_fifth_row_of_admin_and_team_dashboard($widgets);

        $row_widgets = array(
            $first_row,
            $second_row,
            $third_row,
            $fourth_row,
            $fifth_row
        );

        return $row_widgets;
    }

    private function _get_first_row_of_admin_and_team_dashboard($widgets) {

        $row = array();
        $columns = array();

        if (get_array_value($widgets, "clock_in_out")) {
            $columns[] = array("clock_in_out");
        }

        $columns[] = array("my_open_tasks");

        if (get_array_value($widgets, "events_today")) {
            $columns[] = array("events_today");
        }

        if (get_array_value($widgets, "total_due")) {
            $columns[] = array("total_due");
        }

        if (count($columns) < 4 && get_array_value($widgets, "total_clients")) {
            $columns[] = array("total_clients");
        }

        if (count($columns) < 4 && get_array_value($widgets, "total_leads")) {
            $columns[] = array("total_leads");
        }

        if (count($columns) < 4 && get_array_value($widgets, "total_contacts")) {
            $columns[] = array("total_contacts");
        }


        if (count($columns) < 4 && get_array_value($widgets, "new_posts")) {
            $columns[] = array("new_posts");
        }

        if (count($columns) < 4 && get_array_value($widgets, "total_hours_worked")) {
            $columns[] = array("total_hours_worked");
        }

        if (count($columns) < 4 && get_array_value($widgets, "open_projects")) {
            $columns[] = array("open_projects");
        }


        $ratio = "3-3-3-3";
        if (count($columns) == 3) {
            $ratio = "4-4-4";
        } else if (count($columns) == 2) {
            $ratio = "6-6";
        }


        $row["columns"] = $columns;
        $row["ratio"] = $ratio;

        return $row;
    }

    private function _get_second_and_third_row_of_admin_and_team_dashboard_widget_columns($widgets) {
        $columns = array();

        if (get_array_value($widgets, "projects_overview")) {
            if (get_array_value($widgets, "next_reminder")) {
                $columns[] = array("projects_overview", "next_reminder");
            } else {
                $columns[] = array("projects_overview");
            }
        }


        if (get_array_value($widgets, "invoice_overview")) {
            $columns[] = array("invoice_overview");
        }

        if (get_array_value($widgets, "income_vs_expenses")) {
            $columns[] = array("income_vs_expenses");
        }


        if (get_array_value($widgets, "all_tasks_overview")) {
            $columns[] = array("all_tasks_overview");
        }

        if (get_array_value($widgets, "team_members_overview")) {
            if (get_array_value($widgets, "last_announcement")) {
                $columns[] = array("team_members_overview", "last_announcement");
            } else {
                $columns[] = array("team_members_overview");
            }
        }

        if (get_array_value($widgets, "ticket_status")) {
            $columns[] = array("ticket_status");
        }


        if (get_array_value($widgets, "all_timesheets_statistics")) {
            $columns[] = array("all_timesheets_statistics");
        } else if (get_array_value($widgets, "my_timesheet_statistics")) {
            $columns[] = array("my_timesheet_statistics");
        }

        if (get_array_value($widgets, "estimate_sent_statistics")) {
            $columns[] = array("estimate_sent_statistics");
        }
        
        if (get_array_value($widgets, "invoice_statistics")) {
            $columns[] = array("invoice_statistics");
        }
        
        return $columns;
    }

    private function _get_second_row_of_admin_and_team_dashboard($all_columns) {

        $row = array();
        $columns = array();

        $column1 = get_array_value($all_columns, 0);
        $column2 = get_array_value($all_columns, 1);
        $column3 = get_array_value($all_columns, 2);

        if ($column1) {
            $columns[] = $column1;
        }
        if ($column2) {
            $columns[] = $column2;
        }
        if ($column3) {
            $columns[] = $column3;
        }

        $row["columns"] = $columns;

        $row["ratio"] = "4-4-4";

        return $row;
    }

    private function _get_third_row_of_admin_and_team_dashboard($all_columns) {

        $row = array();
        $columns = array();

        $column1 = get_array_value($all_columns, 3);
        $column2 = get_array_value($all_columns, 4);
        $column3 = get_array_value($all_columns, 5);

        if ($column1) {
            $columns[] = $column1;
        }
        if ($column2) {
            $columns[] = $column2;
        }
        if ($column3) {
            $columns[] = $column3;
        }

        $row["columns"] = $columns;

        $row["ratio"] = "4-4-4";

        return $row;
    }

    private function _get_fourth_row_of_admin_and_team_dashboard($widgets) {

        $row = array();
        $columns = array();

        $columns[] = array("project_timeline");
        if (get_array_value($widgets, "events") && get_array_value($widgets, "open_projects_list")) {
            $columns[] = array("events", "open_projects_list");
        } else if (get_array_value($widgets, "open_projects_list") && get_array_value($widgets, "starred_projects")) {
            $columns[] = array("open_projects_list", "starred_projects");
        }

        $columns[] = array("todo_list");

        $row["columns"] = $columns;
        $row["ratio"] = "4-4-4";

        return $row;
    }

    private function _get_fifth_row_of_admin_and_team_dashboard($widgets) {

        $row = array();
        $columns = array();

        $columns[] = array("my_tasks_list");
        $columns[] = array("sticky_note");

        $row["columns"] = $columns;
        $row["ratio"] = "8-4";

        return $row;
    }

    private function _get_admin_and_team_dashboard_data() {
        $row_widgets = $this->_get_admin_and_team_dashboard_widgets();
        return $this->_convert_widgets_array_to_formated_obj($row_widgets);
    }

    function view_custom_widget() {
        $id = $this->request->getPost("id");

        validate_numeric_value($id);

        $widget_info = $this->Custom_widgets_model->get_one($id);

        $view_data["model_info"] = $widget_info;

        return $this->template->view("dashboards/custom_widgets/view", $view_data);
    }

    function view_default_widget() {
        $widget = $this->request->getPost("widget");

        $view_data["widget"] = $this->_make_dashboard_widgets($widget);

        return $this->template->view("dashboards/custom_dashboards/edit/view_default_widget", $view_data);
    }

    private function _get_my_dashboard($id = 0, $is_staff_dashboard = false) {
        if ($id) {
            $options = array("id" => $id);
            if (!$is_staff_dashboard) {
                $options["user_id"] = $this->login_user->id;
            }

            return $this->Dashboards_model->get_details($options)->getRow();
        }
    }

    private function is_staff_dashboard($id) {
        return $id === get_setting("staff_default_dashboard") && $this->login_user->user_type === "staff";
    }

    private function _get_my_custom_widget($id = 0) {
        if ($id) {
            return $this->Custom_widgets_model->get_details(array("user_id" => $this->login_user->id, "id" => $id))->getRow();
        }
    }

    function edit_dashboard($id = 0) {
        if (get_setting("disable_dashboard_customization_by_clients") && $this->login_user->user_type == "client") {
            app_redirect("forbidden");
        }

        validate_numeric_value($id);

        $dashboard_info = $this->_get_my_dashboard($id);

        if (!$dashboard_info) {
            app_redirect("forbidden");
        }


        $view_data["dashboard_info"] = $dashboard_info;
        $view_data["widget_sortable_rows"] = $this->_make_editable_rows(unserialize($dashboard_info->data));
        $view_data["widgets"] = $this->_make_widgets($dashboard_info->id);

        return $this->template->rander("dashboards/custom_dashboards/edit/index", $view_data);
    }

    function save() {
        if (get_setting("disable_dashboard_customization_by_clients") && $this->login_user->user_type == "client") {
            app_redirect("forbidden");
        }

        $id = $this->request->getPost("id");

        if ($id) {
            $dashboard_info = $this->_get_my_dashboard($id);
            if (!$dashboard_info) {
                app_redirect("forbidden");
            }
        }

        $dashboard_data = json_decode($this->request->getPost("data"));

        $data = array(
            "user_id" => $this->login_user->id,
            "title" => $this->request->getPost("title"),
            "data" => $dashboard_data ? serialize($dashboard_data) : serialize(array()),
            "color" => $this->request->getPost("color")
        );

        $save_id = $this->Dashboards_model->ci_save($data, $id);

        if ($save_id) {
            echo json_encode(array("success" => true, "dashboard_id" => $save_id, 'message' => app_lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => app_lang('error_occurred')));
        }
    }

    function delete() {
        $id = $this->request->getPost('id');

        $this->validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        if ($this->_get_my_dashboard($id) && $this->Dashboards_model->delete($id)) {
            if ($this->is_staff_dashboard($id)) {
                $this->Settings_model->save_setting("staff_default_dashboard", "");
            }

            echo json_encode(array("success" => true, 'message' => app_lang('record_deleted')));
        } else {
            echo json_encode(array("success" => false, 'message' => app_lang('record_cannot_be_deleted')));
        }
    }

    function delete_custom_widgets() {
        $id = $this->request->getPost('id');

        $this->validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        if ($this->_get_my_custom_widget($id) && $this->Custom_widgets_model->delete($id)) {
            echo json_encode(array("success" => true, "id" => $id, 'message' => app_lang('record_deleted')));
        } else {
            echo json_encode(array("success" => false, 'message' => app_lang('record_cannot_be_deleted')));
        }
    }

    private function _remove_widgets($widgets = array()) {
        $widgets_permission = $this->_check_widgets_permissions();

        foreach ($widgets as $widget) {
            if (!get_array_value($widgets_permission, $widget) && !is_numeric($widget)) {
                unset($widgets[array_search($widget, $widgets)]);
            }
        }

        return $widgets;
    }

    private function _get_default_widgets() {
        //app widgets
        if ($this->login_user->user_type == "staff" && $this->show_staff_on_staff) {
            $default_widgets_array = array(
                "open_projects",
                "open_projects_list",
                "completed_projects",
                "starred_projects",
                "project_timeline",
                "my_open_tasks",
                "my_tasks_list",
                "all_tasks_kanban",
                "task_status",
                "clock_in_out",
                "members_clocked_in",
                "members_clocked_out",
                "all_team_members",
                "clocked_in_team_members",
                "clocked_out_team_members",
                "latest_online_team_members",
                "latest_online_client_contacts",
                "total_project_hours",
                "my_timesheet_statistics",
                "all_timesheets_statistics",
                "total_hours_worked",
                "timecard_statistics",
                "total_invoices",
                "total_payments",
                "total_due",
                "draft_invoices_value",
                "invoice_statistics",
                "income_vs_expenses",
                "new_tickets",
                "open_tickets",
                "closed_tickets",
                "ticket_status",
                "events_today",
                "events",
                "sticky_note",
                "todo_list",
                "new_posts",
                "active_members_on_projects",
                "pending_leave_approval",
                "draft_invoices",
                "total_clients",
                "total_contacts",
                "open_tickets_list",
                "total_leads",
                "projects_overview",
                "estimate_sent_statistics",
                "last_announcement",
                "team_members_overview",
                "all_tasks_overview",
                "invoice_overview",
                "next_reminder",
            );
        } else {
            $default_widgets_array = array(
                "total_projects",
                "open_projects_list",
                "project_timeline",
                "total_invoices",
                "total_payments",
                "total_due",
                "invoice_statistics",
                "new_tickets",
                "open_tickets",
                "closed_tickets",
                "events_today",
                "events",
                "sticky_note",
                "todo_list",
                "open_tickets_list",
                "last_announcement",
            );
        }

        $plugin_widgets = array();
        $plugin_widgets = app_hooks()->apply_filters('app_filter_dashboard_widgets', $plugin_widgets);
        if ($plugin_widgets && is_array($plugin_widgets)) {
            foreach ($plugin_widgets as $plugin_widget) {
                if (is_array($plugin_widget)) {
                    array_push($default_widgets_array, get_array_value($plugin_widget, "widget"));
                }
            }
        }

        return $default_widgets_array;
    }

    private function _make_widgets($dashboard_id = 0) {

        $default_widgets_array = $this->_get_default_widgets();
        $checked_widgets_array = $this->_remove_widgets($default_widgets_array);

        $widgets_array = array_fill_keys($checked_widgets_array, "default_widgets");

        //custom widgets
        $custom_widgets = $this->Custom_widgets_model->get_details(array("user_id" => $this->login_user->id))->getResult();
        if ($custom_widgets) {
            foreach ($custom_widgets as $custom_widget) {
                $widgets_array[$custom_widget->id] = $custom_widget->title;
            }
        }

        //when its edit mode, we have to remove the widgets which have already in the dashboard
        $dashboard_info = $this->Dashboards_model->get_one($dashboard_id);
        $dashboard_elements_array = $dashboard_info->id ? unserialize($dashboard_info->data) : unserialize(get_setting("client_default_dashboard"));

        if ($dashboard_elements_array) {
            foreach ($dashboard_elements_array as $element) {
                $columns = get_array_value((array) $element, "columns");
                if ($columns) {
                    foreach ($columns as $contents) {
                        foreach ($contents as $content) {
                            $widget = get_array_value((array) $content, "widget");
                            if ($widget && array_key_exists($widget, $widgets_array)) {
                                unset($widgets_array[$widget]);
                            }
                        }
                    }
                }
            }
        }

        return $this->_make_widgets_row($widgets_array);
    }

    private function _make_widgets_row($widgets_array = array(), $permissions_array = array()) {
        $widgets = "";

        foreach ($widgets_array as $key => $value) {
            $error_class = "";
            if (count($permissions_array) && !is_numeric($key) && !get_array_value($permissions_array, $key)) {
                $error_class = "error";
            }
            $widgets .= "<div data-value=" . $key . " class='mb5 widget clearfix p10 bg-white $error_class'>" .
                    $this->_widgets_row_data(array($key => $value))
                    . "</div>";
        }

        if ($widgets) {
            return $widgets;
        } else {
            return "<span class='text-off empty-area-text'>" . app_lang('no_more_widgets_available') . "</span>";
        }
    }

    private function _widgets_row_data($widget_array) {
        $key = key($widget_array);
        $value = $widget_array[key($widget_array)];
        $details_button = "";
        if (is_numeric($key)) {

            $widgets_title = $value;
            $details_button = modal_anchor(get_uri("dashboard/view_custom_widget"), "<i data-feather='more-horizontal' class='icon-16'></i>", array("class" => "text-off pr10 pl10", "title" => app_lang('custom_widget_details'), "data-post-id" => $key));
        } else {
            $details_button = modal_anchor(get_uri("dashboard/view_default_widget"), "<i data-feather='more-horizontal' class='icon-16'></i>", array("class" => "text-off pr10 pl10", "title" => app_lang($key), "data-post-widget" => $key));
            $widgets_title = app_lang($key);
        }

        return "<span class='float-start text-left'>" . $widgets_title . "</span>
                <span class='float-end'>" . $details_button . "<i data-feather='move' class='icon-16 text-off'></i>";
    }

    private function _make_editable_rows($elements) {
        $view = "";
        $permissions_array = $this->_check_widgets_permissions();

        if ($elements) {
            foreach ($elements as $element) {

                $column_ratio = get_array_value((array) $element, "ratio");
                $column_ratio_explode = explode("-", $column_ratio);

                $view .= "<row class='widget-row clearfix d-flex bg-white' data-column-ratio='" . $column_ratio . "'>
                            <div class='float-start row-controller text-off font-16'>
                                <span class='move'><i data-feather='menu' class='icon-16'></i></span>
                                <span class='delete delete-widget-row'><i data-feather='x' class='icon-16'></i></span>
                            </div>
                            <div class = 'float-start clearfix row-container row pr15 pl15'>";

                $columns = get_array_value((array) $element, "columns");

                if ($columns) {
                    foreach ($columns as $key => $value) {
                        $column_class_value = $this->_get_column_class_value($key, $columns, $column_ratio_explode);
                        $view .= "<div class = 'pr0 pl15 widget-column col-md-" . $column_class_value . " col-sm-" . $column_class_value . "'>
                                    <div id = 'add-column-panel-" . rand(500, 10000) . "' class = 'add-column-panel add-column-drop text-center p15'>";

                        foreach ($value as $content) {
                            $widget_value = get_array_value((array) $content, "widget");
                            $view .= $this->_make_widgets_row(array($widget_value => get_array_value((array) $content, "title")), $permissions_array);
                        }

                        $view .= "</div></div>";
                    }
                }
                $view .= "</div></row>";
            }
            return $view;
        }
    }

    private function make_dashboard($elements) {
        $view = "";
        if ($elements) {

            foreach ($elements as $element) {
                $view .= "<div class='dashboards-row clearfix row'>";

                $columns = get_array_value((array) $element, "columns");
                $column_ratio = explode("-", get_array_value((array) $element, "ratio"));

                if ($columns) {

                    foreach ($columns as $key => $value) {
                        $view .= "<div class='widget-container col-md-" . $this->_get_column_class_value($key, $columns, $column_ratio) . "'>";

                        foreach ($value as $content) {
                            $widget = get_array_value((array) $content, "widget");
                            if ($widget) {
                                $view .= $this->_make_dashboard_widgets($widget);
                            }
                        }
                        $view .= "</div>";
                    }
                }

                $view .= "</div>";
            }
            return $view;
        }
    }

    private function _make_dashboard_widgets($widget = "") {
        $widgets_array = $this->_check_widgets_permissions();

        //custom widgets
        if (is_numeric($widget)) {
            $view_data["widget_info"] = $this->Custom_widgets_model->get_one($widget);
            return $this->template->view("dashboards/custom_dashboards/extra_data/custom_widget", $view_data);
        }

        if ($this->login_user->user_type == "staff" && $this->show_staff_on_staff) {
            return $this->_get_widgets_for_staffs($widget, $widgets_array);
        } else {
            return $this->_get_widgets_for_client($widget, $widgets_array);
        }
    }

    private function _get_widgets_for_staffs($widget, $widgets_array) {
        if (get_array_value($widgets_array, $widget)) {
            if ($widget == "clock_in_out") {
                return clock_widget();
            } else if ($widget == "events_today") {
                return events_today_widget();
            } else if ($widget == "new_posts") {
                return new_posts_widget();
            } else if ($widget == "invoice_statistics") {
                return invoice_statistics_widget();
            } else if ($widget == "my_timesheet_statistics") {
                return project_timesheet_statistics_widget("my_timesheet_statistics");
            } else if ($widget == "ticket_status") {
                $this->init_permission_checker("ticket");
                return ticket_status_widget(array("allowed_ticket_types" => $this->allowed_ticket_types, "show_assigned_tickets_only_user_id" => $this->show_assigned_tickets_only_user_id()));
            } else if ($widget == "timecard_statistics") {
                return timecard_statistics_widget();
            } else if ($widget == "income_vs_expenses") {
                return income_vs_expenses_widget("h373");
            } else if ($widget == "events") {
                return events_widget();
            } else if ($widget == "my_open_tasks") {
                return my_open_tasks_widget();
            } else if ($widget == "project_timeline") {
                return $this->template->view("dashboards/custom_dashboards/extra_data/widget_with_heading", array("icon" => "clock", "widget" => $widget));
            } else if ($widget == "task_status") {
                return my_task_stataus_widget("h370");
            } else if ($widget == "sticky_note") {
                return sticky_note_widget("h370");
            } else if ($widget == "all_tasks_kanban") {
                return all_tasks_kanban_widget();
            } else if ($widget == "todo_list") {
                return todo_list_widget();
            } else if ($widget == "open_projects") {
                return open_projects_widget("");
            } else if ($widget == "completed_projects") {
                return completed_projects_widget("");
            } else if ($widget == "members_clocked_in") {
                return count_clock_in_widget();
            } else if ($widget == "members_clocked_out") {
                return count_clock_out_widget();
            } else if ($widget == "open_projects_list") {
                return my_open_projects_widget();
            } else if ($widget == "starred_projects") {
                return my_starred_projects_widget();
            } else if ($widget == "new_tickets" || $widget == "open_tickets" || $widget == "closed_tickets") {
                $this->init_permission_checker("ticket");
                $explode_widget = explode("_", $widget);
                return ticket_status_widget_small(array("status" => $explode_widget[0], "allowed_ticket_types" => $this->allowed_ticket_types, "show_assigned_tickets_only_user_id" => $this->show_assigned_tickets_only_user_id()));
            } else if ($widget == "all_team_members") {
                return all_team_members_widget();
            } else if ($widget == "clocked_in_team_members") {
                $this->init_permission_checker("attendance");
                return clocked_in_team_members_widget(array("access_type" => $this->access_type, "allowed_members" => $this->allowed_members));
            } else if ($widget == "clocked_out_team_members") {
                $this->init_permission_checker("attendance");
                return clocked_out_team_members_widget(array("access_type" => $this->access_type, "allowed_members" => $this->allowed_members));
            } else if ($widget == "latest_online_team_members") {
                return active_members_and_clients_widget("staff");
            } else if ($widget == "total_invoices" || $widget == "total_payments" || $widget == "total_due" || $widget == "draft_invoices_value") {
                $explode_widget = explode("_", $widget);
                $value = get_array_value($explode_widget, 1);
                if ($widget == "draft_invoices_value") {
                    $value = "draft";
                }
                return get_invoices_value_widget($value);
            } else if ($widget == "my_tasks_list") {
                return my_tasks_list_widget();
            } else if ($widget == "all_timesheets_statistics") {
                return project_timesheet_statistics_widget("all_timesheets_statistics");
            } else if ($widget == "pending_leave_approval") {
                $this->init_permission_checker("leave");
                return pending_leave_approval_widget(array("access_type" => $this->access_type, "allowed_members" => $this->allowed_members));
            } else if ($widget == "total_hours_worked" || $widget == "total_project_hours") {
                return count_total_time_widget_small(0, $widget);
            } else if ($widget == "active_members_on_projects") {
                return active_members_on_projects_widget();
            } else if ($widget == "draft_invoices") {
                return draft_invoices_widget();
            } else if ($widget == "total_clients" || $widget == "total_contacts" || $widget == "latest_online_client_contacts") {
                $show_own_clients_only_user_id = $this->show_own_clients_only_user_id();
                $this->init_permission_checker("client");
                if ($widget == "total_clients") {
                    return total_clients_widget($show_own_clients_only_user_id, $this->allowed_client_groups);
                } else if ($widget == "total_contacts") {
                    return total_contacts_widget($show_own_clients_only_user_id, $this->allowed_client_groups);
                } else if ($widget == "latest_online_client_contacts") {
                    return active_members_and_clients_widget("client", $show_own_clients_only_user_id, $this->allowed_client_groups);
                }
            } else if ($widget == "open_tickets_list") {
                return open_tickets_list_widget();
            } else if ($widget == "total_leads") {
                $show_own_leads_only_user_id = $this->show_own_leads_only_user_id();
                return total_leads_widget(true, $show_own_leads_only_user_id);
            } else if ($widget == "projects_overview") {
                return projects_overview_widget();
            } else if ($widget == "estimate_sent_statistics") {
                return estimate_sent_statistics_widget();
            } else if ($widget == "last_announcement") {
                return last_announcement_widget();
            } else if ($widget == "team_members_overview") {
                $this->init_permission_checker("leave");
                return team_members_overview_widget(array("access_type" => $this->access_type, "allowed_members" => $this->allowed_members));
            } else if ($widget == "all_tasks_overview") {
                return all_tasks_overview_widget();
            } else if ($widget == "invoice_overview") {
                return invoice_overview_widget();
            } else if ($widget == "next_reminder") {
                return next_reminder_widget();
            }

            $plugin_widget = $this->_get_plugin_widgets($widget);
            if ($plugin_widget) {
                return $plugin_widget;
            }
        } else {
            return invalid_access_widget();
        }
    }

    private function _get_widgets_for_client($widget, $widgets_array) {
        //client's widgets
        $client_info = get_array_value($widgets_array, "client_info");
        $client_id = get_array_value($widgets_array, "client_id");

        if (get_array_value($widgets_array, $widget)) {
            if ($widget == "total_projects") {
                return $this->template->view("clients/info_widgets/tab", array("tab" => "projects", "client_info" => $client_info));
            } else if ($widget == "total_invoices") {
                return $this->template->view("clients/info_widgets/tab", array("tab" => "total_invoiced", "client_info" => $client_info));
            } else if ($widget == "total_payments") {
                return $this->template->view("clients/info_widgets/tab", array("tab" => "payments", "client_info" => $client_info));
            } else if ($widget == "total_due") {
                return $this->template->view("clients/info_widgets/tab", array("tab" => "due", "client_info" => $client_info));
            } else if ($widget == "open_projects_list") {
                return my_open_projects_widget($client_id);
            } else if ($widget == "events") {
                return events_widget();
            } else if ($widget == "sticky_note") {
                return sticky_note_widget("h370");
            } else if ($widget == "invoice_statistics") {
                return invoice_statistics_widget();
            } else if ($widget == "events_today") {
                return events_today_widget();
            } else if ($widget == "todo_list") {
                return todo_list_widget();
            } else if ($widget == "new_tickets" || $widget == "open_tickets" || $widget == "closed_tickets") {
                $explode_widget = explode("_", $widget);
                return ticket_status_widget_small(array("status" => $explode_widget[0]));
            } else if ($widget == "project_timeline") {
                return $this->template->view("dashboards/custom_dashboards/extra_data/widget_with_heading", array("icon" => "clock", "widget" => $widget));
            } else if ($widget == "open_tickets_list") {
                return open_tickets_list_widget();
            } else if ($widget == "last_announcement") {
                return last_announcement_widget();
            }

            $plugin_widget = $this->_get_plugin_widgets($widget);
            if ($plugin_widget) {
                return $plugin_widget;
            }
        } else {
            return invalid_access_widget();
        }
    }

    private function _get_plugin_widgets($widget = "") {
        $plugin_widgets = array();
        $plugin_widgets = app_hooks()->apply_filters('app_filter_dashboard_widgets', $plugin_widgets);
        if ($plugin_widgets && is_array($plugin_widgets)) {
            foreach ($plugin_widgets as $plugin_widget) {
                if (is_array($plugin_widget) && get_array_value($plugin_widget, "widget") == $widget) {
                    return get_array_value($plugin_widget, "widget_view");
                }
            }
        }
    }

    private function _get_column_class_value($key, $columns, $column_ratio) {
        $columns_array = array(1 => 12, 2 => 6, 3 => 4, 4 => 3);

        $column_count = count($columns);
        $column_ratio_count = count($column_ratio);

        $class_value = $column_ratio[$key];

        if ($column_count < $column_ratio_count) {
            $class_value = $columns_array[$column_count];
        }

        return $class_value;
    }

    function save_dashboard_sort() {
        $this->validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->request->getPost('id');

        $data = array(
            "sort" => $this->request->getPost('sort')
        );

        if ($id) {
            $save_id = $this->Dashboards_model->ci_save($data, $id);

            if ($save_id) {
                echo json_encode(array("success" => true, 'message' => app_lang('record_saved')));
            } else {
                echo json_encode(array("success" => false, app_lang('error_occurred')));
            }
        }
    }

    function client_default_dashboard() {
        $this->access_only_admin_or_settings_admin();
        $this->show_staff_on_staff = false;

        $widgets = $this->_check_widgets_permissions();
        $view_data["dashboards"] = array();

        $client_default_dashboard = get_setting("client_default_dashboard");
        if ($client_default_dashboard) {
            $view_data["widget_columns"] = $this->make_dashboard(unserialize($client_default_dashboard));

            $dashboard_view = $this->template->view("dashboards/custom_dashboards/view", $view_data);
        } else {
            $view_data['show_invoice_info'] = get_array_value($widgets, "show_invoice_info");
            $view_data["show_project_info"] = true; //client can view projects
            $view_data['hidden_menu'] = get_array_value($widgets, "hidden_menu");
            $view_data['client_info'] = get_array_value($widgets, "client_info");
            $view_data['client_id'] = get_array_value($widgets, "client_id");
            $view_data['page_type'] = get_array_value($widgets, "page_type");
            $view_data["custom_field_headers"] = $this->Custom_fields_model->get_custom_field_headers_for_table("projects", $this->login_user->is_admin, $this->login_user->user_type);
            $view_data["custom_field_filters"] = $this->Custom_fields_model->get_custom_field_filters("projects", $this->login_user->is_admin, $this->login_user->user_type);

            $dashboard_view = $this->template->view("dashboards/client_dashboard", $view_data);
        }

        $view_data["dashboard_view"] = $dashboard_view;

        return $this->template->rander("settings/client_default_dashboard/index", $view_data);
    }

    function edit_client_default_dashboard() {
        $this->access_only_admin_or_settings_admin();
        $this->show_staff_on_staff = false;

        $view_data["widget_sortable_rows"] = $this->_make_editable_rows(unserialize(get_setting("client_default_dashboard")));
        $view_data["widgets"] = $this->_make_widgets();

        return $this->template->rander("settings/client_default_dashboard/edit_dashboard", $view_data);
    }

    function save_client_default_dashboard() {
        $this->access_only_admin_or_settings_admin();

        $dashboard_data = json_decode($this->request->getPost("data"));
        $serialized_data = $dashboard_data ? serialize($dashboard_data) : serialize(array());

        $this->Settings_model->save_setting("client_default_dashboard", $serialized_data);

        echo json_encode(array("success" => true, 'message' => app_lang('record_saved')));
    }

    function restore_to_default_client_dashboard() {
        $this->access_only_admin_or_settings_admin();
        $this->Settings_model->save_setting("client_default_dashboard", "");
        app_redirect("dashboard/client_default_dashboard");
    }

    function mark_as_default() {
        $this->access_only_admin();

        $id = $this->request->getPost('id');
        $this->validate_submitted_data(array(
            "id" => "numeric"
        ));

        if (is_null($id)) {
            $id = "";
        }

        $this->Settings_model->save_setting("staff_default_dashboard", $id);
        echo json_encode(array("success" => true, 'message' => app_lang('record_saved')));
    }

    function migration() {
        
        $parish = array(
            array('id' => '99','churchid' => '1001','cimg' => '1001.jpg','chistory' => '     ','cname' => 'Alavnvilai','psaint' => 'St Aloysius Gonsaga','estd' => '1778St. Aloysius Gon','substation' => '      St. Michael Church,Kuzhivilai. St. Antony Church,Nullivilai.','institution' => '              St.Aloysius Higher Secondary School','anbiyam' => 'Parish Council,Finance Council','pious' => '              Little Way Association,YCS,Youth,Women Movement,CLC,Vincent De Paul Society,Franciscan 3rd Association,Catholic Action Society,Legion of Mary,KAIGAL','families' => '','population' => '','website' => '','address' => '        Karenkadu post','telephone' => '','sgroups' => '              ','pemail' => '','type' => 'Parish','slug' => 'alavnvilai','access_user' => NULL),
            array('id' => '100','churchid' => '1002','cimg' => '1002.jpg','chistory' => '','cname' => 'Church of Our Lady of Nativity','psaint' => NULL,'estd' => '1860','substation' => 'Vilavooor','institution' => 'St.Josephs Matric Higher Secondary School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Legion of Mary,Christian Life Movement,Kolping Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-nativity','access_user' => NULL),
            array('id' => '101','churchid' => '1003','cimg' => '1003.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier','psaint' => NULL,'estd' => '1910','substation' => 'Vadivilai','institution' => 'St.Francis Xavier Higher Secondary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Legion of Mary,Christian Life Movement,KOPING,Womens Movement,Little Way Association,Childrens Movement,YCS,Youth','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier','access_user' => NULL),
            array('id' => '102','churchid' => '1004','cimg' => '1004.jpg','chistory' => '','cname' => 'Church of Our Lady of Assumption','psaint' => NULL,'estd' => '1906','substation' => 'Arulanandapuram-St.John De Britto,Thickanamcode-St.Antony','institution' => NULL,'anbiyam' => '','pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-assumption','access_user' => NULL),
            array('id' => '103','churchid' => '1005','cimg' => '1005.jpg','chistory' => '','cname' => 'Church of St. James','psaint' => NULL,'estd' => '1908','substation' => 'Kesavapuram,Thettiyode','institution' => 'St.Josephs Middle School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Asociation,YCS,Youth,Legion of Mary,KAIGAL,IFO,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-james','access_user' => NULL),
            array('id' => '104','churchid' => '1006','cimg' => '1006.jpg','chistory' => '','cname' => 'Church of St.Antony','psaint' => NULL,'estd' => '1910','substation' => 'Tharathattu,Nattalam,Mankarai','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society,Womens Movement,Rural Motivation Program,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '105','churchid' => '1007','cimg' => '1007.jpg','chistory' => '','cname' => 'Church of St. Joseph, MANALIKARAI [1913]','psaint' => NULL,'estd' => '1909','substation' => 'Swamiyarmadam,Solapuram,Kumarapuram,Perumchilampu,Mukilankarai,Kallankuzhy','institution' => 'St.Mary Goretty HSS,Carmel Girls HSSSt.Josephs Primary School,Carmel Nursery and Primary School,Aruljothi Nursery and Primary School,Nirmala Institute of Technology,Carmel Boys Home for Children,Carmel Hospital','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,Young Christian Association,Youth Movement,Christian Workers Association,Catholic Action,Rural Motivation Program,Womens Movement,Christian Life Association,Vincent de Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-joseph-manalikarai-1913','access_user' => NULL),
            array('id' => '106','churchid' => '1008','cimg' => '1008.jpg','chistory' => '','cname' => 'Church of St. Sebastian, MADATHATTUVLIAI [1918]','psaint' => NULL,'estd' => '1918','substation' => 'Villukuri','institution' => 'St.Sebastian Matriculation School,Madathattuvilai','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-sebastian-madathattuvliai-1918','access_user' => NULL),
            array('id' => '107','churchid' => '1009','cimg' => '1009.jpg','chistory' => '','cname' => 'Church of the Most Holy Trinity, THIRITHUVAPURAM [1920]','psaint' => NULL,'estd' => '1910','substation' => '','institution' => 'R.C.Primary School Thirithuvapuram,Infant Jesus & Primary School Thirithuvapuram,St.Josephs Hr.Sec.School Thirithuvapuram','anbiyam' => 'Parish Pastoral Council,Financ','pious' => 'Youth Commission,Christian Workers Movement,Womens Movement,Catholic Action Society,YCS,Rural Motivation Program,Christian Life Movement,Legion of Mary,Vincent De Paul Society,Catholic Sangam','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-most-holy-trinity-thirithuvapuram-1920','access_user' => NULL),
            array('id' => '108','churchid' => '1010','cimg' => '1010.jpg','chistory' => '','cname' => 'Church of Our Lady of Assumption, PUTHUKADAI [1920]','psaint' => NULL,'estd' => '1911','substation' => '','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,IFO,Legion of Mary,Vincent De Paul Society,Sacred Heart Pius association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-assumption-puthukadai-1920','access_user' => NULL),
            array('id' => '109','churchid' => '1011','cimg' => '1011.jpg','chistory' => '','cname' => 'Church of Our Lady of Mt. Carmel, VAVARAI [1924]','psaint' => NULL,'estd' => '1924','substation' => 'Our Lady of Ransom Church Kuzhivilai,St.Josephs Puthukkodu,St.Antonys Church Konaseri','institution' => 'St.Francis Primary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Workers Movement,Legion of Mary,Christian Life Movement,Vincent De Paul Society,KAIGAL,Rural Motivation Program,Dalit Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-mt-carmel-vavarai-1924','access_user' => NULL),
            array('id' => '110','churchid' => '1012','cimg' => '1012.jpg','chistory' => '','cname' => 'Church of St. Michael Archangel, CHERUVALLOOR [1930]','psaint' => NULL,'estd' => '1930','substation' => 'Thomayarpuram-St.Thomas,Mancode-St.Joseph,Kottarakonam(Mission Station','institution' => NULL,'anbiyam' => 'Parish Council, Finance Commit','pious' => 'Childrens Movement, YCS, Youth, Little way Associaion','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-michael-archangel-cheruvalloor-1930','access_user' => NULL),
            array('id' => '111','churchid' => '1013','cimg' => '1013.jpg','chistory' => '','cname' => 'Church of the Sacred Heart of Jesus, PALLIYADY [1931]','psaint' => NULL,'estd' => '1931','substation' => 'St.Peters Church Cherikadai','institution' => 'Primary School and High School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement, YCS, Youth, Little way Associaion,Rural Motivation Program,KAIGAL,Women Movement,Legion of Mary,Vincent De Paul Society,Sacred Heart Pius Association,Franciscan 3rd Association,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-sacred-heart-of-jesus-palliyady-1931','access_user' => NULL),
            array('id' => '112','churchid' => '1014','cimg' => '1014.jpg','chistory' => '','cname' => 'Church of St. Augustine, KULASEKHARAM [1931]','psaint' => NULL,'estd' => '1930','substation' => 'Paicadu,Cheruthikonam','institution' => 'Primary and Higher Secondary School','anbiyam' => 'Parish Council,Anbiam(BCC)-27,','pious' => 'Legion of Mary,Christian Life Movement,Vincent De Paul Society,Youth,YCS,Little Way Association,Childrens Movement,IFO,Christian Workers Association,KAIKAL,Dalit Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-augustine-kulasekharam-1931','access_user' => NULL),
            array('id' => '113','churchid' => '1015','cimg' => '1015.jpg','chistory' => '','cname' => 'Church of St. Eusthachius, PACKIAPURAM [1936]','psaint' => NULL,'estd' => '1936','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Legion of Mary,Catholic Action Society,Catholic Sangam,Youth,Vincent De Paul Society,Sacred Heart of Jesus,Christian Workers of Movement,Young Christian Workers Movement,Womens Movement,KAIGAL,CRMI,Christian Life Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-eusthachius-packiapuram-1936','access_user' => NULL),
            array('id' => '114','churchid' => '1016','cimg' => '1016.jpg','chistory' => '','cname' => 'Church of St.John of the Cross, SILUVAIPURAM [1936]','psaint' => NULL,'estd' => '1936','substation' => 'Santhapuram-St.Therese of Child Jesus','institution' => NULL,'anbiyam' => NULL,'pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-john-of-the-cross-siluvaipuram-1936','access_user' => NULL),
            array('id' => '115','churchid' => '1017','cimg' => 'b6fbdfad2acd4b9360ad99ead7bfc28d.jpg','chistory' => '','cname' => 'Church of St. Antony of Padua, CHEMPARUTHIVILAI [1939]','psaint' => NULL,'estd' => '1939','substation' => 'Eathavilai-Christ the King,Mekkamandapam-Our Lady of Assumption','institution' => 'R.C.Primary & High School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Little Way Association,YCS,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Catholic Association,Christian Life Movement,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony-of-padua-chemparuthivilai-1939','access_user' => '268'),
            array('id' => '116','churchid' => '1018','cimg' => '1018.jpg','chistory' => '','cname' => 'Church of St.Therese of Child Jesus, KANDANVILAI [1944]','psaint' => NULL,'estd' => '07-04-1924','substation' => 'Eraniel,Chithenthoppu,Pandaravilai','institution' => 'St.Theresa Middle School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth,Catholic Action Society,Sacred Heart Pius Association,Francis 3rd Comittee,Rural Motivation Program,Christian Life Movement,Childrens Movement,Little Way Association,YCS,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-therese-of-child-jesus-kandanvilai-1944','access_user' => '301'),
            array('id' => '117','churchid' => '1019','cimg' => '1019.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier, VENCODE [1949]','psaint' => NULL,'estd' => '1329','substation' => 'St.Michaels Church Vettuvilai','institution' => 'St.Francis Xaviers Primary School,St Francis Xaviers Higher Secondary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movemnt,Little Way Association,YCS,Youth,Vincent De Paul Society,Catholic Action Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier-vencode-1949','access_user' => NULL),
            array('id' => '118','churchid' => '1020','cimg' => '1020.jpg','chistory' => '','cname' => 'Church of the Sacred Heart of Jesus, KADAYAL [1952]','psaint' => NULL,'estd' => '1965','substation' => 'Kilathoor,Pongingkalai','institution' => 'Sacred Heart Middle School Kadayal','anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth,Childrens Movement,Childrens Life Movement,Catholic Action Society,Vincent De Paul Society,Legion of Mary,YCS,Little Way Association,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-sacred-heart-of-jesus-kadayal-1952','access_user' => NULL),
            array('id' => '119','churchid' => '1021','cimg' => '1021.jpg','chistory' => '','cname' => 'Church of St.Joseph, KALKURICHY [1954]','psaint' => NULL,'estd' => '1954','substation' => 'Paruthiaraithottam-St.Michael','institution' => 'St.Josephs Middle School,St.Josephs Nursery & Primary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth Movement,Catholic Action Society,Catholic Society,Vincent De Paul Sangam,Holy Childhood,Little Way Association,Sacred Heart Pius Association,Legion of Mary,YCS,Christian Workers Movement,Christian Stone Workers Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-joseph-kalkurichy-1954','access_user' => NULL),
            array('id' => '120','churchid' => '1022','cimg' => '1022.jpg','chistory' => '','cname' => 'Church of St.Antony, KAPPUKAD [1955]','psaint' => NULL,'estd' => '1926','substation' => 'Annainager,Vilathurai','institution' => 'St.Antonys Primary and High School','anbiyam' => 'Parish Council, Sunday Catechi','pious' => 'Little Way Association,YCS,Youth,Rural Motivation Program,KAIKAL,Kolping,Catholic Action Society,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony-kappukad-1955','access_user' => NULL),
            array('id' => '121','churchid' => '1023','cimg' => '1023.jpg','chistory' => '','cname' => 'Church of St. Antony of Pauda, POOTTETTY [1956]','psaint' => NULL,'estd' => '1956','substation' => 'Paloor-Church of St.Theresa of Child Jesus,Theruvukadai-Church of our Lady of Good Health','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-18,','pious' => 'Little Way Association,YCS,Childrens Movement,Youth,Rural Motivation Program,Christian Life Movement,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony-of-pauda-poottetty-1956','access_user' => NULL),
            array('id' => '122','churchid' => '1024','cimg' => '1024.jpg','chistory' => '','cname' => 'Church of the Imm. Heart of Mary, AMSI [1958]','psaint' => NULL,'estd' => '1947','substation' => 'Fathima Nagar,Oottukuzhi','institution' => 'Immaculate Heart of Mary Primary School','anbiyam' => 'Parish Council,Anbiam(BCC)-21,','pious' => 'Little Way Association,Childrens Movement,YCS','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-imm-heart-of-mary-amsi-1958','access_user' => NULL),
            array('id' => '123','churchid' => '1025','cimg' => '1025.jpg','chistory' => '','cname' => 'Church of the Sacred Heart, PACODE [1959]','psaint' => NULL,'estd' => '1959','substation' => 'Our Lady of Lourdes Nellikkavilai','institution' => 'Sacred Heart High School, Pacode','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Little Way Association,YCS,Youth Movement,Kolping,KAIGAL,Vincent De Paul Society,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-sacred-heart-pacode-1959','access_user' => NULL),
            array('id' => '124','churchid' => '1026','cimg' => '1026.jpg','chistory' => '','cname' => 'Church of O.L. of Mt. Carmel, MURASANCODE [1963]','psaint' => NULL,'estd' => '1963','substation' => 'Elanthavilai,Palayam,Kannode,Komanvilai,Kottavilai Mission,Aathivilai Mission','institution' => 'St.Marys Primary School Murasancode,Arockia Annai Middle School Palayam','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,Legion of Mary,Catholic Action Society,Vincent De Paul Society,Womens Movement,Rural Motivation Program,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-o-l-of-mt-carmel-murasancode-1963','access_user' => NULL),
            array('id' => '125','churchid' => '1027','cimg' => '1027.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier, KONAMKADU [1964]','psaint' => NULL,'estd' => '1964','substation' => '','institution' => 'St.Xaviers Dispensary,Library,RC Primary School,RC Higher Secondary School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Christian Workers Movement,Franciscan Movement 3rd Order,Legion of Mary,Youth,Childrens Movement,Little Way Association,YCS,Vincen De Paul Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier-konamkadu-1964','access_user' => NULL),
            array('id' => '126','churchid' => '1028','cimg' => '1028.jpg','chistory' => '','cname' => 'Church of St. Catherine, KAPPIARAI [1966]','psaint' => NULL,'estd' => '1986','substation' => '','institution' => 'St.Catherines Primary School','anbiyam' => 'Parish Council,Anbiam(BCC)-10,','pious' => 'Childrens Movement,Little way Association,Altar Boys Association,YCS,Youth Group,Women Development Society,Kolping Movement,Catholic Service Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-catherine-kappiarai-1966','access_user' => NULL),
            array('id' => '127','churchid' => '1029','cimg' => '1029.jpg','chistory' => '','cname' => 'Church of St.Antony, THUNDATHHUVILAI [1966]','psaint' => NULL,'estd' => '1966','substation' => 'Church of St.Francis Xavier Karungal,Church of Our Lady of Perpectual Succour Kannanvilai,Church of Infant Jesus Perumankuzhy','institution' => 'Nirmala Hospital','anbiyam' => 'Parish Council,Anbiam(BCC)-29,','pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony-thundathhuvilai-1966','access_user' => NULL),
            array('id' => '128','churchid' => '1030','cimg' => '1030.jpg','chistory' => '','cname' => 'Church of the Holy Guardian Angel, MELPURAM [1967]','psaint' => NULL,'estd' => '1967','substation' => 'Vattavilai,Parakonam','institution' => 'Holy Angels Matric School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Little way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Rural Motivation Program,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-holy-guardian-angel-melpuram-1967','access_user' => NULL),
            array('id' => '129','churchid' => '1031','cimg' => '1031.jpg','chistory' => '','cname' => 'Church of Our Lady of Lourdes, ALANVILAI [1968]','psaint' => NULL,'estd' => '1968','substation' => 'Kurunthancode','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,Childrens Movement,Youth Movement,Womens Movement,YCS,Legion of Mary,Catholic Action Society,Education Committee,Sacred Heart Pius Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-lourdes-alanvilai-1968','access_user' => NULL),
            array('id' => '130','churchid' => '1032','cimg' => '1032.jpg','chistory' => '','cname' => 'Church of Our Lady of Sorrows','psaint' => NULL,'estd' => '1968','substation' => 'Soosaipuram','institution' => 'R.C.Middle School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-sorrows','access_user' => NULL),
            array('id' => '131','churchid' => '1033','cimg' => '1033.jpg','chistory' => '','cname' => 'Church of the Sacred Heart of Jesus','psaint' => NULL,'estd' => '1968','substation' => 'Chemmankalai','institution' => 'St.James Primary & High School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Little Way Association,YCS,Youth Movement,Liturgy Committee,Sacred Heart Society,Women Movement,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-sacred-heart-of-jesus','access_user' => NULL),
            array('id' => '132','churchid' => '1034','cimg' => '1034.jpg','chistory' => '','cname' => 'Church of St.Michael','psaint' => NULL,'estd' => '1971','substation' => 'Xavierpuram','institution' => 'St.Josephs Higher Secondary School,Mother Theresa Matric Higher Secondary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-michael','access_user' => NULL),
            array('id' => '133','churchid' => '1035','cimg' => '1035.jpg','chistory' => '','cname' => 'Church of Our Lady of Assumption','psaint' => NULL,'estd' => '1974','substation' => 'Transfiguration of our Lord Church Aikkiyanager,Our Lady of Fatima Church Mankalai','institution' => 'St.Marys Primary School,St.Marys Higher Secondary School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Womens Movement,KAIGAL,Rural Motivation Program,Legion of Mary,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-assumption','access_user' => NULL),
            array('id' => '134','churchid' => '1036','cimg' => '1036.jpg','chistory' => '','cname' => 'Church of St. Elias','psaint' => NULL,'estd' => '1972','substation' => 'Padmanabhapuram','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-16,','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Kolping Movement,Carmel 3rd Association,Vincent De Paul Society,Catholic Association,Christian Life Movement,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-elias','access_user' => NULL),
            array('id' => '135','churchid' => '1037','cimg' => '1037.jpg','chistory' => '','cname' => 'St. Aloysius Church','psaint' => NULL,'estd' => '1927','substation' => 'Chadayankuzhi','institution' => 'Aloysius High School,Aloysius Primary School','anbiyam' => 'Parish Council,Anbiam(BCC)-15','pious' => 'Youth Commission,YCS,Children Movement,Legion of Mary,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'st-aloysius-church','access_user' => NULL),
            array('id' => '136','churchid' => '1038','cimg' => '1038.jpg','chistory' => '','cname' => 'Church of St.Therese of Child Jesus','psaint' => NULL,'estd' => '1972','substation' => 'Valanoor,Varuvilai','institution' => 'Little Flower Matriculation School,St.Josephs Middle School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Womens Movement,Golping,Catholic Service Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-therese-of-child-jesus','access_user' => NULL),
            array('id' => '137','churchid' => '1039','cimg' => '1039.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '1973','substation' => 'Paramanvilai','institution' => 'St.Aloysius Primary School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Legion of Mary,YCS,Holy Childhood,IFO','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '138','churchid' => '1040','cimg' => '1040.jpg','chistory' => '','cname' => 'Church of Our Lady of Mount Carmel','psaint' => NULL,'estd' => '1973','substation' => 'Kuruvikkad,Ambankalai','institution' => 'Mount Carmel Matric.HSS','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society,Christian Workers Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-mount-carmel','access_user' => NULL),
            array('id' => '139','churchid' => '1041','cimg' => '1041.jpg','chistory' => '','cname' => 'Church of Our Lady of Rosary','psaint' => NULL,'estd' => '1974','substation' => 'Manjady,Eraviputhoorkadai,Chirayankuzhy','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Altar Boys Association,Holy Childhood,Little Way Association,Catholic Action Society,Liturgy Committee,Rural Motivation Program,Youth,YCS,Vincent De Paul Sangam,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-rosary','access_user' => NULL),
            array('id' => '140','churchid' => '1042','cimg' => '1042.jpg','chistory' => '','cname' => 'Church of Our Lady of Lourdes','psaint' => NULL,'estd' => '1975','substation' => 'Our Lady of Rosary Pilavilai,St.Antony Manjalumoodu,St.Joseph Malamari','institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Kolping India,Sacred Heart Pius Association,Womens Movement,Catholic Action Society,Christian Life Movement,Childrens Movement,Little Way Association,YCS,Youth,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-lourdes','access_user' => NULL),
            array('id' => '141','churchid' => '1043','cimg' => '1043.jpg','chistory' => '','cname' => 'Church of Our Lady of Snows','psaint' => NULL,'estd' => '1979','substation' => 'Pallavilai,Thalakulam','institution' => NULL,'anbiyam' => 'Parish Council,Audit Council,A','pious' => 'Little Way Association,YCS,Youth,Rural Motivation Program,Sacred ?Heart Pious Association,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Womens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-snows','access_user' => NULL),
            array('id' => '142','churchid' => '1044','cimg' => '1044.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier','psaint' => NULL,'estd' => '1979','substation' => 'Nalloor-Christ the King,Unnamalakadai-Our Lady of Ransom','institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,Vincent De Paul Society,Kolping Movement,Legion of Mary,Womens Movement,IFO,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier','access_user' => NULL),
            array('id' => '143','churchid' => '1045','cimg' => '1045.jpg','chistory' => '','cname' => 'Church of Good Shepherd','psaint' => NULL,'estd' => '1965','substation' => 'Christurajapuram, Arokia Annai Nagar','institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Little Way Association,YCS,Youth Movement,KAIGAL,Dalit Movement,Womens Movement,Legion of Mary,Vincent De Paul Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-good-shepherd','access_user' => NULL),
            array('id' => '144','churchid' => '1046','cimg' => '1046.jpg','chistory' => '','cname' => 'Church of St.Jude Thadeus','psaint' => NULL,'estd' => '1984','substation' => 'Saicode','institution' => 'St.Josephs Middle School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth Movement,Childrens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-jude-thadeus','access_user' => NULL),
            array('id' => '145','churchid' => '1047','cimg' => '1047.jpg','chistory' => '','cname' => 'Church of Christ the King','psaint' => NULL,'estd' => '1984','substation' => 'Elampilavilai','institution' => 'St.Josephs Primary and High Schools','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Catholic Action Society,Vincent De Paul Society,Women Movement,Rural Motivation Program,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-christ-the-king','access_user' => NULL),
            array('id' => '146','churchid' => '1048','cimg' => '1048.jpg','chistory' => '','cname' => 'Church of St.Antony','psaint' => NULL,'estd' => '1957','substation' => 'Mathapuram','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '147','churchid' => '1049','cimg' => '1049.jpg','chistory' => '','cname' => 'Church of Our Lady of Perpetual Help','psaint' => NULL,'estd' => '1964','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-10,','pious' => 'Little Way Association,YCS,Youth,KAIKAL,Dalit Movement,Catholic Action Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-perpetual-help','access_user' => NULL),
            array('id' => '148','churchid' => '1050','cimg' => '1050.jpg','chistory' => '','cname' => 'Church of Our Lady of Assumption','psaint' => NULL,'estd' => '1989','substation' => 'Chitharal,Antoniyarpuram','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,YCS,Youth,KAIGAL Movement,Dalit Movement,Christian Life Movement,Catholic Action Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-assumption','access_user' => NULL),
            array('id' => '149','churchid' => '1051','cimg' => '1051.jpg','chistory' => '','cname' => 'Church of St. Andrew','psaint' => NULL,'estd' => '1991','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-5','pious' => 'Women Movement,Vincent De Paul Society,Childrens Movement,Little Way Association,YCS','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-andrew','access_user' => NULL),
            array('id' => '150','churchid' => '1052','cimg' => '1052.jpg','chistory' => '','cname' => 'Church of St.Michael Archangel','psaint' => NULL,'estd' => '1991','substation' => 'St.Theresas Church Manali','institution' => 'Little Flower Primary School Venkanji','anbiyam' => 'Parish Council,Anbiam(BCC)-16,','pious' => 'Childrens movement,Little way Association,YCS,Youth,Catholic Action Society,Farmers Sangam,Vincent De Paul Sangam,Legion of Mary,Kolping','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-michael-archangel','access_user' => NULL),
            array('id' => '151','churchid' => '1053','cimg' => '1053.jpg','chistory' => '','cname' => 'Church of St.Antony','psaint' => NULL,'estd' => '1995','substation' => 'Aramannam,Ittakaveli','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens movement,Little way Association,YCS,Youth Movement,Catholic Action Society,Kolping,Sacred Heart Pius Association,Vincent De Paul Society,Legion of Mary,KAIGAL,Womens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '152','churchid' => '1054','cimg' => '1054.jpg','chistory' => '','cname' => 'Church of Good Shepherd','psaint' => NULL,'estd' => '1995','substation' => '','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Vincent De Paul Society,Legion of mary,Youth,YCS,Little Way Association,Childrens Movement,KAIGAL','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-good-shepherd','access_user' => NULL),
            array('id' => '153','churchid' => '1055','cimg' => '1055.jpg','chistory' => '','cname' => 'Church of St. Michael','psaint' => NULL,'estd' => '1997','substation' => '','institution' => 'St.Michaels Play School','anbiyam' => 'Parish Council,Anbiam(BCC)-16,','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-michael','access_user' => NULL),
            array('id' => '154','churchid' => '1056','cimg' => '1056.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '1997','substation' => 'Amalapuram','institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Vincent De Paul Society,Catholic Action Society,Christian Workers Movement,Rural Motivation Program,Dalit Movement,Christian Life Movement,Legion of Mary,YCS,Little Way Association,Childrens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '155','churchid' => '1057','cimg' => '1057.jpg','chistory' => '','cname' => 'Church of St. Joseph','psaint' => NULL,'estd' => '1998','substation' => 'Godhayar,Valiyela,Alamparai','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little way Association,Childrens Movement,Youth Movement,YCS,Christian Workers Movement,IFO,Legion of Mary,Vincent De Paul Society,CLC','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-joseph','access_user' => NULL),
            array('id' => '156','churchid' => '1058','cimg' => '1058.jpg','chistory' => '    <p align="justify">St. Josephs Church, Appattuvilai is one of the 101 parishes in the diocese of kuzhithurai which is located in the southern most tip of India. This beautiful and serene village is surrounded by green trees and ponds. This was established a Parish in 1999. The old church was built in 1964. The works of the new church was started in 2008 by Rev.Fr.Vargheese the then parish priest. The successive priests did their best to carry on the work. The work was successfully completed by Rev.Fr.George Ponnaiah in 2015. The Patron of the parish is St.JOSEPH. </p>
          <p align="justify">The peoples hard work and generous contribution is commendable. There are 300 families. The total population is over 1000. People of other religion such as Hindus live with us. There is perfect unity and religious harmony among the people. </p>
          <p align="justify">The lay people are the biggest asset to the Catholic community. Their systematic and active involvement in the parish is wonderful. </p>
          <p align="justify">The entire community untiedly works for the social spiritual and pastoral improvement of the community. Special attention is paid to the upliftment of the poor and the down trodden. </p>','cname' => 'Church of St. Joseph','psaint' => 'St. Joseph','estd' => '1999','substation' => '      ','institution' => '  St. Joseph Finance<br>Nutritious meal centre (for children)<br>St. Antony Primary school (Tamil Medium)<br>Appattuvilai People Welfare Centre.','anbiyam' => 'Parish Council,Anbiam(BCC)-10,','pious' => '  Catholic Association,YCW,Youth,Legion of Mary,Sacred Heart Association','families' => '250','population' => '1000','website' => 'www.stjosephsappattuvilai.com','address' => '    Appattuvilai<br>Thuckalay Post - 629175<br>Kanyakumari District<br>  ','telephone' => '91 4651 256147','sgroups' => '      Catholic Association (Political wing)','pemail' => 'soosaiyappar@gmail.com','type' => 'Parish','slug' => 'church-of-st-joseph','access_user' => NULL),
            array('id' => '157','churchid' => '1059','cimg' => '1059.jpg','chistory' => '','cname' => 'Church of St.Pius X','psaint' => NULL,'estd' => '1999','substation' => 'Thattanvilai','institution' => 'Pius Kindergarten School,St.Theresas Tailoring Centre','anbiyam' => 'Parish Council,Anbiam(BCC)-11,','pious' => 'Little Way Association,YCS,Youth,Vincent De Paul Society,Legion of Mary,Womens Movement,KAIGAL,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-pius-x','access_user' => NULL),
            array('id' => '158','churchid' => '1060','cimg' => '1060.jpg','chistory' => '','cname' => 'Church of St. Antony of Padua','psaint' => NULL,'estd' => '2002','substation' => 'Moolachel,Palapalli','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth,YCS,Legion of Mary,Sacred Heart Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony-of-padua','access_user' => NULL),
            array('id' => '159','churchid' => '1061','cimg' => '1061.jpg','chistory' => '','cname' => 'Church of the Holy Redeemer of the World','psaint' => NULL,'estd' => '2000','substation' => 'Chellankonam,Maruthancode','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-holy-redeemer-of-the-world','access_user' => NULL),
            array('id' => '160','churchid' => '1062','cimg' => '1062.jpg','chistory' => '','cname' => 'Church of Our Lady of Good Health','psaint' => NULL,'estd' => '2000','substation' => 'Sebastiapuram','institution' => 'Arockiya Matha Matriculation School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Legion of Mary,Vincent De Paul Society,Rural Motivation Program,Youth,YCS,Little Way Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-good-health','access_user' => NULL),
            array('id' => '161','churchid' => '1063','cimg' => '1063.jpg','chistory' => '','cname' => 'Church of Our Lady of Perpetual Succour','psaint' => NULL,'estd' => '2001','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-9,B','pious' => 'Women Committee,Education Committee,Rural Motivation Program(women),Commission for Evangelization,Catholic Action Society,Women Welfare Movement,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-perpetual-succour','access_user' => NULL),
            array('id' => '162','churchid' => '1064','cimg' => '1064.jpg','chistory' => '','cname' => 'Church of Infant Jesus','psaint' => NULL,'estd' => '2001','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-6','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-infant-jesus','access_user' => NULL),
            array('id' => '163','churchid' => '1065','cimg' => '1065.jpg','chistory' => '','cname' => 'Church of the Immaculate Heart of Mary','psaint' => NULL,'estd' => '2001','substation' => 'Karumpilavilai,Udavilai','institution' => 'Sacred Heart Primary School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,KOLPING,Rural Motivation Program,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-immaculate-heart-of-mary','access_user' => NULL),
            array('id' => '164','churchid' => '1066','cimg' => '1066.jpg','chistory' => '            a<br>  ','cname' => 'Church of Christ the King','psaint' => 'a','estd' => '2002','substation' => 'Mannanvilai','institution' => 'Christ the King Primary & High Schools','anbiyam' => 'Parish Council,Anbiam(BCC)-12,','pious' => 'Childrens Group,YCS,Little Way Association,Legion of Mary','families' => 'a','population' => 'a','website' => 'a','address' => '  a','telephone' => 'a','sgroups' => '    a  ','pemail' => 'a','type' => 'Parish','slug' => 'church-of-christ-the-king','access_user' => NULL),
            array('id' => '165','churchid' => '1067','cimg' => '1067.jpg','chistory' => '','cname' => 'Church of the Ascension of Lord','psaint' => NULL,'estd' => '2004','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,YCS,Youth Movement,Rural Motivation Program,Sacred Heart Pius Association,Christian Life Movement,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-ascension-of-lord','access_user' => NULL),
            array('id' => '166','churchid' => '1068','cimg' => '1068.jpg','chistory' => '','cname' => 'Church of the Sacred Heart','psaint' => NULL,'estd' => '2005','substation' => NULL,'institution' => 'Sacred Heart Matric School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Childrens Movement,Youth,Legion of Mary,Christian Life Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-the-sacred-heart','access_user' => NULL),
            array('id' => '167','churchid' => '1069','cimg' => '1069.jpg','chistory' => '','cname' => 'Church of St. Roch','psaint' => NULL,'estd' => '2006','substation' => 'Monday Market,Thachamparampu','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Movement,Christian Workers Movement,Kolping,Legion of Mary,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-roch','access_user' => NULL),
            array('id' => '168','churchid' => '1070','cimg' => '1070.jpg','chistory' => '','cname' => 'Church of St. Therese of Child Jesus','psaint' => NULL,'estd' => '2006','substation' => NULL,'institution' => 'St.Peters RC Primary and Higher Secondary School Chekkal','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Catholic Action Society,Rural Development Program,Kolping Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-therese-of-child-jesus','access_user' => NULL),
            array('id' => '169','churchid' => '1071','cimg' => '1071.jpg','chistory' => '','cname' => 'Church of Our Lady of Fathima','psaint' => NULL,'estd' => '1987','substation' => 'Pilavilai','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth,Vincent De Paul Society,Christian Life Movement,Childrens Movement,Little Way Association,YCS','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-fathima','access_user' => NULL),
            array('id' => '170','churchid' => '1072','cimg' => '1072.jpg','chistory' => '','cname' => 'Church of St. Michael','psaint' => NULL,'estd' => '2008','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Kolping Movement,Rural Motivation Program,Christian Life Movement,Catholic Action Society,Vincent De Paul Society,Fransiscan Order III,Childrens Movement,Little Way Association,YCS,Youth','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-michael','access_user' => NULL),
            array('id' => '171','churchid' => '1073','cimg' => '1073.jpg','chistory' => '','cname' => 'Church of Our Lady of Sorrows','psaint' => NULL,'estd' => NULL,'substation' => 'Aloor','institution' => 'Viyagula Annai Primary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society,Christian Workers Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-sorrows','access_user' => NULL),
            array('id' => '172','churchid' => '1074','cimg' => '1074.jpg','chistory' => '','cname' => 'Church of St. Joseph','psaint' => NULL,'estd' => NULL,'substation' => 'Tholayavattam','institution' => 'Jeevan Jotji','anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,Childrens Movement,Youth Movement,Womens Movement,YCS,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-joseph','access_user' => NULL),
            array('id' => '173','churchid' => '1075','cimg' => '1075.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2008','substation' => 'St.Michaels Church Thittavilai,St.Xaviers Church Pullenkuzhi','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,YCS,Youth Movement,KAIGAL Movement,Womens Movement,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '174','churchid' => '1076','cimg' => '1076.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier','psaint' => NULL,'estd' => '2009','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier','access_user' => NULL),
            array('id' => '175','churchid' => '1077','cimg' => '1077.jpg','chistory' => '','cname' => 'Church of Our Lady of Lourdes','psaint' => NULL,'estd' => '2009','substation' => 'Chittar,Channelkarai,Maruthamparai-Mission Station','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Little Way Association,Childrens Movement,YCS,Legion of Mary,Christian Workers Movement,Christian Life Movement,KAIGAL,Carmel 3rd Committee,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-lourdes','access_user' => NULL),
            array('id' => '176','churchid' => '1078','cimg' => '1078.jpg','chistory' => '','cname' => 'Church of St. Joseph','psaint' => NULL,'estd' => '2009','substation' => 'Thachoor','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-11','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-joseph','access_user' => NULL),
            array('id' => '177','churchid' => '1079','cimg' => '1079.jpg','chistory' => '','cname' => 'Sts.Peter & Paul Church','psaint' => NULL,'estd' => '2009','substation' => 'Mathoorkonam-Holy Redeemer','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Assoiation,YCS,Youth,IFO,Sacred Heart Pius Association,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'sts-peter-paul-church','access_user' => NULL),
            array('id' => '178','churchid' => '1080','cimg' => '1080.jpg','chistory' => '','cname' => 'Church of Our Lady of Perpectual Help','psaint' => NULL,'estd' => '2009','substation' => 'Ponmanai,Perunchani','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-16','pious' => 'Youth,YCS,Childrens Movement,Legion of Mary,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-perpectual-help','access_user' => NULL),
            array('id' => '179','churchid' => '1081','cimg' => '1081.jpg','chistory' => '','cname' => 'Church of St. George','psaint' => NULL,'estd' => '2010','substation' => 'Vasanthapuram','institution' => NULL,'anbiyam' => 'Parish Council,Audit Council,A','pious' => 'Little Way Assciation,YCS,Youth Movement,Womens Movement,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-george','access_user' => NULL),
            array('id' => '180','churchid' => '1082','cimg' => '1082.jpg','chistory' => '','cname' => 'Church of St. Little Flower','psaint' => NULL,'estd' => '2010','substation' => 'Verkilambi','institution' => 'Little Flower Nursery & Primary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Banana Farmers Association,Womens Movement,Youth Movement,YCS,Christian Workers Movement,Childrens Movement,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-little-flower','access_user' => NULL),
            array('id' => '181','churchid' => '1083','cimg' => '1083.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2010','substation' => 'Kattuvilai','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-9','pious' => 'Childrens Movement,Little Way Association,YCS,Youth Commission,Catholic Action Society,Legion of Mary,Vincent De Paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '182','churchid' => '1084','cimg' => '1084.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2010','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-6,S','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Christian Life Movement,Womens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '183','churchid' => '1085','cimg' => '1085.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2010','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Little Way Association,YCS,Youth Movement,Kaigal Movement,Kolping Association,Legion of Mary,Rural Motivation Program','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '184','churchid' => '1086','cimg' => '1086.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier','psaint' => NULL,'estd' => '2007','substation' => 'Mathar','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-9,B','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Vincent De Paul Society,Catholic Action Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier','access_user' => NULL),
            array('id' => '185','churchid' => '1087','cimg' => '1087.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier','psaint' => NULL,'estd' => '2011','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,YCS,Youth Movement,Women Movement,Legion of Mary,Vincent De paul Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier','access_user' => NULL),
            array('id' => '186','churchid' => '1088','cimg' => '1088.jpg','chistory' => '','cname' => 'Church of Our Lady of Sorrows','psaint' => NULL,'estd' => '2011','substation' => 'Maavilai','institution' => 'St.Marys R.C.Primary School','anbiyam' => 'Parish Council,Finance Council','pious' => 'Legion of Mary,Catholic Action Society,Christian Workers Movement,Don Bosco Youth Movement,YCS,Little Way Association,Childrens Movement,Kolping Movement,Franciscan 3rd Order,Vincent De Paul Sangam','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-sorrows','access_user' => NULL),
            array('id' => '187','churchid' => '1089','cimg' => '1089.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '1945','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance & Audit','pious' => 'Catholic Action,RMP,YCS,Little Way Association,Childrens Movement,Youth Movement,Sacred Heart Society,Legion of Mary,Womens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '188','churchid' => '1090','cimg' => '1090.jpg','chistory' => '','cname' => 'Church of Our Lady of Fatima','psaint' => NULL,'estd' => '2011','substation' => 'Muthalar,Machuvilai','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-11,','pious' => 'Youth Group,YCS,Rural Motivation Program,Christian Workers Movement,Legion of Mary,Holy Childhood,Little Way Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-fatima','access_user' => NULL),
            array('id' => '189','churchid' => '1091','cimg' => '1091.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2012','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Legion of Mary,YCS,Catholic Action Society,Christian Workers Movement,Childrens Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '190','churchid' => '1092','cimg' => '1092.jpg','chistory' => '','cname' => 'Church of Our Lady of Fatima','psaint' => NULL,'estd' => '2012','substation' => 'Kakkavilai','institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-7 S','pious' => 'Little way Association,YCS,Children Movement,Legion of Mary,Catholic Action Society','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-fatima','access_user' => NULL),
            array('id' => '191','churchid' => '1093','cimg' => '1093.jpg','chistory' => '','cname' => 'Church of St. Joseph','psaint' => NULL,'estd' => '2012','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Little way Association,YCS,Youth Movement,Rural Motivation Program,Catholic Action Society,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-joseph','access_user' => NULL),
            array('id' => '192','churchid' => '1094','cimg' => '1094.jpg','chistory' => '','cname' => 'Church of Our Lady of Mount Carmel','psaint' => NULL,'estd' => '2013','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Womens Movement,Christian Life Movement,Rural Motivation Program,KAIGAL','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-our-lady-of-mount-carmel','access_user' => NULL),
            array('id' => '193','churchid' => '1095','cimg' => '1095.jpg','chistory' => '','cname' => 'Church of St. Francis Xavier','psaint' => NULL,'estd' => '2013','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Anbiam(BCC)-9','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society,KAIGAL','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-francis-xavier','access_user' => NULL),
            array('id' => '194','churchid' => '1096','cimg' => '1096.jpg','chistory' => '','cname' => 'Church of St. Gabriel','psaint' => NULL,'estd' => '2013','substation' => 'Church of Our Lady of Goog Health, Kallupalam','institution' => 'St.Gabriel R.C. Middle School','anbiyam' => 'Parish Council,Finance Committ','pious' => 'Little way Association,YCS,Youth Movement,Rural Motivation Program,Catholic Action Society,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-gabriel','access_user' => NULL),
            array('id' => '195','churchid' => '1097','cimg' => '1097.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2014','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Christian Workers Movement,Legion of Mary,Christian Life Movement,Vincent De Paul Society,KAIGAL,Rural Motivation Program,Dalit Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '196','churchid' => '1098','cimg' => '1098.jpg','chistory' => '','cname' => 'Church of Sacred Heart of Jesus','psaint' => NULL,'estd' => '2014','substation' => 'Maruthoorkurichi','institution' => NULL,'anbiyam' => 'Parish Council,Finance Council','pious' => 'Youth Commission,YCS,Little Way Association,Legion of Mary,Catholic Action Movement,Christian Workers Movement','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-sacred-heart-of-jesus','access_user' => NULL),
            array('id' => '197','churchid' => '1099','cimg' => '1099.jpg','chistory' => '','cname' => 'Church of St. Antony','psaint' => NULL,'estd' => '2014','substation' => 'Veppuvilai','institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Youth Movement,Legion of Mary,Christian Life Movement,Sacred Heart Pius Association,Catholic Action Society,YCS,Little Way Association','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-antony','access_user' => NULL),
            array('id' => '198','churchid' => '1100','cimg' => '1100.jpg','chistory' => '','cname' => 'Church of St.Michael the Archangel','psaint' => NULL,'estd' => '2014','substation' => NULL,'institution' => NULL,'anbiyam' => 'Parish Council,Finance Committ','pious' => 'Kolping India,Sacred Heart Pious Association,Womens Movement,Catholic Action Society,Christian Life Movement, Childrens Movement,Little Way Association,YCS,Youth,Vincent De Paul Society,Legion of Mary','families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Parish','slug' => 'church-of-st-michael-the-archangel','access_user' => NULL),
            array('id' => '202','churchid' => '1101','cimg' => '1101.jpg','chistory' => '-','cname' => 'Martyr Devasahayampillai Shrine, Nattalam 629 195','psaint' => NULL,'estd' => NULL,'substation' => NULL,'institution' => NULL,'anbiyam' => NULL,'pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Shrine','slug' => 'martyr-devasahayampillai-shrine-nattalam-629-195','access_user' => NULL),
            array('id' => '203','churchid' => '1102','cimg' => '1102.jpg','chistory' => '-','cname' => 'St. Antony Shrine, Vettuvenni, Kuzhithurai 629 163','psaint' => NULL,'estd' => NULL,'substation' => NULL,'institution' => NULL,'anbiyam' => NULL,'pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Shrine','slug' => 'st-antony-shrine-vettuvenni-kuzhithurai-629-163','access_user' => NULL),
            array('id' => '204','churchid' => '1103','cimg' => '1103.jpg','chistory' => '-','cname' => 'Martyr Devasahayampillai Shrine, Puliyoorkurichy, Thuckalay 629 175','psaint' => NULL,'estd' => NULL,'substation' => NULL,'institution' => NULL,'anbiyam' => NULL,'pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Shrine','slug' => 'martyr-devasahayampillai-shrine-puliyoorkurichy-thuckalay-629-175','access_user' => NULL),
            array('id' => '205','churchid' => '1104','cimg' => '1104.jpg','chistory' => '-','cname' => 'St. Antony Shrine, Chunkankadai 629 003','psaint' => NULL,'estd' => NULL,'substation' => NULL,'institution' => NULL,'anbiyam' => NULL,'pious' => NULL,'families' => NULL,'population' => NULL,'website' => NULL,'address' => NULL,'telephone' => NULL,'sgroups' => NULL,'pemail' => NULL,'type' => 'Shrine','slug' => 'st-antony-shrine-chunkankadai-629-003','access_user' => NULL)
          );


          $this->db = db_connect('default');

          if(!empty($_GET['parish'])){

            $arrayBatch = [];

            foreach ($parish as $key => $paris_one) 
            {
                $arrayBatch[] = ['company_name'=>$paris_one['cname'],'type'=> ($paris_one['type'] == 'Shrine')?'organization':'person', 'address'=>$paris_one['address']];
            }
            
            $this->db->table('_clients')->insertBatch($arrayBatch); 
          }

          if(!empty($_GET['priest']))
          {

$priest = array(
  array('id' => '1','priestid' => '1001','pname' => 'Fr. Mathias. M','pfname' => 'Mr. Maria Michael','pmnane' => 'Mrs. Annammal','pdob' => '13.06.1931','pplace' => 'Mathiravilai','pseminary' => '','porddate' => '28.03.1960','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop T.R. Agniswami S.J.','pminstring' => 'Retired','paddress' => '              14/23rd Main Road<div></div><div>Srinivasa Nagar</div><div>Trichy 620 017</div>','pphone' => '0431-2782798','pmobile' => '9443466617','pemail' => '','pimg' => '1001.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-mathias-m'),
  array('id' => '2','priestid' => '1002','pname' => 'Fr. Wenceslaus C.M. (Late)','pfname' => 'Mr. Chinnayyan Michael','pmnane' => 'Mrs. Cecily','pdob' => '27.05.1933','pplace' => 'Thiruvithancode','pseminary' => 'St. Raphael\\\'s Seminary  Quilon,St. Paul\\\'s Seminary Trichy ','porddate' => '24.03.1961','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop T.R. Agniswamy S.J.','pminstring' => 'Deceased','paddress' => '                    South Gate,Near Government Mid. Sch.,Thiruvithancode P.O. 629 174','pphone' => '','pmobile' => '9443579750','pemail' => '','pimg' => '1002.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-wenceslaus-c-m-late'),
  array('id' => '3','priestid' => '1003','pname' => 'Fr. Mariadhas A.','pfname' => 'Mr. Arockiam','pmnane' => 'Mrs. Annammal','pdob' => '06.05.1937','pplace' => 'Kuzhivilai','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy','porddate' => '27.03.1963','pordplace' => 'St.Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop T.R. Agniswami S.J.','pminstring' => 'Spiritual Father, puliyoorkurichy','paddress' => '            Martyr Devasahayampillai Shrine, Puliyoorkurichy, Thuckalay 629175','pphone' => '','pmobile' => '8220695762','pemail' => '','pimg' => '1003.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-mariadhas-a'),
  array('id' => '4','priestid' => '1004','pname' => 'Fr. Jesudhasan Thomas','pfname' => 'E.Thomas','pmnane' => 'Annammal','pdob' => '28.03.1935','pplace' => 'Arockiapuram','pseminary' => 'St.Aloysius Pune, St.Gorgan Germany','porddate' => '25.07.1963','pordplace' => 'Eschweiler Germany','pordby' => 'Bishop John Pohlschmener','pminstring' => 'Spiritual Director, St. Aloysius Minor seminary','paddress' => '        Spiritual Director, St. Aloysius Minor seminary, PB No:17, Asaripallam Road, Nagercoil - 629001','pphone' => '','pmobile' => '9442076656','pemail' => 'jesudason@gmx.de','pimg' => '1004.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jesudhasan-thomas'),
  array('id' => '5','priestid' => '1006','pname' => 'Fr. Robert V','pfname' => 'Mr. Varuvel Antony','pmnane' => 'Mrs. Maria Raja Retinam','pdob' => '10.02.1945','pplace' => 'Mela Ramanputhoor','pseminary' => 'St. Aloysius Seminary, Nagercoil,  St. Joseph\\\'s Seminary, Alwaye','porddate' => '20.12.1968','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop T.R. Agniswami S.J','pminstring' => 'Parish priest, Kappiarai','paddress' => '    <span lang="EN-IN" style="line-height: 115%; font-family: Arial, sans-serif;"><font size="3">&nbsp;Parish Priest, Church of St. Catherine, Kappiarai</font></span>','pphone' => '','pmobile' => '9487411988','pemail' => 'robertvaruvel@gmail.com','pimg' => '1006.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-robert-v'),
  array('id' => '6','priestid' => '1007','pname' => 'Fr. Joseph Raj A.','pfname' => 'Mr. Albert','pmnane' => 'Mrs. Pragasi','pdob' => '16.06.1943','pplace' => 'Madathattuvilai','pseminary' => 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary, Poonamallee ','porddate' => '19.12.1969','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop T.R. Agniswamy S.J.','pminstring' => 'Kanjiracode','paddress' => '      <p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt"><span lang="EN-IN" style="font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif;">Church
of O.L. of Rosary, Kan','pphone' => '','pmobile' => '9443940064','pemail' => '','pimg' => '1007.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-joseph-raj-a'),
  array('id' => '7','priestid' => '1008','pname' => 'Fr. Mariadhasan. S','pfname' => 'Mr. Savarimuthu','pmnane' => 'Mrs. Gnanapooammal','pdob' => '01.06.1943','pplace' => 'Chithenthope','pseminary' => 'St. Paul\\\'s Seminary, Trichy ','porddate' => '19.12.1969','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop T.R. Agniswamy S.J.','pminstring' => 'Co- Pastor, Pannavilai','paddress' => '    <p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt"><span style="font-family: Arial, sans-serif; font-size: 12pt;">Church
of the Holy Redeemer of the World, Pannavilai</span></p>','pphone' => '','pmobile' => '9487108765','pemail' => '','pimg' => '1008.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-mariadhasan-s'),
  array('id' => '8','priestid' => '1009','pname' => 'Fr. Hilary A.M.','pfname' => 'Antony Muthu','pmnane' => 'Mariaanthony','pdob' => '29.01.1946','pplace' => 'Mylacode','pseminary' => 'St.Joseph\\\'s ','porddate' => '21.12.1970','pordplace' => 'Kottar','pordby' => 'Bishop Agnisamy','pminstring' => 'Vicar Forane, Vicariate of Mulagumoodu','paddress' => '    <p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt"><span style="font-family: Arial, sans-serif; font-size: 12pt;">St.
Michaelâ€™s Shrine, Puliyurkurichi</span></p>','pphone' => '9443180972','pmobile' => '9488911972','pemail' => 'hilaryam2015@gmail.com, muthu416@yahoo.com','pimg' => '1009.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-hilary-a-m'),
  array('id' => '9','priestid' => '1010','pname' => 'Fr. Chellaiyan P.K. ','pfname' => 'Mr. Kumaravel','pmnane' => 'Mrs. Kochukali','pdob' => '22.05.1942','pplace' => 'Nallayanpuram','pseminary' => 'St. Paul\\\'s Seminary, Trichy','porddate' => '21.12.1971','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Retired ','paddress' => '    ','pphone' => '','pmobile' => '9442304254','pemail' => '','pimg' => '1010.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-chellaiyan-p-k'),
  array('id' => '10','priestid' => '1011','pname' => 'Fr. Wilfred Felix A.','pfname' => '','pmnane' => '','pdob' => '21.02.1948','pplace' => 'Puthenkadai','pseminary' => '','porddate' => '18.03.1972','pordplace' => '','pordby' => '','pminstring' => '','paddress' => '          Asian Centre for Cross Cultural Studies,40/6A Panayur Kuppam Road,Panayur, Sholinganallur P.O.,Chennai 600 119','pphone' => '044 24530206,24530682','pmobile' => '9444034665','pemail' => 'felixwilfred@gmail.com','pimg' => '1011.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-wilfred-felix-a'),
  array('id' => '11','priestid' => '1012','pname' => 'Fr. Innocent J.','pfname' => 'Mr. S.Jones','pmnane' => 'Mrs. Ronickam','pdob' => '02.05.1946','pplace' => 'Karungal ','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Joseph\\\'s Pont.Seminary, Alwaye','porddate' => '21.12.1972','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Parish priest, Kaliakkavilai','paddress' => '    <span lang="EN-IN" style="font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif; color: black;">Parish Priest,<b>&nbsp;</b>Church of St. Antony, Kaliakkavilai</span>','pphone' => '9443791058','pmobile' => '7708755017','pemail' => 'innocent020546@gmail.com','pimg' => '1012.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-innocent-j'),
  array('id' => '12','priestid' => '1013','pname' => 'Fr. Peter M.','pfname' => 'Mr. Mariakkan','pmnane' => 'Mrs. Gnanasoundari','pdob' => '31.07.1950','pplace' => 'Chithenthopue Kandanvilai','pseminary' => 'St. Aloysius Seminary, Nagercoil ,St. Joseph\\\'s Seminary, Alwaye ','porddate' => '22.12.1974','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Archbishop M. Arockiaswamy','pminstring' => 'Parish priest, Thundathuvilai','paddress' => '              Parish Priest ,Church of St. Antony of Padua,Thundathuvilai,Karungal 629 157','pphone' => '9443993582','pmobile' => '9965590625','pemail' => 'avcpeter@yahoo.com','pimg' => '1013.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-peter-m'),
  array('id' => '13','priestid' => '1014','pname' => 'Fr. Jesu Marian A.','pfname' => 'Mr. Arockiam','pmnane' => 'Mrs. Mariammal','pdob' => '28.05.1946','pplace' => 'Arockiapuram','pseminary' => 'St. Aloysius Seminary, Nagercoil,Sacred Heart Seminary, Ponnamallee ','porddate' => '04.02.1975','pordplace' => 'St. Francis Xavier\\\'s Church Manguzhy','pordby' => 'Archbishop M. Arockiaswamy','pminstring' => 'Sacred Heart Seminary','paddress' => '                <p>Sacred Heart Seminary</p><p>Karayanchavadi</p><p>Poonamalle</p><p>Chennai</p>','pphone' => '','pmobile' => '9442525044','pemail' => 'jesumarian@gmail.com','pimg' => '1014.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jesu-marian-a'),
  array('id' => '14','priestid' => '1015','pname' => 'Fr. Antony R. ','pfname' => 'Mr. Rajendran','pmnane' => 'Mrs. Arockiam','pdob' => '25.06.1944','pplace' => 'Palliady','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy, St. Paul\\\'s Seminary, Trichy ','porddate' => '12.05.1975','pordplace' => 'Palliadi','pordby' => 'Archbishop Arockiaswami M.','pminstring' => 'Confessor','paddress' => '                    Church of O.L. of Nativity, Mulagumoodu 629 167','pphone' => '','pmobile' => '9488425144','pemail' => '','pimg' => '1015.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-antony-r'),
  array('id' => '15','priestid' => '1016','pname' => 'Fr. Arul Devadhason M. ','pfname' => 'Mr. S. Maria Arockiam','pmnane' => 'Mrs. Maria Kavalal','pdob' => '06.05.1948','pplace' => 'Punnai Nagar','pseminary' => 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary Poonamallee, Regency Viyasarpady, Chennai, P','porddate' => '14.04.1977','pordplace' => 'Carmel High School, Ramanputhoor','pordby' => 'Archbishop. Arockiaswami M.','pminstring' => 'Shrine of St. Antony,Vettuvenni','paddress' => '                Shrine of St. Antony,Vettuvenni, Kuzhithurai 629 163','pphone' => '','pmobile' => '9443129153','pemail' => 'fr_addhason@rediffmail.com','pimg' => '1016.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-arul-devadhason-m'),
  array('id' => '16','priestid' => '1017','pname' => 'Fr. Jesu Retnam S.','pfname' => 'Mr. Stanislaus','pmnane' => 'Mrs. Maria Packiam','pdob' => '01.01.1950','pplace' => 'Mankuzhy','pseminary' => 'St. Paul\\\'s Seminary, Trichy','porddate' => '17.04.1977','pordplace' => 'Mankuzhy','pordby' => 'Archbishop M. Arockiaswamy','pminstring' => 'Vicar General','paddress' => '        <p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt">Parish Priest, Church of St. Joseph, Manchady, Kattathurai- 629158</p>','pphone' => '','pmobile' => '9442788275','pemail' => 'jco_ordinator@yahoo.co.in','pimg' => '1017.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jesu-retnam-s'),
  array('id' => '17','priestid' => '1018','pname' => 'Fr. Vargheese S','pfname' => 'Mr. Savarimuthu','pmnane' => 'Mrs. Theresammal','pdob' => '27.03.1948','pplace' => 'Thickurichy','pseminary' => 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary Poonamallee','porddate' => '02.05.1978','pordplace' => 'Thickurichy','pordby' => 'Archbishop M. Arockiaswamy','pminstring' => 'Parish Priest, Kamplar','paddress' => '  Church of St.Joseph, Kamplar, Tholaiyavattam - 629159','pphone' => '04651 269077','pmobile' => '9486248535','pemail' => '','pimg' => '1018.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-vargheese-s'),
  array('id' => '18','priestid' => '1019','pname' => 'Fr. Vincent Raj S.','pfname' => 'Mr. Savarimuthu','pmnane' => 'Mrs. Rajammal','pdob' => '24.06.1953','pplace' => 'Kalkurichy','pseminary' => 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary  Poonamallee  ','porddate' => '03.10.1979','pordplace' => 'Kalkurichy','pordby' => 'Archbishop M. Arockiaswamy','pminstring' => 'Vicar Forane, Vicariate of Mathiravilai','paddress' => '  &nbsp;Church of St.Michael the Archangel, Manalikuzhivilai&nbsp;<div><br></div>','pphone' => '9486933818','pmobile' => '9443370360','pemail' => 'frsvincentraj@gmail.com','pimg' => '1019.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-vincent-raj-s'),
  array('id' => '19','priestid' => '1020','pname' => 'Fr. Maria Alphonse V.','pfname' => 'Mr. V. Wenceslaus','pmnane' => 'Mrs. Agathammal','pdob' => '17.12.1954','pplace' => 'Vellicode','pseminary' => 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor, Theology  Papal Seminary, Pune, Philosop','porddate' => '27.05.1980','pordplace' => 'Vellicode','pordby' => 'Bishop Antonymuthu Bishop of Vellore','pminstring' => 'Vicar General','paddress' => '        Bishop\'s House, P.B.No: 1,Unnamalaikadai 629179,K.K. Dist','pphone' => '','pmobile' => '9486249262','pemail' => 'vmalphonse@gmail.com','pimg' => '1020.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-alphonse-v'),
  array('id' => '20','priestid' => '1021','pname' => 'Fr. Raphael V.','pfname' => 'Mr. A. Varuvel','pmnane' => 'Mrs. Maria Sebastiaye','pdob' => '22.02.1952','pplace' => 'Appattuvilai','pseminary' => 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee Christ Hall, Karumathoor','porddate' => '15.06.1981','pordplace' => 'Appattuvilai','pordby' => 'Most Rev. M. Arockiaswamy','pminstring' => 'Formator, St. Paul\'s Seminary, Trichy','paddress' => '          St. Paul\'s Seminary ,P.B.No.36,Trichy 620 001','pphone' => '0431 2402500, 2402501','pmobile' => '9442383326','pemail' => 'raphaelvbible@yahoo.co.in','pimg' => '1021.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-raphael-v'),
  array('id' => '21','priestid' => '1022','pname' => 'Fr. Paschal S. Prosper','pfname' => 'Mr. Singarayan','pmnane' => 'Mrs. Rosammal','pdob' => '17.05.1952','pplace' => 'Puthenkadai','pseminary' => 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor,St. Paul\\\'s Seminary, Trichy','porddate' => '18.04.1982','pordplace' => 'Puthenkadai','pordby' => 'Archbishop M. Arockiaswamy','pminstring' => '','paddress' => '      Rua 7 De Setembro,No 348, Tabuleiro Do Martins,CEP 57.061 140 Maceio AL,Brazil.    ','pphone' => '','pmobile' => '0055 8299814195','pemail' => 'paschalprosper@yahoo.com.br','pimg' => '1022.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-paschal-s-prosper'),
  array('id' => '22','priestid' => '1023','pname' => 'Fr. Xavier Bruce. R','pfname' => 'P. Rajendran','pmnane' => 'A. Nesammal','pdob' => '31.07.1957','pplace' => 'Thalavaipuram','pseminary' => 'Papal Seminary, Pune','porddate' => '27.10.1982','pordplace' => 'Carmel Nagar','pordby' => 'Bishop M. Arokiasamy','pminstring' => 'Co - Pastor Munchirai','paddress' => 'Church of O.L.of Good Health. Munchirai, Puthukadai - 629171','pphone' => '','pmobile' => '9597055386','pemail' => 'xavierbrucer@yahoo.com','pimg' => '1023.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-xavier-bruce-r'),
  array('id' => '23','priestid' => '1024','pname' => 'Fr. Francis S.','pfname' => '','pmnane' => '','pdob' => '25.05.1956','pplace' => 'Chemparuthivilai','pseminary' => '','porddate' => '10.04.1983','pordplace' => '','pordby' => '','pminstring' => 'USA','paddress' => '      USA','pphone' => '','pmobile' => '','pemail' => '','pimg' => '1024.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-francis-s'),
  array('id' => '24','priestid' => '1025','pname' => 'Fr. George Ponnaiah','pfname' => 'Mr. Swaminathan Ponnaiah','pmnane' => 'Mrs . Maria Chellammal','pdob' => '06.12.1957','pplace' => 'Moolachael','pseminary' => 'St. Aloysius Seminary, Nagercoil.  St. Peter\\\'s Seminary, Madurai.  Papal Seminary, Pune','porddate' => '10.12.1983','pordplace' => 'Moolachel','pordby' => 'Archishop M. Arockiaswamy','pminstring' => 'Parish Priest, Panavilai','paddress' => '          Parish Priest, Church of the Holy Redeemer of the World, Panavilai.','pphone' => '04651 256147','pmobile' => '9488282787','pemail' => 'fr_ponnaiah@yahoo.com','pimg' => '1025.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-george-ponnaiah'),
  array('id' => '25','priestid' => '1026','pname' => 'Fr. Mary John R.','pfname' => 'Mr. Rayappan','pmnane' => 'Mrs. Savariai','pdob' => '28.01.1957','pplace' => 'Melpuram','pseminary' => 'St. Aloysius Seminary, Nagercoil, St. Peter\\\'s Seminary, Madurai,St. Paul\\\'s Seminary, Trichy ','porddate' => '29.04.1984','pordplace' => 'Assisi Campus, Nagercoil','pordby' => 'Bishop M. Arokiasamy','pminstring' => 'Parish Priest, Irudhayapuram','paddress' => '        Parish Priest,Church of Sacred Heart of Jesus, Irudhayapuram, Kuzhicode - 629 167','pphone' => '','pmobile' => '9443450709','pemail' => 'rmaryjohn@yahoo.co.uk','pimg' => '1026.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-mary-john-r'),
  array('id' => '26','priestid' => '1027','pname' => 'Fr. Augustine P. ','pfname' => 'Mr. K. Ponnaian','pmnane' => 'Mrs. Annammal','pdob' => '14.11.1958','pplace' => 'Elavuvilai','pseminary' => 'St. Aloysius Seminary, Nagercoil, St. Paul\\\'s Seminary, Trichy','porddate' => '14.04.1985','pordplace' => 'St. Xavier\\\'s Cathedral,Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Procurator of the Diocese','paddress' => '          Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K. Dist, Tamilnadu. ','pphone' => '','pmobile' => '9486249201','pemail' => 'ponaugustine@gmail.com','pimg' => '1027.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-augustine-p'),
  array('id' => '27','priestid' => '1028','pname' => 'Fr. Vincent S.','pfname' => 'Mr. Joachim (Subakian)','pmnane' => ' Mrs. Rosammal','pdob' => '11.08.1957 ','pplace' => 'Vencode','pseminary' => 'St. Aloysius Seminary Nagercoil, St. Peter\\\'s Seminary Karumathoor, St. Paul\\\'s Seminary Trichy','porddate' => '14.04.1985','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Parish Priest, VelliaVilai','paddress' => '          Parish Priest,Church of Good Shepherd ,Velliavilai,Palapallam 629 159','pphone' => '','pmobile' => '9444051816','pemail' => '','pimg' => '1028.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-vincent-s'),
  array('id' => '28','priestid' => '1029','pname' => 'Fr. Antony M. Muthu','pfname' => 'Mr. Maria Siluvai','pmnane' => 'Mrs. Maria Isidorial','pdob' => '25.08.1958','pplace' => 'Mavilai, Mukkalampaddu','pseminary' => 'St. Peter\\\'s Seminary, Madurai, Sacred Heart Seminary, Poonamallee, College Studies Christ Hall, Kar','porddate' => '06.04.1986','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Parish Priest, Melpalai','paddress' => '        Church of Assumption of Our Lady, Melpalai 629 152','pphone' => '','pmobile' => '9444688225','pemail' => 'frmamuthu@yahoo.co.in','pimg' => '1029.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-antony-m-muthu'),
  array('id' => '29','priestid' => '1030','pname' => 'Fr. Elphinston Joseph J.','pfname' => 'Mr. K.S. John','pmnane' => ' Mrs. P. Rajammal','pdob' => '23.03.1961','pplace' => 'Kandanvilai','pseminary' => 'St. Aloysius Seminary Nagercoil,St. Peter\\\'s Seminary Madurai,Christ Hall Seminary Madurai,St. Paul\\','porddate' => '26.04.1987','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Italy ','paddress' => '            Italy','pphone' => '','pmobile' => '','pemail' => 'elphinj@yahoo.com','pimg' => '1030.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-elphinston-joseph-j'),
  array('id' => '30','priestid' => '1031','pname' => 'Fr. Maria Arputham R.','pfname' => 'Mr. M. Rayappan','pmnane' => 'Mrs. S. Mathavadial','pdob' => '13.12.1955','pplace' => 'Vencode','pseminary' => 'St. Peter\\\'s Seminary, Madurai.St. Paul\\\'s Seminary, Trichy','porddate' => '26.04.1987','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Parish Priest, Alencholai','paddress' => '        Parish Priest,Church of O.L. of Lourdes,Pilankalavilai (Alencholai), Kaliyal 629161','pphone' => '','pmobile' => '9486942860','pemail' => 'arpyroy@yahoo.com','pimg' => '1031.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-arputham-r'),
  array('id' => '31','priestid' => '1032','pname' => 'Fr. Maria Martin S.','pfname' => 'Mr. V. Sinkarayan','pmnane' => 'Mrs. T. Maria Muthu','pdob' => '29.03.1960','pplace' => 'Sahayanagar','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Peter\\\'s Seminary, Madurai, St. Paul\\\'s Seminary, Trichy','porddate' => '26.04.1987','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop M. Arockiaswamy','pminstring' => 'Secretary, Puthuvasantham','paddress' => '        Secretary, Puthuvasantham, Near Block Office, Tholayavattam - 629157','pphone' => '','pmobile' => '9442761150','pemail' => 'singhmark@yahoo.com','pimg' => '1032.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-martin-s'),
  array('id' => '32','priestid' => '1033','pname' => 'Fr. Joseph Jeyaseelan S.','pfname' => 'Mr. M. Stanislaus','pmnane' => 'Mrs. Palpeenammal','pdob' => '21.11.1962','pplace' => 'Karenkadu','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Peter\\\'s Seminary, Madurai,Christ Hall, Karumathur,St. Paul\\\'s ','porddate' => '04.04.1988','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev, M.Arockiasamy','pminstring' => 'Kalaikaviri','paddress' => '  Kalaikaviri College, 18-Benwells Road, Trichy-620001','pphone' => '','pmobile' => '9443118725','pemail' => 'frjeyaseelan@gmail.com, frjeyaseelan@yahoo.co.in','pimg' => '1033.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-joseph-jeyaseelan-s'),
  array('id' => '33','priestid' => '1034','pname' => 'Fr. Maria William M.','pfname' => 'Mr. M. Maria Soosai','pmnane' => 'Mrs. Mary Angel','pdob' => '08.01.1962','pplace' => 'Nullivilai','pseminary' => 'St. Aloysius Minor Seminary, Nagercoil, St. Peter\\\'s Madurai,Sacred Heart Seminary, Poonamallee','porddate' => '29.05.1988','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Iruthayaraj,','pminstring' => 'Correspondant, St. Xavier\'s Catholic College of Engineering, Chunkankadai','paddress' => '            Correspondant, St. Xavier\'s Catholic College of Engineering, Chunkankadai, Nagercoil - 629003','pphone' => '','pmobile' => '9488881212','pemail' => 'mahizh6218@yahoo.com','pimg' => '1034.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-william-m'),
  array('id' => '34','priestid' => '1035','pname' => 'Fr. George K.','pfname' => 'Mr. Kamalies','pmnane' => 'Mrs. Pragacy','pdob' => '06.04.1964','pplace' => 'Vencode','pseminary' => 'St. Aloysius Seminary, Nagercoil.Sacred Heart Seminary, Poonamallee','porddate' => '22.04.1990','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Elanthavilai','paddress' => '          Parish Priest,Church of  Holy Family, Elanthavilai, Meycode -629804','pphone' => '','pmobile' => '9487643191','pemail' => 'george28kamalies@gmail.com','pimg' => '1035.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-george-k'),
  array('id' => '35','priestid' => '1036','pname' => 'Fr. Xavier Benedict. S','pfname' => 'Mr. S. Sathianathan','pmnane' => 'Mrs. Ronickal','pdob' => '12.03.1964','pplace' => 'Vencode','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy','porddate' => '22.04.1990','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Rev. Leon A. Tharmaraj','pminstring' => 'St. Paul\'s Seminary','paddress' => '  St. Paul\'s Seminary, P.B.No: 36, Trichy - 620001','pphone' => '','pmobile' => '9442456818','pemail' => 'sbenxavier@gmail.com','pimg' => '1036.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-xavier-benedict-s'),
  array('id' => '36','priestid' => '1037','pname' => 'Fr. Gaspar Raj M. ','pfname' => 'Mr. Maria Paulian E.','pmnane' => 'Mrs. Maria Pushpam G.','pdob' => '22.01.1966','pplace' => 'Kanjampuram','pseminary' => 'St. Aloysius Seminary Nagercoil,Sacred Heart Seminary Poonamallee','porddate' => '07.04.1991','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Thamizh Maiyam','paddress' => '    Goodwill Communications Ltd., New No. 68, (Old No.150), Luz Church Road, Mylapore, Chennai 600 004','pphone' => '044 24994344','pmobile' => '9444072217','pemail' => '','pimg' => '1037.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-gaspar-raj-m'),
  array('id' => '37','priestid' => '1038','pname' => 'Fr. Russel Raj B.','pfname' => 'Mr. Bhakthinathan','pmnane' => 'Mrs. Rajammal','pdob' => '01.12.1963','pplace' => 'Cheriakolla','pseminary' => 'St. Aloysius Seminary, Nagercoil, St. Paul\\\'s Seminary, Trichy','porddate' => '07.04.1991','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Chancellor, Judicial Vicar and Rector of Nattalam shrine','paddress' => '              Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K.Dist, Tamilnadu. ','pphone' => '','pmobile' => '9486516374','pemail' => 'chancellor.kuzhithurai@gmail.com','pimg' => '1038.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-russel-raj-b'),
  array('id' => '38','priestid' => '1039','pname' => 'Fr. Sebastian F.','pfname' => 'Mr. A. Francis','pmnane' => 'Mrs. Mary John','pdob' => '15.05.1966','pplace' => 'Kulavilai, Konamcadu','pseminary' => 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee','porddate' => '26.04.1992','pordplace' => ' St. Xavier\\\'s Cathedral, Kottar','pordby' => ' Most Rev. Leon A.Tharmaraj','pminstring' => 'SIGARAM','paddress' => '  Sigaram, Main Road, Mulagumoodu.&nbsp;','pphone' => '','pmobile' => '9443450063','pemail' => 'mail_seba@yahoo.com','pimg' => '1039.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-sebastian-f'),
  array('id' => '39','priestid' => '1040','pname' => 'Fr. Sekhar Michael','pfname' => 'Mr. K. Savarimuthu','pmnane' => 'Mrs. S. Kamala Josephine','pdob' => '14.11.1966','pplace' => 'Thuckalay','pseminary' => 'St. Aloysius Seminary Nagercoil (1984 1986), Christ Hall Seminary  Karumathoor(1986 1987)','porddate' => '26.04.1992','pordplace' => ' St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Appattuvilai','paddress' => '              Parish Priest,Church of St. Antony, Appattuvilai , Thuckalay - 629175','pphone' => '','pmobile' => '9487422061','pemail' => 'sekharmichael@yahoo.com','pimg' => '1040.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-sekhar-michael'),
  array('id' => '40','priestid' => '1041','pname' => 'Fr. Maria Selvaraj S.','pfname' => '','pmnane' => '','pdob' => '13.05.1959','pplace' => 'Mukkalampadu','pseminary' => '','porddate' => '19.12.1992','pordplace' => '','pordby' => '','pminstring' => '','paddress' => '  ','pphone' => '','pmobile' => '9443993323','pemail' => '','pimg' => '1041.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-selvaraj-s'),
  array('id' => '41','priestid' => '1042','pname' => 'Fr. Maria Susai P.','pfname' => 'Mr. Ponnaiyan','pmnane' => 'Mrs. Dasammal','pdob' => '18.05.1961','pplace' => 'Melpalai','pseminary' => 'St. Aloysius Minor Seminary, Nagercoil(1978),St. Pauls Seminary, Trichy (1979 1982)','porddate' => '15.04.1993','pordplace' => 'Jerusalam, Trichy','pordby' => 'Most Rev. Thomas Fernando','pminstring' => 'Parish Priest, Kappu Kadu','paddress' => '          Parish Priest,Church of Kallithattu St. Antony,Kappucadu,Kunnathoor 629 162','pphone' => '','pmobile' => '9443208639','pemail' => 'mariasusaimari@yahoo.co.in','pimg' => '1042.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-susai-p'),
  array('id' => '42','priestid' => '1043','pname' => 'Fr. Dominic Kadatcha Dhas M. ','pfname' => 'Mr. Moses Motcha Dhas','pmnane' => 'Mrs. Gnana Retna Bai','pdob' => '10.04.1967','pplace' => 'Thundathuvilai','pseminary' => 'Christ Hall Karumathoor,St. Paul\\\'s Seminary Trichy','porddate' => '18.04.1993','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Mulagumoodu','paddress' => '            Church of O.L. of Nativity, Mulagumoodu 629 167 ','pphone' => '','pmobile' => '9442383119','pemail' => 'dominickdhas@yahoo.com','pimg' => '1043.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-dominic-kadatcha-dhas-m'),
  array('id' => '43','priestid' => '1044','pname' => 'Fr. John Michel Raj M.','pfname' => 'Mr. M.A. Malayappan','pmnane' => 'Mrs. Swarnam','pdob' => '11.10.1967','pplace' => 'Mulavilai','pseminary' => 'St. Aloysius Seminary, Nagercoil 1984 1985,Philosophy Christ Hall, Madurai 1985 1988,Theology St. Pa','porddate' => '18.04.1993','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Cherukol, Director KIDSS','paddress' => '        Parish Priest, Church of  St. Antony,Cherukol,Karumputhottam, Kattathurai 629 158','pphone' => '','pmobile' => '9443129831','pemail' => 'michael_raj2000@yahoo.com','pimg' => '1044.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-john-michel-raj-m'),
  array('id' => '44','priestid' => '1045','pname' => 'Fr. Steephen C.','pfname' => 'Mr. Chellan','pmnane' => 'Mrs. Therasammal','pdob' => '04.04.1966','pplace' => 'Kolvel','pseminary' => 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Sacred Heart Seminary Poonamallee','porddate' => '10.04.1994','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Study','paddress' => '  Anugraha, Friary, Nochiodaipatti, Dindigul - 624003','pphone' => '','pmobile' => '9443134495','pemail' => ' chellan.ste@gmail.com','pimg' => '1045.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-steephen-c'),
  array('id' => '45','priestid' => '1046','pname' => 'Fr. Benedict M.D. Anelin ','pfname' => 'Mr. J. Maria Dhasan','pmnane' => 'Mrs. R. Leela','pdob' => '21.04.1968','pplace' => 'Thuckalay','pseminary' => 'St. Aloysius Seminary, Nagercoil, Arul Anandar College, Karumathor, Theology St. Paul\\\'s, Trichy','porddate' => '23.04.1995','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Palliady','paddress' => '  Parish Priest, Church of Sacred Heart of Jesus, Palliady - 629169','pphone' => '','pmobile' => '9443416414','pemail' => 'franelin@rediffmail.com','pimg' => '1046.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-benedict-m-d-anelin'),
  array('id' => '46','priestid' => '1047','pname' => 'Fr. Benjamin D. ','pfname' => 'Mr. Davidson','pmnane' => 'Mrs. Ganapragasi','pdob' => '02.02.1968','pplace' => 'Cherikkadai','pseminary' => 'St. Aloysius Seminary, Nagercoil, Arulanandar College, Karumathoor, Theology St. Paul\\\'s Seminary, T','porddate' => '23.04.1995','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest ,Munchirai, Vicar Forane (Vencode)','paddress' => '          Church of O.L. Good Health, Munchirai , Puthukkadai  629 171','pphone' => '','pmobile' => '9443595872','pemail' => 'benjaminkottar@yahoo.com','pimg' => '1047.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-benjamin-d'),
  array('id' => '47','priestid' => '1048','pname' => 'Fr. David Michael M. ','pfname' => 'Mr. Maria Michael V.','pmnane' => 'Mrs. Mary Archangel M.','pdob' => '20.09.1967','pplace' => 'Madathattuvilai','pseminary' => 'St. Aloysius Seminary Nagercoil,Philosophy Sacred Heart  Poonamallee,Theology Sacred Heart Poonamall','porddate' => '23.04.1995','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'USA','paddress' => '  USA','pphone' => '04651 273009','pmobile' => '9442312212','pemail' => 'frdavidmichael@gmail.com','pimg' => '1048.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-david-michael-m'),
  array('id' => '48','priestid' => '1049','pname' => 'Fr. Antony William F.','pfname' => '','pmnane' => '','pdob' => '08.02.1966','pplace' => 'Mallanvilai','pseminary' => '','porddate' => '14.04.1996','pordplace' => '','pordby' => '','pminstring' => 'USA','paddress' => '    Holy Family Church, 15, Gender Road, New York, DE 1973, USA','pphone' => '','pmobile' => '','pemail' => 'fantonywilliam@yahoo.co.in','pimg' => '1049.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-antony-william-f'),
  array('id' => '49','priestid' => '1050','pname' => 'Fr. Gelastin Gerald A. ','pfname' => 'Mr. A. Antonypillai','pmnane' => 'Mrs. C. Annammal','pdob' => '09.03.1968','pplace' => 'Puthenkadai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil  Philosophy Arulananthar  Karumathoor,Theology St. Paul\\\'s, Trich','porddate' => '14.04.1996','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Bishop\'s House Unnamalaikadai','paddress' => '        Bishop\'s House, P.B.No: 1, Unnamalaikadai 629 179','pphone' => '','pmobile' => '9442730307','pemail' => 'aggerald@rediffmail.com','pimg' => '1050.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-gelastin-gerald-a'),
  array('id' => '50','priestid' => '1051','pname' => 'Fr. Jayaprakash S.','pfname' => 'Mr. Singarayan','pmnane' => 'Mrs. Nesammal','pdob' => '20.02.1969','pplace' => 'Thundathuvilai','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil,Philosophy Christ Hall, Karumathoor,Theology St. Paul\\\'s Se','porddate' => '14.04.1996','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai','paddress' => '            Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai, Nagercoil - 629003','pphone' => '','pmobile' => '9443011181','pemail' => '','pimg' => '1051.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jayaprakash-s'),
  array('id' => '51','priestid' => '1052','pname' => 'Fr. Jose Robinson S.K.','pfname' => 'Mr. S. Singarayan','pmnane' => 'Mrs. C. Kamalam','pdob' => '10.09.1969','pplace' => 'Thundathuvilai','pseminary' => 'St. Aloysius Seminary, Nagercoil,Philosophy Papal Seminary, Pune,Theology Papal Seminary, Pune','porddate' => '14.04.1996','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Nanjil Career Academy ','paddress' => '          Annai Ada Centre, Azhahiyamandapam','pphone' => '','pmobile' => '9486377227','pemail' => 'nanjilsrobin@gmail.com','pimg' => '1052.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jose-robinson-s-k'),
  array('id' => '52','priestid' => '1053','pname' => 'Fr. Martin N.','pfname' => 'Mr. Neelakandan Asari','pmnane' => 'Mrs. Monica (Kolammal)','pdob' => '22.05.1967','pplace' => 'Pacode','pseminary' => 'St. Aloysius, Nagercoil, Philosophy ChristHall,Karumathoor Theology  St. Paul\\\'s, Trichy','porddate' => '14.04.1996','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Manali','paddress' => '    parish Priest, Church of St. Antony of Padua, Manali, Thuckalay- 629175','pphone' => '','pmobile' => '9442653803','pemail' => 'martinkottar@gmail.com','pimg' => '1053.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-martin-n'),
  array('id' => '53','priestid' => '1054','pname' => 'Fr. Callistus M. ','pfname' => 'Mr. Maria Sebastian A.','pmnane' => 'Mrs. Maria Nesam','pdob' => '05.01.1965','pplace' => 'Kuzhivilai','pseminary' => 'Karumathur  Minor Seminary, Kumbakonam  Philosophy Christ Hall, Karumathoor Arulananthar College, Ka','porddate' => '22.04.1996','pordplace' => 'Kuzhivilai','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Amsi','paddress' => '<div>Parish Priest,Church of Imm. Heart of Mary,Amsi, Maniaramkuntu,Thengapattanam 629 173<br></div>','pphone' => '','pmobile' => '9443607766','pemail' => '','pimg' => '1054.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-callistus-m'),
  array('id' => '54','priestid' => '1055','pname' => 'Fr. Gnanamuthu V.','pfname' => 'Mr. Varuvel','pmnane' => 'Mrs. Rosammal','pdob' => '22.05.1968','pplace' => 'Pullani','pseminary' => 'St. Aloysius, Nagercoil 1988,Philosophy Christ Hall, 1993 Karumathoor,Theology St. Paul\\\'s, Trichy 1','porddate' => '06.04.1997','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'St. Paul\'s Seminary','paddress' => '          St. Paul\'s Seminary, P.B.No:36, 620001','pphone' => '','pmobile' => '9489264680','pemail' => 'vgnana2002@yahoo.com','pimg' => '1055.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-gnanamuthu-v'),
  array('id' => '55','priestid' => '1056','pname' => 'Fr. Anthireya alias Andrew D.','pfname' => 'Mr. Devasahayam','pmnane' => 'Mrs. Chellammal','pdob' => '22.11.1959 ','pplace' => 'Themanoor','pseminary' => 'Philosophy Dharmaram, Bangalore Theology Dharmaram, Bangalore,','porddate' => '19.04.1998','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Kuzhivilai','paddress' => '            Church of St. Francis Xavier, kuzhivilai, Prakadai, Kappiarai - 629156','pphone' => '','pmobile' => '9443415475','pemail' => 'frandrew.1960@gmail.com','pimg' => '1056.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-anthireya-alias-andrew-d'),
  array('id' => '56','priestid' => '1057','pname' => 'Fr. Antony Jeya S. ','pfname' => 'Mr. Siluvai Rayan','pmnane' => 'Mrs. Lourdu Mary','pdob' => '11.08.1970','pplace' => 'Konamcadu','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil, Philosophy Christ Hall Seminary, Karumathur, Theology Sacred Hea','porddate' => '11.04.1999','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'USA','paddress' => '  USA','pphone' => '','pmobile' => '9442831807','pemail' => 'santonyjeya@yahoo.com','pimg' => '1057.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-antony-jeya-s'),
  array('id' => '57','priestid' => '1058','pname' => 'Fr. Jeya Kumar G.','pfname' => 'Mr. Gnanapragasam','pmnane' => 'Mrs. Maria Pushpam','pdob' => '24.09.1971','pplace' => 'Pallavilai (Pattarivilai)','pseminary' => 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall Seminary , Karumathoor,Theology St. Paul\\\'s ','porddate' => '11.04.1999','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Madathattuvilai','paddress' => '  Parish Priest, Church of St. Sebastian, Madathattuvilai','pphone' => '','pmobile' => '9487688033','pemail' => '','pimg' => '1058.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jeya-kumar-g'),
  array('id' => '58','priestid' => '1059','pname' => 'Fr. Maria Rajendran S.','pfname' => 'Mr. Savariar Adimai','pmnane' => 'Mrs. Theresammal','pdob' => '14.05.1969','pplace' => 'Mathiravilai','pseminary' => 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall, Karumathur ,Theology Sacred Heart, Poonamal','porddate' => '11.04.1999','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Vavarai & Corresspondant, Nanjil Catholic Arts and Science College','paddress' => '      Secretary, Nanjil Catholic College of Arts and Science, Kaliyakkavilai.','pphone' => '','pmobile' => '9443606008','pemail' => 'rajendranmaria@yahoo.com','pimg' => '1059.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-rajendran-s'),
  array('id' => '59','priestid' => '1060','pname' => 'Fr. Paul Richard Joseph R.','pfname' => 'Mr. Rayappan','pmnane' => 'Mrs. Mary Leela','pdob' => '10.03.1972','pplace' => 'Palliady','pseminary' => 'St. Aloysius Seminary, Nagercoil','porddate' => '11.04.1999','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest- Thikurichy, Co-Correspondent Trinity School','paddress' => '              Paish Priest<div>Church of St. Gabriels</div><div>Thickurichy - 629 168</div>','pphone' => '04651 230144, 230244','pmobile' => '9443693505','pemail' => 'paulrichardjoseph@hotmail.com','pimg' => '1060.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-paul-richard-joseph-r'),
  array('id' => '60','priestid' => '1061','pname' => 'Fr. Robert Benni M.','pfname' => 'Mr. Sahaya Marcose','pmnane' => 'Mrs. Saral Mary','pdob' => '06.05.1971','pplace' => 'Mylacode','pseminary' => 'St. Aloysius Seminary, Nagercoil,  Philosophy Christ Hall, Karumathoor,  Theology St. Paul\\\'s, Trich','porddate' => '11.04.1999','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Chetticharvilai','paddress' => '          Parish Priest, Church of St. Little Flower, Chetticharvilai','pphone' => '','pmobile' => '9443808823','pemail' => 'frmrbenni@yahoo.co.in,  frmrbenni@gmail.com','pimg' => '1061.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-robert-benni-m'),
  array('id' => '61','priestid' => '1062','pname' => 'Fr. Manohim Xavier F.','pfname' => 'Mr. A.R. Francis','pmnane' => 'Mrs. Rajammal','pdob' => '28.06.1972','pplace' => 'Mathiravilai','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil,Philosophy Christ Hall Seminary, Karumathur,St. Pauls\\\' Sem','porddate' => '30.04.2000','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Parish Priest, Muttaicadu, Correspondent Trinity School & Asst. Director Nanjil Milk Plant','paddress' => '              Parish Priest, Church of St. Francis Xavier, Muttaicadu, Kumarapuram - 629189','pphone' => '','pmobile' => '9443579345','pemail' => 'frmano2010@gmail.com','pimg' => '1062.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-manohim-xavier-f'),
  array('id' => '62','priestid' => '1063','pname' => 'Fr. Leo Alex A.','pfname' => 'Mr. Ambrose','pmnane' => 'Mrs. Annammal','pdob' => '01.08.1970','pplace' => 'Nagacode','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Paul\\\'s Seminary, Trichy','porddate' => '27.12.2000','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Vellicode','paddress' => '        Parish Priest,Church of Our Lady of Sorrows,Vellicode,Mulagumoodu 629 167','pphone' => '','pmobile' => '9443595664','pemail' => 'frleoalex2000@gmail.com','pimg' => '1063.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-leo-alex-a'),
  array('id' => '63','priestid' => '1064','pname' => 'Fr. P. Sahaya Dhason.','pfname' => 'Mr. Pathrose','pmnane' => 'Mrs. Retna Bai','pdob' => '22.11.1972','pplace' => 'Kandanvilai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\\\'s Seminary, Trichy','porddate' => '27.12.2000','pordplace' => ' St. Xavier\\\'s Cathedral, Kottar','pordby' => ' Most Rev. Leon A.Tharmaraj','pminstring' => 'Parish Priest, Vattam & Asst. Procurator ','paddress' => '            Parish Priest, St.Antony\'s Church Vattom, Thiruvithancode PO','pphone' => ' 04651 253360, 248122','pmobile' => '9487422704','pemail' => 'dhasu.saha@gmail.com','pimg' => '1064.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-p-sahaya-dhason'),
  array('id' => '64','priestid' => '1065','pname' => 'Fr. Christopher S. ','pfname' => 'Mr. Siluvairayan','pmnane' => 'Mrs. Jesu Mary','pdob' => '24.05.1973','pplace' => 'Karenkadu','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil, Sacred Heart, Poonamallee','porddate' => '22.04.2001','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Ithayapuram (Viricode), MD VSCS','paddress' => '          Church of Sacred Heart of Jesus, Ithayapuram, Viricode - 629165','pphone' => '','pmobile' => '9443118067','pemail' => 'frchristo_rexputh@yahoo.co.in','pimg' => '1065.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-christopher-s'),
  array('id' => '65','priestid' => '1066','pname' => 'Fr. Isaac Raj R.','pfname' => 'Mr. Rayappan','pmnane' => 'Mrs. Rethna Bai','pdob' => '05.05.1971','pplace' => 'Kappiyarai','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathur,St. Paul\\\'s Seminary, Tric','porddate' => '22.04.2001','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Parish Priest, Mylacode, ','paddress' => '        Parish Priest, Church of St. Micheal, Mylacode, Alancode, Neyyoor - 629802','pphone' => '','pmobile' => '8903253253','pemail' => 'frisaacraj@gmail.com','pimg' => '1066.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-isaac-raj-r'),
  array('id' => '66','priestid' => '1067','pname' => 'Fr. Maria Vincent A.','pfname' => 'Mr. Alangaram (Late)','pmnane' => 'Mrs. Ronickam','pdob' => '12.03.1957','pplace' => 'Thuckalay','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil  St.Pauls, Trichy','porddate' => '22.04.2001','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest,Packiapuram','paddress' => '          Parish Priest,Church of St. Eusthachius,<br>Packiapuram,Arumanai 629 151','pphone' => '9344431629','pmobile' => '8903476560','pemail' => 'frmariavincent@gmail.com','pimg' => '1067.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-vincent-a'),
  array('id' => '67','priestid' => '1068','pname' => 'Fr. Victor V.','pfname' => 'Mr. Varuvel','pmnane' => 'Mrs. Santhai','pdob' => '17.04.1973','pplace' => 'Pacode','pseminary' => ' St. Aloysius Seminary Nagercoil,Christ Hall Seminary Karumathur,Sacred Heart Poonamallee .','porddate' => '22.04.2001','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Director, TLS, Trichy','paddress' => '             T.L.S. Trust , 49 J, Bharathiar Salai , Trichy 620 001','pphone' => '0431 2412833','pmobile' => '9443500408','pemail' => 'victor_priest@yahoo.co.in','pimg' => '1068.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-victor-v'),
  array('id' => '68','priestid' => '1069','pname' => 'Fr. Bright Simsa Raj A. ','pfname' => 'Mr. A. Antony Muthu','pmnane' => 'Mrs. A. Agnes','pdob' => '31.07.1971','pplace' => 'Kallukoottam','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\\\'s Seminary, Trichy','porddate' => '07.04.2002','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Melpuram','paddress' => '        Church of the Holy Guardian Angels, Melpuram, Pacode 629 168','pphone' => '','pmobile' => '9443692480','pemail' => ' ','pimg' => '1069.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-bright-simsa-raj-a'),
  array('id' => '69','priestid' => '1070','pname' => 'Fr. Densingh M. ','pfname' => 'Mr. Muthaiah N.S.','pmnane' => 'Mrs. Rosammal ','pdob' => '23.05.1962','pplace' => 'Mathicode Sahayanager','pseminary' => 'St. Aloysius\\\' Minor Seminary Nagercoil,St. Joseph\\\'s Mangalore','porddate' => '07.04.2002','pordplace' => 'St.Francis Xavier Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Soosaipuram','paddress' => '              Church of St. Antony, Valvachakostam, Kunnamparai, kattathuirai- 629158','pphone' => '04651 268277','pmobile' => '9443500655','pemail' => '','pimg' => '1070.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-densingh-m'),
  array('id' => '70','priestid' => '1071','pname' => 'Fr. Dominic Savio V. ','pfname' => 'Mr. Varghese M.S','pmnane' => 'Mrs. Jesu Retnam A.','pdob' => '12.05.1975','pplace' => 'Madathattuvilai','pseminary' => 'St. Aloysius\\\' Seminary Nagercoil,St. Joseph\\\'s Seminary Mangalore, Paul Seminary Pune','porddate' => '07.04.2002','pordplace' => 'St. Francis Xavier Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Parish Priest, Arockiapuram','paddress' => '          Church of St. Roch, Arokiapuram Monday Market, Neyyoor PO','pphone' => '','pmobile' => '9443483466','pemail' => 'frvsavio@yahoo.com','pimg' => '1071.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-dominic-savio-v'),
  array('id' => '71','priestid' => '1072','pname' => 'Fr. Jerald Justin D.','pfname' => 'Mr. R. Deva Sahayam R.','pmnane' => 'Mrs. R.Theresammal','pdob' => '19.01.1970','pplace' => 'Kallukoottam','pseminary' => 'Sacred Heart, Poonamalle','porddate' => '07.04.2002','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Managing Director, Nanjil Milk Plant','paddress' => '  Nanjil Milk Plant, (Res) Church of St. Mary, Mulagumoodu - 629167','pphone' => '','pmobile' => '9442079448','pemail' => 'frjervy02@gmail.com','pimg' => '1072.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jerald-justin-d'),
  array('id' => '72','priestid' => '1073','pname' => 'Fr. Sujan Kumar D.M.','pfname' => 'Mr. J. Devanesan','pmnane' => 'Mrs. A. Maria Rose (Late)','pdob' => '13.06.1972','pplace' => 'Kanjampuram','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil, St. Paul\\\'s, Trichy','porddate' => '07.04.2002','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Study','paddress' => '  St. Little Flower Mission Centre, Bharathiyar University, Coimbatore','pphone' => '','pmobile' => '9486473063','pemail' => 'frsujankumar13@gmail.com','pimg' => '1073.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-sujan-kumar-d-m'),
  array('id' => '73','priestid' => '1074','pname' => 'Fr. Wiselin Xavier. E','pfname' => 'Mr. A. Elias (Late)','pmnane' => 'Mrs. Rajam','pdob' => '28.10.1973','pplace' => 'Vellicode','pseminary' => 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy','porddate' => '07.04.2002','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Kolvel, Editor - "Puthiya Thedal" ','paddress' => '          Church of Our Lady of Mount Carmel, Kolvel, Thiruvarampu- 629161','pphone' => '','pmobile' => '9443607097','pemail' => 'frwiselinxavier2015@gmail.com','pimg' => '1074.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-wiselin-xavier-e'),
  array('id' => '74','priestid' => '1075','pname' => 'Fr. Romeric Thadeus K.M.','pfname' => 'P. Kulandai Swamy','pmnane' => 'K. Crispina Mary','pdob' => '08.12.1970','pplace' => 'Ramanathichenputhur','pseminary' => 'For Philosopy, Trinity College, Jalandhar, Punjab for Theolory, Papal Seminary Pune','porddate' => '27.04.2003','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Bishop Leon A. Tharmaraj','pminstring' => 'Parish Priest Mankuzhy','paddress' => '          Parish Priest,Church of St. Francis Xavier, Mankuzhy ,Neyyoor 629 802   ','pphone' => '','pmobile' => '8903901169','pemail' => 'frthadeus@gmail.com ','pimg' => '1075.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-romeric-thadeus-k-m'),
  array('id' => '75','priestid' => '1076','pname' => 'Fr. Thatheu Leon Jose A.S.','pfname' => 'Mr. Selva Mony','pmnane' => 'Mrs. Amalorpavam','pdob' => '11.07.1973','pplace' => 'Kuzhivilai, Mulagumoodu','pseminary' => 'St. Aloysius\\\' Seminary Nageroil,Theology : St. Paul\\\'s Trichy,Philosophy : Christ Hall  Karumathoor','porddate' => '27.04.2003','pordplace' => ' St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Kootamavu ','paddress' => '          Parish Priest, Church of Our Lady of Perpetual Succor, Kootamavu, Mulagumoodu - 629167','pphone' => '04651 283276','pmobile' => '9442076599','pemail' => 'frthatheu@yahoo.com','pimg' => '1076.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-thatheu-leon-jose-a-s'),
  array('id' => '76','priestid' => '1077','pname' => 'Fr. George Eugin Raj A','pfname' => 'Mr. S. Antony','pmnane' => 'Mrs. D. Alphonsal','pdob' => '20.06.1977','pplace' => 'Elanthavilai','pseminary' => 'St. Aloysius\\\' Seminary , Nagercoil.St. Pius College, Mumbai.','porddate' => '18.04.2004','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Study, Germany','paddress' => '  ','pphone' => '','pmobile' => '9442301467','pemail' => 'george.eugeneraj@gmail.com','pimg' => '1077.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-george-eugin-raj-a'),
  array('id' => '77','priestid' => '1078','pname' => 'Fr. Robert John Kennedy G.','pfname' => 'Mr. George','pmnane' => 'Mrs. Mary Ritammal','pdob' => '31.08.1974','pplace' => 'Kandanvilai','pseminary' => 'St. Aloysius\\\' Seminary , Nageroil, St. Joseph\\\'s Seminary, Mangalore','porddate' => '18.04.2004','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Chemparuhi Vilai','paddress' => '        Parish Priest , Church of St. Antony, Chemparuthivilai 629 166 ','pphone' => '9443490023','pmobile' => '8903417068','pemail' => 'revrojokennedy@gmail.com','pimg' => '1078.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-robert-john-kennedy-g'),
  array('id' => '78','priestid' => '1079','pname' => 'Fr. Suresh Kumar P.','pfname' => 'Mr. Pankiraj A.','pmnane' => 'Mrs. Annammal C.','pdob' => '16.02.1977','pplace' => 'Mulagumoodu','pseminary' => 'St. Aloysius\\\' Seminary Nageroil, Papal Seminary Pune','porddate' => '18.04.2004','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Corporate Manager','paddress' => 'Church of O.L.of Good Health Munchirai','pphone' => '','pmobile' => '9443164272','pemail' => 'sureshmlg1977@gmail.com','pimg' => '1079.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-suresh-kumar-p'),
  array('id' => '79','priestid' => '1080','pname' => 'Fr. Xavier Sundar. A','pfname' => 'Savaria Pitchai','pmnane' => 'Philominal','pdob' => '05.06.1972','pplace' => 'Aral Arockia Nagar','pseminary' => 'St.Paulin','porddate' => '18.04.2004','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest,Yettacode','paddress' => '          Parish Priest,Church of St. Francis Xavier,Yettacode,Veeyanoor 629 177','pphone' => '','pmobile' => '9443681899','pemail' => 'sundarxavier@gmail.com','pimg' => '1080.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-xavier-sundar-a'),
  array('id' => '80','priestid' => '1081','pname' => 'Fr. Chandra Sekar C.P. ','pfname' => 'Mr. Paul Raj C.','pmnane' => 'Mrs. Thanga Bai','pdob' => '31.07.1977','pplace' => 'Chentharai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil  Arulanandar College, Karumathur  Christ Hall, Karumathur  St. Pa','porddate' => '03.04.2005','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'USA','paddress' => '      USA','pphone' => '04651 222368','pmobile' => '9443559724','pemail' => 'chandracpsekar@yahoo.co.in','pimg' => '1081.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-chandra-sekar-c-p'),
  array('id' => '81','priestid' => '1082','pname' => 'Fr. Godwin Soundar Raj M.','pfname' => 'Mr. Maria Antony','pmnane' => 'Mrs. Cecily','pdob' => '21.01.1977','pplace' => 'Mankuzhy','pseminary' => 'St. Aloysius\\\' Seminary , Nageroil,Papal Seminary , Pune ,','porddate' => '03.04.2005','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Nallayan Puram','paddress' => '          Parish Priest,Church of Good Shepherd Nallayan puram, Palugal - 629170','pphone' => '04651 236150','pmobile' => '9487064600','pemail' => 'godsrajm@yahoo.in','pimg' => '1082.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-godwin-soundar-raj-m'),
  array('id' => '82','priestid' => '1083','pname' => 'Fr. Jegan Bose U.','pfname' => 'Mr. Uttaria Muthu M.','pmnane' => 'Mrs. Mary Vincent S.','pdob' => '21.04.1977','pplace' => 'Nullivilai','pseminary' => 'St. Aloysius\\\' Seminary , Nageroil,Papal Seminry, Pune, St.Pauls, Trichy','porddate' => '03.04.2005','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A.Tharmaraj','pminstring' => 'Study, Rome','paddress' => '        Rome&nbsp;','pphone' => '','pmobile' => '9486533218','pemail' => 'frjbose@gmail.com','pimg' => '1083.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jegan-bose-u'),
  array('id' => '83','priestid' => '1084','pname' => 'Fr. John Francis M.','pfname' => 'Mr. Mathias V.','pmnane' => 'Mrs. Maria Pushpam Y','pdob' => '12.09.1977','pplace' => 'Vencode','pseminary' => 'St. Aloysius\\\' Seminary , Nageroil,Christ Hall, Karumathur,St. Paul\\\'s Seminary, Trichy','porddate' => '03.04.2005','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Rest','paddress' => 'Priests Home, Nirmala Hospital, Krungal','pphone' => '','pmobile' => '9842928612','pemail' => 'frjohnfranchis@gmail.com','pimg' => '1084.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-john-francis-m'),
  array('id' => '84','priestid' => '1085','pname' => 'Fr. Eckermens Michael M. ','pfname' => 'Mr. Michael','pmnane' => 'Mrs. Mary Margaret Michael ','pdob' => '28.01.1976','pplace' => 'Madathattuvilai','pseminary' => 'St. Aloysius\\\' Seminary Nageroil,St. Pius College Mumbai ','porddate' => '23.04.2006','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Study, Thanjavur','paddress' => '                Church of Our Lady of Good Health, Thirukanurpatti, Thanjavur','pphone' => '04651 263098','pmobile' => '9360331148','pemail' => 'fr.eckermens@gmail.com','pimg' => '1085.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-eckermens-michael-m'),
  array('id' => '85','priestid' => '1086','pname' => 'Fr. Maria Thomas Austin M.','pfname' => 'Mr. Michael Pillai','pmnane' => 'Mrs. Pushpa Virgin','pdob' => '21.04.1979','pplace' => 'Mdavilagam - Marthandamthurai','pseminary' => 'St. Aloysius\\\' Seminary , Nageroil, Christ Hall, Karumathur,Sacred Heart Seminary, Poonamallee ','porddate' => '23.04.2006','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Leave','paddress' => '  ','pphone' => '04651 268658','pmobile' => '9597779546','pemail' => 'maustindiaz@gmail.com','pimg' => '1086.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-thomas-austin-m'),
  array('id' => '86','priestid' => '1087','pname' => 'Fr. Primas Singh M.','pfname' => 'Mr. Maria Rethna George','pmnane' => 'Mrs. Selvi Mary','pdob' => '24.03.1979','pplace' => 'Mukkalampadu','pseminary' => 'St. Aloysius\\\' Seminary  Nageroil, Papal Seminary Pune','porddate' => '23.04.2006','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Correspondent, Morning Star Polytechnic College, Chunkankadai','paddress' => '        Correspondent, Morning Star Polytechnic College, Chunkankadai 629003','pphone' => '','pmobile' => '9486178919','pemail' => 'frprimas@gmail.com','pimg' => '1087.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-primas-singh-m'),
  array('id' => '87','priestid' => '1088','pname' => 'Fr. Pushpa Raj A.','pfname' => 'Mr. Asirvatham D.','pmnane' => 'Mrs. Rajammal A.','pdob' => '01.10.1974','pplace' => 'Thumbaly','pseminary' => 'St. Aloysius\\\' Seminary , Nageroil Krishu Jyothi College, Bangalore','porddate' => '23.04.2006','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Leon A. Tharmaraj','pminstring' => 'Parish Priest, Palavilai','paddress' => '        Parish Priest, Church of St. Antony, Palavilai, Kuzhithurai - 629163','pphone' => '','pmobile' => '9486325298','pemail' => 'frpushpa197@gmail.com','pimg' => '1088.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-pushpa-raj-a'),
  array('id' => '88','priestid' => '1089','pname' => 'Fr. Arockia Shelly Rose A.M. ','pfname' => 'Mr. Ambrose P.','pmnane' => 'Mrs. Mary Elizabeth','pdob' => '17.04.1978','pplace' => 'Iruthayapuram','pseminary' => 'St. Aloysius\\\' Seminary , Nagercoil, St. Paul\\\'s Seminary, Trichy','porddate' => '15.04.2007','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Edward Francis','pminstring' => 'Parish Priest, Tiruthuvapuram','paddress' => '        Cathedral of the Most Holy Trinity,Thirithuvapuram,Kuzhithurai 629 163','pphone' => '','pmobile' => '9487251004','pemail' => 'frshelleyrose@hotmail.com','pimg' => '1089.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-arockia-shelly-rose-a-m'),
  array('id' => '89','priestid' => '1090','pname' => 'Fr. Benny L. ','pfname' => 'Mr. Lucas','pmnane' => 'Mrs. Jalarthacy','pdob' => '02.10.1975','pplace' => 'Puthenkadai','pseminary' => 'St. Aloysius\\\' Seminary , Nagercoil,Christ Hall Seminary, Karumathur,Sacred Heart Seminary, Poonamal','porddate' => '15.04.2007','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Edward Francis','pminstring' => 'Parish Priest, Manjakonan, Vicar Forane (Puthenkadai)','paddress' => '        Church of St. Therese of Child Jesus, Manjakonam, Thirparapu - 629161','pphone' => '','pmobile' => '9578120866','pemail' => 'fr.bennyl@yahoo.com','pimg' => '1090.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-benny-l'),
  array('id' => '90','priestid' => '1091','pname' => 'Fr. Godwin Selva Justus S.','pfname' => 'M. Selva Raj','pmnane' => 'Marianthony','pdob' => '04.11.1979','pplace' => 'Alenchy','pseminary' => 'St. Aloysius\\\' Seminary , Nagercoil. Christ Hall, Karumathoor. Papal Seminary Pune','porddate' => '15.04.2007','pordplace' => 'St. Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Edward Francis','pminstring' => 'Parish Priest, Alanvilai','paddress' => '      Financial Adminstrator SXCCN, Chunkankadai, Parish Priest, Church of O.L. of Lourdes, Alanvilai, Karenkadu - 629809','pphone' => '','pmobile' => '9486910526','pemail' => 'godwin411@gmail.com','pimg' => '1091.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-godwin-selva-justus-s'),
  array('id' => '91','priestid' => '1092','pname' => 'Fr. Arockia Jose G. ','pfname' => 'Mr. Gnanasigamoni','pmnane' => 'Mrs. Roselet Mary','pdob' => '09.06.1978','pplace' => 'Konnakuzhivilai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil, St. Pius College, Mumbai','porddate' => '19.04.2009','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => '','pminstring' => 'Studies, Italy','paddress' => '        Italy','pphone' => '','pmobile' => '','pemail' => 'arockia1978jose@gmail.com','pimg' => '1092.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-arockia-jose-g'),
  array('id' => '92','priestid' => '1093','pname' => 'Fr. Geo Giltus G.','pfname' => 'Mr. George Maria Arputham','pmnane' => 'Mrs. Barbara','pdob' => '18.02.1974','pplace' => 'Pandaravilai Kandanvilai','pseminary' => 'MSS.CC Bangalore, Dharmaram College Bangalore, St. Paul\\\'s Seminary Trichy','porddate' => '19.04.2009','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Parish Priest,Vellayambalam','paddress' => '          Church of St.  Antony, Vellayambalam, Puthukadai 629 171','pphone' => '','pmobile' => '9486671566','pemail' => 'frgeogkuz@gmail.com','pimg' => '1093.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-geo-giltus-g'),
  array('id' => '93','priestid' => '1094','pname' => 'Fr. Gilbert Lingson V.','pfname' => 'Mr. Varuvel','pmnane' => 'Mrs. Mary Rethinam','pdob' => '07.07.1976','pplace' => 'Appattuvilai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil.Christ Hall Seminary, Karumathur.St. Paul\\\'s Seminary, Trichy','porddate' => '19.04.2009','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Parish Priest, Mullanganavilai','paddress' => '  Church of St. Antony, Mullanganavilai, (Via) Karungal 629 157','pphone' => '','pmobile' => '7373354728','pemail' => 'fr.lingson@gmail.com','pimg' => '1094.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-gilbert-lingson-v'),
  array('id' => '94','priestid' => '1095','pname' => 'Fr. Andrews V.','pfname' => 'Mr. Varghese','pmnane' => 'Mrs. Maria Thangam A.','pdob' => '15.09.1981','pplace' => 'Appattuvilai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil, Christ Hall Seminary, Karumathur, St. Paul\\\'s Seminary, Trichy','porddate' => '18.04.2010','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Parish Priest, Kallu Kootam, Treasurer (Nanjil Milk Plant)','paddress' => '          Church of O.L. of Fathima, Kallukkoottam 629 802','pphone' => '','pmobile' => '9443159308','pemail' => 'joyandrewson27@yahoo.com','pimg' => '1095.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-andrews-v'),
  array('id' => '95','priestid' => '1096','pname' => 'Fr. Jokens A.','pfname' => 'Mr. Antony R.','pmnane' => 'Mrs. Ronickam A.','pdob' => '11.09.1979','pplace' => 'Chemparuthivilai','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil,St. Joseph\\\'s Seminary, Mangalore','porddate' => '18.04.2010','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Parish Priest, Mula Vilai','paddress' => '      Parochial Administrator, Church of  Christ the King,Mula Vilai,Veeyanoor 629 177','pphone' => '','pmobile' => '9442858706','pemail' => 'jokinsantorony@gmail.com','pimg' => '1096.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-jokens-a'),
  array('id' => '96','priestid' => '1097','pname' => 'Fr. Titus Mohan M.','pfname' => 'Mr. Maria Alphonse S.','pmnane' => 'Mrs. Yesumarial D. ','pdob' => '17.06.1983','pplace' => 'Chemparuthivilai ','pseminary' => 'St. Aloysius\\\' Seminary Nagercoil, Christ Hall Seminary Karumathur,Papal Seminary Pune  ','porddate' => '11.12.2011','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Parish Priest, Sahaya Nagar','paddress' => '        Parochial Administrator,  Church of O.L. of Perpetual Succour,Sahaya Nagar,Palapallam 629 159','pphone' => '','pmobile' => '9443447814','pemail' => 'titusmohan@gmail.com ','pimg' => '1097.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-titus-mohan-m'),
  array('id' => '97','priestid' => '1098','pname' => 'Fr. Shine S.','pfname' => 'Mr. Simon S.P.','pmnane' => 'Mrs. Maria Pushpam','pdob' => '02.10.1984','pplace' => 'Kalaiakkavilai','pseminary' => 'St. Aloysius\\\' Seminary Nagercoil, Arulanandar College  Madurai, St. Paul\\\'s Seminary Trichy','porddate' => '15.12.2012','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => ' Most Rev. Peter Remigius','pminstring' => 'Parish Priest, Fatimapuram, Director (Youth Comission)','paddress' => '  Church of Our lady of Fatima, Fathimapuram, Kollencode - 629169','pphone' => '','pmobile' => '9952862474','pemail' => ' fr.shinekottar@gmail.com','pimg' => '1098.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-shine-s'),
  array('id' => '98','priestid' => '1099','pname' => 'Fr. Suresh Raj R.','pfname' => 'Mr. Rajayan A.','pmnane' => 'Mrs. Rethina Bai','pdob' => '09.08.1981','pplace' => 'Vellicode','pseminary' => 'St. Aloysius\\\' Seminary Nagercoil,Sacred Heart Seminary Poonamallee','porddate' => '09.12.2013','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Parish Priest, Kottoorkonam','paddress' => '          Parish Priest, Church of Infant Jesus, Kottoorkonam  ,Kulasekharam 629 161','pphone' => '04651 280868','pmobile' => ' 9444132216','pemail' => 'sureshraj882@gmail.com','pimg' => '1099.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-suresh-raj-r'),
  array('id' => '99','priestid' => '1100','pname' => 'Fr. Florence A.','pfname' => 'Mr. Antony Kruz J. (Late)','pmnane' => 'Mrs. Alphonse Ammal K. ','pdob' => '24.11.1980','pplace' => 'Aaloor','pseminary' => 'St. Aloysius\\\' Seminary Nagercoil,St. Joseph\\\'s Seminary Mangalore ','porddate' => '06.09.2014','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Study ','paddress' => '  ','pphone' => '','pmobile' => '9786472448','pemail' => 'florencevijay2411@gmail.com','pimg' => '1100.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-florence-a'),
  array('id' => '100','priestid' => '1101','pname' => 'Fr. John Benhar N.','pfname' => 'Mr. Nasamony V','pmnane' => 'Mrs. Marial V','pdob' => '14.03.1984','pplace' => 'Vencode','pseminary' => 'St. Aloysius\\\' Seminary, Nagercoil,Sacred Heart Seminary, Poonamallee ','porddate' => '06.09.2014','pordplace' => 'St. Francis Xavier\\\'s Cathedral, Kottar','pordby' => 'Most Rev. Peter Remigius','pminstring' => 'Leave','paddress' => '    ','pphone' => '','pmobile' => '9884831859','pemail' => 'benhar14@gmail.com','pimg' => '1101.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-john-benhar-n'),
  array('id' => '101','priestid' => '1102','pname' => 'Fr. Benitto V. ','pfname' => 'Mr. L. Varghese','pmnane' => 'Mrs. S. Joice Chellammal','pdob' => '24.01.1985','pplace' => 'Alanvilai','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Peter\\\'s Seminary, Viraganoor','porddate' => '10.05.2015','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Murasancode','paddress' => '  Parish Priest, Chruch of Our Lady of Mount Carmel, Murasancode.&nbsp;','pphone' => '','pmobile' => '9488504009','pemail' => 'benialv@gmail.com','pimg' => '1102.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-benitto-v'),
  array('id' => '102','priestid' => '1104','pname' => 'Fr. Martin M.','pfname' => 'Mr. Michael J.','pmnane' => 'Mrs. K. Rosammal','pdob' => '13.01.1986','pplace' => 'Vavarai','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathoor,St. Pauls Seminary, Trich','porddate' => '10.05.2015','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Choozhal ','paddress' => '        Parish Priest, Church of St. Michael Archangel, Choozhal, Fatimanagar - 629160','pphone' => '','pmobile' => '9597989948','pemail' => 'mmmartinrose@gmail.com','pimg' => '1104.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-martin-m'),
  array('id' => '103','priestid' => '1105','pname' => 'Fr. Pencer Xavier R.','pfname' => 'Mr. Rajamony','pmnane' => 'Mrs. Thangammal','pdob' => '07.06.1985','pplace' => 'Yettacode','pseminary' => 'St. Aloysius\\\' Minor Seminary Nagercoil,Morning Star College Kolkata,St. Peter\\\'s Pontifical Seminar','porddate' => '10.05.2015','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Mathiravilai','paddress' => '  Parish Priest, Church of Our Lady of Assumption, Mathiravilai, Thikanamcode - 629804','pphone' => '','pmobile' => '8903935323','pemail' => 'pencerxavier@gmail.com','pimg' => '1105.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-pencer-xavier-r'),
  array('id' => '104','priestid' => '1106','pname' => 'Fr. Sujin D.','pfname' => 'Mr. S. Dennis','pmnane' => 'Mrs. Mary Lizzie','pdob' => '27.02.1986','pplace' => 'Amsi','pseminary' => 'St. Aloysius\\\' Minor Seminary  Nagercoil,Christ Hall Seminary Karumathur Madurai, St. Paul Seminary ','porddate' => '10.05.2015','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Lourdugiri','paddress' => '  Parish Priest, Church of Our Lady of Lourdes, Lourdugiri - Anducode - 629168&nbsp;','pphone' => '','pmobile' => '9677936244','pemail' => 'sujindennis@gmail.com','pimg' => '1106.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-sujin-d'),
  array('id' => '105','priestid' => '1107','pname' => 'Fr. Xavier Raj','pfname' => 'G. Rajamony','pmnane' => 'Maria Puspam','pdob' => '06.05.1984','pplace' => 'Yettacode','pseminary' => 'Sacred Heart Seminary, Poonamallee','porddate' => '10.05.2015 ','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'xavier.mum@gmail.com','pminstring' => 'Parish Priest, Eanchacode','paddress' => '  Parish Priest, Church of Our Lady of Perpetual Succor, Eanchacode, Ponmanai - 629161','pphone' => '','pmobile' => '9626660889','pemail' => 'xavier.mum@gmail.com ','pimg' => '1107.jpg','pdiocese' => 'Diocese of Kuzhithurai','contract' => NULL,'home_priest' => '1','slug' => 'fr-xavier-raj'),
  array('id' => '106','priestid' => '1108','pname' => 'Fr. Francis Xavier M','pfname' => 'Madavadiyan','pmnane' => 'Ronikam','pdob' => '10.06.1979','pplace' => 'Kappiyarai','pseminary' => 'St.Peter Pontifical Seminary, Bangalore','porddate' => '01.05.2016','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Konnakuzhivilai','paddress' => '  <font size="3">Parish Priest, Church of Our Lady of Sorrows, Konnakuzhivilai, Villukury - 629180</font><style type="text/css">
		body,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:"Calibri";','pphone' => '','pmobile' => '7598112014','pemail' => 'xfrancis35@gmail.com','pimg' => '1108.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-francis-xavier-m'),
  array('id' => '107','priestid' => '1109','pname' => 'Fr. Maria Anto Halvin','pfname' => 'Joseph Alexander','pmnane' => 'Maria Sebastiaye','pdob' => '17.11.1981','pplace' => 'Madathattuvilai','pseminary' => 'St. Pius X Mumbai','porddate' => '01.05.2016','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Padarnilam','paddress' => '  Parish Priest, Church of St. Pius X, Padarnilam, Manavalakurichy - 629252','pphone' => '','pmobile' => '9629209055','pemail' => 'halvin.j@gmail.com','pimg' => '1109.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-maria-anto-halvin'),
  array('id' => '108','priestid' => '1113','pname' => 'Fr. Michael Alocious M.A','pfname' => 'S. Michael Antony','pmnane' => 'G. Mary Joice','pdob' => '29.04.1987','pplace' => 'Kuzhivilai','pseminary' => 'Sacred Heart Seminary, Poonamalle','porddate' => '01.05.2016','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Appattuvilai','paddress' => '                                              <p>St.Joseph\'s Church&nbsp;</p><p>Appattuvilai</p>','pphone' => '04651272077','pmobile' => '8903148050','pemail' => 'alomic29@gmail.com','pimg' => '1113.jpg','pdiocese' => 'Kuzhithurai Diocese','contract' => NULL,'home_priest' => '1','slug' => 'fr-michael-alocious-m-a'),
  array('id' => '109','priestid' => '1110','pname' => 'Fr. Sargin Rubas B','pfname' => 'V. Barnapas','pmnane' => 'R. Agnes','pdob' => '30.05.1986','pplace' => 'Chemparuthivilai','pseminary' => 'St. Aloysius Seminary, Nagercoil, St.Joseph\\\'s Seminary Mangalore','porddate' => '01.05.2016','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Paramanvilai','paddress' => '        Parish Priest, Paralogamatha Church, Paramanvilai, Padanthalumoodu - 629163','pphone' => '','pmobile' => '9597909745','pemail' => 'srubas@gmail.com','pimg' => '1110.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-sargin-rubas-b'),
  array('id' => '110','priestid' => '1112','pname' => 'Fr. Domi Lilil Raja A','pfname' => 'Antony M','pmnane' => 'George Mary V','pdob' => '07.10.1986','pplace' => 'Konnakuzhivilai','pseminary' => 'St.Aloysis Seminary, Sacred Heart Seminary Poonamallee','porddate' => '01.05.2016','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Parakunnu ','paddress' => '  Parish Priest, Church of Sacred Heart of Jesus, Parakunnu, Vanniyur, (Via) Kuzhithurai - 629163','pphone' => '','pmobile' => '7402586774','pemail' => 'domilililraja@gmail.com','pimg' => '1112.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-domi-lilil-raja-a'),
  array('id' => '111','priestid' => '1103','pname' => 'Fr. Charles Viju A.','pfname' => 'M. Arockiam','pmnane' => 'S. Annammal','pdob' => '30.08.1984','pplace' => 'Konamkadu','pseminary' => 'St. Aloysius\\\' Minor Seminary, Nagercoil, St.Josephs Interdiocesan Seminary, Mangalore','porddate' => '10.05.2015','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Vizhunthayampalam','paddress' => '              Church of St. Antony,&nbsp;Vizhunthayampalam, Thenkapattanam - 629173','pphone' => '','pmobile' => '9487015472','pemail' => 'charlesviju@gmail.com','pimg' => '1103.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-charles-viju-a'),
  array('id' => '112','priestid' => '1111','pname' => 'Fr. Cyril Mesmin','pfname' => 'Vincent','pmnane' => 'Pushpamary','pdob' => '10.06.1986','pplace' => 'Kolvel','pseminary' => 'St.Pauls Major Seminary Trichy','porddate' => '01.05.2016','pordplace' => 'Holy Trinity Cathedral Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Parish Priest, Varthanvilai','paddress' => '  Parish Priest, Church of St. Antony, Varthanvilai, Bethelpuram - 629803','pphone' => '','pmobile' => '9787595552','pemail' => 'cyrilmesmin@yahoo.com','pimg' => '1111.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-cyril-mesmin'),
  array('id' => '113','priestid' => '1117','pname' => 'Fr. Edwin Raj C.','pfname' => 'K. Chinnathurai','pmnane' => 'J.Omanal','pdob' => '27-09-1987','pplace' => 'Melpuram','pseminary' => 'Papal Seminary, Pune.','porddate' => '07-05-2017','pordplace' => 'Cathedral of the Most Holy Trinity','pordby' => 'Most. Rev. Jeromedhas V.','pminstring' => 'Secretary to the Bishop','paddress' => '            Bishop\'s house&nbsp;<div>Post.Box. No:1<br><div>Unnamalaikadai</div><div>K.K.Dist- 629179</div></div><div>Tamil Nadu, South India</div>','pphone' => '04651-272077','pmobile' => '8149863115','pemail' => 'edwinchinna@yahoo.co.in','pimg' => '1117.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-edwin-raj-c'),
  array('id' => '114','priestid' => '1114','pname' => 'Fr. Jees Raymond','pfname' => 'Mr. S. Raymond (Late)','pmnane' => 'Mrs. A. Rethinammal (Late)','pdob' => '09.07.1977','pplace' => 'Thoothoor','pseminary' => 'Jyothir Bhavan, Kalamassery.','porddate' => '07.05.2017','pordplace' => 'The Cathedral of Most Holy Trinity, Thirithuvapuram.','pordby' => 'Most. Rev. Jeromedhas SDB','pminstring' => 'Co- Pastor, Mathiravilai','paddress' => '    Church of Our Lady of Assumption, Mathiravilai.&nbsp;','pphone' => '','pmobile' => '9444643805','pemail' => 'jeesdenn@gmail.com','pimg' => '1114.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-jees-raymond'),
  array('id' => '115','priestid' => '1115','pname' => 'Fr. Vinso Antony V. ','pfname' => 'Mr. A. Vensaslaus','pmnane' => 'Mrs. S. maria Sathai','pdob' => '01.07.1984','pplace' => 'Kallukootam','pseminary' => 'Christ Hall Seminary, Papal Seminary','porddate' => '07.05.2017','pordplace' => 'The Cathedral of the Most Holy Trinity, Thirithuvapuram.','pordby' => 'Most. Rev. Jeromedhas SDB','pminstring' => 'Parish Priest, Alancholai','paddress' => '            ','pphone' => '','pmobile' => '8939707671','pemail' => 'vinso84@gmail.com','pimg' => '1115.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-vinso-antony-v'),
  array('id' => '116','priestid' => '1116','pname' => 'Fr. Albin Jose E.','pfname' => 'Mr. Eliyas','pmnane' => 'Mrs. sarasamma','pdob' => '26.03.1985','pplace' => 'Varuvilai, Kanjampuram','pseminary' => 'St. Paul\\\'s Seminary','porddate' => '07.05.2017','pordplace' => 'The Cathedral of Most Holy Trinity, Thirithuvapuram.','pordby' => 'Bishop Jeromedhas SDB','pminstring' => 'Co- Pastor,Thundathuvilai','paddress' => '          ','pphone' => '','pmobile' => '9486893800','pemail' => 'ealbinjose@gmail.com','pimg' => '1116.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-albin-jose-e'),
  array('id' => '117','priestid' => '1118','pname' => 'Fr. Alwin Vijay M','pfname' => 'Mr. C. Mohan','pmnane' => 'Mrs. S. Glory','pdob' => '01-01-1988','pplace' => 'Nattalam','pseminary' => 'St.Paul\\\'s, Trichy','porddate' => '07-05-2017','pordplace' => 'The Cathedral of the Most Holy Trinity, Thirithuvapuram','pordby' => 'Most.Rev. Jeromedhas V. SDB','pminstring' => 'Co - Pastor Madathattuvilai','paddress' => '          ','pphone' => '','pmobile' => '9488807775','pemail' => 'malwinvijay1988@gmail.com','pimg' => '1118.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-alwin-vijay-m'),
  array('id' => '118','priestid' => '1119','pname' => 'Fr Arul','pfname' => 'Mr. Rajaiyan','pmnane' => 'Mrs. Radha','pdob' => '24/09/1988','pplace' => 'Maruthancode','pseminary' => 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, St.Paul\\\'s Semnary, Trichy','porddate' => '15.04.2018','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most Rev. V. Jeromedhas','pminstring' => 'Co-pastor at Munchirai','paddress' => 'Sasthanpottai,&nbsp;<div>Maruthancode Post</div><div>629163</div>','pphone' => '','pmobile' => '8270863652','pemail' => 'aruljoe1989@gmail.com','pimg' => '1119.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-arul'),
  array('id' => '119','priestid' => '1120','pname' => 'Fr. Jeya Sunder Singh','pfname' => 'Mr. Chellakkan','pmnane' => 'Mrs. Maria Rackini','pdob' => '01.10.1989','pplace' => 'Muzhavilai','pseminary' => 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Papal Seminary Pune.','porddate' => '15.04.2018','pordplace' => 'Holy Trinity Cathedral, Thirithuvapuram','pordby' => 'Most. Rev. Jeromedhas SDB','pminstring' => 'Secretary to the Bishop','paddress' => 'Melaputhichari vilai,<div>Muzhavilai,&nbsp;</div><div>Veeyanoor post - 629177</div>','pphone' => '','pmobile' => '9786936426','pemail' => 'dearsundersingh@gmail.com','pimg' => '1120.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-jeya-sunder-singh'),
  array('id' => '120','priestid' => '1121','pname' => 'Fr. Arul Raj','pfname' => '','pmnane' => '','pdob' => '','pplace' => '','pseminary' => '','porddate' => '','pordplace' => '','pordby' => '','pminstring' => '','paddress' => '  ','pphone' => '','pmobile' => '','pemail' => '','pimg' => '1121.jpg','pdiocese' => NULL,'contract' => NULL,'home_priest' => '1','slug' => 'fr-arul-raj'),
  array('id' => '128','priestid' => '2001','pname' => 'Fr. Amaladhas Densingh R.A.','pfname' => '','pmnane' => '','pdob' => '06.12.1973','pplace' => 'Kurusady','pseminary' => '','porddate' => '07.04.2002','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Nullivilai','paddress' => '        Parish Priest, Church of O.L. of Mount Carmel, Nullivilai, Karenkadu - 629 809','pphone' => '04651 231412','pmobile' => '9488271741','pemail' => 'singh27star@yahoo.co.uk','pimg' => '2001.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-amaladhas-densingh-r-a'),
  array('id' => '129','priestid' => '2002','pname' => 'Fr. Amutha Valan M.','pfname' => '','pmnane' => '','pdob' => '06.03.1982','pplace' => 'Kovalam','pseminary' => '','porddate' => '18.04.2010','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Kallaraivilai','paddress' => '  Parish Priest, Church Of O.L.of Fatima, Kallaraivilai, Chenkodi 629177','pphone' => '04651 221576','pmobile' => '8903701818','pemail' => 'amuthavalan82@gmail.com','pimg' => '2002.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-amutha-valan-m'),
  array('id' => '130','priestid' => '2003','pname' => 'Fr. Antony Gomez P.','pfname' => '','pmnane' => '','pdob' => '02.06.1974','pplace' => 'Manakudy','pseminary' => '','porddate' => '18.04.2004','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Konamcadu','paddress' => '  Parish Priest,Church of St. Francis Xavier, Konamcadu, West Neyyoor - 629803','pphone' => '04651 226209','pmobile' => '9488278088','pemail' => 'frgomezktr@gmail.com','pimg' => '2003.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-antony-gomez-p'),
  array('id' => '131','priestid' => '2004','pname' => 'Fr. Antony Jayakodi','pfname' => '','pmnane' => '','pdob' => '02.09.1978','pplace' => 'Kurusady','pseminary' => '','porddate' => '11.12.2011','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Elavuvilai','paddress' => 'Church of St. Aloysius Elavuvilai 629171','pphone' => '','pmobile' => '8760817448','pemail' => 'antonyjayakodi@gmail.com','pimg' => '2004.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-antony-jayakodi'),
  array('id' => '132','priestid' => '2005','pname' => 'Fr. Arulappan','pfname' => '','pmnane' => '','pdob' => '25.04.1946','pplace' => 'Sarel','pseminary' => '','porddate' => '21.12.1971','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Kanjiracode','paddress' => '  Parish Priest, Church of O.L. of Rosary, Kanjiracode, Kanjiracode Post - 629155','pphone' => '04651 272719','pmobile' => '9442365337','pemail' => 'frarulappa@yahoo.com','pimg' => '2005.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-arulappan'),
  array('id' => '133','priestid' => '2007','pname' => 'Fr. Benziger P.','pfname' => '','pmnane' => '','pdob' => '29.12.1963','pplace' => 'Thittuvilai - Mathal','pseminary' => '','porddate' => '30.04.2000','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Nullivilai ','paddress' => 'Church of O.L.of Mount Carmel, Nullivilai, Karencadu 629809','pphone' => '04651 230345','pmobile' => '9486269906','pemail' => '','pimg' => '2007.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-benziger-p'),
  array('id' => '134','priestid' => '2008','pname' => 'Fr. Berchmans Michael Kenet F.','pfname' => '','pmnane' => '','pdob' => '11.10.1964','pplace' => 'Punnai Nagar','pseminary' => '','porddate' => '18.04.1993','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Vencode','paddress' => '  Parish Priest, St. Xavier\'s Church, Vencode, Puthukadi -629171','pphone' => '04651 270976','pmobile' => '9443482972','pemail' => 'bmkenet@yahoo.com','pimg' => '2008.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-berchmans-michael-kenet-f'),
  array('id' => '135','priestid' => '2017','pname' => 'Fr. Selvaraj J.','pfname' => '','pmnane' => '','pdob' => '07.06.1974','pplace' => 'Arockiapuram-Cape','pseminary' => '','porddate' => '27.04.2003','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Attoor','paddress' => 'Parish Priest, Church of St. Andrew, Attoor - 629191','pphone' => '','pmobile' => '9489554444','pemail' => 'selvaa.raj@rediffmail.com','pimg' => '2017.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-selvaraj-j'),
  array('id' => '136','priestid' => '2018','pname' => 'Fr. Soosai Antony P.','pfname' => '','pmnane' => '','pdob' => '05.02.1978','pplace' => 'Kovalam','pseminary' => '','porddate' => '19.04.2009','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Ambalakadai','paddress' => '  Parish Priest, Sts. Peter and Paul Church Ambalakadai, Chitharal 629151','pphone' => '','pmobile' => '9443130423','pemail' => 'samsantosoo@gmail.com','pimg' => '2018.jpg','pdiocese' => 'Diocese of Kottar','contract' => 'no','home_priest' => '0','slug' => 'fr-soosai-antony-p'),
  array('id' => '137','priestid' => '2019','pname' => 'Fr. Lawrence S.P.','pfname' => '','pmnane' => '','pdob' => '19.08.1972','pplace' => '','pseminary' => '','porddate' => '07.04.2002','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest, Kuzhithurai','paddress' => '  Parish Priest,Church of St. Michael the Archangel , Kuzhithurai - 629163','pphone' => '04651 355455','pmobile' => '9442008557','pemail' => '','pimg' => '2019.jpg','pdiocese' => 'Archdiocese of Trivandrum','contract' => 'no','home_priest' => '0','slug' => 'fr-lawrence-s-p'),
  array('id' => '138','priestid' => '2021','pname' => 'Fr. Amul Raj','pfname' => '','pmnane' => '','pdob' => '24.11.1983','pplace' => '','pseminary' => '','porddate' => '15.05.2011','pordplace' => '','pordby' => '','pminstring' => 'Co-Pastor, Packiapuram','paddress' => 'Co-Pastor, church of St. Eusthachius, Packiapuram, Arumanai - 629151','pphone' => '','pmobile' => '8098756704','pemail' => '','pimg' => '2021.jpg','pdiocese' => 'Heralds of Good News','contract' => 'yes','home_priest' => '0','slug' => 'fr-amul-raj'),
  array('id' => '139','priestid' => '2022','pname' => 'Fr. Antony Xavier','pfname' => '','pmnane' => '','pdob' => '11.02.1960','pplace' => 'Mulankanavilai ','pseminary' => '','porddate' => '15.05.1990','pordplace' => 'Church of St. Antony, Mulankanavilai','pordby' => 'Bishop Leon A. Dharmaraj','pminstring' => 'Priest-In-Charge, Maruthancode','paddress' => '    Priest-In-Charge, Church of St. Antony, Maruthancode, Kuzhithurai - 629163','pphone' => '','pmobile' => '9445949050, 8220197177','pemail' => 'frtonyzavier@gmail.com','pimg' => '2022.jpg','pdiocese' => 'Diocese of Daltonganj','contract' => 'yes','home_priest' => '0','slug' => 'fr-antony-xavier'),
  array('id' => '140','priestid' => '2024','pname' => 'Fr. Christuraj','pfname' => '','pmnane' => '','pdob' => '25.12.1968','pplace' => '','pseminary' => '','porddate' => '10.05.1996','pordplace' => '','pordby' => '','pminstring' => 'Priest-In-Charge, Kuttaicadu','paddress' => '  Priest-In-Charge, Church of St. Jude Thadeus, Kuttaicadu, Kattathurai 629158','pphone' => '04651 227755','pmobile' => '9698560707, 9487523381','pemail' => 'frchristuraj@gmail.com','pimg' => '2024.jpg','pdiocese' => 'Diocese of Amravati','contract' => 'yes','home_priest' => '0','slug' => 'fr-christuraj'),
  array('id' => '141','priestid' => '2025','pname' => 'Fr. Jaya Kumar','pfname' => '','pmnane' => '','pdob' => '31.03.1983','pplace' => '','pseminary' => '','porddate' => '06.05.2014','pordplace' => '','pordby' => '','pminstring' => 'Co-Pastor, Mulagumoodu','paddress' => '  Co-Pastor, Church of O.L. of Nativity, Mulagumoodu - 629167','pphone' => '','pmobile' => '7639416933','pemail' => '','pimg' => '2025.jpg','pdiocese' => 'Heralds of Good News','contract' => 'yes','home_priest' => '0','slug' => 'fr-jaya-kumar'),
  array('id' => '142','priestid' => '2027','pname' => 'Fr. Amaladhas F.A.','pfname' => '','pmnane' => '','pdob' => '01.09.1962','pplace' => '','pseminary' => '','porddate' => '21.05.1993','pordplace' => '','pordby' => '','pminstring' => 'Priest-In-Charge, Kanjampuram','paddress' => '  Priest-In-Charge, Church of St. Therese of Child Jesus, Kanjampuram - 629154','pphone' => '','pmobile' => '9597265595','pemail' => '','pimg' => '2027.jpg','pdiocese' => 'CMF','contract' => 'yes','home_priest' => '0','slug' => 'fr-amaladhas-f-a'),
  array('id' => '143','priestid' => '2028','pname' => 'Fr. Sahaya Wilfred J.','pfname' => '','pmnane' => '','pdob' => '26.05.1970','pplace' => '','pseminary' => '','porddate' => '20.11.2004','pordplace' => '','pordby' => '','pminstring' => 'Priest-In-Charge, Mathoor','paddress' => '  Priest-In-Charge, Church of St.Joseph, Mathoor, Aruvikarai 629177','pphone' => '04651 240420','pmobile' => '9865478900','pemail' => '','pimg' => '2028.jpg','pdiocese' => 'Society of Jesus','contract' => 'yes','home_priest' => '0','slug' => 'fr-sahaya-wilfred-j'),
  array('id' => '144','priestid' => '2030','pname' => 'Fr. Baskar','pfname' => '','pmnane' => '','pdob' => '15.01.1981','pplace' => '','pseminary' => '','porddate' => '09.12.2007','pordplace' => '','pordby' => '','pminstring' => 'Priest-In-Charge, Poottetty ','paddress' => '  Priest-in-charge, Church of St. Antony, Poottetty, (Via) Karungal - 629157','pphone' => '04651 254444','pmobile' => '9444128235','pemail' => '','pimg' => '2030.jpg','pdiocese' => 'Holy Family','contract' => 'yes','home_priest' => '0','slug' => 'fr-baskar'),
  array('id' => '145','priestid' => '2031','pname' => 'Fr. Justin James','pfname' => '','pmnane' => '','pdob' => '31.05.1971','pplace' => '','pseminary' => '','porddate' => '09.08.2008','pordplace' => '','pordby' => '','pminstring' => 'Priest-In-Charge, Mukkalampadu','paddress' => '  Priest-In-Charge, Church of O.L. of Sorrows, Mukkalampadu, Kurunthencode - 629805','pphone' => '','pmobile' => '9486577971','pemail' => '','pimg' => '2031.jpg','pdiocese' => 'Arch-diocese of Delhi','contract' => 'yes','home_priest' => '0','slug' => 'fr-justin-james'),
  array('id' => '146','priestid' => '2020','pname' => 'Fr. Marconi Ravi Chandran','pfname' => '','pmnane' => '','pdob' => '','pplace' => '','pseminary' => '','porddate' => '','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest at Valvachakostam','paddress' => '  ','pphone' => '','pmobile' => NULL,'pemail' => '','pimg' => '2020.jpg','pdiocese' => NULL,'contract' => 'no','home_priest' => '0','slug' => 'fr-marconi-ravi-chandran'),
  array('id' => '147','priestid' => '2021','pname' => 'Fr. Jacksas Elango','pfname' => '','pmnane' => '','pdob' => '','pplace' => '','pseminary' => '','porddate' => '','pordplace' => '','pordby' => '','pminstring' => 'Parochial Administrator at Chetticharvilai','paddress' => '  ','pphone' => '','pmobile' => NULL,'pemail' => '','pimg' => '2021.jpg','pdiocese' => NULL,'contract' => 'no','home_priest' => '0','slug' => 'fr-jacksas-elango'),
  array('id' => '148','priestid' => '2022','pname' => 'Fr. George Clement','pfname' => '','pmnane' => '','pdob' => '','pplace' => '','pseminary' => '','porddate' => '','pordplace' => '','pordby' => '','pminstring' => 'Parish Priest at Manchadi','paddress' => '  ','pphone' => '','pmobile' => NULL,'pemail' => '','pimg' => '2022.jpg','pdiocese' => NULL,'contract' => 'no','home_priest' => '0','slug' => 'fr-george-clement')
);
            $arrayBatch = [];

            foreach ($parish as $key => $paris_one) 
            {
                $arrayBatch[] = ['company_name'=>$paris_one['cname'],'type'=> ($paris_one['type'] == 'Shrine')?'organization':'person', 'address'=>$paris_one['address']];
            }
            
            $this->db->table('_clients')->insertBatch($arrayBatch); 
          }
          
          $data = $this->db->query('select * from _clients')->getResultArray();
          echo "<pre>";
          print_r($data);

        die('dd');
    }

}

/* End of file dashboard.php */
/* Location: ./app/controllers/dashboard.php */