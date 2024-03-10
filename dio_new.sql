-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 10, 2024 at 01:17 PM
-- Server version: 8.0.36-0ubuntu0.20.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dio_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `_activity_logs`
--

CREATE TABLE `_activity_logs` (
  `id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `action` enum('created','updated','deleted','bitbucket_notification_received','github_notification_received') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_type_title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_type_id` int NOT NULL DEFAULT '0',
  `changes` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `log_for` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int NOT NULL DEFAULT '0',
  `log_for2` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `log_for_id2` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_announcements`
--

CREATE TABLE `_announcements` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL,
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_announcements`
--

INSERT INTO `_announcements` (`id`, `title`, `description`, `start_date`, `end_date`, `created_by`, `share_with`, `created_at`, `files`, `read_by`, `deleted`) VALUES
(1, 'welcome', '<p>welcome</p>', '2024-03-13', '2024-03-30', 1, 'all_members', '2024-03-02 15:22:13', 'a:0:{}', '0', 0),
(2, 'asdfsadf', '<p>sadfsadfasdfsdfasdf</p>', '2024-03-30', '2024-04-29', 1, 'all_members', '2024-03-02 15:45:17', 'a:1:{i:0;a:4:{s:9:\"file_name\";s:70:\"announcement_file65e3498d3d43d-enquiries-resbee-panel-Ekhool-tech.xlsx\";s:9:\"file_size\";s:5:\"29763\";s:7:\"file_id\";N;s:12:\"service_type\";N;}}', '0,1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_article_helpful_status`
--

CREATE TABLE `_article_helpful_status` (
  `id` int NOT NULL,
  `article_id` int NOT NULL,
  `status` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_attendance`
--

CREATE TABLE `_attendance` (
  `id` int NOT NULL,
  `status` enum('incomplete','pending','approved','rejected','deleted') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `checked_by` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `checked_at` datetime DEFAULT NULL,
  `reject_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_checklist_groups`
--

CREATE TABLE `_checklist_groups` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `checklists` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_checklist_items`
--

CREATE TABLE `_checklist_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_checked` int NOT NULL DEFAULT '0',
  `task_id` int NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_checklist_template`
--

CREATE TABLE `_checklist_template` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_ci_sessions`
--

CREATE TABLE `_ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_ci_sessions`
--

INSERT INTO `_ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('girhojc444ldjap2r8eptbeis2df9ptm', '127.0.0.1', '2024-03-02 08:24:30', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393336373837303b5f63695f70726576696f75735f75726c7c733a34383a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f70726f6a656374732f616c6c5f70726f6a65637473223b757365725f69647c733a313a2231223b),
('flpb47lbdieigcibrrl5v9nujkclspc6', '127.0.0.1', '2024-03-02 09:10:07', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393337303630373b5f63695f70726576696f75735f75726c7c733a33363a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f64617368626f617264223b757365725f69647c733a313a2231223b),
('i6jojoofgdc4a2tf50q1dgqrg9forjmd', '127.0.0.1', '2024-03-02 10:14:45', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393337303630373b5f63695f70726576696f75735f75726c7c733a33343a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f636c69656e7473223b757365725f69647c733a313a2231223b),
('j8i475sf92gli34bq3rkj1tcd7aqnf89', '127.0.0.1', '2024-03-02 14:59:12', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339313535323b5f63695f70726576696f75735f75726c7c733a33333a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f7369676e696e223b),
('7m01qhnn0tgh2q0uu0qa12ora6uu8unl', '127.0.0.1', '2024-03-02 15:04:18', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339313835383b5f63695f70726576696f75735f75726c7c733a33333a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f7369676e696e223b),
('798nndlk3rhhsfnqm3d8o61jgeg2djv2', '127.0.0.1', '2024-03-02 15:14:46', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339323438363b5f63695f70726576696f75735f75726c7c733a33333a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f7369676e696e223b),
('789vldjv3pcmn06q92vaffv4m8p25uda', '127.0.0.1', '2024-03-02 15:20:35', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339323833353b5f63695f70726576696f75735f75726c7c733a33333a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f7369676e696e223b),
('811dj6n5c96410ru9kha1o36kqssmnv1', '127.0.0.1', '2024-03-02 15:26:10', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339333137303b5f63695f70726576696f75735f75726c7c733a35343a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f73657474696e67732f636c69656e745f7065726d697373696f6e73223b757365725f69647c733a313a2231223b),
('vsl2g9tjg8s5qcqpuv6ihgevnf5p6g9l', '127.0.0.1', '2024-03-02 15:22:13', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339323933333b5f63695f70726576696f75735f75726c7c733a36393a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f6e6f74696669636174696f6e5f70726f636573736f722f6372656174655f6e6f74696669636174696f6e223b),
('eeo9timuv3p1krjopk1aqjak0vgljul5', '127.0.0.1', '2024-03-02 15:34:33', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339333637333b5f63695f70726576696f75735f75726c7c733a3133373a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f6576656e74732f63616c656e6461725f6576656e74732f6576656e74732f302f3f73746172743d323032342d30322d3235543030253341303025334130302532423035253341333026656e643d323032342d30342d30375430302533413030253341303025324230352533413330223b757365725f69647c733a313a2231223b),
('40mlvmff4uq142h84s4erlci2vkbjsq9', '127.0.0.1', '2024-03-02 15:39:37', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339333937373b5f63695f70726576696f75735f75726c7c733a34333a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f73657474696e67732f67656e6572616c223b757365725f69647c733a313a2231223b),
('lnhf74bkd5j9oqbjbu4fq8j8pvm0uo4s', '127.0.0.1', '2024-03-02 15:45:18', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339343331383b5f63695f70726576696f75735f75726c7c733a34353a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f616e6e6f756e63656d656e74732f666f726d223b757365725f69647c733a313a2231223b),
('tt1ldfqho1nh0nbs7pqb6u64oj9v4ls0', '127.0.0.1', '2024-03-02 15:45:17', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339343331373b5f63695f70726576696f75735f75726c7c733a36393a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f6e6f74696669636174696f6e5f70726f636573736f722f6372656174655f6e6f74696669636174696f6e223b),
('71si00v8f3bf24jdmtrlpc74314p6s8g', '127.0.0.1', '2024-03-02 15:48:02', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393339343331383b5f63695f70726576696f75735f75726c7c733a33363a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f64617368626f617264223b757365725f69647c733a313a2231223b),
('8doq3vklehsioj4qe8psgpg3hdq87p1h', '127.0.0.1', '2024-03-02 18:21:38', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393430333639383b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f223b757365725f69647c733a313a2231223b),
('j6a0m2m1buln76klg592r3g6dobs4r96', '127.0.0.1', '2024-03-02 18:27:56', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393430343037363b5f63695f70726576696f75735f75726c7c733a34333a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f73657474696e67732f67656e6572616c223b757365725f69647c733a313a2231223b),
('g1cr12rcl0ql8mj9d8fpnudccfvsp2ml', '127.0.0.1', '2024-03-02 18:34:51', 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393430343037363b5f63695f70726576696f75735f75726c7c733a34373a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f73657474696e67732f696e746567726174696f6e223b757365725f69647c733a313a2231223b),
('mg0llh53o8a7ollo49bo16cn8o45invg', '127.0.0.1', '2024-03-10 07:13:55', 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303035343833353b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f64696f2e6c6f63616c2f696e6465782e7068702f223b);

-- --------------------------------------------------------

--
-- Table structure for table `_clients`
--

CREATE TABLE `_clients` (
  `id` int NOT NULL,
  `company_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('organization','person') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'organization',
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `starred_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `group_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_lead` tinyint(1) NOT NULL DEFAULT '0',
  `lead_status_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `created_by` int NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `lead_source_id` int NOT NULL,
  `last_lead_status` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_migration_date` date NOT NULL,
  `vat_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `currency` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_clients`
--

INSERT INTO `_clients` (`id`, `company_name`, `type`, `address`, `city`, `state`, `zip`, `country`, `created_date`, `website`, `phone`, `currency_symbol`, `starred_by`, `group_ids`, `deleted`, `is_lead`, `lead_status_id`, `owner_id`, `created_by`, `sort`, `lead_source_id`, `last_lead_status`, `client_migration_date`, `vat_number`, `currency`, `disable_online_payment`) VALUES
(1, 'asdf', 'organization', 'asdf', 'daf', 'asdf', '', 'asdf', '2024-03-02', '', '', '', '', '', 0, 0, 0, 0, 1, 0, 0, '', '0000-00-00', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_client_groups`
--

CREATE TABLE `_client_groups` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_company`
--

CREATE TABLE `_company` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `website` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vat_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_company`
--

INSERT INTO `_company` (`id`, `name`, `address`, `phone`, `email`, `website`, `vat_number`, `is_default`, `deleted`) VALUES
(1, 'Company Name', '', '', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_contracts`
--

CREATE TABLE `_contracts` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL,
  `contract_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accepted_by` int NOT NULL DEFAULT '0',
  `staff_signed_by` int NOT NULL DEFAULT '0',
  `meta_data` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_contract_items`
--

CREATE TABLE `_contract_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `contract_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_contract_templates`
--

CREATE TABLE `_contract_templates` (
  `id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_contract_templates`
--

INSERT INTO `_contract_templates` (`id`, `title`, `template`, `deleted`) VALUES
(1, 'Contract template 1', '<div style=\"display: flex; flex-direction: column;\">\n\n <table style=\"margin-top: 0; margin-bottom: 40px\">\n <tbody>\n <tr>\n <td style=\"padding: 0;\">\n <div style=\"background-size: cover; background-position: center top; background-image: url(\'https://fairsketch.com/media/proposal/bg-2.png\'); padding: 140px 10px 100px;\">\n <div style=\"color:#FFFFFF;font-size:50px;line-height:62px !important;font-weight:600;letter-spacing:0px; text-align: center;\">{CONTRACT_TITLE}</div>\n <div style=\"color: #FFFFFF;\n font-size: 15px;\n text-align: center;\n  padding-top: 30px;\">We develop amazing apps for your business. <br>Here is the contract.</div>\n     </div>\n </td>\n  </tr>\n        </tbody>\n    </table>This App Development Contract states the terms and conditions that shall govern the contractual agreement between&nbsp; {COMPANY_NAME} (the Service Provider) and {CONTRACT_TO_COMPANY_NAME} (the Client) who agrees to be bound by the terms of the Contract.<table style=\"margin-top: 0; margin-bottom: 40px\"><tbody>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 40px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n     <div style=\"text-align: center\">\n         <div style=\"font-size: 30px\">{CONTRACT_ID}</div>\n         <div style=\"height: 3px;\n  width: 80px;\n  background-color: #2AA384;\n  margin: 25px auto 20px;\"></div>\n         <div style=\"margin-bottom: 20px;\"><div style=\"text-align: center;\">Contract Date:&nbsp;<span style=\"text-align: start;\">{CONTRACT_DATE}&nbsp;</span></div><div style=\"text-align: center;\"><span style=\"text-align: start;\">Expiry Date:&nbsp;&nbsp;{CONTRACT_EXPIRY_DATE}</span></div><div style=\"text-align: left;\"><br></div></div>\n     </div>\n     <div style=\"clear: both;\">\n         <div style=\"width: 50%; float: left;  padding-right: 10px\">\n <img src=\"https://fairsketch.com/media/proposal/proposal-to.png\" style=\"width: 100%; margin-bottom: 15px\">\n <p><i>Client</i></p>\n <br>\n {CONTRACT_TO_INFO}\n         </div>\n\n         <div style=\"width: 50%; float: left; padding-left: 10px\">\n <img src=\"https://fairsketch.com/media/proposal/proposal-from.png\" style=\"width: 100%; margin-bottom: 15px\">\n <p><i>Service Provider</i></p>\n <br>\n {COMPANY_INFO}\n         </div>\n     </div>\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 40px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n     <div style=\"margin-top: 20px\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">Service Details</div>\n <div style=\"height: 3px; width: 80px; background-color: #2AA384; margin: 25px auto 20px;\"></div>\n <div style=\"margin-bottom: 20px;\">We\'ll develop a mobile app for your business. <br>Here are more details about the service.&nbsp;</div>\n         </div>\n\n         <p>\n {CONTRACT_ITEMS}\n         </p>\n     </div>\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 60px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">1. Service Policy&nbsp;</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"text-align: left; margin-bottom: 20px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </div><div style=\"text-align: left; margin-bottom: 20px;\">It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div><div style=\"text-align: left; margin-bottom: 20px;\"><br></div><div style=\"margin-bottom: 20px;\"></div></div></div>\n\n\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">2. Delivery&nbsp;</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"text-align: left; margin-bottom: 20px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. </div><div style=\"text-align: left; margin-bottom: 20px;\"><span>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></div><div style=\"text-align: left; margin-bottom: 20px;\"><span><br></span></div></div></div><div style=\"\"><div style=\"text-align: center\"><div style=\"margin-bottom: 20px;\"></div></div></div>\n\n\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">3. Intellectual property rights</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"text-align: left; margin-bottom: 20px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div><div style=\"text-align: left; margin-bottom: 20px;\"><br></div><div style=\"margin-bottom: 20px;\"></div></div></div>\n\n\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">4. Confidentiality</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"text-align: left; margin-bottom: 20px;\"><span>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></div><div style=\"text-align: left; margin-bottom: 20px;\">Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div><div style=\"text-align: left; margin-bottom: 20px;\"><br></div><div style=\"margin-bottom: 20px;\"></div></div></div>\n\n\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">5. Support</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"text-align: left; margin-bottom: 20px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div><div style=\"margin-bottom: 20px;\"></div></div></div>\n\n\n\n</td></tr></tbody></table></div><div style=\"display: flex; flex-direction: column;\">\n\n<div>\n{CONTRACT_NOTE}\n</div>\n</div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_custom_fields`
--

CREATE TABLE `_custom_fields` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title_language_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `placeholder_language_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `show_in_embedded_form` tinyint NOT NULL DEFAULT '0',
  `placeholder` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `example_variable_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `options` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_to` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `add_filter` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_estimate` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_contract` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_order` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_proposal` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT '0',
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT '0',
  `disable_editing_by_clients` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_kanban_card` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_custom_field_values`
--

CREATE TABLE `_custom_field_values` (
  `id` int NOT NULL,
  `related_to_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_to_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_custom_widgets`
--

CREATE TABLE `_custom_widgets` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `show_title` tinyint(1) NOT NULL DEFAULT '0',
  `show_border` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_dashboards`
--

CREATE TABLE `_dashboards` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `color` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_email_templates`
--

CREATE TABLE `_email_templates` (
  `id` int NOT NULL,
  `template_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `default_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `template_type` enum('default','custom') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'default',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_email_templates`
--

INSERT INTO `_email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `template_type`, `language`, `deleted`) VALUES
(1, 'login_info', 'Login details', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME} {USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 'default', '', 0),
(2, 'reset_password', 'Reset password', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '', 'default', '', 0),
(3, 'team_member_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don not want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 'default', '', 0),
(4, 'send_invoice', 'New invoice', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '', 'default', '', 0),
(5, 'signature', 'Signature', 'Powered By: <a href=\"http://fairsketch.com/\" target=\"_blank\">fairsketch </a>', '', 'default', '', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don not want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 'default', '', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', '', 'default', '', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', '', 'default', '', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', '', 'default', '', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', '', 'default', '', 0),
(11, 'general_notification', '{EVENT_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', '', 'default', '', 0),
(12, 'invoice_payment_confirmation', 'Payment received', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\">\r\n                                        <tbody><tr>\r\n                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                                    <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>', NULL, 'default', '', 0),
(13, 'message_received', '{SUBJECT}', '<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"> <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\"> <style type=\"text/css\"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id=\"message-container\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;\"> <tbody> <tr> <td valign=\"top\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"50\" width=\"600\">&nbsp;</td> </tr> <tr> <td style=\"background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; \" width=\"600\"><h2 style=\"color:#fff; text-align:center;\">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor=\"whitesmoke\" style=\"background:#fff; font-family:Helvetica,Arial,sans-serif\" valign=\"top\" width=\"600\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> <tr> <td width=\"560\"><p><span style=\"background-color: transparent;\">{MESSAGE_CONTENT}</span></p> <p style=\"display:inline-block; padding: 10px 15px; background-color: #00b393;\"><a href=\"{MESSAGE_URL}\" style=\"text-decoration: none; color:#fff;\" target=\"_blank\">Reply Message</a></p> </td> </tr> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height=\"60\" width=\"600\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(14, 'invoice_due_reminder_before_due_date', 'Invoice due reminder', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Invoice Due Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,<br>We would like to remind you that invoice {INVOICE_ID} is due on {DUE_DATE}. Please pay the invoice within due date.&nbsp;</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>If you have already submitted the payment, please ignore this email.</p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(15, 'invoice_overdue_reminder', 'Invoice overdue reminder', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Invoice Overdue Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,<br>We would like to remind you that you have an unpaid invoice {INVOICE_ID}. We kindly request you to pay the invoice as soon as possible.&nbsp;</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>If you have already submitted the payment, please ignore this email.</p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(16, 'recurring_invoice_creation_reminder', 'Recurring invoice creation reminder', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Invoice Cration Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,<br>We would like to remind you that a recurring invoice will be created on {NEXT_RECURRING_DATE}.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">View Invoice</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(17, 'project_task_deadline_reminder', 'Project task deadline reminder', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">This is to remind you that there are some tasks which deadline is {DEADLINE}.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">{TASKS_LIST}</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '', 'default', '', 0),
(18, 'estimate_sent', 'New estimate', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is the estimate. Please check the attachment.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0);
INSERT INTO `_email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `template_type`, `language`, `deleted`) VALUES
(19, 'estimate_request_received', 'Estimate request received', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE REQUEST #{ESTIMATE_REQUEST_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"><span style=\"background-color: transparent;\">A new estimate request has been received from {CONTACT_FIRST_NAME}.</span><br></p><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_REQUEST_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate Request</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(20, 'estimate_rejected', 'Estimate rejected', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"><p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">The estimate #{ESTIMATE_ID} has been rejected.</span></font><br></p><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(21, 'estimate_accepted', 'Estimate accepted', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"><p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">The estimate #{ESTIMATE_ID} has been accepted.</span></font><br></p><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(22, 'new_client_greetings', 'Welcome!', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Welcome to {COMPANY_NAME}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Thank you for creating your account. </span></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">We are happy to see you here.<br></span></p><hr><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {CONTACT_LOGIN_EMAIL}</span><br></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{CONTACT_LOGIN_PASSWORD}</span></p><p style=\"color: rgb(85, 85, 85);\"><br></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 'default', '', 0),
(23, 'verify_email', 'Please verify your email', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account verification</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\"><p style=\"font-size: 14px;\">To initiate the signup process, please click on the following link:<br></p><p style=\"font-size: 14px;\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{VERIFY_EMAIL_URL}\" target=\"_blank\">Verify Email</a></span></p>  <p style=\"font-size: 14px;\"><br></p><p style=\"\"><span style=\"font-size: 14px;\">If you did not initiate the request, you do not need to take any further action and can safely disregard this email.</span></p><p style=\"\"><span style=\"font-size: 14px;\"><br></span></p><p style=\"font-size: 14px;\">{SIGNATURE}</p></div></div></div>', '', 'default', '', 0),
(24, 'new_order_received', 'New order received', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>ORDER #{ORDER_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">A new order has been received from&nbsp;</span><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">{CONTACT_FIRST_NAME} and is attached here.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ORDER_URL}\" target=\"_blank\">Show Order</a></span></p><p style=\"\"><br></p>  </div> </div></div>', '', 'default', '', 0),
(25, 'order_status_updated', 'Order status updated', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>ORDER #{ORDER_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your order&nbsp;</span><font color=\"#555555\"><span style=\"font-size: 14px;\">has been updated&nbsp;</span></font><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ORDER_URL}\" target=\"_blank\">Show Order</a></span></p><p style=\"\"><br></p>  </div> </div></div>', '', 'default', '', 0),
(26, 'proposal_sent', 'Proposal sent', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>PROPOSAL #{PROPOSAL_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is a proposal for you.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{PROPOSAL_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Proposal</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> </p><p>Public URL: {PUBLIC_PROPOSAL_URL}</p><p><br></p><p>{SIGNATURE} </p></td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', NULL, 'default', '', 0),
(27, 'project_completed', 'Project completed', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Project #{PROJECT_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Project #{PROJECT_ID}&nbsp;has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">Title:&nbsp;</span>{PROJECT_TITLE}</p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROJECT_URL}\" target=\"_blank\">Show Project</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"color: rgb(78, 94, 106); font-size: 13.5px;\">{SIGNATURE}</span><br></span></p>   </div>  </div> </div>', '', 'default', '', 0),
(28, 'proposal_accepted', 'Proposal accepted', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>PROPOSAL #{PROPOSAL_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The proposal #{PROPOSAL_ID} has been accepted.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROPOSAL_URL}\" target=\"_blank\">Show Proposal</a></span></p><p style=\"\"><br></p>  </div> </div></div>', '', 'default', '', 0),
(29, 'proposal_rejected', 'Proposal rejected', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>PROPOSAL #{PROPOSAL_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The proposal #{PROPOSAL_ID} has been rejected.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROPOSAL_URL}\" target=\"_blank\">Show Proposal</a></span></p><p style=\"\"><br></p>  </div> </div></div>', '', 'default', '', 0),
(30, 'estimate_commented', 'Estimate  #{ESTIMATE_ID}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Estimate #{ESTIMATE_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{COMMENT_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ESTIMATE_URL}\" target=\"_blank\">Show Estimate</a></span></p></div></div></div>', '', 'default', '', 0),
(31, 'contract_sent', 'Contract sent', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>CONTRACT #{CONTRACT_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is a contract for you.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{CONTRACT_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Contract</a></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>Public URL: {PUBLIC_CONTRACT_URL}<br></p><p><br></p><p>{SIGNATURE}<br></p></td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0),
(32, 'contract_accepted', 'Contract accepted', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>CONTRACT #{CONTRACT_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The contract #{CONTRACT_ID} has been accepted.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{CONTRACT_URL}\" target=\"_blank\">Show Contract</a></span></p><p style=\"\"><br></p>  </div> </div></div>', '', 'default', '', 0),
(33, 'contract_rejected', 'Contract rejected', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>CONTRACT #{CONTRACT_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The contract #{CONTRACT_ID} has been rejected.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{CONTRACT_URL}\" target=\"_blank\">Show Contract</a></span></p><p style=\"\"><br></p>  </div> </div></div>', '', 'default', '', 0),
(34, 'invoice_manual_payment_added', 'Manual payment added', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Payment Added</h2> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,</p><p>A new payment has been added to {INVOICE_ID}. </p><p>Payment amount: {PAYMENT_AMOUNT}</p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> </td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 'default', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_estimates`
--

CREATE TABLE `_estimates` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `estimate_request_id` int NOT NULL DEFAULT '0',
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `accepted_by` int NOT NULL DEFAULT '0',
  `meta_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `signature` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_estimate_comments`
--

CREATE TABLE `_estimate_comments` (
  `id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `estimate_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_estimate_forms`
--

CREATE TABLE `_estimate_forms` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `assigned_to` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `enable_attachment` tinyint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_estimate_items`
--

CREATE TABLE `_estimate_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `estimate_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_estimate_requests`
--

CREATE TABLE `_estimate_requests` (
  `id` int NOT NULL,
  `estimate_form_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int NOT NULL,
  `lead_id` int NOT NULL,
  `assigned_to` int NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'new',
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_events`
--

CREATE TABLE `_events` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int NOT NULL,
  `location` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `client_id` int NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `editable_google_event` tinyint(1) NOT NULL DEFAULT '0',
  `google_event_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `ticket_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `task_id` int NOT NULL DEFAULT '0',
  `next_recurring_time` datetime DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `snoozing_time` datetime DEFAULT NULL,
  `reminder_status` enum('new','shown','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'new',
  `type` enum('event','reminder') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'event',
  `color` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `last_start_date` date DEFAULT NULL,
  `recurring_dates` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `confirmed_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rejected_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_expenses`
--

CREATE TABLE `_expenses` (
  `id` int NOT NULL,
  `expense_date` date NOT NULL,
  `category_id` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `amount` double NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `client_id` int NOT NULL DEFAULT '0',
  `recurring` tinyint NOT NULL DEFAULT '0',
  `recurring_expense_id` tinyint NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `next_recurring_date` date DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_expense_categories`
--

CREATE TABLE `_expense_categories` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_expense_categories`
--

INSERT INTO `_expense_categories` (`id`, `title`, `deleted`) VALUES
(1, 'Miscellaneous expense', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_file_category`
--

CREATE TABLE `_file_category` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `type` enum('project') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'project',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_general_files`
--

CREATE TABLE `_general_files` (
  `id` int NOT NULL,
  `file_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `service_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `uploaded_by` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_general_files`
--

INSERT INTO `_general_files` (`id`, `file_name`, `file_id`, `service_type`, `description`, `file_size`, `created_at`, `client_id`, `user_id`, `uploaded_by`, `deleted`) VALUES
(1, '_file65e2ede77f7c3-GOD_2633....S.jpg', NULL, NULL, '', 1119633, '2024-03-02 09:14:15', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_help_articles`
--

CREATE TABLE `_help_articles` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_views` int NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_help_categories`
--

CREATE TABLE `_help_categories` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('help','knowledge_base') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_invoices`
--

CREATE TABLE `_invoices` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','not_paid','cancelled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `tax_id3` int NOT NULL DEFAULT '0',
  `recurring` tinyint NOT NULL DEFAULT '0',
  `recurring_invoice_id` int NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `next_recurring_date` date DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `due_reminder_date` date DEFAULT NULL,
  `recurring_reminder_date` date DEFAULT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_invoice_items`
--

CREATE TABLE `_invoice_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `invoice_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_invoice_payments`
--

CREATE TABLE `_invoice_payments` (
  `id` int NOT NULL,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `invoice_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_items`
--

CREATE TABLE `_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `show_in_client_portal` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_item_categories`
--

CREATE TABLE `_item_categories` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_item_categories`
--

INSERT INTO `_item_categories` (`id`, `title`, `deleted`) VALUES
(1, 'General item', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_labels`
--

CREATE TABLE `_labels` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` enum('event','invoice','note','project','task','ticket','to_do') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_leads`
--

CREATE TABLE `_leads` (
  `id` int NOT NULL,
  `company_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_lead_source`
--

CREATE TABLE `_lead_source` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_lead_source`
--

INSERT INTO `_lead_source` (`id`, `title`, `sort`, `deleted`) VALUES
(1, 'Google', 1, 0),
(2, 'Facebook', 2, 0),
(3, 'Twitter', 3, 0),
(4, 'Youtube', 4, 0),
(5, 'Elsewhere', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_lead_status`
--

CREATE TABLE `_lead_status` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_lead_status`
--

INSERT INTO `_lead_status` (`id`, `title`, `color`, `sort`, `deleted`) VALUES
(1, 'New', '#f1c40f', 0, 0),
(2, 'Qualified', '#2d9cdb', 1, 0),
(3, 'Discussion', '#29c2c2', 2, 0),
(4, 'Negotiation', '#2d9cdb', 3, 0),
(5, 'Won', '#83c340', 4, 0),
(6, 'Lost', '#e74c3c', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_leave_applications`
--

CREATE TABLE `_leave_applications` (
  `id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7,2) NOT NULL,
  `total_days` decimal(5,2) NOT NULL,
  `applicant_id` int NOT NULL,
  `reason` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `checked_at` datetime DEFAULT NULL,
  `checked_by` int NOT NULL DEFAULT '0',
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_leave_types`
--

CREATE TABLE `_leave_types` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_leave_types`
--

INSERT INTO `_leave_types` (`id`, `title`, `status`, `color`, `description`, `deleted`) VALUES
(1, 'Casual Leave', 'active', '#83c340', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_likes`
--

CREATE TABLE `_likes` (
  `id` int NOT NULL,
  `project_comment_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_messages`
--

CREATE TABLE `_messages` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `status` enum('unread','read') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_by_users` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_milestones`
--

CREATE TABLE `_milestones` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `due_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_notes`
--

CREATE TABLE `_notes` (
  `id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `project_id` int NOT NULL DEFAULT '0',
  `client_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_notifications`
--

CREATE TABLE `_notifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `notify_to` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `event` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `task_id` int NOT NULL,
  `project_comment_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `ticket_comment_id` int NOT NULL,
  `project_file_id` int NOT NULL,
  `leave_id` int NOT NULL,
  `post_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `activity_log_id` int NOT NULL,
  `client_id` int NOT NULL,
  `lead_id` int NOT NULL,
  `invoice_payment_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `estimate_id` int NOT NULL,
  `contract_id` int NOT NULL,
  `order_id` int NOT NULL,
  `estimate_request_id` int NOT NULL,
  `actual_message_id` int NOT NULL,
  `parent_message_id` int NOT NULL,
  `event_id` int NOT NULL,
  `announcement_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `estimate_comment_id` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_notification_settings`
--

CREATE TABLE `_notification_settings` (
  `id` int NOT NULL,
  `event` varchar(250) NOT NULL,
  `category` varchar(50) NOT NULL,
  `enable_email` int NOT NULL DEFAULT '0',
  `enable_web` int NOT NULL DEFAULT '0',
  `enable_slack` int NOT NULL DEFAULT '0',
  `notify_to_team` text NOT NULL,
  `notify_to_team_members` text NOT NULL,
  `notify_to_terms` text NOT NULL,
  `sort` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_notification_settings`
--

INSERT INTO `_notification_settings` (`id`, `event`, `category`, `enable_email`, `enable_web`, `enable_slack`, `notify_to_team`, `notify_to_team_members`, `notify_to_terms`, `sort`, `deleted`) VALUES
(1, 'project_created', 'project', 0, 0, 0, '', '', '', 1, 0),
(2, 'project_deleted', 'project', 0, 0, 0, '', '', '', 2, 0),
(3, 'project_task_created', 'project', 0, 1, 0, '', '', 'project_members,task_assignee', 3, 0),
(4, 'project_task_updated', 'project', 0, 1, 0, '', '', 'task_assignee', 4, 0),
(5, 'project_task_assigned', 'project', 0, 1, 0, '', '', 'task_assignee', 5, 0),
(7, 'project_task_started', 'project', 0, 0, 0, '', '', '', 7, 0),
(8, 'project_task_finished', 'project', 0, 0, 0, '', '', '', 8, 0),
(9, 'project_task_reopened', 'project', 0, 0, 0, '', '', '', 9, 0),
(10, 'project_task_deleted', 'project', 0, 1, 0, '', '', 'task_assignee', 10, 0),
(11, 'project_task_commented', 'project', 0, 1, 0, '', '', 'task_assignee', 11, 0),
(12, 'project_member_added', 'project', 0, 1, 0, '', '', 'project_members', 12, 0),
(13, 'project_member_deleted', 'project', 0, 1, 0, '', '', 'project_members', 13, 0),
(14, 'project_file_added', 'project', 0, 1, 0, '', '', 'project_members', 14, 0),
(15, 'project_file_deleted', 'project', 0, 1, 0, '', '', 'project_members', 15, 0),
(16, 'project_file_commented', 'project', 0, 1, 0, '', '', 'project_members', 16, 0),
(17, 'project_comment_added', 'project', 0, 1, 0, '', '', 'project_members', 17, 0),
(18, 'project_comment_replied', 'project', 0, 1, 0, '', '', 'project_members,comment_creator', 18, 0),
(19, 'project_customer_feedback_added', 'project', 0, 1, 0, '', '', 'project_members', 19, 0),
(20, 'project_customer_feedback_replied', 'project', 0, 1, 0, '', '', 'project_members,comment_creator', 20, 0),
(21, 'client_signup', 'client', 0, 0, 0, '', '', '', 21, 0),
(22, 'invoice_online_payment_received', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(23, 'leave_application_submitted', 'leave', 0, 0, 0, '', '', '', 23, 0),
(24, 'leave_approved', 'leave', 0, 1, 0, '', '', 'leave_applicant', 24, 0),
(25, 'leave_assigned', 'leave', 0, 1, 0, '', '', 'leave_applicant', 25, 0),
(26, 'leave_rejected', 'leave', 0, 1, 0, '', '', 'leave_applicant', 26, 0),
(27, 'leave_canceled', 'leave', 0, 0, 0, '', '', '', 27, 0),
(28, 'ticket_created', 'ticket', 0, 0, 0, '', '', '', 28, 0),
(29, 'ticket_commented', 'ticket', 0, 1, 0, '', '', 'client_primary_contact,ticket_creator', 29, 0),
(30, 'ticket_closed', 'ticket', 0, 1, 0, '', '', 'client_primary_contact,ticket_creator', 30, 0),
(31, 'ticket_reopened', 'ticket', 0, 1, 0, '', '', 'client_primary_contact,ticket_creator', 31, 0),
(32, 'estimate_request_received', 'estimate', 0, 0, 0, '', '', '', 32, 0),
(34, 'estimate_accepted', 'estimate', 0, 0, 0, '', '', '', 34, 0),
(35, 'estimate_rejected', 'estimate', 0, 0, 0, '', '', '', 35, 0),
(36, 'new_message_sent', 'message', 0, 0, 0, '', '', '', 36, 0),
(37, 'message_reply_sent', 'message', 0, 0, 0, '', '', '', 37, 0),
(38, 'invoice_payment_confirmation', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(39, 'new_event_added_in_calendar', 'event', 0, 0, 0, '', '', '', 39, 0),
(40, 'recurring_invoice_created_vai_cron_job', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(41, 'new_announcement_created', 'announcement', 0, 0, 0, '', '', 'recipient', 41, 0),
(42, 'invoice_due_reminder_before_due_date', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(43, 'invoice_overdue_reminder', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(44, 'recurring_invoice_creation_reminder', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(45, 'project_completed', 'project', 0, 0, 0, '', '', '', 2, 0),
(46, 'lead_created', 'lead', 0, 0, 0, '', '', '', 21, 0),
(47, 'client_created_from_lead', 'lead', 0, 0, 0, '', '', '', 21, 0),
(48, 'project_task_deadline_pre_reminder', 'project', 0, 1, 0, '', '', 'task_assignee', 20, 0),
(49, 'project_task_reminder_on_the_day_of_deadline', 'project', 0, 1, 0, '', '', 'task_assignee', 20, 0),
(50, 'project_task_deadline_overdue_reminder', 'project', 0, 1, 0, '', '', 'task_assignee', 20, 0),
(51, 'recurring_task_created_via_cron_job', 'project', 0, 1, 0, '', '', 'project_members,task_assignee', 20, 0),
(52, 'calendar_event_modified', 'event', 0, 0, 0, '', '', '', 39, 0),
(53, 'client_contact_requested_account_removal', 'client', 0, 0, 0, '', '', '', 21, 0),
(54, 'bitbucket_push_received', 'project', 0, 1, 0, '', '', '', 45, 0),
(55, 'github_push_received', 'project', 0, 1, 0, '', '', '', 45, 0),
(56, 'invited_client_contact_signed_up', 'client', 0, 0, 0, '', '', '', 21, 0),
(57, 'created_a_new_post', 'timeline', 0, 0, 0, '', '', '', 52, 0),
(58, 'timeline_post_commented', 'timeline', 0, 0, 0, '', '', '', 52, 0),
(59, 'ticket_assigned', 'ticket', 0, 0, 0, '', '', 'ticket_assignee', 31, 0),
(60, 'new_order_received', 'order', 0, 0, 0, '', '', '', 1, 0),
(61, 'order_status_updated', 'order', 0, 0, 0, '', '', '', 2, 0),
(62, 'proposal_accepted', 'proposal', 0, 0, 0, '', '', '', 34, 0),
(63, 'proposal_rejected', 'proposal', 0, 0, 0, '', '', '', 35, 0),
(64, 'estimate_commented', 'estimate', 0, 0, 0, '', '', '', 35, 0),
(65, 'invoice_manual_payment_added', 'invoice', 0, 0, 0, '', '', '', 22, 0),
(66, 'contract_accepted', 'contract', 0, 0, 0, '', '', '', 66, 0),
(67, 'contract_rejected', 'contract', 0, 0, 0, '', '', '', 67, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_orders`
--

CREATE TABLE `_orders` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `order_date` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_id` int NOT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_order_items`
--

CREATE TABLE `_order_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `order_id` int NOT NULL,
  `created_by` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_order_status`
--

CREATE TABLE `_order_status` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_order_status`
--

INSERT INTO `_order_status` (`id`, `title`, `color`, `sort`, `deleted`) VALUES
(1, 'New', '#f1c40f', 0, 0),
(2, 'Processing', '#29c2c2', 1, 0),
(3, 'Confirmed', '#83c340', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_pages`
--

CREATE TABLE `_pages` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `slug` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `internal_use_only` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_team_members_only` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_clients_only` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_payment_methods`
--

CREATE TABLE `_payment_methods` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT '0',
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_payment_amount` double NOT NULL DEFAULT '0',
  `settings` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_payment_methods`
--

INSERT INTO `_payment_methods` (`id`, `title`, `type`, `description`, `online_payable`, `available_on_invoice`, `minimum_payment_amount`, `settings`, `sort`, `deleted`) VALUES
(1, 'Cash', 'custom', 'Cash payments', 0, 0, 0, '', 0, 0),
(2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}', 0, 0),
(3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:\"pay_button_text\";s:6:\"PayPal\";s:5:\"email\";s:4:\"\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}', 0, 0),
(4, 'Paytm', 'paytm', 'Paytm online payments', 1, 0, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_paypal_ipn`
--

CREATE TABLE `_paypal_ipn` (
  `id` int NOT NULL,
  `transaction_id` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `ipn_hash` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ipn_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_pin_comments`
--

CREATE TABLE `_pin_comments` (
  `id` int NOT NULL,
  `project_comment_id` int NOT NULL,
  `pinned_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_posts`
--

CREATE TABLE `_posts` (
  `id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `post_id` int NOT NULL,
  `share_with` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_projects`
--

CREATE TABLE `_projects` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `project_type` enum('client_project','internal_project') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'client_project',
  `start_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `client_id` int NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `status` enum('open','completed','hold','canceled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `starred_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `estimate_id` int NOT NULL,
  `order_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_project_comments`
--

CREATE TABLE `_project_comments` (
  `id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `comment_id` int NOT NULL DEFAULT '0',
  `task_id` int NOT NULL DEFAULT '0',
  `file_id` int NOT NULL DEFAULT '0',
  `customer_feedback_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_project_files`
--

CREATE TABLE `_project_files` (
  `id` int NOT NULL,
  `file_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `service_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `project_id` int NOT NULL,
  `uploaded_by` int NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_project_members`
--

CREATE TABLE `_project_members` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `project_id` int NOT NULL,
  `is_leader` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_project_settings`
--

CREATE TABLE `_project_settings` (
  `project_id` int NOT NULL,
  `setting_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_project_time`
--

CREATE TABLE `_project_time` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `hours` float NOT NULL,
  `status` enum('open','logged','approved') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'logged',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `task_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_proposals`
--

CREATE TABLE `_proposals` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `proposal_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accepted_by` int NOT NULL DEFAULT '0',
  `meta_data` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_proposal_items`
--

CREATE TABLE `_proposal_items` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `proposal_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_proposal_templates`
--

CREATE TABLE `_proposal_templates` (
  `id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_proposal_templates`
--

INSERT INTO `_proposal_templates` (`id`, `title`, `template`, `deleted`) VALUES
(1, 'Proposal template 1', '<div style=\"display: flex; flex-direction: column;\">\n\n <table style=\"margin-top: 0; margin-bottom: 40px\">\n <tbody>\n <tr>\n <td style=\"padding: 0;\">\n <div style=\"background-size: cover; background-position: center top; background-image: url(\'https://fairsketch.com/media/proposal/bg-2.png\'); padding: 140px 10px 100px;\">\n <div style=\"color:#FFFFFF;font-size:50px;line-height:62px !important;font-weight:600;letter-spacing:0px; text-align: center;\">App Development<br>Proposal</div>\n <div style=\"color: #FFFFFF;\n font-size: 15px;\n text-align: center;\n  padding-top: 30px;\">We develop amazing apps for your business. <br>Here is our best offer for you.</div>\n     </div>\n </td>\n  </tr>\n        </tbody>\n    </table>We are excited to get to work on your new mobile app, and we want to make sure you are satisfied with our proposal and have a full understanding of what to expect in this lengthy process. Creating a mobile app is exciting and our expert team is fully capable of giving you something unique that will help grow your business.<table style=\"margin-top: 0; margin-bottom: 40px\"><tbody>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 40px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n     <div style=\"text-align: center\">\n         <div style=\"font-size: 30px\">{PROPOSAL_ID}</div>\n         <div style=\"height: 3px;\n  width: 80px;\n  background-color: #2AA384;\n  margin: 25px auto 20px;\"></div>\n         <div style=\"margin-bottom: 20px;\"><div style=\"text-align: center;\">Proposal Date:&nbsp;<span style=\"text-align: start;\">{PROPOSAL_DATE}&nbsp;</span></div><div style=\"text-align: center;\"><span style=\"text-align: start;\">Expiry Date:&nbsp;&nbsp;{PROPOSAL_EXPIRY_DATE}</span></div><div style=\"text-align: left;\"><br></div></div>\n     </div>\n     <div style=\"clear: both;\">\n         <div style=\"width: 50%; float: left;  padding-right: 10px\">\n <img src=\"https://fairsketch.com/media/proposal/proposal-to.png\" style=\"width: 100%; margin-bottom: 15px\">\n <p><i>Proposal For</i></p>\n <br>\n {PROPOSAL_TO_INFO}\n         </div>\n\n         <div style=\"width: 50%; float: left; padding-left: 10px\">\n <img src=\"https://fairsketch.com/media/proposal/proposal-from.png\" style=\"width: 100%; margin-bottom: 15px\">\n <p><i>Proposal From</i></p>\n <br>\n {COMPANY_INFO}\n         </div>\n     </div>\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 40px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n     <div style=\"margin-top: 20px\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">Our Best Offer</div>\n <div style=\"height: 3px; width: 80px; background-color: #2AA384; margin: 25px auto 20px;\"></div>\n <div style=\"margin-bottom: 20px;\">We would like to develop a mobile app for your business. <br>Please feel free to contact us if you have any questions.</div>\n         </div>\n\n         <p>\n {PROPOSAL_ITEMS}\n         </p>\n     </div>\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 60px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">Our Objective</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"margin-bottom: 20px;\">We build professional apps for business. Customer satisfaction is our main goal.&nbsp;</div><div style=\"margin-bottom: 20px;\"><br></div>\n         </div>\n\n         <div style=\"clear: both;\">\n <div style=\"width: 50%; float: left;  padding-right: 10px\">\n  <img src=\"https://fairsketch.com/media/proposal/phone-picture.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n\n <div style=\"width: 50%; float: left; padding-left: 10px\">\n  <div style=\"font-size:18px;line-height:28px;font-weight:600;letter-spacing:0px;padding:0;padding-bottom:20px; padding-top: 80px;\">\n      We Provide High Quality and Cost Effective Services.\n  </div>\n  <div style=\"font-size:15px;line-height:28px;letter-spacing:0px;padding:0;padding-bottom:30px;\">Our app development process contains different levels of testing. We can confirm you the largest amount of device support guaranty.</div>\n  <div>Work with us.</div>\n  <div style=\"font-size: 15px; color:  #2AA384; padding-top: 5px;\">Be a part of our happy customers.</div><div style=\"font-size: 15px; color:  #2AA384; padding-top: 5px;\"><br></div><div style=\"font-size: 15px; color:  #2AA384; padding-top: 5px;\"><br></div><br></div>\n         </div>\n     </div>\n\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 40px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">Our Portfolio</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"margin-bottom: 20px;\">Some of our previous work here</div>\n         </div>\n\n         <div style=\"clear: both; margin: 0 -10px;\">\n <div style=\"width: 33.33%; float: left;  padding: 0 10px; margin-bottom: 20px\">\n  <img src=\"https://fairsketch.com/media/proposal/portfolio-1.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n <div style=\"width: 33.33%; float: left; padding: 0 10px; margin-bottom: 20px\">\n  <img src=\"https://fairsketch.com/media/proposal/portfolio-2.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n <div style=\"width: 33.33%; float: left;  padding: 0 10px; margin-bottom: 20px\">\n  <img src=\"https://fairsketch.com/media/proposal/portfolio-3.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n         </div>\n         <div style=\"clear: both; margin: 0 -10px;\">\n <div style=\"width: 33.33%; float: left;  padding: 0 10px; margin-bottom: 20px\">\n  <img src=\"https://fairsketch.com/media/proposal/portfolio-4.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n <div style=\"width: 33.33%; float: left; padding: 0 10px; margin-bottom: 20px\">\n  <img src=\"https://fairsketch.com/media/proposal/portfolio-5.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n <div style=\"width: 33.33%; float: left;  padding: 0 10px; margin-bottom: 20px\">\n  <img src=\"https://fairsketch.com/media/proposal/portfolio-6.png\" style=\"    display: block; border: 0;\n       width: 100%;\n       max-width: 290px;\">\n </div>\n         </div>\n\n     </div>\n\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    <table style=\"margin-top: 0; margin-bottom: 40px\">\n        <tbody>\n  <tr>\n <td style=\"padding: 0;\">\n\n     <div style=\"\">\n         <div style=\"text-align: center\">\n <div style=\"font-size: 30px\">Contact Us</div>\n <div style=\"height: 3px;\n   width: 80px;\n   background-color: #2AA384;\n   margin: 25px auto 20px;\"></div>\n <div style=\"margin-bottom: 20px;\"></div>\n         </div>\n\n         <p style=\"text-align: center; margin-bottom: 20px;\">We are looking forward working with you. Please feel free to contact us.&nbsp;</p><p style=\"text-align: center; margin-bottom: 20px;\"><br></p>\n         <div style=\"text-align: center;\"><img src=\"https://fairsketch.com/media/proposal/bg-1.png\" style=\"width: 100%;\"></div></div>\n\n </td>\n  </tr>\n        </tbody>\n    </table>\n\n    {PROPOSAL_NOTE}\n\n</div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_roles`
--

CREATE TABLE `_roles` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_settings`
--

CREATE TABLE `_settings` (
  `setting_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'app',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_settings`
--

INSERT INTO `_settings` (`setting_name`, `setting_value`, `type`, `deleted`) VALUES
('accepted_file_formats', 'jpg,jpeg,png,doc,xlsx,txt,pdf,zip', 'app', 0),
('allowed_ip_addresses', '', 'app', 0),
('app_title', 'RISE - Ultimate Project Manager and CRM', 'app', 0),
('client_can_access_store', '', 'app', 0),
('client_can_add_files', '', 'app', 0),
('client_can_add_project_files', '', 'app', 0),
('client_can_assign_tasks', '', 'app', 0),
('client_can_comment_on_files', '', 'app', 0),
('client_can_comment_on_tasks', '', 'app', 0),
('client_can_create_projects', '', 'app', 0),
('client_can_create_reminders', '', 'app', 0),
('client_can_create_tasks', '', 'app', 0),
('client_can_delete_own_files_in_project', '', 'app', 0),
('client_can_edit_projects', '', 'app', 0),
('client_can_edit_tasks', '', 'app', 0),
('client_can_view_activity', '', 'app', 0),
('client_can_view_files', '1', 'app', 0),
('client_can_view_gantt', '', 'app', 0),
('client_can_view_milestones', '', 'app', 0),
('client_can_view_overview', '', 'app', 0),
('client_can_view_project_files', '', 'app', 0),
('client_can_view_tasks', '', 'app', 0),
('client_message_own_contacts', '', 'app', 0),
('client_message_users', '', 'app', 0),
('conversion_rate', 'a:0:{}', 'app', 0),
('currency_position', 'left', 'app', 0),
('currency_symbol', '$', 'app', 0),
('date_format', 'Y-m-d', 'app', 0),
('decimal_separator', '.', 'app', 0),
('default_client_left_menu', 'a:9:{i:0;a:1:{s:4:\"name\";s:9:\"dashboard\";}i:1;a:1:{s:4:\"name\";s:6:\"events\";}i:2;a:1:{s:4:\"name\";s:16:\"invoice_payments\";}i:3;a:1:{s:4:\"name\";s:13:\"announcements\";}i:4;a:1:{s:4:\"name\";s:5:\"users\";}i:5;a:1:{s:4:\"name\";s:5:\"files\";}i:6;a:1:{s:4:\"name\";s:10:\"my_profile\";}i:7;a:1:{s:4:\"name\";s:14:\"knowledge_base\";}i:8;a:1:{s:4:\"name\";s:4:\"todo\";}}', 'app', 0),
('default_contract_template', '1', 'app', 0),
('default_currency', 'USD', 'app', 0),
('default_left_menu', 'a:10:{i:0;a:1:{s:4:\"name\";s:9:\"dashboard\";}i:1;a:1:{s:4:\"name\";s:6:\"events\";}i:2;a:1:{s:4:\"name\";s:7:\"clients\";}i:3;a:1:{s:4:\"name\";s:5:\"notes\";}i:4;a:1:{s:4:\"name\";s:8:\"messages\";}i:5;a:1:{s:4:\"name\";s:4:\"team\";}i:6;a:2:{s:4:\"name\";s:12:\"team_members\";s:11:\"is_sub_menu\";s:1:\"1\";}i:7;a:2:{s:4:\"name\";s:13:\"announcements\";s:11:\"is_sub_menu\";s:1:\"1\";}i:8;a:1:{s:4:\"name\";s:8:\"settings\";}i:9;a:1:{s:4:\"name\";s:4:\"todo\";}}', 'app', 0),
('default_proposal_template', '1', 'app', 0),
('default_theme_color', 'F2F2F2', 'app', 0),
('disable_access_favorite_project_option_for_clients', '1', 'app', 0),
('disable_client_login', '', 'app', 0),
('disable_client_signup', '1', 'app', 0),
('disable_dashboard_customization_by_clients', '1', 'app', 0),
('disable_editing_left_menu_by_clients', '1', 'app', 0),
('disable_topbar_menu_customization', '1', 'app', 0),
('disable_user_invitation_option_by_clients', '', 'app', 0),
('email_sent_from_address', 'edwin18g@gmail.com', 'app', 0),
('email_sent_from_name', 'edwin', 'app', 0),
('enable_rich_text_editor', '0', 'app', 0),
('favicon', 'a:1:{s:9:\"file_name\";s:30:\"_file65e3483972466-favicon.png\";}', 'app', 0),
('first_day_of_week', '0', 'app', 0),
('hidden_client_menus', '', 'app', 0),
('invoice_logo', 'default-invoice-logo.png', 'app', 0),
('item_purchase_code', 'd', 'app', 0),
('language', 'english', 'app', 0),
('module_announcement', '1', 'app', 0),
('module_attendance', '', 'app', 0),
('module_chat', '1', 'app', 0),
('module_contract', '', 'app', 0),
('module_estimate', '', 'app', 0),
('module_estimate_request', '', 'app', 0),
('module_event', '1', 'app', 0),
('module_expense', '', 'app', 0),
('module_gantt', '', 'app', 0),
('module_help', '1', 'app', 0),
('module_invoice', '', 'app', 0),
('module_knowledge_base', '', 'app', 0),
('module_lead', '', 'app', 0),
('module_leave', '', 'app', 0),
('module_message', '1', 'app', 0),
('module_note', '1', 'app', 0),
('module_order', '', 'app', 0),
('module_project_timesheet', '', 'app', 0),
('module_proposal', '', 'app', 0),
('module_reminder', '1', 'app', 0),
('module_ticket', '', 'app', 0),
('module_timeline', '1', 'app', 0),
('module_todo', '1', 'app', 0),
('no_of_decimals', '2', 'app', 0),
('rows_per_page', '10', 'app', 0),
('rtl', '0', 'app', 0),
('scrollbar', 'jquery', 'app', 0),
('show_background_image_in_signin_page', 'no', 'app', 0),
('show_logo_in_signin_page', 'no', 'app', 0),
('show_theme_color_changer', 'yes', 'app', 0),
('signin_page_background', 'sigin-background-image.jpg', 'app', 0),
('site_logo', 'a:1:{s:9:\"file_name\";s:32:\"_file65e34809bfeb4-site-logo.png\";}', 'app', 0),
('task_point_range', '5', 'app', 0),
('time_format', 'small', 'app', 0),
('timezone', 'UTC', 'app', 0),
('user_1_dashboard', '', 'user', 0),
('verify_email_before_client_signup', '', 'app', 0),
('weekends', '', 'app', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_social_links`
--

CREATE TABLE `_social_links` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `facebook` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `twitter` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `linkedin` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `googleplus` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `digg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `youtube` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pinterest` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `instagram` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `github` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `tumblr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `vine` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `whatsapp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_stripe_ipn`
--

CREATE TABLE `_stripe_ipn` (
  `id` int NOT NULL,
  `payment_intent` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `verification_code` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_verification_code` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_id` int NOT NULL,
  `contact_user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_tasks`
--

CREATE TABLE `_tasks` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `project_id` int NOT NULL,
  `milestone_id` int NOT NULL DEFAULT '0',
  `assigned_to` int NOT NULL,
  `deadline` date DEFAULT NULL,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `points` tinyint NOT NULL DEFAULT '1',
  `status` enum('to_do','in_progress','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'to_do',
  `status_id` int NOT NULL,
  `priority_id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `collaborators` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `recurring` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `recurring_task_id` int NOT NULL DEFAULT '0',
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `created_date` date NOT NULL,
  `blocking` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `blocked_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_task_id` int NOT NULL,
  `next_recurring_date` date DEFAULT NULL,
  `reminder_date` date NOT NULL,
  `ticket_id` int NOT NULL,
  `status_changed_at` datetime DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_task_priority`
--

CREATE TABLE `_task_priority` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_task_priority`
--

INSERT INTO `_task_priority` (`id`, `title`, `icon`, `color`, `deleted`) VALUES
(1, 'Minor', 'arrow-down', '#aab7b7', 0),
(2, 'Major', 'arrow-up', '#e18a00', 0),
(3, 'Critical ', 'alert-circle', '#ad159e', 0),
(4, 'Blocker ', 'alert-octagon', '#e74c3c', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_task_status`
--

CREATE TABLE `_task_status` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `key_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `hide_from_kanban` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_task_status`
--

INSERT INTO `_task_status` (`id`, `title`, `key_name`, `color`, `sort`, `hide_from_kanban`, `deleted`) VALUES
(1, 'To Do', 'to_do', '#F9A52D', 0, 0, 0),
(2, 'In progress', 'in_progress', '#1672B9', 1, 0, 0),
(3, 'Done', 'done', '#00B393', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_taxes`
--

CREATE TABLE `_taxes` (
  `id` int NOT NULL,
  `title` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_taxes`
--

INSERT INTO `_taxes` (`id`, `title`, `percentage`, `deleted`) VALUES
(1, 'Tax (10%)', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_team`
--

CREATE TABLE `_team` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `members` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_team_member_job_info`
--

CREATE TABLE `_team_member_job_info` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_of_hire` date DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `salary` double NOT NULL DEFAULT '0',
  `salary_term` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_tickets`
--

CREATE TABLE `_tickets` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `ticket_type_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `requested_by` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `status` enum('new','client_replied','open','closed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime DEFAULT NULL,
  `assigned_to` int NOT NULL DEFAULT '0',
  `creator_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `creator_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `task_id` int NOT NULL,
  `closed_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_ticket_comments`
--

CREATE TABLE `_ticket_comments` (
  `id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ticket_id` int NOT NULL,
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_note` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_ticket_templates`
--

CREATE TABLE `_ticket_templates` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ticket_type_id` int NOT NULL,
  `private` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_ticket_types`
--

CREATE TABLE `_ticket_types` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_ticket_types`
--

INSERT INTO `_ticket_types` (`id`, `title`, `deleted`) VALUES
(1, 'General Support', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_to_do`
--

CREATE TABLE `_to_do` (
  `id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('to_do','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'to_do',
  `start_date` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_to_do`
--

INSERT INTO `_to_do` (`id`, `created_by`, `created_at`, `title`, `description`, `labels`, `status`, `start_date`, `deleted`) VALUES
(1, 1, '2024-03-02 15:46:12', 'asdfasdf', '', '', 'to_do', NULL, 0),
(2, 1, '2024-03-02 15:46:16', 'asdfsdaf', '', '', 'to_do', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_users`
--

CREATE TABLE `_users` (
  `id` int NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_type` enum('staff','client','lead') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime DEFAULT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `notification_checked_at` datetime DEFAULT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `job_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT '0',
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `alternative_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sticky_note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `skype` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT '1',
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `last_online` datetime DEFAULT NULL,
  `requested_account_removal` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_users`
--

INSERT INTO `_users` (`id`, `first_name`, `last_name`, `user_type`, `is_admin`, `role_id`, `email`, `password`, `image`, `status`, `message_checked_at`, `client_id`, `notification_checked_at`, `is_primary_contact`, `job_title`, `disable_login`, `note`, `address`, `alternative_address`, `phone`, `alternative_phone`, `dob`, `ssn`, `gender`, `sticky_note`, `skype`, `language`, `enable_web_notification`, `enable_email_notification`, `created_at`, `last_online`, `requested_account_removal`, `deleted`) VALUES
(1, 'edwin', 'baske', 'staff', 1, 0, 'edwin18g@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'a:1:{s:9:\"file_name\";s:29:\"_file65e348badf188-avatar.png\";}', 'active', '2024-03-02 15:45:47', 0, '2024-03-02 15:45:45', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, NULL, '', 1, 1, '2024-03-02 13:49:21', '2024-03-02 18:34:25', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_verification`
--

CREATE TABLE `_verification` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('invoice_payment','reset_password','verify_email','invitation') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `_activity_logs`
--
ALTER TABLE `_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_announcements`
--
ALTER TABLE `_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `_article_helpful_status`
--
ALTER TABLE `_article_helpful_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_attendance`
--
ALTER TABLE `_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `checked_by` (`checked_by`);

--
-- Indexes for table `_checklist_groups`
--
ALTER TABLE `_checklist_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_checklist_items`
--
ALTER TABLE `_checklist_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_checklist_template`
--
ALTER TABLE `_checklist_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_ci_sessions`
--
ALTER TABLE `_ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `_clients`
--
ALTER TABLE `_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_client_groups`
--
ALTER TABLE `_client_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_company`
--
ALTER TABLE `_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_contracts`
--
ALTER TABLE `_contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_contract_items`
--
ALTER TABLE `_contract_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_contract_templates`
--
ALTER TABLE `_contract_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_custom_fields`
--
ALTER TABLE `_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_custom_field_values`
--
ALTER TABLE `_custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_to_type` (`related_to_type`),
  ADD KEY `related_to_id` (`related_to_id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

--
-- Indexes for table `_custom_widgets`
--
ALTER TABLE `_custom_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_dashboards`
--
ALTER TABLE `_dashboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_email_templates`
--
ALTER TABLE `_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_estimates`
--
ALTER TABLE `_estimates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_estimate_comments`
--
ALTER TABLE `_estimate_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_estimate_forms`
--
ALTER TABLE `_estimate_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_estimate_items`
--
ALTER TABLE `_estimate_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_estimate_requests`
--
ALTER TABLE `_estimate_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_events`
--
ALTER TABLE `_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `_expenses`
--
ALTER TABLE `_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_expense_categories`
--
ALTER TABLE `_expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_file_category`
--
ALTER TABLE `_file_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_general_files`
--
ALTER TABLE `_general_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_help_articles`
--
ALTER TABLE `_help_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_help_categories`
--
ALTER TABLE `_help_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_invoices`
--
ALTER TABLE `_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_invoice_items`
--
ALTER TABLE `_invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_invoice_payments`
--
ALTER TABLE `_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `_items`
--
ALTER TABLE `_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_item_categories`
--
ALTER TABLE `_item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_labels`
--
ALTER TABLE `_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_leads`
--
ALTER TABLE `_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_lead_source`
--
ALTER TABLE `_lead_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_lead_status`
--
ALTER TABLE `_lead_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_leave_applications`
--
ALTER TABLE `_leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `user_id` (`applicant_id`),
  ADD KEY `checked_by` (`checked_by`);

--
-- Indexes for table `_leave_types`
--
ALTER TABLE `_leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_likes`
--
ALTER TABLE `_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_messages`
--
ALTER TABLE `_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_from` (`from_user_id`),
  ADD KEY `message_to` (`to_user_id`);

--
-- Indexes for table `_milestones`
--
ALTER TABLE `_milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_notes`
--
ALTER TABLE `_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_notifications`
--
ALTER TABLE `_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `_notification_settings`
--
ALTER TABLE `_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `_orders`
--
ALTER TABLE `_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_order_items`
--
ALTER TABLE `_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_order_status`
--
ALTER TABLE `_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_pages`
--
ALTER TABLE `_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_payment_methods`
--
ALTER TABLE `_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_paypal_ipn`
--
ALTER TABLE `_paypal_ipn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_pin_comments`
--
ALTER TABLE `_pin_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_posts`
--
ALTER TABLE `_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_projects`
--
ALTER TABLE `_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_project_comments`
--
ALTER TABLE `_project_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_project_files`
--
ALTER TABLE `_project_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_project_members`
--
ALTER TABLE `_project_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_project_settings`
--
ALTER TABLE `_project_settings`
  ADD UNIQUE KEY `unique_index` (`project_id`,`setting_name`);

--
-- Indexes for table `_project_time`
--
ALTER TABLE `_project_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_proposals`
--
ALTER TABLE `_proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_proposal_items`
--
ALTER TABLE `_proposal_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_proposal_templates`
--
ALTER TABLE `_proposal_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_roles`
--
ALTER TABLE `_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_settings`
--
ALTER TABLE `_settings`
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Indexes for table `_social_links`
--
ALTER TABLE `_social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_stripe_ipn`
--
ALTER TABLE `_stripe_ipn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_tasks`
--
ALTER TABLE `_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_task_priority`
--
ALTER TABLE `_task_priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_task_status`
--
ALTER TABLE `_task_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_taxes`
--
ALTER TABLE `_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_team`
--
ALTER TABLE `_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_team_member_job_info`
--
ALTER TABLE `_team_member_job_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `_tickets`
--
ALTER TABLE `_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_ticket_comments`
--
ALTER TABLE `_ticket_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_ticket_templates`
--
ALTER TABLE `_ticket_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_ticket_types`
--
ALTER TABLE `_ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_to_do`
--
ALTER TABLE `_to_do`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_users`
--
ALTER TABLE `_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type` (`user_type`),
  ADD KEY `email` (`email`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `_verification`
--
ALTER TABLE `_verification`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `_activity_logs`
--
ALTER TABLE `_activity_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_announcements`
--
ALTER TABLE `_announcements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `_article_helpful_status`
--
ALTER TABLE `_article_helpful_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_attendance`
--
ALTER TABLE `_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_checklist_groups`
--
ALTER TABLE `_checklist_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_checklist_items`
--
ALTER TABLE `_checklist_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_checklist_template`
--
ALTER TABLE `_checklist_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_clients`
--
ALTER TABLE `_clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_client_groups`
--
ALTER TABLE `_client_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_company`
--
ALTER TABLE `_company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_contracts`
--
ALTER TABLE `_contracts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_contract_items`
--
ALTER TABLE `_contract_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_contract_templates`
--
ALTER TABLE `_contract_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_custom_fields`
--
ALTER TABLE `_custom_fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_custom_field_values`
--
ALTER TABLE `_custom_field_values`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_custom_widgets`
--
ALTER TABLE `_custom_widgets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_dashboards`
--
ALTER TABLE `_dashboards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_email_templates`
--
ALTER TABLE `_email_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `_estimates`
--
ALTER TABLE `_estimates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_estimate_comments`
--
ALTER TABLE `_estimate_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_estimate_forms`
--
ALTER TABLE `_estimate_forms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_estimate_items`
--
ALTER TABLE `_estimate_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_estimate_requests`
--
ALTER TABLE `_estimate_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_events`
--
ALTER TABLE `_events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_expenses`
--
ALTER TABLE `_expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_expense_categories`
--
ALTER TABLE `_expense_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_file_category`
--
ALTER TABLE `_file_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_general_files`
--
ALTER TABLE `_general_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_help_articles`
--
ALTER TABLE `_help_articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_help_categories`
--
ALTER TABLE `_help_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_invoices`
--
ALTER TABLE `_invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_invoice_items`
--
ALTER TABLE `_invoice_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_invoice_payments`
--
ALTER TABLE `_invoice_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_items`
--
ALTER TABLE `_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_item_categories`
--
ALTER TABLE `_item_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_labels`
--
ALTER TABLE `_labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_leads`
--
ALTER TABLE `_leads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_lead_source`
--
ALTER TABLE `_lead_source`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `_lead_status`
--
ALTER TABLE `_lead_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `_leave_applications`
--
ALTER TABLE `_leave_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_leave_types`
--
ALTER TABLE `_leave_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_likes`
--
ALTER TABLE `_likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_messages`
--
ALTER TABLE `_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_milestones`
--
ALTER TABLE `_milestones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_notes`
--
ALTER TABLE `_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_notifications`
--
ALTER TABLE `_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_notification_settings`
--
ALTER TABLE `_notification_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `_orders`
--
ALTER TABLE `_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_order_items`
--
ALTER TABLE `_order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_order_status`
--
ALTER TABLE `_order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `_pages`
--
ALTER TABLE `_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_payment_methods`
--
ALTER TABLE `_payment_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `_paypal_ipn`
--
ALTER TABLE `_paypal_ipn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_pin_comments`
--
ALTER TABLE `_pin_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_posts`
--
ALTER TABLE `_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_projects`
--
ALTER TABLE `_projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_project_comments`
--
ALTER TABLE `_project_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_project_files`
--
ALTER TABLE `_project_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_project_members`
--
ALTER TABLE `_project_members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_project_time`
--
ALTER TABLE `_project_time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_proposals`
--
ALTER TABLE `_proposals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_proposal_items`
--
ALTER TABLE `_proposal_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_proposal_templates`
--
ALTER TABLE `_proposal_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_roles`
--
ALTER TABLE `_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_stripe_ipn`
--
ALTER TABLE `_stripe_ipn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_tasks`
--
ALTER TABLE `_tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_task_priority`
--
ALTER TABLE `_task_priority`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `_task_status`
--
ALTER TABLE `_task_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `_taxes`
--
ALTER TABLE `_taxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_team`
--
ALTER TABLE `_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_team_member_job_info`
--
ALTER TABLE `_team_member_job_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_tickets`
--
ALTER TABLE `_tickets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_ticket_comments`
--
ALTER TABLE `_ticket_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_ticket_templates`
--
ALTER TABLE `_ticket_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_ticket_types`
--
ALTER TABLE `_ticket_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_to_do`
--
ALTER TABLE `_to_do`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `_users`
--
ALTER TABLE `_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_verification`
--
ALTER TABLE `_verification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
