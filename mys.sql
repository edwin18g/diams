-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 04, 2024 at 01:38 PM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edwinpok_kuzhithuraidiocese`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_levels`
--

CREATE TABLE `account_levels` (
  `id` int(11) NOT NULL,
  `al_name` varchar(150) NOT NULL,
  `al_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_levels`
--

INSERT INTO `account_levels` (`id`, `al_name`, `al_id`) VALUES
(1, 'super admin', 1),
(2, 'priest', 0),
(3, 'parish', 2);

-- --------------------------------------------------------

--
-- Table structure for table `administration`
--

CREATE TABLE `administration` (
  `id` int(11) NOT NULL,
  `a_user_id` int(11) NOT NULL,
  `a_type` int(11) NOT NULL,
  `a_role` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administration`
--

INSERT INTO `administration` (`id`, `a_user_id`, `a_type`, `a_role`) VALUES
(2, 175, 2, 'Contact Person (Former Vicar General)'),
(3, 175, 3, 'Vicar General'),
(11, 185, 2, 'Financial Administrator'),
(10, 196, 2, 'Diocesan Secretary'),
(12, 222, 2, 'Asst. Financial Administrator'),
(14, 211, 2, 'Secretary to the Bishop'),
(29, 174, 3, 'Nominated '),
(16, 205, 3, 'Vicar Forane'),
(17, 196, 3, 'Diocesan Secretary'),
(18, 225, 3, 'Vicar Forane - Mathiravilai Vicariate'),
(19, 248, 3, 'Vicar Forane'),
(20, 185, 3, 'Financial Administrator'),
(21, 246, 3, 'Vicar Forane'),
(22, 171, 3, 'Priest Personal Board'),
(30, 208, 3, 'Director of Pastoral Commissions'),
(24, 193, 3, 'Vicar Forane'),
(27, 217, 3, 'Vicar Forane, Muzhagu moodu Vicariate'),
(31, 356, 1, 'Apostolic Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `circular`
--

CREATE TABLE `circular` (
  `id` int(11) NOT NULL,
  `c_title` varchar(100) NOT NULL,
  `c_filename` varchar(100) NOT NULL,
  `c_file_path` varchar(100) NOT NULL,
  `c_slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `circular`
--

INSERT INTO `circular` (`id`, `c_title`, `c_filename`, `c_file_path`, `c_slug`) VALUES
(15, 'Bible Sunday September 29-2019', '3dd06bd522a164252b9cfe421771148a.pdf', 'http://kuzhithuraidiocese.com/uploads/circular/3dd06bd522a164252b9cfe421771148a.pdf', 'Bible_Sunday_September_29-2019');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `comments` text NOT NULL,
  `anonymous` int(11) NOT NULL,
  `type` int(1) NOT NULL COMMENT '0 = updates, 1 = posts, 2 = snapshots, 3 = openletters',
  `commentType` varchar(22) NOT NULL,
  `timestamp` varchar(22) NOT NULL,
  `amount` int(11) NOT NULL,
  `is_viewed` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `itemID`, `userID`, `comments`, `anonymous`, `type`, `commentType`, `timestamp`, `amount`, `is_viewed`) VALUES
(0, 1, 1, 'Test', 0, 0, '0', '1545140777', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `c_img` varchar(100) DEFAULT 'placeholder.jpg',
  `c_name` varchar(100) DEFAULT NULL,
  `members` text,
  `website` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `sgroups` varchar(300) DEFAULT NULL,
  `c_email` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `slug` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `access_user` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `c_img`, `c_name`, `members`, `website`, `address`, `telephone`, `sgroups`, `c_email`, `type`, `slug`, `access_user`) VALUES
(1, '2b8b2dfeacd9ca74d7d8ff9439e1d0dc.jpeg', 'Thenaruvi', NULL, 'thenaruvi.com', 'test', '97478884', NULL, 'productdemo.user+user@gmail.com', NULL, 'thenaruvi', '268'),
(5, 'placeholder.jpg', 'Youth Commission', NULL, NULL, 'test', '1234567896', NULL, NULL, NULL, 'youth-commission', '268'),
(6, 'placeholder.jpg', 'Family Commission', NULL, NULL, 'sadfasdf', 'asdfasfsa', NULL, NULL, NULL, 'family-commision', '268'),
(9, 'b075e8ac98564e80e9f01b054d57fee1.jpg', 'thedal', NULL, NULL, 'dsd', '3', NULL, NULL, NULL, 'thedal', '321');

-- --------------------------------------------------------

--
-- Table structure for table `commission_customfield`
--

CREATE TABLE `commission_customfield` (
  `cc_id` int(11) NOT NULL,
  `cc_field_name` varchar(250) NOT NULL,
  `cc_field_value` varchar(250) NOT NULL,
  `cc_commission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `messages` text NOT NULL,
  `timestamp` varchar(22) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '0 = unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `full_name`, `email`, `phone`, `subject`, `messages`, `timestamp`, `status`) VALUES
(0, 'Sabarimuthu', 'sabarimuthu.vyakappan@gmail.com', '9486214851', 'Pritecting the vellicode church', 'From\r\nV. Sabarimuthu\r\n26-3 Thattankonam, Vellicode, Mulagumoodu P.O. PIN:629167\r\nTo\r\nRt. Rev. Jerome Dhas Varuvel\r\nBishop of Kuzhithurai, Unnamalai Kadai\r\nYour Excellency\r\nSub: Preventing the demolition of the Vellicode Church-reg\r\nThere is a 3200 sq ft stone church at Vellicode.  As no stone church of this kind is going to be erected in future, it is the duty of everyone to protect it.\r\nBut it is to be dismantled and the foundation stone for a new church is to be blessed on 28 April 2019.\r\nMy father – Mr. T. Vyakappan- was the contractor for the above church and he was not paid fully as agreed by the members of the Vellicode Parish. After his death, we -his children- did not claim the money.\r\nTherefore, anyone can use the church but no one has any moral right to pull down it or tamper it.\r\nIf the above view is accepted as a correct one, Your Excellency need not bless the foundation for any new church in the same place.\r\nAs I am now in the USA, I email this letter. A copy of this letter is to be sent by post by my wife from India.\r\nVellicode                                                 Obediently\r\n19-4-2019                                             V. Sabarimuthu', '1555601587', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diocesepriest`
--

CREATE TABLE `diocesepriest` (
  `id` int(11) NOT NULL,
  `priestid` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `pfname` varchar(100) DEFAULT NULL,
  `pmnane` varchar(100) DEFAULT NULL,
  `pdob` varchar(20) DEFAULT NULL,
  `pplace` varchar(75) DEFAULT NULL,
  `pseminary` varchar(150) DEFAULT NULL,
  `porddate` varchar(30) DEFAULT NULL,
  `pordplace` varchar(100) DEFAULT NULL,
  `pordby` varchar(100) DEFAULT NULL,
  `pminstring` varchar(100) DEFAULT NULL,
  `paddress` varchar(200) DEFAULT NULL,
  `pphone` varchar(30) DEFAULT NULL,
  `pmobile` varchar(30) DEFAULT NULL,
  `pemail` varchar(60) DEFAULT NULL,
  `pimg` varchar(50) DEFAULT NULL,
  `pdiocese` varchar(30) DEFAULT NULL,
  `nadd1` varchar(50) DEFAULT NULL,
  `nadd2` varchar(50) DEFAULT NULL,
  `nadd3` varchar(50) DEFAULT NULL,
  `bloodg` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diocesepriest`
--

INSERT INTO `diocesepriest` (`id`, `priestid`, `pname`, `pfname`, `pmnane`, `pdob`, `pplace`, `pseminary`, `porddate`, `pordplace`, `pordby`, `pminstring`, `paddress`, `pphone`, `pmobile`, `pemail`, `pimg`, `pdiocese`, `nadd1`, `nadd2`, `nadd3`, `bloodg`) VALUES
(367, 1001, 'Fr. Mathias. M', 'Mr. Maria Michael', 'Mrs. Annammal', '13.06.1931', 'Mathiravilai', '', '28.03.1960', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J.', 'Retired', '                14/23rd Main Road<div></div><div>Srinivasa Nagar</div><div>Trichy 620 017</div>', '0431-2782798', '9443466617', '', '1001.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(368, 1002, 'Fr. Wenceslaus C.M. (Late)', 'Mr. Chinnayyan Michael', 'Mrs. Cecily', '27.05.1933', 'Thiruvithancode', 'St. Raphael\'s Seminary  Quilon,St. Paul\'s Seminary Trichy ', '24.03.1961', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Deceased', '                    South Gate,Near Government Mid. Sch.,Thiruvithancode P.O. 629 174', '', '9443579750', '', '1002.jpg', 'Diocese of Kuzhithurai', 'South Gate,', 'Near Government Mid. Sch.,', 'Thiruvithancode P.O. 629 174', 'A1+'),
(369, 1003, 'Fr. Mariadhas A.', 'Mr. Arockiam', 'Mrs. Annammal', '06.05.1937', 'Kuzhivilai', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy', '27.03.1963', 'St.Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J.', 'Spiritual Father, puliyoorkurichy', '            Martyr Devasahayampillai Shrine, Puliyoorkurichy, Thuckalay 629175', '', '8220695762', '', '1003.jpg', 'Diocese of Kuzhithurai', 'Kuzhivilai, Kunnathoor', 'Kapukadu PO - 629162', 'K.K. Dist., Tamil Nadu, INDIA', ''),
(370, 1004, 'Fr. Jesudhasan Thomas', 'E.Thomas', 'Annammal', '28.03.1935', 'Arockiapuram', 'St.Aloysius Pune, St.Gorgan Germany', '25.07.1963', 'Eschweiler Germany', 'Bishop John Pohlschmener', 'Spiritual Director, St. Aloysius Minor seminary', '        Spiritual Director, St. Aloysius Minor seminary, PB No:17, Asaripallam Road, Nagercoil - 629001', '', '9442076656', 'jesudason@gmx.de', '1004.jpg', 'Diocese of Kuzhithurai', 'Arockiapuram, K.K. District ', 'Tamil Nadu', 'INDIA', 'B+'),
(372, 1006, 'Fr. Robert V', 'Mr. Varuvel Antony', 'Mrs. Maria Raja Retinam', '10.02.1945', 'Mela Ramanputhoor', 'St. Aloysius Seminary, Nagercoil,  St. Joseph\'s Seminary, Alwaye', '20.12.1968', 'St. Francis Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J', 'Parish priest, Kappiarai', '    <span lang=\"EN-IN\" style=\"line-height: 115%; font-family: Arial, sans-serif;\"><font size=\"3\">&nbsp;Parish Priest, Church of St. Catherine, Kappiarai</font></span>', '', '9487411988', 'robertvaruvel@gmail.com', '1006.jpg', 'Diocese of Kuzhithurai', 'Holy Family Street, Mela Ramanputhoor', 'Nagercoil - 600002', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(373, 1007, 'Fr. Joseph Raj A.', 'Mr. Albert', 'Mrs. Pragasi', '16.06.1943', 'Madathattuvilai', 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary, Poonamallee ', '19.12.1969', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Kanjiracode', '      <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span lang=\"EN-IN\" style=\"font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif;\">Church\r\nof O.L. of Rosary, Kan', '', '9443940064', '', '1007.jpg', 'Diocese of Kuzhithurai', 'Madathattuvilai, Convent Road', 'Villukury PO', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(374, 1008, 'Fr. Mariadhasan. S', 'Mr. Savarimuthu', 'Mrs. Gnanapooammal', '01.06.1943', 'Chithenthope', 'St. Paul\'s Seminary, Trichy ', '19.12.1969', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Co- Pastor, Pannavilai', '    <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">Church\r\nof the Holy Redeemer of the World, Pannavilai</span></p>', '', '9487108765', '', '1008.jpg', 'Diocese of Kuzhithurai', 'Joy Home, Chithenthopu', 'Kandanvilai PO - 629810', 'K.K. Dist., Tamil Nadu, INDIA', ''),
(375, 1009, 'Fr. Hilary A.M.', 'Antony Muthu', 'Mariaanthony', '29.01.1946', 'Mylacode', 'St.Joseph\'s ', '21.12.1970', 'Kottar', 'Bishop Agnisamy', 'Vicar Forane, Vicariate of Mulagumoodu', '    <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">St.\r\nMichaelâ€™s Shrine, Puliyurkurichi</span></p>', '9443180972', '9488911972', 'hilaryam2015@gmail.com, muthu416@yahoo.com', '1009.jpg', 'Diocese of Kuzhithurai', 'Mylacode, Alencode PO, Neyoor ', '629802', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(376, 1010, 'Fr. Chellaiyan P.K. ', 'Mr. Kumaravel', 'Mrs. Kochukali', '22.05.1942', 'Nallayanpuram', 'St. Paul\'s Seminary, Trichy', '21.12.1971', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Retired ', '    ', '', '9442304254', '', '1010.jpg', 'Diocese of Kuzhithurai', ' Bishop\'s House, P.B.No: 1', 'Unnamalaikadai 629179', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(377, 1011, 'Fr. Wilfred Felix A.', '', '', '21.02.1948', 'Puthenkadai', '', '18.03.1972', '', '', '', '          Asian Centre for Cross Cultural Studies,40/6A Panayur Kuppam Road,Panayur, Sholinganallur P.O.,Chennai 600 119', '044 24530206,24530682', '9444034665', 'felixwilfred@gmail.com', '1011.jpg', 'Diocese of Kuzhithurai', '40/6A, Panayur Kuppam Road', 'Sholinganallur Post, Panayur', 'Chennai - 600 119, Tamilnadu', ''),
(378, 1012, 'Fr. Innocent J.', 'Mr. S.Jones', 'Mrs. Ronickam', '02.05.1946', 'Karungal ', 'St. Aloysius Seminary, Nagercoil,St. Joseph\'s Pont.Seminary, Alwaye', '21.12.1972', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish priest, Kaliakkavilai', '    <span lang=\"EN-IN\" style=\"font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif; color: black;\">Parish Priest,<b>&nbsp;</b>Church of St. Antony, Kaliakkavilai</span>', '9443791058', '7708755017', 'innocent020546@gmail.com', '1012.jpg', 'Diocese of Kuzhithurai', 'Ayanivilai, Karungal PO ', '629157', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(379, 1013, 'Fr. Peter M.', 'Mr. Mariakkan', 'Mrs. Gnanasoundari', '31.07.1950', 'Chithenthopue Kandanvilai', 'St. Aloysius Seminary, Nagercoil ,St. Joseph\'s Seminary, Alwaye ', '22.12.1974', 'St. Xavier\'s Cathedral, Kottar', 'Archbishop M. Arockiaswamy', 'Parish priest, Thundathuvilai', '              Parish Priest ,Church of St. Antony of Padua,Thundathuvilai,Karungal 629 157', '9443993582', '9965590625', 'avcpeter@yahoo.com', '1013.jpg', 'Diocese of Kuzhithurai', 'Chithenthopue, Kandanvilai PO', '629810', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(380, 1014, 'Fr. Jesu Marian A.', 'Mr. Arockiam', 'Mrs. Mariammal', '28.05.1946', 'Arockiapuram', 'St. Aloysius Seminary, Nagercoil,Sacred Heart Seminary, Ponnamallee ', '04.02.1975', 'St. Francis Xavier\'s Church Manguzhy', 'Archbishop M. Arockiaswamy', 'Sacred Heart Seminary', '                <p>Sacred Heart Seminary</p><p>Karayanchavadi</p><p>Poonamalle</p><p>Chennai</p>', '', '9442525044', 'jesumarian@gmail.com', '1014.jpg', 'Diocese of Kuzhithurai', 'Roch Campus, Arockiapuram', 'Neyoor PO - 629 802', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(381, 1015, 'Fr. Antony R. ', 'Mr. Rajendran', 'Mrs. Arockiam', '25.06.1944', 'Palliady', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy, St. Paul\'s Seminary, Trichy ', '12.05.1975', 'Palliadi', 'Archbishop Arockiaswami M.', 'Confessor', '                    Church of O.L. of Nativity, Mulagumoodu 629 167', '', '9488425144', '', '1015.jpg', 'Diocese of Kuzhithurai', 'No. 25/93, Kakkanadu', 'Palliady - 629169', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(382, 1016, 'Fr. Arul Devadhason M. ', 'Mr. S. Maria Arockiam', 'Mrs. Maria Kavalal', '06.05.1948', 'Punnai Nagar', 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary Poonamallee, Regency Viyasarpady, Chennai, P.U.C. Karumathoor, Madurai', '14.04.1977', 'Carmel High School, Ramanputhoor', 'Archbishop. Arockiaswami M.', 'Shrine of St. Antony,Vettuvenni', '                Shrine of St. Antony,Vettuvenni, Kuzhithurai 629 163', '', '9443129153', 'fr_addhason@rediffmail.com', '1016.jpg', 'Diocese of Kuzhithurai', 'Punnai Nager,', ' Nagercoil - 629004', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(383, 1017, 'Fr. Jesu Retnam S.', 'Mr. Stanislaus', 'Mrs. Maria Packiam', '01.01.1950', 'Mankuzhy', 'St. Paul\'s Seminary, Trichy', '17.04.1977', 'Mankuzhy', 'Archbishop M. Arockiaswamy', 'Vicar General', '        <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\">Parish Priest, Church of St. Joseph, Manchady, Kattathurai- 629158</p>', '', '9442788275', 'jco_ordinator@yahoo.co.in', '1017.jpg', 'Diocese of Kuzhithurai', 'Mankuzhy, Neyoor Post', '629802', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(384, 1018, 'Fr. Vargheese S', 'Mr. Savarimuthu', 'Mrs. Theresammal', '27.03.1948', 'Thickurichy', 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary Poonamallee', '02.05.1978', 'Thickurichy', 'Archbishop M. Arockiaswamy', 'Parish Priest, Kamplar', '  Church of St.Joseph, Kamplar, Tholaiyavattam - 629159', '04651 269077', '9486248535', '', '1018.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(385, 1019, 'Fr. Vincent Raj S.', 'Mr. Savarimuthu', 'Mrs. Rajammal', '24.06.1953', 'Kalkurichy', 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary  Poonamallee  ', '03.10.1979', 'Kalkurichy', 'Archbishop M. Arockiaswamy', 'Vicar Forane, Vicariate of Mathiravilai', '  &nbsp;Church of St.Michael the Archangel, Manalikuzhivilai&nbsp;<div><br></div>', '9486933818', '9443370360', 'frsvincentraj@gmail.com', '1019.jpg', 'Diocese of Kuzhithurai', 'Soosai Nagar, Kalkurichy', 'Thuckalay PO - 629 175', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(386, 1020, 'Fr. Maria Alphonse V.', 'Mr. V. Wenceslaus', 'Mrs. Agathammal', '17.12.1954', 'Vellicode', 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor, Theology  Papal Seminary, Pune, Philosophy Pune', '27.05.1980', 'Vellicode', 'Bishop Antonymuthu Bishop of Vellore', 'Vicar General', '        Bishop\'s House, P.B.No: 1,Unnamalaikadai 629179,K.K. Dist', '', '9486249262', 'vmalphonse@gmail.com', '1020.jpg', 'Diocese of Kuzhithurai', '4-19A, Vanianvilai, Vellicode', 'Mulagumoodu - 629167', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(387, 1021, 'Fr. Raphael V.', 'Mr. A. Varuvel', 'Mrs. Maria Sebastiaye', '22.02.1952', 'Appattuvilai', 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee Christ Hall, Karumathoor', '15.06.1981', 'Appattuvilai', 'Most Rev. M. Arockiaswamy', 'Formator, St. Paul\'s Seminary, Trichy', '          St. Paul\'s Seminary ,P.B.No.36,Trichy 620 001', '0431 2402500, 2402501', '9442383326', 'raphaelvbible@yahoo.co.in', '1021.jpg', 'Diocese of Kuzhithurai', 'Chemmanvilai, Appattuvilai', 'Thuckalay Post - 629175', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(388, 1022, 'Fr. Paschal S. Prosper', 'Mr. Singarayan', 'Mrs. Rosammal', '17.05.1952', 'Puthenkadai', 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor,St. Paul\'s Seminary, Trichy', '18.04.1982', 'Puthenkadai', 'Archbishop M. Arockiaswamy', '', '      Rua 7 De Setembro,No 348, Tabuleiro Do Martins,CEP 57.061 140 Maceio AL,Brazil.    ', '', '0055 8299814195', 'paschalprosper@yahoo.com.br', '1022.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(389, 1023, 'Fr. Xavier Bruce. R', 'P. Rajendran', 'A. Nesammal', '31.07.1957', 'Thalavaipuram', 'Papal Seminary, Pune', '27.10.1982', 'Carmel Nagar', 'Bishop M. Arokiasamy', 'Co - Pastor Munchirai', 'Church of O.L.of Good Health. Munchirai, Puthukadai - 629171', '', '9597055386', 'xavierbrucer@yahoo.com', '1023.jpg', 'Diocese of Kuzhithurai', '132, St. Mary\'s Street, Thalavaipuram', 'Nagercoil - 629004', 'K.K. Dist., Tamil Nadu, INDIA', 'B -'),
(390, 1024, 'Fr. Francis S.', '', '', '25.05.1956', 'Chemparuthivilai', '', '10.04.1983', '', '', 'USA', '      USA', '', '', '', '1024.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(391, 1025, 'Fr. George Ponnaiah', 'Mr. Swaminathan Ponnaiah', 'Mrs . Maria Chellammal', '06.12.1957', 'Moolachael', 'St. Aloysius Seminary, Nagercoil.  St. Peter\'s Seminary, Madurai.  Papal Seminary, Pune', '10.12.1983', 'Moolachel', 'Archishop M. Arockiaswamy', 'Parish Priest, Panavilai', '          Parish Priest, Church of the Holy Redeemer of the World, Panavilai.', '04651 256147', '9488282787', 'fr_ponnaiah@yahoo.com', '1025.jpg', 'Diocese of Kuzhithurai', 'Ponnaiah Veedu, Keezha Moolachel', 'Thuckalay Post - 629175', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(392, 1026, 'Fr. Mary John R.', 'Mr. Rayappan', 'Mrs. Savariai', '28.01.1957', 'Melpuram', 'St. Aloysius Seminary, Nagercoil, St. Peter\'s Seminary, Madurai,St. Paul\'s Seminary, Trichy ', '29.04.1984', 'Assisi Campus, Nagercoil', 'Bishop M. Arokiasamy', 'Parish Priest, Irudhayapuram', '        Parish Priest,Church of Sacred Heart of Jesus, Irudhayapuram, Kuzhicode - 629 167', '', '9443450709', 'rmaryjohn@yahoo.co.uk', '1026.jpg', 'Diocese of Kuzhithurai', 'Kadamacode, Melpuram', 'Pacode PO - 629 168', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(393, 1027, 'Fr. Augustine P. ', 'Mr. K. Ponnaian', 'Mrs. Annammal', '14.11.1958', 'Elavuvilai', 'St. Aloysius Seminary, Nagercoil, St. Paul\'s Seminary, Trichy', '14.04.1985', 'St. Xavier\'s Cathedral,Kottar', 'Bishop M. Arockiaswamy', 'Procurator of the Diocese', '          Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K. Dist, Tamilnadu. ', '', '9486249201', 'ponaugustine@gmail.com', '1027.jpg', 'Diocese of Kuzhithurai', 'Vettukattuvilai, ', 'Elavuilai - 629 171', 'K.K.Dist., Tamil Nadu, INDIA', 'A2B+'),
(394, 1028, 'Fr. Vincent S.', 'Mr. Joachim (Subakian)', ' Mrs. Rosammal', '11.08.1957 ', 'Vencode', 'St. Aloysius Seminary Nagercoil, St. Peter\'s Seminary Karumathoor, St. Paul\'s Seminary Trichy', '14.04.1985', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, VelliaVilai', '          Parish Priest,Church of Good Shepherd ,Velliavilai,Palapallam 629 159', '', '9444051816', '', '1028.jpg', 'Diocese of Kuzhithurai', 'Vencode, Vencode PO', 'Puthukadai - 629171', 'K.K.Dist., Tamil Nadu, INDIA', 'A+'),
(395, 1029, 'Fr. Antony M. Muthu', 'Mr. Maria Siluvai', 'Mrs. Maria Isidorial', '25.08.1958', 'Mavilai, Mukkalampaddu', 'St. Peter\'s Seminary, Madurai, Sacred Heart Seminary, Poonamallee, College Studies Christ Hall, Karumathoor', '06.04.1986', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, Melpalai', '        Church of Assumption of Our Lady, Melpalai 629 152', '', '9444688225', 'frmamuthu@yahoo.co.in', '1029.jpg', 'Diocese of Kuzhithurai', 'Mavilai, ', 'Kurunthencode PO 629805', 'K.K.Dist., Tamil Nadu, INDIA', 'B -'),
(396, 1030, 'Fr. Elphinston Joseph J.', 'Mr. K.S. John', ' Mrs. P. Rajammal', '23.03.1961', 'Kandanvilai', 'St. Aloysius Seminary Nagercoil,St. Peter\'s Seminary Madurai,Christ Hall Seminary Madurai,St. Paul\'s Seminary Trichy', '26.04.1987', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Italy ', '            Italy', '', '', 'elphinj@yahoo.com', '1030.jpg', 'Diocese of Kuzhithurai', 'Kandanvilai, Kandanvilai (P.O),', 'Neyyoor (Via), Pin-629810', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(397, 1031, 'Fr. Maria Arputham R.', 'Mr. M. Rayappan', 'Mrs. S. Mathavadial', '13.12.1955', 'Vencode', 'St. Peter\'s Seminary, Madurai.St. Paul\'s Seminary, Trichy', '26.04.1987', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, Alencholai', '        Parish Priest,Church of O.L. of Lourdes,Pilankalavilai (Alencholai), Kaliyal 629161', '', '9486942860', 'arpyroy@yahoo.com', '1031.jpg', 'Diocese of Kuzhithurai', 'Bishop\'s House, ', '', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(398, 1032, 'Fr. Maria Martin S.', 'Mr. V. Sinkarayan', 'Mrs. T. Maria Muthu', '29.03.1960', 'Sahayanagar', 'St. Aloysius Seminary, Nagercoil,St. Peter\'s Seminary, Madurai, St. Paul\'s Seminary, Trichy', '26.04.1987', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Secretary, Puthuvasantham', '        Secretary, Puthuvasantham, Near Block Office, Tholayavattam - 629157', '', '9442761150', 'singhmark@yahoo.com', '1032.jpg', 'Diocese of Kuzhithurai', 'Paduvoor, Kattuvilai, ', 'Palappallam PO 629159', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(399, 1033, 'Fr. Joseph Jeyaseelan S.', 'Mr. M. Stanislaus', 'Mrs. Palpeenammal', '21.11.1962', 'Karenkadu', 'St. Aloysius Seminary, Nagercoil,St. Peter\'s Seminary, Madurai,Christ Hall, Karumathur,St. Paul\'s Seminary,Trichy', '04.04.1988', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev, M.Arockiasamy', 'Kalaikaviri', '  Kalaikaviri College, 18-Benwells Road, Trichy-620001', '', '9443118725', 'frjeyaseelan@gmail.com, frjeyaseelan@yahoo.co.in', '1033.jpg', 'Diocese of Kuzhithurai', 'St. Aloysius Church, ', 'Karankadu - 629 809', 'K.K.Dist., Tamil Nadu, INDIA', 'A1+'),
(400, 1034, 'Fr. Maria William M.', 'Mr. M. Maria Soosai', 'Mrs. Mary Angel', '08.01.1962', 'Nullivilai', 'St. Aloysius Minor Seminary, Nagercoil, St. Peter\'s Madurai,Sacred Heart Seminary, Poonamallee', '29.05.1988', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Iruthayaraj,', 'Correspondant, St. Xavier\'s Catholic College of Engineering, Chunkankadai', '            Correspondant, St. Xavier\'s Catholic College of Engineering, Chunkankadai, Nagercoil - 629003', '', '9488881212', 'mahizh6218@yahoo.com', '1034.jpg', 'Diocese of Kuzhithurai', 'Nullivilai,', 'karankadu 629809', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(401, 1035, 'Fr. George K.', 'Mr. Kamalies', 'Mrs. Pragacy', '06.04.1964', 'Vencode', 'St. Aloysius Seminary, Nagercoil.Sacred Heart Seminary, Poonamallee', '22.04.1990', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Elanthavilai', '          Parish Priest,Church of  Holy Family, Elanthavilai, Meycode -629804', '', '9487643191', 'george28kamalies@gmail.com', '1035.jpg', 'Diocese of Kuzhithurai', 'Kamala Pragasa Bhavan, Kayalavilai Veedu', 'Vencode, Puthukadai PO - 629 171', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(402, 1036, 'Fr. Xavier Benedict. S', 'Mr. S. Sathianathan', 'Mrs. Ronickal', '12.03.1964', 'Vencode', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy', '22.04.1990', 'St. Xavier\'s Cathedral, Kottar', 'Rev. Leon A. Tharmaraj', 'St. Paul\'s Seminary', '  St. Paul\'s Seminary, P.B.No: 36, Trichy - 620001', '', '9442456818', 'sbenxavier@gmail.com', '1036.jpg', 'Diocese of Kuzhithurai', 'Aramvilagam Veedu, Vencode,', 'Puthukadai  - 629 171', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(403, 1037, 'Fr. Gaspar Raj M. ', 'Mr. Maria Paulian E.', 'Mrs. Maria Pushpam G.', '22.01.1966', 'Kanjampuram', 'St. Aloysius Seminary Nagercoil,Sacred Heart Seminary Poonamallee', '07.04.1991', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Thamizh Maiyam', '    Goodwill Communications Ltd., New No. 68, (Old No.150), Luz Church Road, Mylapore, Chennai 600 004', '044 24994344', '9444072217', '', '1037.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(404, 1038, 'Fr. Russel Raj B.', 'Mr. Bhakthinathan', 'Mrs. Rajammal', '01.12.1963', 'Cheriakolla', 'St. Aloysius Seminary, Nagercoil, St. Paul\'s Seminary, Trichy', '07.04.1991', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Chancellor, Judicial Vicar and Rector of Nattalam shrine', '              Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K.Dist, Tamilnadu. ', '', '9486516374', 'chancellor.kuzhithurai@gmail.com', '1038.jpg', 'Diocese of Kuzhithurai', 'Anbu Illam, Anbu Nagar', '48 B-5 Paramarthalingapuram, Vettoornimadam', 'Nagercoil - 629 003', 'B+'),
(405, 1039, 'Fr. Sebastian F.', 'Mr. A. Francis', 'Mrs. Mary John', '15.05.1966', 'Kulavilai, Konamcadu', 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee', '26.04.1992', ' St. Xavier\'s Cathedral, Kottar', ' Most Rev. Leon A.Tharmaraj', 'SIGARAM', '  Sigaram, Main Road, Mulagumoodu.&nbsp;', '', '9443450063', 'mail_seba@yahoo.com', '1039.jpg', 'Diocese of Kuzhithurai', '6-96A, Sigaram, Johnson Tower', 'Mulagumoodu - 629 167', 'K.K. Dist., Tamil Nadu, INDIA', 'A1B+'),
(406, 1040, 'Fr. Sekhar Michael', 'Mr. K. Savarimuthu', 'Mrs. S. Kamala Josephine', '14.11.1966', 'Thuckalay', 'St. Aloysius Seminary Nagercoil (1984 1986), Christ Hall Seminary  Karumathoor(1986 1987)', '26.04.1992', ' St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Appattuvilai', '              Parish Priest,Church of St. Antony, Appattuvilai , Thuckalay - 629175', '', '9487422061', 'sekharmichael@yahoo.com', '1040.jpg', 'Diocese of Kuzhithurai', 'Mukuntha Bhavan, Gandhi Nager', 'Thuckalay PO - 629 175', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(407, 1041, 'Fr. Maria Selvaraj S.', '', '', '13.05.1959', 'Mukkalampadu', '', '19.12.1992', '', '', '', '  ', '', '9443993323', '', '1041.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(408, 1042, 'Fr. Maria Susai P.', 'Mr. Ponnaiyan', 'Mrs. Dasammal', '18.05.1961', 'Melpalai', 'St. Aloysius Minor Seminary, Nagercoil(1978),St. Pauls Seminary, Trichy (1979 1982)', '15.04.1993', 'Jerusalam, Trichy', 'Most Rev. Thomas Fernando', 'Parish Priest, Kappu Kadu', '          Parish Priest,Church of Kallithattu St. Antony,Kappucadu,Kunnathoor 629 162', '', '9443208639', 'mariasusaimari@yahoo.co.in', '1042.jpg', 'Diocese of Kuzhithurai', 'Xavier Illam', 'Melpalai & Post - 629152', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(409, 1043, 'Fr. Dominic Kadatcha Dhas M. ', 'Mr. Moses Motcha Dhas', 'Mrs. Gnana Retna Bai', '10.04.1967', 'Thundathuvilai', 'Christ Hall Karumathoor,St. Paul\'s Seminary Trichy', '18.04.1993', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Mulagumoodu', '            Church of O.L. of Nativity, Mulagumoodu 629 167 ', '', '9442383119', 'dominickdhas@yahoo.com', '1043.jpg', 'Diocese of Kuzhithurai', '92/1, Thundathuvilai', 'Karungal Post - 629 157', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(410, 1044, 'Fr. John Michel Raj M.', 'Mr. M.A. Malayappan', 'Mrs. Swarnam', '11.10.1967', 'Mulavilai', 'St. Aloysius Seminary, Nagercoil 1984 1985,Philosophy Christ Hall, Madurai 1985 1988,Theology St. Paul\'s, Trichy 1989 1993', '18.04.1993', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Cherukol, Director KIDSS', '        Parish Priest, Church of  St. Antony,Cherukol,Karumputhottam, Kattathurai 629 158', '', '9443129831', 'michael_raj2000@yahoo.com', '1044.jpg', 'Diocese of Kuzhithurai', 'Mulavilai, Pottavilai, ', 'Veeyanoor P.O. -629 177', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(411, 1045, 'Fr. Steephen C.', 'Mr. Chellan', 'Mrs. Therasammal', '04.04.1966', 'Kolvel', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Sacred Heart Seminary Poonamallee', '10.04.1994', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study', '  Anugraha, Friary, Nochiodaipatti, Dindigul - 624003', '', '9443134495', ' chellan.ste@gmail.com', '1045.jpg', 'Diocese of Kuzhithurai', '7/70, Kolvel, ', 'Thiruvarambu PO.  - 629 161', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(412, 1046, 'Fr. Benedict M.D. Anelin ', 'Mr. J. Maria Dhasan', 'Mrs. R. Leela', '21.04.1968', 'Thuckalay', 'St. Aloysius Seminary, Nagercoil, Arul Anandar College, Karumathor, Theology St. Paul\'s, Trichy', '23.04.1995', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Palliady', '  Parish Priest, Church of Sacred Heart of Jesus, Palliady - 629169', '', '9443416414', 'franelin@rediffmail.com', '1046.jpg', 'Diocese of Kuzhithurai', 'No. 10-59A, Amala Convent Street', 'Padmanapapuram, Thuckalay (P.O)', 'Kanyakumari District, Pin:629 175', 'O+'),
(413, 1047, 'Fr. Benjamin D. ', 'Mr. Davidson', 'Mrs. Ganapragasi', '02.02.1968', 'Cherikkadai', 'St. Aloysius Seminary, Nagercoil, Arulanandar College, Karumathoor, Theology St. Paul\'s Seminary, Trichy', '23.04.1995', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest ,Munchirai, Vicar Forane (Vencode)', '          Church of O.L. Good Health, Munchirai , Puthukkadai  629 171', '', '9443595872', 'benjaminkottar@yahoo.com', '1047.jpg', 'Diocese of Kuzhithurai', 'Chiravachanvilai, Near Cherikadai', 'Palliyady PO - 629169  ', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(414, 1048, 'Fr. David Michael M. ', 'Mr. Maria Michael V.', 'Mrs. Mary Archangel M.', '20.09.1967', 'Madathattuvilai', 'St. Aloysius Seminary Nagercoil,Philosophy Sacred Heart  Poonamallee,Theology Sacred Heart Poonamallee', '23.04.1995', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'USA', '  USA', '04651 273009', '9442312212', 'frdavidmichael@gmail.com', '1048.jpg', 'Diocese of Kuzhithurai', 'Annai Street', 'Madathattuvilai', 'Villukury (P.O)', 'B+'),
(415, 1049, 'Fr. Antony William F.', '', '', '08.02.1966', 'Mallanvilai', '', '14.04.1996', '', '', 'USA', '    Holy Family Church, 15, Gender Road, New York, DE 1973, USA', '', '', 'fantonywilliam@yahoo.co.in', '1049.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(416, 1050, 'Fr. Gelastin Gerald A. ', 'Mr. A. Antonypillai', 'Mrs. C. Annammal', '09.03.1968', 'Puthenkadai', 'St. Aloysius\' Seminary, Nagercoil  Philosophy Arulananthar  Karumathoor,Theology St. Paul\'s, Trichy', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Bishop\'s House Unnamalaikadai', '        Bishop\'s House, P.B.No: 1, Unnamalaikadai 629 179', '', '9442730307', 'aggerald@rediffmail.com', '1050.jpg', 'Diocese of Kuzhithurai', 'St. James Church, Puthenkadai', 'Thiruvattar PO-629177', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(417, 1051, 'Fr. Jayaprakash S.', 'Mr. Singarayan', 'Mrs. Nesammal', '20.02.1969', 'Thundathuvilai', 'St. Aloysius\' Minor Seminary, Nagercoil,Philosophy Christ Hall, Karumathoor,Theology St. Paul\'s Seminary, Trichy', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai', '            Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai, Nagercoil - 629003', '', '9443011181', '', '1051.jpg', 'Diocese of Kuzhithurai', 'Sundavilai', 'Karungal Post - 629157', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(418, 1052, 'Fr. Jose Robinson S.K.', 'Mr. S. Singarayan', 'Mrs. C. Kamalam', '10.09.1969', 'Thundathuvilai', 'St. Aloysius Seminary, Nagercoil,Philosophy Papal Seminary, Pune,Theology Papal Seminary, Pune', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Nanjil Career Academy ', '          Annai Ada Centre, Azhahiyamandapam', '', '9486377227', 'nanjilsrobin@gmail.com', '1052.jpg', 'Diocese of Kuzhithurai', 'Paloor', 'Karungal Post - 629157', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(419, 1053, 'Fr. Martin N.', 'Mr. Neelakandan Asari', 'Mrs. Monica (Kolammal)', '22.05.1967', 'Pacode', 'St. Aloysius, Nagercoil, Philosophy ChristHall,Karumathoor Theology  St. Paul\'s, Trichy', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Manali', '    parish Priest, Church of St. Antony of Padua, Manali, Thuckalay- 629175', '', '9442653803', 'martinkottar@gmail.com', '1053.jpg', 'Diocese of Kuzhithurai', 'Mullu Vilai House, North Street', 'Marthandam - 629165', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(420, 1054, 'Fr. Callistus M. ', 'Mr. Maria Sebastian A.', 'Mrs. Maria Nesam', '05.01.1965', 'Kuzhivilai', 'Karumathur  Minor Seminary, Kumbakonam  Philosophy Christ Hall, Karumathoor Arulananthar College, Karumathoor Theology Morning Star College, Calcutta', '22.04.1996', 'Kuzhivilai', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Amsi', '<div>Parish Priest,Church of Imm. Heart of Mary,Amsi, Maniaramkuntu,Thengapattanam 629 173<br></div>', '', '9443607766', '', '1054.jpg', 'Diocese of Kuzhithurai', 'Nagara Porta Vilai, ', 'Kapiyarai PO - 629156', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(421, 1055, 'Fr. Gnanamuthu V.', 'Mr. Varuvel', 'Mrs. Rosammal', '22.05.1968', 'Pullani', 'St. Aloysius, Nagercoil 1988,Philosophy Christ Hall, 1993 Karumathoor,Theology St. Paul\'s, Trichy 1997 ', '06.04.1997', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'St. Paul\'s Seminary', '          St. Paul\'s Seminary, P.B.No:36, 620001', '', '9489264680', 'vgnana2002@yahoo.com', '1055.jpg', 'Diocese of Kuzhithurai', 'Thidu Thidu Than Vilai, Nattalam Post', 'West Marthandam Via, 629165', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(422, 1056, 'Fr. Anthireya alias Andrew D.', 'Mr. Devasahayam', 'Mrs. Chellammal', '22.11.1959 ', 'Themanoor', 'Philosophy Dharmaram, Bangalore Theology Dharmaram, Bangalore,', '19.04.1998', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kuzhivilai', '            Church of St. Francis Xavier, kuzhivilai, Prakadai, Kappiarai - 629156', '', '9443415475', 'frandrew.1960@gmail.com', '1056.jpg', 'Diocese of Kuzhithurai', 'Mangattuvilai, ', 'Moovattumugam PO - 629177', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(423, 1057, 'Fr. Antony Jeya S. ', 'Mr. Siluvai Rayan', 'Mrs. Lourdu Mary', '11.08.1970', 'Konamcadu', 'St. Aloysius\' Seminary, Nagercoil, Philosophy Christ Hall Seminary, Karumathur, Theology Sacred Heart, Poonamallee', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'USA', '  USA', '', '9442831807', 'santonyjeya@yahoo.com', '1057.jpg', 'Diocese of Kuzhithurai', 'Church Street, ', 'Konamcadu  - 629 803', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(424, 1058, 'Fr. Jeya Kumar G.', 'Mr. Gnanapragasam', 'Mrs. Maria Pushpam', '24.09.1971', 'Pallavilai (Pattarivilai)', 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall Seminary , Karumathoor,Theology St. Paul\'s Seminary, Trichy ', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Madathattuvilai', '  Parish Priest, Church of St. Sebastian, Madathattuvilai', '', '9487688033', '', '1058.jpg', 'Diocese of Kuzhithurai', 'Palla Vilai, ', 'Thalakulam PO - 629 802', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(425, 1059, 'Fr. Maria Rajendran S.', 'Mr. Savariar Adimai', 'Mrs. Theresammal', '14.05.1969', 'Mathiravilai', 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall, Karumathur ,Theology Sacred Heart, Poonamallee', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Vavarai & Corresspondant, Nanjil Catholic Arts and Science College', '      Secretary, Nanjil Catholic College of Arts and Science, Kaliyakkavilai.', '', '9443606008', 'rajendranmaria@yahoo.com', '1059.jpg', 'Diocese of Kuzhithurai', 'Mathiravilai, ', 'ThickanamCode PO - 629 804', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(426, 1060, 'Fr. Paul Richard Joseph R.', 'Mr. Rayappan', 'Mrs. Mary Leela', '10.03.1972', 'Palliady', 'St. Aloysius Seminary, Nagercoil', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest- Thikurichy, Co-Correspondent Trinity School', '              Paish Priest<div>Church of St. Gabriels</div><div>Thickurichy - 629 168</div>', '04651 230144, 230244', '9443693505', 'paulrichardjoseph@hotmail.com', '1060.jpg', 'Diocese of Kuzhithurai', 'Koottakuzhivilai', 'Palliadi - 629169', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(427, 1061, 'Fr. Robert Benni M.', 'Mr. Sahaya Marcose', 'Mrs. Saral Mary', '06.05.1971', 'Mylacode', 'St. Aloysius Seminary, Nagercoil,  Philosophy Christ Hall, Karumathoor,  Theology St. Paul\'s, Trichy 1998', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Chetticharvilai', '          Parish Priest, Church of St. Little Flower, Chetticharvilai', '', '9443808823', 'frmrbenni@yahoo.co.in,  frmrbenni@gmail.com', '1061.jpg', 'Diocese of Kuzhithurai', 'No. 24/42, A1, Marsha Garden', ' Vattam Junction, Thiruvithancode PO  629174', 'K.K. Dist., Tamil Nadu, INDIA', 'A1B+'),
(428, 1062, 'Fr. Manohim Xavier F.', 'Mr. A.R. Francis', 'Mrs. Rajammal', '28.06.1972', 'Mathiravilai', 'St. Aloysius\' Minor Seminary, Nagercoil,Philosophy Christ Hall Seminary, Karumathur,St. Pauls\' Seminary, Trichy', '30.04.2000', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Muttaicadu, Correspondent Trinity School & Asst. Director Nanjil Milk Plant', '              Parish Priest, Church of St. Francis Xavier, Muttaicadu, Kumarapuram - 629189', '', '9443579345', 'frmano2010@gmail.com', '1062.jpg', 'Diocese of Kuzhithurai', 'Rajam Nivas, Mathira Vilai', 'Thickkanam Code PO - 629 804', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(429, 1063, 'Fr. Leo Alex A.', 'Mr. Ambrose', 'Mrs. Annammal', '01.08.1970', 'Nagacode', 'St. Aloysius\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Paul\'s Seminary, Trichy', '27.12.2000', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Vellicode', '        Parish Priest,Church of Our Lady of Sorrows,Vellicode,Mulagumoodu 629 167', '', '9443595664', 'frleoalex2000@gmail.com', '1063.jpg', 'Diocese of Kuzhithurai', 'No.13-15/13, Kattukulam, Nagacode', 'Kulasekharam-629161', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(430, 1064, 'Fr. P. Sahaya Dhason.', 'Mr. Pathrose', 'Mrs. Retna Bai', '22.11.1972', 'Kandanvilai', 'St. Aloysius\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\'s Seminary, Trichy', '27.12.2000', ' St. Xavier\'s Cathedral, Kottar', ' Most Rev. Leon A.Tharmaraj', 'Parish Priest, Vattam & Asst. Procurator ', '            Parish Priest, St.Antony\'s Church Vattom, Thiruvithancode PO', ' 04651 253360, 248122', '9487422704', 'dhasu.saha@gmail.com', '1064.jpg', 'Diocese of Kuzhithurai', 'Pandara Vilai, ', 'Kandanvilai PO - 629810', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(431, 1065, 'Fr. Christopher S. ', 'Mr. Siluvairayan', 'Mrs. Jesu Mary', '24.05.1973', 'Karenkadu', 'St. Aloysius\' Minor Seminary, Nagercoil, Sacred Heart, Poonamallee', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Ithayapuram (Viricode), MD VSCS', '          Church of Sacred Heart of Jesus, Ithayapuram, Viricode - 629165', '', '9443118067', 'frchristo_rexputh@yahoo.co.in', '1065.jpg', 'Diocese of Kuzhithurai', '2,3A, North St., ', 'Karankadu - 629 809', 'K.K. Dist., Tamil Nadu, INDIA', 'A1-'),
(432, 1066, 'Fr. Isaac Raj R.', 'Mr. Rayappan', 'Mrs. Rethna Bai', '05.05.1971', 'Kappiyarai', 'St. Aloysius\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathur,St. Paul\'s Seminary, Trichy', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Mylacode, ', '        Parish Priest, Church of St. Micheal, Mylacode, Alancode, Neyyoor - 629802', '', '8903253253', 'frisaacraj@gmail.com', '1066.jpg', 'Diocese of Kuzhithurai', 'Rethna Cottage, Koovara Vilai', 'Kappiyarai PO - 629156', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(433, 1067, 'Fr. Maria Vincent A.', 'Mr. Alangaram (Late)', 'Mrs. Ronickam', '12.03.1957', 'Thuckalay', 'St. Aloysius\' Minor Seminary, Nagercoil  St.Pauls, Trichy', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Packiapuram', '          Parish Priest,Church of St. Eusthachius,<br>Packiapuram,Arumanai 629 151', '9344431629', '8903476560', 'frmariavincent@gmail.com', '1067.jpg', 'Diocese of Kuzhithurai', 'Vadakuvilai, Keezhkalkurichy', 'Thuckalay - 629175', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(434, 1068, 'Fr. Victor V.', 'Mr. Varuvel', 'Mrs. Santhai', '17.04.1973', 'Pacode', ' St. Aloysius Seminary Nagercoil,Christ Hall Seminary Karumathur,Sacred Heart Poonamallee .', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Director, TLS, Trichy', '             T.L.S. Trust , 49 J, Bharathiar Salai , Trichy 620 001', '0431 2412833', '9443500408', 'victor_priest@yahoo.co.in', '1068.jpg', 'Diocese of Kuzhithurai', 'Kovilvilai, North Street', 'Marthandam - 629165', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(435, 1069, 'Fr. Bright Simsa Raj A. ', 'Mr. A. Antony Muthu', 'Mrs. A. Agnes', '31.07.1971', 'Kallukoottam', 'St. Aloysius\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\'s Seminary, Trichy', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Melpuram', '        Church of the Holy Guardian Angels, Melpuram, Pacode 629 168', '', '9443692480', ' ', '1069.jpg', 'Diocese of Kuzhithurai', 'Chariathottathu Vilai, ', 'Kallukoottam PO', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(436, 1070, 'Fr. Densingh M. ', 'Mr. Muthaiah N.S.', 'Mrs. Rosammal ', '23.05.1962', 'Mathicode Sahayanager', 'St. Aloysius\' Minor Seminary Nagercoil,St. Joseph\'s Mangalore', '07.04.2002', 'St.Francis Xavier Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Soosaipuram', '              Church of St. Antony, Valvachakostam, Kunnamparai, kattathuirai- 629158', '04651 268277', '9443500655', '', '1070.jpg', 'Diocese of Kuzhithurai', 'Mathicode, Sahayanagar Post ', 'Palapalam via, Pin-629159', 'K.K.Dist., Tamil Nadu, INDIA', 'O+'),
(437, 1071, 'Fr. Dominic Savio V. ', 'Mr. Varghese M.S', 'Mrs. Jesu Retnam A.', '12.05.1975', 'Madathattuvilai', 'St. Aloysius\' Seminary Nagercoil,St. Joseph\'s Seminary Mangalore, Paul Seminary Pune', '07.04.2002', 'St. Francis Xavier Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Arockiapuram', '          Church of St. Roch, Arokiapuram Monday Market, Neyyoor PO', '', '9443483466', 'frvsavio@yahoo.com', '1071.jpg', 'Diocese of Kuzhithurai', 'Savio Illam, Manthoppu', 'Villukiri PO - 629180', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(438, 1072, 'Fr. Jerald Justin D.', 'Mr. R. Deva Sahayam R.', 'Mrs. R.Theresammal', '19.01.1970', 'Kallukoottam', 'Sacred Heart, Poonamalle', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Managing Director, Nanjil Milk Plant', '  Nanjil Milk Plant, (Res) Church of St. Mary, Mulagumoodu - 629167', '', '9442079448', 'frjervy02@gmail.com', '1072.jpg', 'Diocese of Kuzhithurai', 'North Kallukoottam ', 'Kallukoottam PO - 629802', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(439, 1073, 'Fr. Sujan Kumar D.M.', 'Mr. J. Devanesan', 'Mrs. A. Maria Rose (Late)', '13.06.1972', 'Kanjampuram', 'St. Aloysius\' Seminary, Nagercoil, St. Paul\'s, Trichy', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study', '  St. Little Flower Mission Centre, Bharathiyar University, Coimbatore', '', '9486473063', 'frsujankumar13@gmail.com', '1073.jpg', 'Diocese of Kuzhithurai', '13/20A, Rosary Villa, Chettiya Vilai Veedu', 'Nithiravilai PO - 629 154', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(440, 1074, 'Fr. Wiselin Xavier. E', 'Mr. A. Elias (Late)', 'Mrs. Rajam', '28.10.1973', 'Vellicode', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kolvel, Editor - \"Puthiya Thedal\" ', '          Church of Our Lady of Mount Carmel, Kolvel, Thiruvarampu- 629161', '', '9443607097', 'frwiselinxavier2015@gmail.com', '1074.jpg', 'Diocese of Kuzhithurai', 'Chavidivilai Veedu, ', 'Mulagumoodu Post  - 629 167', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(441, 1075, 'Fr. Romeric Thadeus K.M.', 'P. Kulandai Swamy', 'K. Crispina Mary', '08.12.1970', 'Ramanathichenputhur', 'For Philosopy, Trinity College, Jalandhar, Punjab for Theolory, Papal Seminary Pune', '27.04.2003', 'St. Xavier\'s Cathedral, Kottar', 'Bishop Leon A. Tharmaraj', 'Parish Priest Mankuzhy', '          Parish Priest,Church of St. Francis Xavier, Mankuzhy ,Neyyoor 629 802   ', '', '8903901169', 'frthadeus@gmail.com ', '1075.jpg', 'Diocese of Kuzhithurai', 'Ramanathichen Puthur, Kumarapuram ', 'Thoppur PO - 629 402', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(442, 1076, 'Fr. Thatheu Leon Jose A.S.', 'Mr. Selva Mony', 'Mrs. Amalorpavam', '11.07.1973', 'Kuzhivilai, Mulagumoodu', 'St. Aloysius\' Seminary Nageroil,Theology : St. Paul\'s Trichy,Philosophy : Christ Hall  Karumathoor.', '27.04.2003', ' St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kootamavu ', '          Parish Priest, Church of Our Lady of Perpetual Succor, Kootamavu, Mulagumoodu - 629167', '04651 283276', '9442076599', 'frthatheu@yahoo.com', '1076.jpg', 'Diocese of Kuzhithurai', 'Thittavilai, Parakadai', 'Kuzhicode Post - 629167', 'K.K.Dist., Tamil Nadu, INDIA', 'A1+'),
(443, 1077, 'Fr. George Eugin Raj A', 'Mr. S. Antony', 'Mrs. D. Alphonsal', '20.06.1977', 'Elanthavilai', 'St. Aloysius\' Seminary , Nagercoil.St. Pius College, Mumbai.', '18.04.2004', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study, Germany', '  ', '', '9442301467', 'george.eugeneraj@gmail.com', '1077.jpg', 'Diocese of Kuzhithurai', 'Elanthanvilai, ', 'Meycode PO-629 804', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(444, 1078, 'Fr. Robert John Kennedy G.', 'Mr. George', 'Mrs. Mary Ritammal', '31.08.1974', 'Kandanvilai', 'St. Aloysius\' Seminary , Nageroil, St. Joseph\'s Seminary, Mangalore', '18.04.2004', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Chemparuhi Vilai', '        Parish Priest , Church of St. Antony, Chemparuthivilai 629 166 ', '9443490023', '8903417068', 'revrojokennedy@gmail.com', '1078.jpg', 'Diocese of Kuzhithurai', '56/121, Street III, Karunanidhi Nager', 'Topndairpet West, Chennai - 6000 081', 'Tamil Nadu, INDIA', 'B+'),
(445, 1079, 'Fr. Suresh Kumar P.', 'Mr. Pankiraj A.', 'Mrs. Annammal C.', '16.02.1977', 'Mulagumoodu', 'St. Aloysius\' Seminary Nageroil, Papal Seminary Pune', '18.04.2004', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Corporate Manager', 'Church of O.L.of Good Health Munchirai', '', '9443164272', 'sureshmlg1977@gmail.com', '1079.jpg', 'Diocese of Kuzhithurai', 'Varikka Vilai, ', 'Mulagumoodu Post - 629 167', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(446, 1080, 'Fr. Xavier Sundar. A', 'Savaria Pitchai', 'Philominal', '05.06.1972', 'Aral Arockia Nagar', 'St.Paulin', '18.04.2004', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Yettacode', '          Parish Priest,Church of St. Francis Xavier,Yettacode,Veeyanoor 629 177', '', '9443681899', 'sundarxavier@gmail.com', '1080.jpg', 'Diocese of Kuzhithurai', 'Divine Home, Thovalai Puthoor', 'Thovalai - 629 302', 'K.K. Dist., Tamil Nadu, INDIA', 'A+'),
(447, 1081, 'Fr. Chandra Sekar C.P. ', 'Mr. Paul Raj C.', 'Mrs. Thanga Bai', '31.07.1977', 'Chentharai', 'St. Aloysius\' Seminary, Nagercoil  Arulanandar College, Karumathur  Christ Hall, Karumathur  St. Paul\'s Seminary, Trichy', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'USA', '      USA', '04651 222368', '9443559724', 'chandracpsekar@yahoo.co.in', '1081.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(448, 1082, 'Fr. Godwin Soundar Raj M.', 'Mr. Maria Antony', 'Mrs. Cecily', '21.01.1977', 'Mankuzhy', 'St. Aloysius\' Seminary , Nageroil,Papal Seminary , Pune ,', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Nallayan Puram', '          Parish Priest,Church of Good Shepherd Nallayan puram, Palugal - 629170', '04651 236150', '9487064600', 'godsrajm@yahoo.in', '1082.jpg', 'Diocese of Kuzhithurai', 'Mankuzhy', 'Neyyoor Post, Pin-629802', 'K.K.Dist., Tamil Nadu, INDIA', 'A1+'),
(449, 1083, 'Fr. Jegan Bose U.', 'Mr. Uttaria Muthu M.', 'Mrs. Mary Vincent S.', '21.04.1977', 'Nullivilai', 'St. Aloysius\' Seminary , Nageroil,Papal Seminry, Pune, St.Pauls, Trichy', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Study, Rome', '        Rome&nbsp;', '', '9486533218', 'frjbose@gmail.com', '1083.jpg', 'Diocese of Kuzhithurai', '24/914, Nullivilai, ', 'Nullivilai - 629 809', 'K.K. Dist., Tamil Nadu, INDIA', 'A+'),
(450, 1084, 'Fr. John Francis M.', 'Mr. Mathias V.', 'Mrs. Maria Pushpam Y', '12.09.1977', 'Vencode', 'St. Aloysius\' Seminary , Nageroil,Christ Hall, Karumathur,St. Paul\'s Seminary, Trichy', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Rest', 'Priests Home, Nirmala Hospital, Krungal', '', '9842928612', 'frjohnfranchis@gmail.com', '1084.jpg', 'Diocese of Kuzhithurai', 'Pulyanvilai', 'Vencode PO - 629 171', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(451, 1085, 'Fr. Eckermens Michael M. ', 'Mr. Michael', 'Mrs. Mary Margaret Michael ', '28.01.1976', 'Madathattuvilai', 'St. Aloysius\' Seminary Nageroil,St. Pius College Mumbai ', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study, Thanjavur', '                Church of Our Lady of Good Health, Thirukanurpatti, Thanjavur', '04651 263098', '9360331148', 'fr.eckermens@gmail.com', '1085.jpg', 'Diocese of Kuzhithurai', 'St. Lawrence Street, Madathattuvilai,', 'Villukuri,(P.O.) - 629180', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(452, 1086, 'Fr. Maria Thomas Austin M.', 'Mr. Michael Pillai', 'Mrs. Pushpa Virgin', '21.04.1979', 'Mdavilagam - Marthandamthurai', 'St. Aloysius\' Seminary , Nageroil, Christ Hall, Karumathur,Sacred Heart Seminary, Poonamallee ', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Leave', '  ', '04651 268658', '9597779546', 'maustindiaz@gmail.com', '1086.jpg', 'Diocese of Kuzhithurai', '', '', '', ''),
(453, 1087, 'Fr. Primas Singh M.', 'Mr. Maria Rethna George', 'Mrs. Selvi Mary', '24.03.1979', 'Mukkalampadu', 'St. Aloysius\' Seminary  Nageroil, Papal Seminary Pune', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Correspondent, Morning Star Polytechnic College, Chunkankadai', '        Correspondent, Morning Star Polytechnic College, Chunkankadai 629003', '', '9486178919', 'frprimas@gmail.com', '1087.jpg', 'Diocese of Kuzhithurai', '1/11, Mukkalampadu,', ' Kurunthencode PO - 629 805', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(454, 1088, 'Fr. Pushpa Raj A.', 'Mr. Asirvatham D.', 'Mrs. Rajammal A.', '01.10.1974', 'Thumbaly', 'St. Aloysius\' Seminary , Nageroil Krishu Jyothi College, Bangalore', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Palavilai', '        Parish Priest, Church of St. Antony, Palavilai, Kuzhithurai - 629163', '', '9486325298', 'frpushpa197@gmail.com', '1088.jpg', 'Diocese of Kuzhithurai', 'Thenganagan Vilai, Thumpali', 'Irenipuram PO 629162', 'K.K.Dist., Tamil Nadu, INDIA', 'AB+'),
(455, 1089, 'Fr. Arockia Shelly Rose A.M. ', 'Mr. Ambrose P.', 'Mrs. Mary Elizabeth', '17.04.1978', 'Iruthayapuram', 'St. Aloysius\' Seminary , Nagercoil, St. Paul\'s Seminary, Trichy', '15.04.2007', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Tiruthuvapuram', '        Cathedral of the Most Holy Trinity,Thirithuvapuram,Kuzhithurai 629 163', '', '9487251004', 'frshelleyrose@hotmail.com', '1089.jpg', 'Diocese of Kuzhithurai', 'Rose Cottage, Uthinoorvilai', 'Kulapuram PO 629153', 'K.K.Dist., Tamil Nadu, INDIA', 'B+'),
(456, 1090, 'Fr. Benny L. ', 'Mr. Lucas', 'Mrs. Jalarthacy', '02.10.1975', 'Puthenkadai', 'St. Aloysius\' Seminary , Nagercoil,Christ Hall Seminary, Karumathur,Sacred Heart Seminary, Poonamalle', '15.04.2007', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Manjakonan, Vicar Forane (Puthenkadai)', '        Church of St. Therese of Child Jesus, Manjakonam, Thirparapu - 629161', '', '9578120866', 'fr.bennyl@yahoo.com', '1090.jpg', 'Diocese of Kuzhithurai', '1/307, R.C.Street, Puthenkadai', 'Thiruvattar PO - 629177', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(457, 1091, 'Fr. Godwin Selva Justus S.', 'M. Selva Raj', 'Marianthony', '04.11.1979', 'Alenchy', 'St. Aloysius\' Seminary , Nagercoil. Christ Hall, Karumathoor. Papal Seminary Pune', '15.04.2007', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Alanvilai', '      Financial Adminstrator SXCCN, Chunkankadai, Parish Priest, Church of O.L. of Lourdes, Alanvilai, Karenkadu - 629809', '', '9486910526', 'godwin411@gmail.com', '1091.jpg', 'Diocese of Kuzhithurai', 'M.S. Raj Cottage, 6-62A/1, Their Vilai', 'Mulagumoodu - 629 167', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(458, 1092, 'Fr. Arockia Jose G. ', 'Mr. Gnanasigamoni', 'Mrs. Roselet Mary', '09.06.1978', 'Konnakuzhivilai', 'St. Aloysius\' Seminary, Nagercoil, St. Pius College, Mumbai', '19.04.2009', 'St. Francis Xavier\'s Cathedral, Kottar', '', 'Studies, Italy', '        Italy', '', '', 'arockia1978jose@gmail.com', '1092.jpg', 'Diocese of Kuzhithurai', 'Konnakuzhivilai, ', 'Villukuri Post- 629180', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(459, 1093, 'Fr. Geo Giltus G.', 'Mr. George Maria Arputham', 'Mrs. Barbara', '18.02.1974', 'Pandaravilai Kandanvilai', 'MSS.CC Bangalore, Dharmaram College Bangalore, St. Paul\'s Seminary Trichy', '19.04.2009', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest,Vellayambalam', '          Church of St.  Antony, Vellayambalam, Puthukadai 629 171', '', '9486671566', 'frgeogkuz@gmail.com', '1093.jpg', 'Diocese of Kuzhithurai', 'Geo Illam, Pandaravilai', 'Kandanvilai PO - 629810', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(460, 1094, 'Fr. Gilbert Lingson V.', 'Mr. Varuvel', 'Mrs. Mary Rethinam', '07.07.1976', 'Appattuvilai', 'St. Aloysius\' Seminary, Nagercoil.Christ Hall Seminary, Karumathur.St. Paul\'s Seminary, Trichy', '19.04.2009', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Mullanganavilai', '  Church of St. Antony, Mullanganavilai, (Via) Karungal 629 157', '', '7373354728', 'fr.lingson@gmail.com', '1094.jpg', 'Diocese of Kuzhithurai', 'Chemman Vilai, Appattuvilai', 'Thuckalay PO. - 629 175', 'K.K.Dist., Tamil Nadu, INDIA', '');
INSERT INTO `diocesepriest` (`id`, `priestid`, `pname`, `pfname`, `pmnane`, `pdob`, `pplace`, `pseminary`, `porddate`, `pordplace`, `pordby`, `pminstring`, `paddress`, `pphone`, `pmobile`, `pemail`, `pimg`, `pdiocese`, `nadd1`, `nadd2`, `nadd3`, `bloodg`) VALUES
(461, 1095, 'Fr. Andrews V.', 'Mr. Varghese', 'Mrs. Maria Thangam A.', '15.09.1981', 'Appattuvilai', 'St. Aloysius\' Seminary, Nagercoil, Christ Hall Seminary, Karumathur, St. Paul\'s Seminary, Trichy', '18.04.2010', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Kallu Kootam, Treasurer (Nanjil Milk Plant)', '          Church of O.L. of Fathima, Kallukkoottam 629 802', '', '9443159308', 'joyandrewson27@yahoo.com', '1095.jpg', 'Diocese of Kuzhithurai', 'Near St. Joseph Church, Appattuvilai', 'Thuckalay PO - 629 175', 'Tamil Nadu, INDIA', ''),
(462, 1096, 'Fr. Jokens A.', 'Mr. Antony R.', 'Mrs. Ronickam A.', '11.09.1979', 'Chemparuthivilai', 'St. Aloysius\' Seminary, Nagercoil,St. Joseph\'s Seminary, Mangalore', '18.04.2010', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Mula Vilai', '      Parochial Administrator, Church of  Christ the King,Mula Vilai,Veeyanoor 629 177', '', '9442858706', 'jokinsantorony@gmail.com', '1096.jpg', 'Diocese of Kuzhithurai', 'Oottukuzhi Vilai, ', 'Mekkamandapam PO - 629 166', 'K.K. Dist., Tamil Nadu, INDIA', 'A2B+'),
(463, 1097, 'Fr. Titus Mohan M.', 'Mr. Maria Alphonse S.', 'Mrs. Yesumarial D. ', '17.06.1983', 'Chemparuthivilai ', 'St. Aloysius\' Seminary Nagercoil, Christ Hall Seminary Karumathur,Papal Seminary Pune  ', '11.12.2011', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Sahaya Nagar', '        Parochial Administrator,  Church of O.L. of Perpetual Succour,Sahaya Nagar,Palapallam 629 159', '', '9443447814', 'titusmohan@gmail.com ', '1097.jpg', 'Diocese of Kuzhithurai', 'Chappara Vilai,', ' Chemparuthivilai PO - 629 166', 'Tamil Nadu, INDIA', 'O+'),
(464, 1098, 'Fr. Shine S.', 'Mr. Simon S.P.', 'Mrs. Maria Pushpam', '02.10.1984', 'Kalaiakkavilai', 'St. Aloysius\' Seminary Nagercoil, Arulanandar College  Madurai, St. Paul\'s Seminary Trichy', '15.12.2012', 'St. Francis Xavier\'s Cathedral, Kottar', ' Most Rev. Peter Remigius', 'Parish Priest, Fatimapuram, Director (Youth Comission)', '  Church of Our lady of Fatima, Fathimapuram, Kollencode - 629169', '', '9952862474', ' fr.shinekottar@gmail.com', '1098.jpg', 'Diocese of Kuzhithurai', 'S P Simon Illam, R.C. Street', 'Kaliakkavilai 629153', 'K.K. Dist., Tamil Nadu, INDIA', 'O-'),
(465, 1099, 'Fr. Suresh Raj R.', 'Mr. Rajayan A.', 'Mrs. Rethina Bai', '09.08.1981', 'Vellicode', 'St. Aloysius\' Seminary Nagercoil,Sacred Heart Seminary Poonamallee', '09.12.2013', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Kottoorkonam', '          Parish Priest, Church of Infant Jesus, Kottoorkonam  ,Kulasekharam 629 161', '04651 280868', ' 9444132216', 'sureshraj882@gmail.com', '1099.jpg', 'Diocese of Kuzhithurai', 'Swamitharavilai, Vellicode', 'Mulagumoodu Post  - 629 167', 'K.K. Dist., Tamil Nadu, INDIA', 'A+'),
(466, 1100, 'Fr. Florence A.', 'Mr. Antony Kruz J. (Late)', 'Mrs. Alphonse Ammal K. ', '24.11.1980', 'Aaloor', 'St. Aloysius\' Seminary Nagercoil,St. Joseph\'s Seminary Mangalore ', '06.09.2014', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Study ', '  ', '', '9786472448', 'florencevijay2411@gmail.com', '1100.jpg', 'Diocese of Kuzhithurai', 'R.C. Street.', 'Aloor - 629 801', 'K.K. Dist., Tamil Nadu, INDIA', 'AB+'),
(467, 1101, 'Fr. John Benhar N.', 'Mr. Nasamony V', 'Mrs. Marial V', '14.03.1984', 'Vencode', 'St. Aloysius\' Seminary, Nagercoil,Sacred Heart Seminary, Poonamallee ', '06.09.2014', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Leave', '    ', '', '9884831859', 'benhar14@gmail.com', '1101.jpg', 'Diocese of Kuzhithurai', 'Pulayan Vilai, ', 'Vencode & PO - 629 171', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(468, 1102, 'Fr. Benitto V. ', 'Mr. L. Varghese', 'Mrs. S. Joice Chellammal', '24.01.1985', 'Alanvilai', 'St. Aloysius\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Peter\'s Seminary, Viraganoor', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Murasancode', '  Parish Priest, Chruch of Our Lady of Mount Carmel, Murasancode.&nbsp;', '', '9488504009', 'benialv@gmail.com', '1102.jpg', 'Diocese of Kuzhithurai', 'Alanvilai South,', ' Karankadu PO - 629 809', 'K.K. Dist., Tamil Nadu, INDIA', 'A+'),
(470, 1104, 'Fr. Martin M.', 'Mr. Michael J.', 'Mrs. K. Rosammal', '13.01.1986', 'Vavarai', 'St. Aloysius\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathoor,St. Pauls Seminary, Trichy', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Choozhal ', '        Parish Priest, Church of St. Michael Archangel, Choozhal, Fatimanagar - 629160', '', '9597989948', 'mmmartinrose@gmail.com', '1104.jpg', 'Diocese of Kuzhithurai', 'East Kalpakhaseri House, Vavarai', 'S.T. Mankad PO 629172', 'K.K.Dist., Tamil Nadu, INDIA', 'A+'),
(471, 1105, 'Fr. Pencer Xavier R.', 'Mr. Rajamony', 'Mrs. Thangammal', '07.06.1985', 'Yettacode', 'St. Aloysius\' Minor Seminary Nagercoil,Morning Star College Kolkata,St. Peter\'s Pontifical Seminary Bangalore  ', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Mathiravilai', '  Parish Priest, Church of Our Lady of Assumption, Mathiravilai, Thikanamcode - 629804', '', '8903935323', 'pencerxavier@gmail.com', '1105.jpg', 'Diocese of Kuzhithurai', 'Xavier Cottage, Ammanthalai Vilai', 'Yettacode, Veeyannoor PO - 629177', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(472, 1106, 'Fr. Sujin D.', 'Mr. S. Dennis', 'Mrs. Mary Lizzie', '27.02.1986', 'Amsi', 'St. Aloysius\' Minor Seminary  Nagercoil,Christ Hall Seminary Karumathur Madurai, St. Paul Seminary Trichy', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Lourdugiri', '  Parish Priest, Church of Our Lady of Lourdes, Lourdugiri - Anducode - 629168&nbsp;', '', '9677936244', 'sujindennis@gmail.com', '1106.jpg', 'Diocese of Kuzhithurai', 'Orupilavilai, Amsi, ', 'Thengapattanam PO - 629173', 'K.K. Dist., Tamil Nadu, INDIA', 'O+'),
(473, 1107, 'Fr. Xavier Raj', 'G. Rajamony', 'Maria Puspam', '06.05.1984', 'Yettacode', 'Sacred Heart Seminary, Poonamallee', '10.05.2015 ', 'Holy Trinity Cathedral Thirithuvapuram', 'xavier.mum@gmail.com', 'Parish Priest, Eanchacode', '  Parish Priest, Church of Our Lady of Perpetual Succor, Eanchacode, Ponmanai - 629161', '', '9626660889', 'xavier.mum@gmail.com ', '1107.jpg', 'Diocese of Kuzhithurai', 'Tholichal, Yettacode, Parayan Konathu Vilai', 'Veeyannoor PO-629177', 'K.K. Dist., Tamil Nadu, INDIA', 'B-'),
(474, 1108, 'Fr. Francis Xavier M', 'Madavadiyan', 'Ronikam', '10.06.1979', 'Kappiyarai', 'St.Peter Pontifical Seminary, Bangalore', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Konnakuzhivilai', '  <font size=\"3\">Parish Priest, Church of Our Lady of Sorrows, Konnakuzhivilai, Villukury - 629180</font><style type=\"text/css\">\r\n		body,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:\"Calibri\";', '', '7598112014', 'xfrancis35@gmail.com', '1108.jpg', NULL, 'SamaVilai, ', 'Kappiyarai PO 629156', 'K.K. Dist., Tamil Nadu, INDIA', 'A+'),
(475, 1109, 'Fr. Maria Anto Halvin', 'Joseph Alexander', 'Maria Sebastiaye', '17.11.1981', 'Madathattuvilai', 'St. Pius X Mumbai', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Padarnilam', '  Parish Priest, Church of St. Pius X, Padarnilam, Manavalakurichy - 629252', '', '9629209055', 'halvin.j@gmail.com', '1109.jpg', NULL, '2/13, Convent Road Madathattuvilai', 'Villukury PO- 629180', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(476, 1113, 'Fr. Michael Alocious M.A', 'S. Michael Antony', 'G. Mary Joice', '29.04.1987', 'Kuzhivilai', 'Sacred Heart Seminary, Poonamalle', '01.05.2016', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Appattuvilai', '                                              <p>St.Joseph\'s Church&nbsp;</p><p>Appattuvilai</p>', '04651272077', '8903148050', 'alomic29@gmail.com', '1113.jpg', 'Kuzhithurai Diocese', '9-4A Kuzhivilai', 'Kattimancodu PO - 629806', 'K.K. Dist., Tamil Nadu, INDIA', 'A2B+'),
(477, 1110, 'Fr. Sargin Rubas B', 'V. Barnapas', 'R. Agnes', '30.05.1986', 'Chemparuthivilai', 'St. Aloysius Seminary, Nagercoil, St.Joseph\'s Seminary Mangalore', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Paramanvilai', '        Parish Priest, Paralogamatha Church, Paramanvilai, Padanthalumoodu - 629163', '', '9597909745', 'srubas@gmail.com', '1110.jpg', NULL, 'Panchivilai, ', 'Chemparuthivilai PO 629166', 'K.K. Dist., Tamil Nadu, INDIA', 'A1+'),
(478, 1112, 'Fr. Domi Lilil Raja A', 'Antony M', 'George Mary V', '07.10.1986', 'Konnakuzhivilai', 'St.Aloysis Seminary, Sacred Heart Seminary Poonamallee', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Parakunnu ', '  Parish Priest, Church of Sacred Heart of Jesus, Parakunnu, Vanniyur, (Via) Kuzhithurai - 629163', '', '7402586774', 'domilililraja@gmail.com', '1112.jpg', NULL, 'H.No.27-14C, Konnakuzhivilai', 'Villukiri PO-629 180', 'K.K. Dist., Tamil Nadu, INDIA', 'B+'),
(481, 1103, 'Fr. Charles Viju A.', 'M. Arockiam', 'S. Annammal', '30.08.1984', 'Konamkadu', 'St. Aloysius\' Minor Seminary, Nagercoil, St.Josephs Interdiocesan Seminary, Mangalore', '10.05.2015', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Vizhunthayampalam', '              Church of St. Antony,&nbsp;Vizhunthayampalam, Thenkapattanam - 629173', '', '9487015472', 'charlesviju@gmail.com', '1103.jpg', NULL, 'Konamkadu, Saralvilai', 'Konamkadu PO - 629 803', 'K.K.Dist., Tamil Nadu, INDIA', ''),
(482, 1111, 'Fr. Cyril Mesmin', 'Vincent', 'Pushpamary', '10.06.1986', 'Kolvel', 'St.Pauls Major Seminary Trichy', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Varthanvilai', '  Parish Priest, Church of St. Antony, Varthanvilai, Bethelpuram - 629803', '', '9787595552', 'cyrilmesmin@yahoo.com', '1111.jpg', NULL, 'Kolvel, Karugali Villai', 'Thiruvarambu PO 629183', 'K.K. Dist., Tamil Nadu, INDIA', 'AB+'),
(483, 1117, 'Fr. Edwin Raj C.', 'K. Chinnathurai', 'J.Omanal', '27-09-1987', 'Melpuram', 'Papal Seminary, Pune.', '07-05-2017', 'Cathedral of the Most Holy Trinity', 'Most. Rev. Jeromedhas V.', 'Secretary to the Bishop', '            Bishop\'s house&nbsp;<div>Post.Box. No:1<br><div>Unnamalaikadai</div><div>K.K.Dist- 629179</div></div><div>Tamil Nadu, South India</div>', '04651-272077', '8149863115', 'edwinchinna@yahoo.co.in', '1117.jpg', NULL, 'Pattavilai ', 'Pacode (P.O)', 'K.K. Dist- 629168', 'O+ve'),
(484, 1114, 'Fr. Jees Raymond', 'Mr. S. Raymond (Late)', 'Mrs. A. Rethinammal (Late)', '09.07.1977', 'Thoothoor', 'Jyothir Bhavan, Kalamassery.', '07.05.2017', 'The Cathedral of Most Holy Trinity, Thirithuvapuram.', 'Most. Rev. Jeromedhas SDB', 'Co- Pastor, Mathiravilai', '    Church of Our Lady of Assumption, Mathiravilai.&nbsp;', '', '9444643805', 'jeesdenn@gmail.com', '1114.jpg', NULL, 'Near Govt. Hospital', 'Thoothoor - 629176', '', ''),
(485, 1115, 'Fr. Vinso Antony V. ', 'Mr. A. Vensaslaus', 'Mrs. S. maria Sathai', '01.07.1984', 'Kallukootam', 'Christ Hall Seminary, Papal Seminary', '07.05.2017', 'The Cathedral of the Most Holy Trinity, Thirithuvapuram.', 'Most. Rev. Jeromedhas SDB', 'Parish Priest, Alancholai', '            ', '', '8939707671', 'vinso84@gmail.com', '1115.jpg', NULL, 'Valiavilai ', 'Kallukootam', 'K. K. Dist - 629802', ''),
(486, 1116, 'Fr. Albin Jose E.', 'Mr. Eliyas', 'Mrs. sarasamma', '26.03.1985', 'Varuvilai, Kanjampuram', 'St. Paul\'s Seminary', '07.05.2017', 'The Cathedral of Most Holy Trinity, Thirithuvapuram.', 'Bishop Jeromedhas SDB', 'Co- Pastor,Thundathuvilai', '          ', '', '9486893800', 'ealbinjose@gmail.com', '1116.jpg', NULL, 'Aruvan Pottai, ', 'Kanjampuram.', '', ''),
(487, 1118, 'Fr. Alwin Vijay M', 'Mr. C. Mohan', 'Mrs. S. Glory', '01-01-1988', 'Nattalam', 'St.Paul\'s, Trichy', '07-05-2017', 'The Cathedral of the Most Holy Trinity, Thirithuvapuram', 'Most.Rev. Jeromedhas V. SDB', 'Co - Pastor Madathattuvilai', '          ', '', '9488807775', 'malwinvijay1988@gmail.com', '1118.jpg', NULL, 'Ezhathuvilai', 'Nattalam', 'K.K.Dist', ''),
(488, 1119, 'Fr Arul', 'Mr. Rajaiyan', 'Mrs. Radha', '24/09/1988', 'Maruthancode', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, St.Paul\'s Semnary, Trichy', '15.04.2018', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Co-pastor at Munchirai', 'Sasthanpottai,&nbsp;<div>Maruthancode Post</div><div>629163</div>', '', '8270863652', 'aruljoe1989@gmail.com', '1119.jpg', NULL, '', '', '', 'O-'),
(489, 1120, 'Fr. Jeya Sunder Singh', 'Mr. Chellakkan', 'Mrs. Maria Rackini', '01.10.1989', 'Muzhavilai', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Papal Seminary Pune.', '15.04.2018', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most. Rev. Jeromedhas SDB', 'Secretary to the Bishop', 'Melaputhichari vilai,<div>Muzhavilai,&nbsp;</div><div>Veeyanoor post - 629177</div>', '', '9786936426', 'dearsundersingh@gmail.com', '1120.jpg', NULL, '', '', '', 'O+'),
(490, 1121, 'Fr. Arul Raj', '', '', '', '', '', '', '', '', '', '  ', '', '', '', '1121.jpg', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `rowID` int(22) NOT NULL,
  `userID` int(22) NOT NULL,
  `is_following` int(22) NOT NULL,
  `timestamp` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE `friendships` (
  `rowID` int(22) NOT NULL,
  `fromID` int(22) NOT NULL,
  `toID` int(22) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 = request, 1 = accepted, 2 = banned',
  `timestamp` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friendships`
--

INSERT INTO `friendships` (`rowID`, `fromID`, `toID`, `status`, `timestamp`) VALUES
(0, 1, 268, 1, '1543436830');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `url`, `priority`) VALUES
(187, '', 'dc4c6-slider3.jpg', NULL),
(188, '', '006a6-slider3.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` text CHARACTER SET latin1 NOT NULL,
  `english` text CHARACTER SET latin1 NOT NULL,
  `tamil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `tamil`) VALUES
(1, 'timeline', 'Timeline', 'காலவரிசை'),
(2, 'posts', 'Posts', 'கட்டுரைகள்'),
(3, 'snapshot', 'Gallery', 'கேலரி'),
(4, 'type_keywords', 'Type keywords', 'முக்கிய வார்த்தைகளின் வகை'),
(5, 'notifications', 'Notifications', 'அறிவிப்புகளை'),
(6, 'view_all_notifications', 'View all notifications', 'எல்லா அறிவிப்புகளையும் காண்க'),
(7, 'go_admin', 'Go Admin', 'நிர்வாகம் செல்க'),
(8, 'translate', 'Translate', 'மொழிபெயர்'),
(9, 'articles', 'Articles', ' இடுகைகள்'),
(10, 'snapshots', 'Gallerys', 'புகைப்படங்கள்'),
(11, 'edit_profile', 'Edit Profile', 'சுயவிவரத்தை திருத்து'),
(12, 'logout', 'Logout', 'வெளியேறு'),
(13, 'search', 'Search', 'தேடல்'),
(14, 'latest_quiries', 'Latest Quiries', 'சமீபத்திய Quiries'),
(15, 'latest_news', 'Latest News', 'சமீபத்திய செய்திகள்'),
(16, 'meet_our_office', 'Meet Our Office', 'எங்கள் அலுவலகத்தை சந்திக்கவும்'),
(17, 'language', 'Language', 'மொழி'),
(18, 'sure_to_delete', 'Are sure want to delete?', 'நிச்சயமாக நீக்க வேண்டுமா?'),
(19, 'this_action_cannot_be_undone', 'This action cannot be undone!', 'இந்த செயலைச் செயல்தவிர்க்க முடியாது!'),
(20, 'continue', 'Continue', 'தொடர்ந்து'),
(21, 'cancel', 'Cancel', 'ரத்து'),
(22, 'default_language', 'Default Language', 'இயல்புநிலை மொழி'),
(23, 'search_article_or_hashtag', 'Search article or hashtag', 'தேடல் கட்டுரை அல்லது ஹேஸ்டேக்'),
(24, 'type_keywords_and_hit_search', 'Type keywords and hit search', 'முக்கிய வார்த்தைகளைத் தட்டச்சு செய்து, தேடல் தேடுக'),
(25, 'dashboard', 'Dashboard', 'டாஷ்போர்டு'),
(26, 'orders', 'Orders', ''),
(27, 'invoices', 'Invoices', 'பற்றுச்சீட்டுகள்'),
(28, 'payments', 'Payments', 'கொடுப்பனவு'),
(29, 'wall', 'Wall', 'சுவர்'),
(30, 'friends', 'Friends', 'நண்பர்கள்'),
(31, 'followers', 'Followers', 'பின்பற்றுபவர்கள்'),
(32, 'following', 'Following', 'தொடர்ந்து'),
(33, 'male', 'Male', 'ஆண்'),
(34, 'years', 'Years', 'வருடங்கள்'),
(35, 'whats_on_your_mind', 'What\'s on your mind?', 'உங்கள் மனதில் என்ன இருக்கிறது?'),
(36, 'upload_a_snapshot', 'Upload Snapshot', 'பதிவேற்ற ஸ்னாப்ஷாட்'),
(37, 'write_new_article', 'Write an Article', 'ஒரு கட்டுரை எழுதவும்'),
(38, 'update', 'Update', 'புதுப்பிக்கப்பட்டது'),
(39, 'top_contributors', 'Top Contributors', 'சிறந்த பங்களிப்பாளர்கள்'),
(40, 'trending', 'Trending', 'பிரபலமாகும்'),
(41, 'new_snapshot', 'New Snapshot', 'புதிய ஸ்னாப்ஷாட்'),
(42, 'contributors', 'Contributors', 'பங்களிப்பாளர்கள்'),
(43, 'most_commented', 'Most Commented', 'பெரும்பாலான கருத்துரைகள்'),
(44, 'categories', 'Categories', 'வகைகள்'),
(45, 'latest_articles', 'Latest Articles', 'சமீபத்திய கட்டுரைகள்'),
(46, 'trending_hashtags', 'Trending Hashtag', 'பிரபல ஹாஷ்டேக்'),
(47, 'about_this_snapshot', 'About this snapshot', 'இந்த ஸ்னாப்ஷாட் பற்றி'),
(48, 'write_snapshot_descriptions', 'Write snapshot descriptions', 'ஸ்னாப்ஷாட் விவரங்களை எழுதுங்கள்'),
(49, 'save', 'Save', 'சேமி'),
(50, 'edit', 'Edit', 'தொகு'),
(51, 'remove', 'Remove', 'அகற்று'),
(52, 'uploading_a_snapshot', 'Uploading a snapshot', 'ஸ்னாப்ஷாட்டை ஏற்றும்'),
(53, 'year', 'Year', 'ஆண்டு'),
(54, 'month', 'Month', 'மாதம்'),
(55, 'week', 'Week', 'வீக்'),
(56, 'day', 'Day', 'தினம்'),
(57, 'hour', 'Hour', 'ஹவர்'),
(58, 'minute', 'Minute', 'மினிட்'),
(59, 'just_now', 'Just now', 'இப்போது'),
(60, 'comments', '', ''),
(61, 'likes', 'Likes', 'தோட்'),
(62, 'reposts', 'Reposts', 'Reposts'),
(63, 'new_post', 'New Post', 'புதிய பதவி'),
(64, 'title', 'Title', 'தலைப்பு'),
(65, 'date_created', 'Date Created', 'தேதி உருவாக்கப்பட்டது'),
(66, 'action', 'Action', 'அதிரடி'),
(67, 'title_and_content', 'Title and Content', 'தலைப்பு மற்றும் உள்ளடக்கம்'),
(68, 'post_title', 'Post Title', 'தலைப்பு தலைப்பு'),
(69, 'write_article_here', 'Write complete article', 'முழு கட்டுரை எழுதவும்'),
(70, 'tags', 'Tags', 'குறிச்சொற்கள்'),
(71, 'post_category', 'Post Category', 'அஞ்சல் வகை'),
(72, 'product_descriptions', 'Product Descriptions', 'தயாரிப்பு விளக்கம்'),
(73, 's', 's', 'ங்கள்'),
(74, 'write_comments', 'Write a comment and hit &quot;Enter&quot; to submit...', 'ஒரு கருத்தை எழுதி, சமர்ப்பிக்க &quot;Enter&quot; ஐ அழுத்தவும் ...'),
(75, 'view_order', 'View Orders', 'ஆணைகளைக் காண்க'),
(76, 'writing_an_article', 'Writing an article', 'ஒரு கட்டுரை எழுதுதல்'),
(77, 'category', 'Category', 'வகை'),
(78, 'login', 'Sign In', 'உள்நுழைக'),
(79, 'dashboard_access', 'Dashboard Access', 'டாஷ்போர்டு அணுகல்'),
(80, 'register', 'Register', 'பதிவு'),
(81, 'username_or_email', 'Username / Email', ''),
(82, 'type_your_password', 'Your Password', 'தங்களது கடவுச்சொல்'),
(83, 'login_description', 'Type your username or email and password to login. Or you can simply using your Facebook account.', 'உள்நுழைய உங்கள் பயனர்பெயர் அல்லது மின்னஞ்சல் மற்றும் கடவுச்சொல்லை தட்டச்சு செய்யவும்.  அல்லது நீங்கள் உங்கள் பேஸ்புக் கணக்கைப் பயன்படுத்தலாம்.'),
(84, 'password', 'Password', 'கடவுச்சொல்'),
(85, 'hash', 'Hash', 'ஹாஷ்'),
(86, 'edit_article', 'Edit Article', 'கட்டுரை திருத்தவும்'),
(87, 'save_changes', 'Save Changes', 'மாற்றங்களை சேமியுங்கள்'),
(88, 'read_more', 'Read More', 'மேலும் வாசிக்க'),
(89, 'previous', 'Previous', 'முந்தைய'),
(90, 'next', 'Next', 'அடுத்த'),
(91, 'oops_page_not_found', 'Oops... Page not found!', 'அச்சச்சோ ... பக்கம் காணப்படவில்லை!'),
(92, 'the_page_is_currently_not_available', 'The page you trying to access is currently unavailable.', 'நீங்கள் அணுக முயற்சிக்கும் பக்கம் தற்போது கிடைக்கவில்லை.'),
(93, 'access_forbidden', 'Access forbidden!', 'அணுகல் தடைசெய்யப்பட்டது!'),
(94, 'access_forbidden', 'Access forbidden!', 'அணுகல் தடைசெய்யப்பட்டது!'),
(95, 'you_have_no_power_here', 'You have no power here :p', 'உனக்கு இங்கே அதிகாரமில்லை: ப'),
(96, 'close', 'Close', ''),
(97, 'female', 'Female', 'பெண்'),
(98, 'website_and_traffic_analytics', 'Website and Visitors Analytics', 'வலைத்தளம் மற்றும் பார்வையாளர்கள் அனலிட்டிக்ஸ்'),
(99, 'fri', 'Fri', ''),
(100, 'sat', 'Sat', 'ச'),
(101, 'sun', 'Sun', 'சன்'),
(102, 'hit_units', 'Hit Units', 'அலகுகள் ஹிட்'),
(103, 'hits', 'Hits', 'ஹிட்ஸ்'),
(104, 'posts_stalker', 'Post\'s Stalker', 'இடுகையின் ஸ்டாக்கர்'),
(105, 'article_comments', 'Article\'s Comments', 'கட்டுரைகளின் கருத்துக்கள்'),
(106, 'snapshot_comments', 'Gallery\'s Comments', 'கேலரி கருத்துக்கள்'),
(107, 'article_likes', 'Article\'s Like', 'கட்டுரை போன்றது'),
(108, 'snapshot_likes', 'Gallery\'s Like', 'கேலரி லைக்'),
(109, 'edit_a_snapshot', 'Edit a Gallery', 'ஒரு தொகுப்பு திருத்தவும்'),
(110, 'basic_info', 'Basic Information', 'அடிப்படை தகவல்'),
(111, 'full_name', 'Full Name', 'முழு பெயர்'),
(112, 'gender', 'Gender', 'பாலினம்'),
(113, 'select_gender', 'Select Gender', 'பாலினத்தைத் தேர்ந்தெடுக்கவும்'),
(114, 'man', 'Male', 'ஆண்'),
(115, 'woman', 'Female', 'பெண்'),
(116, 'age', 'Age', 'வயது'),
(117, 'photo', 'Photo', 'புகைப்பட'),
(118, 'contact_info', 'Contact Information', 'தொடர்பு தகவல்'),
(119, 'phone_number', 'Phone Number', 'தொலைபேசி எண்'),
(120, 'address', '', ''),
(121, 'account_info', 'Account Info', 'கணக்கு தகவல்'),
(122, 'email', 'Email', 'மின்னஞ்சல்'),
(123, 'update_profile', 'Update Profile', 'சுயவிவரத்தை புதுப்பிக்கவும்'),
(124, 'write_an_article', 'Write an Post', 'ஒரு கட்டுரை எழுதவும்'),
(125, 'translation', 'Translation', ''),
(126, 'options', 'Options', 'விருப்பங்கள்'),
(127, 'edit_phrase', 'Edit Phrase', 'சொற்றொடரைத் திருத்தவும்'),
(128, 'delete_translation', 'Deleter Translation', ''),
(129, 'back', 'Back', 'மீண்டும்'),
(130, 'update_phrase', 'Update Phrase', 'சொற்றொடரைப் புதுப்பிக்கவும்'),
(131, 'commenting_on', 'Commenting on', 'கருத்து தெரிவித்தல்'),
(132, 'article', 'Post', 'கட்டுரை'),
(133, 'reply', 'Reply', 'பதில்'),
(134, 'report', 'Report', 'அறிக்கை'),
(135, 'commented_on', 'Commented on', 'கருத்து தெரிவித்துள்ளார்'),
(136, 'headline_news', 'Headline News', 'தலைப்பு செய்தி'),
(137, 'update_content', 'Update Content', 'உள்ளடக்கத்தை புதுப்பி'),
(138, 'visibility', 'Visibility', 'தன்மை'),
(139, 'updating_status', 'Updating status', 'நிலையை மேம்படுத்துகிறது'),
(140, 'home', 'Home', 'முகப்பு'),
(141, 'settings_updated', 'Setting\'s Updated', 'அமைப்பு புதுப்பிக்கப்பட்டது'),
(142, 'news_title', 'News Title', 'செய்திகள் தலைப்பு'),
(143, 'user', 'User', 'பயனர்'),
(144, 'act', 'Act', 'நாடகம்'),
(145, 'show', 'Show', 'காட்டு'),
(146, 'keywords', 'Keywords', 'முக்கிய வார்த்தைகள்'),
(147, 'showing', 'Showing', 'காட்டும்'),
(148, 'results_for_keywords', 'result for keywords', 'முக்கிய வார்த்தைகள் முடிவு'),
(149, 'register_new_account', 'Register New Account', 'புதிய கணக்கு பதிவு'),
(150, 'register_hint', 'All fields is required. Please fill all fields based your profile information to register.', 'அனைத்து துறைகள் தேவை.  பதிவு செய்ய உங்கள் சுயவிவரத் தகவலை அடிப்படையாகக் கொண்ட அனைத்து புலங்களையும் நிரப்புக.'),
(151, 'username', 'Username', 'பயனர்பெயர்'),
(152, 'retype_password', 'Retype Password', 'கடவுச்சொல்லை மீண்டும் தட்டச்சு செய்க'),
(153, 'mobile', 'Mobile', 'மொபைல்'),
(154, 'email_address', 'Email Address', 'மின்னஞ்சல் முகவரி'),
(155, 'profile_updated_successfully', 'Profile was updated successfully!', 'சுயவிவரத்தை வெற்றிகரமாக புதுப்பிக்கப்பட்டது!'),
(156, 'confirmation_password', 'Confirmation password', 'உறுதிப்படுத்தல் கடவுச்சொல்'),
(157, 'biography', 'Biography', 'சுயசரிதை'),
(158, 'liking_on', 'likin on', 'likin மீது'),
(159, 'login_error', 'Your email or username and password doesn\'t match!', 'உங்கள் மின்னஞ்சல் அல்லது பயனர் பெயர் மற்றும் கடவுச்சொல் பொருந்தவில்லை!'),
(160, 'coming_soon', 'Coming soon', 'விரைவில் வருகிறது'),
(161, 'open_letter', 'News &amp; Event', 'செய்தி & நிகழ்வு'),
(162, 'petition', 'Petitions', 'மனுக்களை'),
(163, 'welcome', 'Welcome', 'வரவேற்பு'),
(164, 'account_details', 'About Me', 'என்னை பற்றி'),
(165, 'is_following_you', 'Is following you', 'நீங்கள் தொடர்ந்து வருகிறீர்கள்'),
(166, 'mon', 'Mon', 'தி'),
(167, 'photo_changed', 'Photo changed', 'புகைப்படம் மாற்றப்பட்டது'),
(168, 'cover_changed', 'Cover changed', 'மாற்றம் மாற்றப்பட்டது'),
(169, 'tue', 'Tue', 'செ'),
(170, 'photo_changed_successfully', 'Your profile picture was changed successfully!', 'உங்கள் சுயவிவர படம் வெற்றிகரமாக மாற்றப்பட்டது!'),
(171, 'alert', 'Alert', 'எச்சரிக்கை'),
(172, 'cover_changed_successfully', 'Your profile cover was changed successfully!', 'உங்கள் சுயவிவர அட்டை வெற்றிகரமாக மாற்றப்பட்டது!'),
(173, 'welcome_back', 'Welcome Back', 'மீண்டும் வருக'),
(174, 'greeting_messages', 'Everyone have a choice to publish their own reportation. Here you can writing article or uploading snapshot and share through worldwide!', 'எல்லோருக்கும் தங்கள் சொந்த அறிக்கையை வெளியிட ஒரு தேர்வு உள்ளது.  இங்கே நீங்கள் கட்டுரையை எழுதுவது அல்லது உலகளாவிய ரீதியிலான ஸ்னாப்ஷாட் மற்றும் பகிர்வது!'),
(175, 'write_article', 'Write an post', 'ஒரு கட்டுரை எழுதவும்'),
(176, 'upload_snapshot', 'Upload a Snapshot', 'ஒரு நொடிப்பைப் பதிவேற்றவும்'),
(177, 'more_than', 'More than', 'விட'),
(178, 'people_became_reporter', 'people became reporters', 'மக்கள் செய்தியாளர்களாக ஆனார்கள்'),
(179, 'stalker', 'Stalker', 'வேட்டைக்காரர்'),
(180, 'clear_notifications', '', ''),
(181, 'descriptions', 'Descriptions', 'விளக்கம்'),
(182, 'time', 'Time', 'நேரம்'),
(183, 'view', 'View', 'காண்க'),
(184, 'you_do_not_have_any_notification', 'You do not have any notification', 'உங்களுக்கு எந்த அறிவிப்பும் இல்லை'),
(185, 'wed', 'Wed', 'திருமணம் செய்'),
(186, 'thu', 'Thu', 'வி'),
(187, 'edit_post', 'Edit Post', 'இடுகையைத் திருத்தவும்'),
(188, 'show_what_you_have_take_with_your_cam', 'Show what you have take with your camera', 'உங்கள் கேமராவுடன் எடுத்துக் கொண்டதைக் காட்டு'),
(189, 'headline', 'Headline', 'ஹெட்லைன்'),
(190, 'content', 'Content', 'உள்ளடக்க'),
(191, 'snapshots', 'Gallerys', 'Gallerys'),
(192, 'snapshot_added_successfully', 'Gallery was uploaded successfully!', 'ஸ்னாப்ஷாட் வெற்றிகரமாக பதிவேற்றப்பட்டது!'),
(193, 'open_letters', 'Open News', 'திறந்த கடிதங்கள்'),
(194, 'petitions', 'Petitions', 'மனுக்களை'),
(195, 'new_letter', 'New Event', 'புதிய நிகழ்வு'),
(196, 'target', 'Target', 'இலக்கு'),
(197, 'letter_headline', 'Event Headline', 'நிகழ்வு தலைப்பு'),
(198, 'aimed_to', 'Aimmed To', 'உருவானது'),
(199, 'target_details', 'Target Details', 'இலக்கு விவரங்கள்'),
(200, 'write_complete_letter_here', 'Write complete letter here', 'இங்கே முழு கடிதத்தை எழுதுங்கள்'),
(201, 'submit_new_open_letter', 'Submit open news', 'திறந்த கடிதத்தை சமர்ப்பி'),
(202, 'letter_content', 'Letter Content', 'கடிதம் உள்ளடக்கம்'),
(203, 'open_letter_added_successfully', 'Ness was added successfully!', 'திறந்த கடிதம் வெற்றிகரமாக சேர்க்கப்பட்டது!'),
(204, 'open_letter_updated_successfully', 'News was updated successfully!', 'திறந்த கடிதம் வெற்றிகரமாக புதுப்பிக்கப்பட்டது!'),
(205, 'sincerely', 'Sincerely', 'உண்மையுள்ள'),
(206, 'read_letter', 'Read news', 'கடிதம் வாசிக்கவும்'),
(207, 'response_to_this_letter', 'Response to this letter', 'இந்த கடிதத்தில் பதில்'),
(208, 'messages', 'Messages', 'செய்திகள்'),
(209, 'repost_this_update', 'Repost this update', 'இந்த புதுப்பிப்பை மீண்டும் எழுதவும்'),
(210, 'say_something', 'Say something', 'ஏதாவது கூறுங்கள்'),
(211, 'repost', 'Repost', 'மறுஇடுகை'),
(212, 'repost_this_article', 'Repost this article', 'இந்த கட்டுரையைப் படியுங்கள்'),
(213, 'repost_this_letter', 'Repost this letterp', 'இந்த கடிதத்தை எழுதுங்கள்'),
(214, 'writing_an_open_letter', 'Writing an7', 'ஒரு திறந்த கடிதம் எழுதுதல்'),
(215, 'openletters', 'Open Letters', 'திறந்த கடிதங்கள்'),
(216, 'write_letter_and_remind_others', 'Write letter and remind others', 'கடிதம் எழுதி பிறரை ஞாபகப்படுத்துங்கள்'),
(217, 'page_not_found', 'Page Not Found!', 'பக்கம் காணப்படவில்லை!'),
(218, 'whatever_you_writing_for_is_a_reportations', 'Whatever you writing for is a reportations', 'நீங்கள் எதை எழுதினாலும் ஒரு அறிக்கைகள்'),
(219, 'share_everything_you_take_by_camera', 'Share everything you take by your camera', 'உங்கள் கேமரா மூலம் எடுக்கும் அனைத்தையும் பகிர்'),
(220, 'write_letter_for_justice', 'Write letter for justice', 'நீதிக்கான கடிதத்தை எழுதுங்கள்'),
(221, 'page_not_found_descriptions', 'The page you trying to access is currently unavailable', 'நீங்கள் அணுக முயற்சிக்கும் பக்கம் தற்போது கிடைக்கவில்லை'),
(222, 'does_not_have_any_follower', 'Does not have any follower', 'பின்பற்றுபவர் இல்லை'),
(223, 'does_not_have_any_friend', 'Does not have friend', 'நண்பர் இல்லை'),
(224, 'does_not_follow_any_user', 'Does not follow any user', 'எந்த பயனரையும் பின்பற்ற வேண்டாம்'),
(225, 'images', 'Images', 'படங்களை'),
(226, 'add_post', 'Add Post', 'இடுகையைச் சேர்'),
(227, 'category_id', 'Category ID', 'வகை ஐடி'),
(228, 'tags_contain_unsupported_characters', 'Tags contain unsupported character. You can separate tags by commas.', 'குறிப்புகள் ஆதரிக்கப்படாத தன்மையைக் கொண்டிருக்கின்றன.  குறிச்சொற்கள் மூலம் குறிச்சொற்களை பிரிக்கலாம்.'),
(229, 'post_added_successfully', 'Post was added successfully', 'இடுகை வெற்றிகரமாக சேர்க்கப்பட்டது'),
(230, 'image', 'Snapshot', 'நொடிப்பு'),
(231, 'about_this_image', 'About this snapshot', 'இந்த ஸ்னாப்ஷாட் பற்றி'),
(232, 'snapshot_updated_successfully', 'Snapshot was updated successfully', 'ஸ்னாப்ஷாட் வெற்றிகரமாக புதுப்பிக்கப்பட்டது'),
(233, 'repost_success', 'Repost success!', 'வருகை வெற்றி!'),
(234, 'repost_this_image', 'Repost this Snapshot', 'இந்த ஸ்னாப்ஷாட்டைப் படியுங்கள்'),
(235, 'repost_this_snapshot', 'Repostthis Snapshot', 'Repostthis Snapshot'),
(236, 'became_translator', 'Became Translator', 'Became Translator'),
(237, 'requesting_friendship_to_you', 'Requesting friendship to you', 'Requesting friendship to you'),
(238, 'letter', 'Letter', 'Letter'),
(239, 'views', 'Views', 'Views'),
(240, 'post_updated_successfully', '', ''),
(241, 'the_page_was_not_found', 'The page was not found', 'பக்கம் காணப்படவில்லை'),
(242, 'search_title_tags_or_everything', 'Search title, tags or everything', 'தேடல் தலைப்பு, குறிச்சொற்கள் அல்லது எல்லாம்'),
(243, 'users', 'Users', 'பயனர்கள்'),
(244, 'global_settings', 'Global Settings', 'உலகளாவிய அமைப்புகள்'),
(245, 'sitetitle', 'Site Title', 'தள தலைப்பு'),
(246, 'sitedescription', 'Site Descriptions', 'தள விவரம்'),
(247, 'sitetheme', 'Site Theme', 'தளத்தின் தீம்'),
(248, 'sitelang', 'Default Language', ''),
(249, 'sitephone', 'Site Phone', 'தள தொலைபேசி'),
(250, 'on', 'on', 'மீது'),
(251, 'facebook_login', 'Facebook Login', ''),
(252, 'complete_your_account', 'Complete Your Account', 'உங்கள் கணக்கை முடிக்கவும்'),
(253, 'choose_username', 'Choose username', 'பயனர்பெயரைத் தேர்வுசெய்க'),
(254, 'instant_login', 'Using Facebook', 'பேஸ்புக் பயன்படுத்துதல்'),
(255, 'add_snapshots', 'Upload a Snaphot', 'ஒரு ஸ்னாப் பதிவேற்றவும்'),
(256, 'are_you_have_a_reports', 'Do you have reports today?', 'உங்களுக்கு இன்று அறிக்கைகள் இருக்கிறதா?'),
(257, 'do_you_have_any_reports_today', 'Do you have reports today?', 'உங்களுக்கு இன்று அறிக்கைகள் இருக்கிறதா?'),
(258, 'administration', 'Administation', 'மேனேஜ்மென்ட்'),
(259, 'post_categories', 'Post Categories', 'இடுகை வகைகள்'),
(260, 'register_since', 'Register Since', 'முதல் பதிவு'),
(261, 'last_login', 'Last Login', 'கடைசி தேதி'),
(262, 'level', 'Level', 'நிலை'),
(263, 'contributor', 'Contributor', 'பங்களிப்பாளர்'),
(264, 'administrator', 'Administrator', 'நிர்வாகி'),
(265, 'new_category', 'New Category', 'புதிய வகை'),
(266, 'category_title', 'Category Title', 'வகை தலைப்பு'),
(267, 'posts_total', 'Post Total', 'மொத்தம் இடுகை'),
(268, 'category_descriptions', 'Category Descriptions', 'வகை விளக்கம்'),
(269, 'category_updated_successfully', 'Category was updated successfully', 'வகை வெற்றிகரமாக புதுப்பிக்கப்பட்டது'),
(270, 'does_not_have_any_update', 'Does not have any update', 'புதுப்பிப்பு இல்லை'),
(271, 'manage_category', 'Manage Category', 'வகை நிர்வகி'),
(272, 'manage_user', 'Manage Users', 'பயனர்களை நிர்வகி'),
(273, 'add_new_category', 'Add New Category', 'புதிய வகை சேர்க்கவும்'),
(274, 'category_added_successfully', 'Category was added successfully!', 'பகுப்பு வெற்றிகரமாக சேர்க்கப்பட்டது!'),
(275, 'add_category', 'Add Category', 'பகுதியைச் சேர்'),
(276, 'visitors', 'Visitors', 'பார்வையாளர்கள்'),
(277, 'liking_own_snapshot', 'Liking own snapshot', 'சொந்த ஸ்னாப்ஷாட்டை விரும்புவது'),
(278, 'liking_own_article', 'Liking own article', 'சொந்த கட்டுரையைப் போல'),
(279, 'commenting_own_article', 'Comenting own article', 'சொந்த கட்டுரை கூறுகிறது'),
(280, 'accepted_your_friend_request', 'Accepted your friend request', 'உங்கள் நண்பர் வேண்டுகோளை ஏற்றுக்கொண்டார்'),
(281, 'update_info', 'Update Profile', 'சுயவிவரத்தை புதுப்பிக்கவும்'),
(282, 'unfollow', 'Unfollow', 'பின்தொடராட்'),
(283, 'waiting_approval', 'Waiting Approval', 'ஒப்புதல் காத்திருக்கிறது'),
(284, 'follow', 'Follow', 'பின்பற்றவும்'),
(285, 'confirm_request', 'Confirm Request', 'கோரிக்கையை உறுதிப்படுத்தவும்'),
(286, 'please_login_to_comment', 'Please login to comment', 'கருத்து தெரிவிக்க உள்நுழையவும்'),
(287, 'add_friend', 'Add Friend', 'நண்பரை சேர்க்கவும்'),
(288, 'unfriend', 'Unfriend', 'புறக்கணிக்க'),
(289, 'do_you_have_any_snapshot_in_your_camera', 'Do you have any snapshot in your camera?', 'உங்கள் கேமராவில் ஏதேனும் ஸ்னாப்ஷாட் இருக்கிறதா?'),
(290, 'momment_have_been_documented', 'momment have been documented', 'தாய்மை ஆவணப்படுத்தப்பட்டுள்ளது'),
(291, 'do_you_write_letter_for_better_changes', 'Do you write letter for better changes?', 'சிறந்த மாற்றங்களுக்கு நீங்கள் கடிதம் எழுதுகிறீர்களா?'),
(292, 'write_letter', 'Write Letter', 'கடிதம் எழுதுங்கள்'),
(293, 'letter_have_been_responded', 'letter have been responded', 'கடிதம் பதிலளித்தது'),
(294, 'most_views', 'Most Views', 'மிகவும் பார்வை'),
(295, 'write_new_letter', 'Write a Letter', 'கடிதம் எழுது'),
(296, 'connect_to_facebook', 'Connect to Facebook', 'பேஸ்புக்கில் இணைக்கவும்'),
(297, 'account_connected_to_facebook', 'Your account was linked to Facebook!', 'உங்கள் கணக்கு பேஸ்புடன் இணைக்கப்பட்டது!'),
(298, 'do_not_connect_to_facebook', 'Disconnect Facebook', 'பேஸ்புக் இணைப்பைத் துண்டிக்கவும்'),
(299, 'letter_added_successfully', 'Your letter was submitted successfully!', 'உங்கள் கடிதம் வெற்றிகரமாக சமர்ப்பிக்கப்பட்டது!'),
(300, 'please_login_to_upload', 'Please login to upload!', ''),
(301, 'sharing_is_caring', 'Sharing is Caring!', 'பகிர்தலே அக்கறை காட்டுதல்!'),
(302, 'sharing_is_caring_post_desc', 'Share this post to get more readers. Click button below to share this article to your friends in social media:', 'மேலும் வாசகர்கள் பெற இந்த இடுகையைப் பகிர்க.  சமூக ஊடகங்களில் உங்கள் நண்பர்களுக்கு இந்த கட்டுரையைப் பகிர்ந்து கொள்ள கீழே உள்ள பொத்தானைக் கிளிக் செய்யவும்:'),
(303, 'sharing_is_caring_snapshot_desc', 'Share this snapshot to get more readers. Click button below to share this image to your friends in social media:', 'மேலும் வாசகர்களைப் பெற இந்த ஸ்னாப்ஷாட்டைப் பகிரவும்.  சமூக ஊடகங்களில் உங்கள் நண்பர்களுக்கு இந்த படத்தை பகிர்ந்து கொள்ள கீழே உள்ள பொத்தானைக் கிளிக் செய்யவும்:'),
(304, 'registration_successfull', 'Registration successfull!', 'பதிவு வெற்றிகரமாக!'),
(305, 'tv_channels', 'TV Channels', ''),
(306, 'do_you_have_channel_to_publish', 'Do you have private or favorites channel to publish your own reportage?', 'உங்களுடைய சொந்த அறிக்கையை வெளியிட தனியார் அல்லது பிடித்த சேனல்கள் உங்களிடம் உள்ளனவா?'),
(307, 'publish_channel', 'Publish Channel', 'சேனலை வெளியிடுக'),
(308, 'online_tv_streaming_on_demand', 'Online TV Streaming on Demand', 'ஆன்லைனில் டிவி ஸ்ட்ரீமிங் தேவை'),
(309, 'tv', 'TV', 'டிவி'),
(310, 'tv_channel', 'TV Channels', 'டிவி சேனல்கள்'),
(311, 'new_channel', 'New Channel', 'புதிய சேனல்'),
(312, 'url', 'Channel URL', 'சேனல் URL'),
(313, 'edit_tv_channel', 'Edit TV Channel', 'டிவி சேனலைத் திருத்தவும்'),
(314, 'channel_title', 'Channel Title', 'சேனல் தலைப்பு'),
(315, 'channel_url', 'Channel URL', 'சேனல் URL'),
(316, 'channel_url_notes', 'You must have valid m3u8 URL to publish your channel!', 'உங்கள் சேனலை வெளியிட, உங்களுக்கு m3u8 சரியான URL இருக்க வேண்டும்!'),
(317, 'about_this_channel', 'About this Channel', 'இந்த சேனலைப் பற்றி'),
(318, 'write_channel_descriptions', 'Write channel descriptions', 'சேனல் விளக்கங்களை எழுதுக'),
(319, 'edit_channel', 'Edit Channel', 'சேனலைத் திருத்தவும்'),
(320, 'add_new_tv_channel', 'Add New TV Channel', 'புதிய டிவி சேனலைச் சேர்க்கவும்'),
(321, 'add_channel', 'Add Channel', 'சேனலைச் சேர்'),
(322, 'add_tv_channel', 'Add TV Channel', 'டிவி சேனலைச் சேர்க்கவும்'),
(323, 'channel_descriptions', 'Channel Description', 'சேனல் விவரம்'),
(324, 'channel_logo', 'Cannel Logo', 'Cannel லோகோ'),
(325, 'hash_incorrect', 'Token was incorrected!', 'டோக்கன் தவறானது!'),
(326, 'watch', 'Watch', 'வாட்ச்'),
(327, 'sharing_is_caring_desc', 'Share this post to get more readers. Click button below to share this image to your friends in social media:', 'மேலும் வாசகர்கள் பெற இந்த இடுகையைப் பகிர்க.  சமூக ஊடகங்களில் உங்கள் நண்பர்களுக்கு இந்த படத்தை பகிர்ந்து கொள்ள கீழே உள்ள பொத்தானைக் கிளிக் செய்யவும்:'),
(328, 'channel_added_successfully', 'Channel was added successfully!', 'சேனல் வெற்றிகரமாக சேர்க்கப்பட்டது!'),
(329, 'channel_updated_successfully', 'Channel was updated successfully!', 'சேனல் வெற்றிகரமாக புதுப்பிக்கப்பட்டது!'),
(330, 'sharing_is_caring_channel_desc', 'Share this channel to get more viewers. Click button below to share this image to your friends in social media:', 'மேலும் பார்வையாளர்களைப் பெற இந்த சேனலைப் பகிரவும்.  சமூக ஊடகங்களில் உங்கள் நண்பர்களுக்கு இந்த படத்தை பகிர்ந்து கொள்ள கீழே உள்ள பொத்தானைக் கிளிக் செய்யவும்:'),
(331, 'feedback', 'Feedback', 'பின்னூட்டம்'),
(332, 'updated_on', 'Updated on', 'புதுப்பிக்கப்பட்டது'),
(333, 'manage_pages', 'Manage Pages', 'பக்கங்களை நிர்வகி'),
(334, 'pages', 'Pages', 'பக்கங்கள்'),
(335, 'new_page', 'New Page', 'புதிய பக்கம்'),
(336, 'visits_count', 'Visits Count', 'வருகைகள் எண்ணிக்கை'),
(337, 'edit_page', 'Edit Page', 'பக்கத்தைத் திருத்தவும்'),
(338, 'page_title', 'Page Title', 'பக்க தலைப்பு'),
(339, 'select_language', 'Select Language', 'மொழியைத் தேர்ந்தெடுங்கள்'),
(340, 'write_page_content_here', 'Write complete page content here', 'முழுமையான பக்க உள்ளடக்கத்தை இங்கே எழுதுங்கள்'),
(341, 'page_updated_successfully', 'Page was updated successfully!', 'பக்கம் வெற்றிகரமாக புதுப்பிக்கப்பட்டது!'),
(342, 'contact_us', 'Contact Us', 'எங்களை தொடர்பு கொள்ள'),
(343, 'enter_full_name', 'Enter Fullname', 'முழு பெயர் சேர்க்கவும்'),
(344, 'enter_email', 'Enter Email', 'மின்னஞ்சல் உள்ளிடவும்'),
(345, 'enter_phone_number', 'Enter Phone Number', 'தொலைபேசி எண் உள்ளிடவும்'),
(346, 'write_messages', 'Write Your Messages', 'உங்கள் செய்திகளை எழுதுங்கள்'),
(347, 'also_send_to_me', 'Also copy to me', 'என்னை நகலெடுக்கவும்'),
(348, 'submit', 'Submit', 'சமர்ப்பி'),
(349, 'phone', 'Phone', 'தொலைபேசி'),
(350, 'fax', 'Fax', 'தொலைநகல்'),
(351, 'messenger', 'Messenger', 'தூதர்'),
(352, 'bbm_pin', 'BBM PIN', 'பிபிஎம் PIN'),
(353, 'website', 'Website', 'இணையதளம்'),
(354, 'edit_user', 'Edit User', 'பயனர் திருத்து'),
(355, 'see_all', 'See All', 'அனைத்தையும் பார்'),
(356, 'copy_email', 'Also send to me', 'எனக்கு அனுப்பவும்'),
(357, 'thank_you', 'Thank you', 'நன்றி'),
(358, 'your_messages_were_submitted', 'Your message was successfully received and being reviewed by our team.', 'உங்கள் செய்தி வெற்றிகரமாகப் பெற்றது, எங்கள் குழு மதிப்பாய்வு செய்யப்பட்டது.'),
(359, 'here_is_your_message_copies', 'Here is your message copies', 'இங்கே உங்கள் செய்தி பிரதிகள்'),
(360, 'submitted_date', 'Date Submitted', 'சமர்ப்பிக்கப்பட்ட தேதி'),
(361, 'thanks_for_your_attention', 'Thank\'s for your attentions', 'Thank\'s for your attentions'),
(362, 'contact_messages_submitted', 'Your message was successfully received and being reviewed by our team.', 'Your message was successfully received and being reviewed by our team.'),
(363, 'subjects', 'Subjects', 'Subjects'),
(364, 'enter_subject_of_messages', 'Enter your messages subject', 'Enter your messages subject'),
(365, 'subject', 'Subject', 'Subject'),
(366, 'no_content', '', ''),
(367, 'other', '', ''),
(368, 'edit_letter', '', ''),
(369, 'choose_available_translation_above_to_set_your_language', '', ''),
(370, 'editor_choice', '', ''),
(371, 'editor_choices', '', ''),
(372, 'add_new_letter', '', ''),
(373, 'main_menu', '', ''),
(374, 'my_account', '', ''),
(375, 'add_page', '', ''),
(376, 'created_pages', '', ''),
(377, 'readers', '', ''),
(378, 'repost_this_channel', '', ''),
(379, 'please_login_to_repost', '', ''),
(380, 'edit_open_letter', '', ''),
(381, 'letter_updated_successfully', '', ''),
(382, 'new_from_snapshots', '', ''),
(383, 'enter_your_age', '', ''),
(384, 'enter_mobile_number', '', ''),
(385, 'enter_full_address', '', ''),
(386, 'select_username', '', ''),
(387, 'enter_password', '', ''),
(388, 'last_users', '', ''),
(389, 'view_all', '', ''),
(390, 'new_from_open_letters', '', ''),
(391, 'by', '', ''),
(392, 'updates_stream', '', ''),
(393, 'people_are_watching', '', ''),
(394, 'search_user', '', ''),
(395, 'searching', '', ''),
(396, 'navigation', '', ''),
(397, 'add_new_page', '', ''),
(398, 'unable_to_submit_inquiry', '', ''),
(399, 'notification', '', ''),
(400, 'send_something', '', ''),
(401, 'post_something', '', ''),
(402, 'send_snapshot', '', ''),
(403, 'submit_open_letter', '', ''),
(404, 'submit_tv_channel', '', ''),
(405, 'choose_what_is_in_your_mind_right_now', '', ''),
(406, 'update_snapshot', '', ''),
(407, 'updating', '', ''),
(408, 'unable_to_update_snapshot', '', ''),
(409, 'edit_snapshot', '', ''),
(410, 'unable_to_update_article', '', ''),
(411, 'unable_to_update_settings', '', ''),
(412, 'update_configuration', '', ''),
(413, 'be_first_to_comment', '', ''),
(414, 'info', '', ''),
(415, 'bio', '', ''),
(416, 'public', '', ''),
(417, 'post', '', ''),
(418, 'signing_in', '', ''),
(419, 'sign_in', '', ''),
(420, 'unable_to_signing_in', '', ''),
(421, 'another_articles', '', ''),
(422, 'unable_to_update_profile', '', ''),
(423, 'profile_was_updated_successfully', '', ''),
(424, 'welcome_to_user_control_panel', '', ''),
(425, 'another_open_letters', '', ''),
(426, 'unable_to_update_letter', '', ''),
(427, 'another_channels', '', ''),
(428, 'username_or_password_did_not_match', '', ''),
(429, 'add_translation', '', ''),
(430, 'leave_page_confirm', '', ''),
(431, 'you_have_not_submitted_your_changes', '', ''),
(432, 'do_you_want_to_leave_page_without_changes', '', ''),
(433, 'leave_page', '', ''),
(434, 'stay_here', '', ''),
(435, 'unable_to_update_translation', '', ''),
(436, 'number_of_phrase', '', ''),
(437, 'translation_was_updated_successfully', '', ''),
(438, 'saving', '', ''),
(439, 'unable_to_save_snapshot', '', ''),
(440, 'add_snapshot', '', ''),
(441, 'choose_photo', '', ''),
(442, 'copyright_credits', '', ''),
(443, 'credit_about_this_photo', '', ''),
(444, 'please_provide_copyright_credits_if_it_is_not_your_own_photo', '', ''),
(445, 'snapshot_was_successfully_submitted', 'gallaery susscessfully submitted', 'gallaery susscessfully submitted'),
(446, 'credits_to', '', ''),
(447, 'another_snapshots', '', ''),
(448, 'registering', '', ''),
(449, 'unable_to_register', '', ''),
(450, 'your_account_was_created', '', ''),
(451, 'share', '', ''),
(452, 'article_was_updated_successfully', '', ''),
(453, 'oops', '', ''),
(454, 'unable_to_update_channel', '', ''),
(455, 'add_article', '', ''),
(456, 'unable_to_add_article', '', ''),
(457, 'find_us', '', ''),
(458, 'send_feedback', '', ''),
(459, 'send', '', ''),
(460, 'sending', '', ''),
(461, 'unable_to_send_your_messages', '', ''),
(462, 'from', '', ''),
(463, 'add_open_letter', '', ''),
(464, 'unable_to_save_letter', '', ''),
(465, 'unable_to_save_category', '', ''),
(466, 'edit_category', '', ''),
(467, 'unable_to_update_category', '', ''),
(468, 'unable_to_add_page', '', ''),
(469, 'unable_to_update_page', '', ''),
(470, 'unable_to_save_channel', '', ''),
(471, 'unable_to_update_user_information', '', ''),
(472, 'basic_information', '', ''),
(473, 'unable_to_update_your_profile', '', ''),
(474, 'submit_channel', '', ''),
(475, 'another_awesome_build_with', '', ''),
(476, 'and', '', ''),
(477, 'hosted_by_sponsor_server', '', ''),
(478, 'configuration_saved', '', ''),
(479, 'has_no_friend', '', ''),
(480, 'has_no_follower', '', ''),
(481, 'read_another_articles', '', ''),
(482, 'view_another_snapshots', '', ''),
(483, 'read_another_openletter', '', ''),
(484, 'watch_another_tv', '', ''),
(485, 'action_success', '', ''),
(486, 'are_you_sure_want_to_continue', '', ''),
(487, 'success', '', ''),
(488, 'remove_comment', '', ''),
(489, 'delete_this_updates', '', ''),
(490, 'updates', '', ''),
(491, 'liking_own_updates', '', ''),
(492, 'i_do_not_want_to_see_this', '', ''),
(493, 'delete_this_snapshot', '', ''),
(494, 'reposting_own_snapshot', '', ''),
(495, 'submitting_a_tv_channel', '', ''),
(496, 'delete_this_tv', '', ''),
(497, 'commenting_own_opdates', '', ''),
(498, 'commenting_own_snapshot', '', ''),
(499, 'commenting_own_updates', '', ''),
(500, 'commenting_own_post', '', ''),
(501, 'article_was_submitted_successfully', '', ''),
(502, 'openletter', '', ''),
(503, 'submitting_an_open_letter', '', ''),
(504, 'in', '', ''),
(505, 'unable_to_delete_this_likes', '', ''),
(506, 'online', '', ''),
(507, 'delete_this_openletter', '', ''),
(508, 'unable_to_proccess_your_request', '', ''),
(509, 'your_internet_was_disconnected', '', ''),
(510, 'please_enter_some_text_to_submit', '', ''),
(511, 'july', '', ''),
(512, 'june', '', ''),
(513, 'may', '', ''),
(514, 'april', '', ''),
(515, 'march', '', ''),
(516, 'february', '', ''),
(517, 'january', '', ''),
(518, 'december', '', ''),
(519, 'november', '', ''),
(520, 'october', '', ''),
(521, 'september', '', ''),
(522, 'august', '', ''),
(523, 'reposting', '', ''),
(524, 'unable_to_repost_this_snapshot', '', ''),
(525, 'comments_was_successfully_removed', '', ''),
(526, 'accept', '', ''),
(527, 'unable_to_repost_this_update', '', ''),
(528, 'updates_was_successfully_reported', '', ''),
(529, 'hide_this_feed', '', ''),
(530, 'unable_to_repost_this_post', '', ''),
(531, 'commenting_user_post', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; article', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; article'),
(532, 'liking_user_snapshot', 'liked on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; snapshot', 'liked on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; snapshot'),
(533, 'reposting_user_post', 'reposting &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; article', 'reposting &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; article'),
(534, 'reposting_user_updates', 'reposting &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; updates', 'reposting &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; updates'),
(535, 'commenting_user_snapshot', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; snapshot', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; snapshot'),
(536, 'commenting_user_updates', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; updates', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; updates'),
(537, 'liking_own_openletter', '', ''),
(538, 'liking_user_post', 'liked on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; article', 'liked on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; article'),
(539, 'commenting_user_openletter', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; letter', 'commented on &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; letter'),
(540, 'liking_on_snapshot', '', ''),
(541, 'commented_on_snapshot', '', ''),
(542, 'commented_on_pembaruan', '', ''),
(543, 'commented_on_artikel', '', ''),
(544, 'reposting_updates', '', ''),
(545, 'commented_on_updates', '', ''),
(546, 'commented_on_article', '', ''),
(547, 'liking_user_openletter', 'liking &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; openletter', 'liking &lt;a href=&quot;base_url/%1&quot; class=&quot;ajaxLoad hoverCard&quot;&gt;%2&lt;/a&gt; openletter'),
(548, 'update_user_profile', '', ''),
(549, 'snapshot_was_updated_successfully', '', ''),
(550, 'upate_channel', '', ''),
(551, 'update_page', '', ''),
(552, 'site_information', '', ''),
(553, 'website_name', '', ''),
(554, 'company_or_business_name', '', ''),
(555, 'website_description', '', ''),
(556, 'company_slogan_and_showcase', '', ''),
(557, 'website_footer', '', ''),
(558, 'footer_notes', '', ''),
(559, 'theme', '', ''),
(560, 'contact_information', '', ''),
(561, 'settings_address', '', ''),
(562, 'type_company_address', '', ''),
(563, 'settings_phone', '', ''),
(564, 'type_company_phone', '', ''),
(565, 'settings_fax', '', ''),
(566, 'type_company_fax', '', ''),
(567, 'settings_email', '', ''),
(568, 'type_company_email', '', ''),
(569, 'yahoo_messenger', '', ''),
(570, 'add', '', ''),
(571, 'ym_username_or_email', '', ''),
(572, 'parent_cannot_removed', '', ''),
(573, 'child_removed_or_not_exist.', '', ''),
(574, 'settings_image_error', '', ''),
(575, 'update_open_letter', 'update_open_letter', 'update_open_letter'),
(576, 'unable_to_submit_your_comment', '', ''),
(577, 'letter_was_updated_successfully', '', ''),
(578, 'page_was_created_successfully', '', ''),
(579, 'page_was_successfully_updated', '', ''),
(580, 'add_administration', 'Add Administration', 'Add Administration'),
(581, 'administration', 'Administration', 'Administration'),
(582, 'edit_administration', 'Edit Administration', 'Edit Administration'),
(583, 'user_profile_was_updated_successfully', '', ''),
(584, 'unable_to_update_your_status', '', ''),
(585, 'about_me', 'About Me', 'என்னை பற்றி'),
(586, 'father_name', 'Father Name', 'தந்தையின் பெயர்'),
(587, 'mother_name', 'Mother Name', 'அம்மா பெயர்'),
(588, 'birth_date', 'Birth Date', 'பிறந்த தேதி'),
(589, 'birth_place', 'Birth Place', 'பிறந்த இடம்'),
(590, 'seminary', 'Seminary', 'கல்லூரி'),
(591, 'ordination_date', 'Ordination Date', 'Ordination Date'),
(592, 'place_ordination', 'Ordination place', 'Ordination place'),
(593, 'ordination_by', 'Ordination By', 'Ordination By'),
(594, 'parish', 'Parish', 'Parish'),
(595, 'letter_was_successfully_submitted', '', ''),
(596, 'category_was_successfully_submitted', '', ''),
(597, 'posts_was_successfully_reported', '', ''),
(598, 'updates_was_successfully_removed', '', ''),
(599, 'unable_to_delete_this_updates', '', ''),
(600, 'snapshots_was_successfully_reported', '', ''),
(601, 'unable_to_submit_channel', '', ''),
(602, 'channel_was_submitted_successfully', '', ''),
(603, 'channel_was_updated_successfully', '', ''),
(604, 'unable_to_save_article', '', ''),
(605, 'liking_user_tv', '', ''),
(606, 'your_messages_was_successfully_submitted', '', ''),
(607, 'something_went_wrong_submitting_your_feedback', '', ''),
(608, 'reposting_user_snapshot', '', ''),
(609, 'category_was_successfully_updated', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `like` int(22) NOT NULL,
  `dislike` int(22) NOT NULL,
  `likeType` int(1) NOT NULL COMMENT '0 = updates, 1 = posts, 2 = snapshots, 3 = openletters',
  `date` int(22) NOT NULL,
  `timestamp` int(22) NOT NULL,
  `is_viewed` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `itemID`, `userID`, `like`, `dislike`, `likeType`, `date`, `timestamp`, `is_viewed`) VALUES
(0, 5, 1, 1, 0, 2, 0, 1551932787, NULL),
(0, 4, 1, 1, 0, 2, 0, 1551932798, NULL),
(0, 3, 1, 0, 1, 2, 0, 1552317907, NULL),
(0, 1, 268, 1, 0, 4, 0, 1555384820, NULL),
(0, 33, 301, 0, 1, 2, 0, 1582548601, NULL),
(0, 42, 356, 1, 0, 2, 0, 1706447421, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `ntitle` varchar(100) NOT NULL,
  `nlink` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsandevents`
--

CREATE TABLE `newsandevents` (
  `id` int(11) NOT NULL,
  `ctitle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsandevents`
--

INSERT INTO `newsandevents` (`id`, `ctitle`) VALUES
(5, 'Our Bishop celebrates his Birthday on 21, October, 2017');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `n_title` varchar(100) DEFAULT NULL,
  `n_file_path` varchar(100) DEFAULT NULL,
  `n_slug` varchar(100) DEFAULT NULL,
  `n_filename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `n_title`, `n_file_path`, `n_slug`, `n_filename`) VALUES
(15, 'October - 2019', 'http://kuzhithuraidiocese.com/uploads/newsletters/af253e48042fb6a59bfc40a16db40608.pdf', 'October_-_2019', 'af253e48042fb6a59bfc40a16db40608.pdf'),
(16, 'November', 'http://kuzhithuraidiocese.com/uploads/newsletters/32d5fab07f1e3c73093309ea14d7bb69.pdf', 'November', '32d5fab07f1e3c73093309ea14d7bb69.pdf'),
(17, 'December - 2019', 'http://kuzhithuraidiocese.com/uploads/newsletters/3c5a83bd29fba45c3929d648e8541be1.pdf', 'December_-_2019', '3c5a83bd29fba45c3929d648e8541be1.pdf'),
(18, 'Puthiya Thedal - June 2020', 'https://kuzhithuraidiocese.com/uploads/newsletters/678b02322140eabeed394844770ad8df.pdf', 'Puthiya_Thedal_-_June_2020', '678b02322140eabeed394844770ad8df.pdf'),
(19, 'Puthiya Thedal Magazhine - June', 'https://kuzhithuraidiocese.com/uploads/newsletters/dd91e2a35a487a6287f4ab52488e861e.pdf', 'Puthiya_Thedal_Magazhine_-_June', 'dd91e2a35a487a6287f4ab52488e861e.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifyID` int(11) NOT NULL,
  `fromID` int(11) NOT NULL,
  `toID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `repostID` int(11) NOT NULL,
  `postType` int(2) NOT NULL COMMENT '0 = updates, 1 = posts, 2 = snapshots, 3 = likes, 3 = comments, 4 = repost',
  `targetURL` varchar(500) NOT NULL,
  `type` varchar(22) NOT NULL,
  `description` text NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 = unseen, 1 = seen',
  `alert` int(1) NOT NULL COMMENT '0 = active, 1 = openned',
  `timestamp` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notifyID`, `fromID`, `toID`, `itemID`, `commentID`, `repostID`, `postType`, `targetURL`, `type`, `description`, `status`, `alert`, `timestamp`) VALUES
(0, 1, 268, 0, 0, 0, 0, 'http://kuzhithuraidiocese.com/new/admin', 'friendship', '', 0, 1, 1543436830),
(0, 1, 268, 0, 0, 0, 0, 'http://kuzhithuraidiocese.com/new/admin', 'confirmed', '', 0, 1, 1543436833);

-- --------------------------------------------------------

--
-- Table structure for table `odiocesepriest`
--

CREATE TABLE `odiocesepriest` (
  `id` int(11) NOT NULL,
  `priestid` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `pfname` varchar(100) DEFAULT NULL,
  `pmnane` varchar(100) DEFAULT NULL,
  `pdob` varchar(20) DEFAULT NULL,
  `pplace` varchar(75) DEFAULT NULL,
  `pseminary` varchar(100) DEFAULT NULL,
  `porddate` varchar(30) DEFAULT NULL,
  `pordplace` varchar(100) DEFAULT NULL,
  `pordby` varchar(100) DEFAULT NULL,
  `pminstring` varchar(100) DEFAULT NULL,
  `paddress` varchar(200) DEFAULT NULL,
  `pphone` varchar(30) DEFAULT NULL,
  `pmobile` varchar(30) DEFAULT NULL,
  `pemail` varchar(50) DEFAULT NULL,
  `pimg` varchar(50) DEFAULT NULL,
  `pdiocese` varchar(30) DEFAULT NULL,
  `contract` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `odiocesepriest`
--

INSERT INTO `odiocesepriest` (`id`, `priestid`, `pname`, `pfname`, `pmnane`, `pdob`, `pplace`, `pseminary`, `porddate`, `pordplace`, `pordby`, `pminstring`, `paddress`, `pphone`, `pmobile`, `pemail`, `pimg`, `pdiocese`, `contract`) VALUES
(38, 2001, 'Fr. Amaladhas Densingh R.A.', '', '', '06.12.1973', 'Kurusady', '', '07.04.2002', '', '', 'Parish Priest, Nullivilai', '        Parish Priest, Church of O.L. of Mount Carmel, Nullivilai, Karenkadu - 629 809', '04651 231412', '9488271741', 'singh27star@yahoo.co.uk', '2001.jpg', 'Diocese of Kottar', 'no'),
(39, 2002, 'Fr. Amutha Valan M.', '', '', '06.03.1982', 'Kovalam', '', '18.04.2010', '', '', 'Parish Priest, Kallaraivilai', '  Parish Priest, Church Of O.L.of Fatima, Kallaraivilai, Chenkodi 629177', '04651 221576', '8903701818', 'amuthavalan82@gmail.com', '2002.jpg', 'Diocese of Kottar', 'no'),
(40, 2003, 'Fr. Antony Gomez P.', '', '', '02.06.1974', 'Manakudy', '', '18.04.2004', '', '', 'Parish Priest, Konamcadu', '  Parish Priest,Church of St. Francis Xavier, Konamcadu, West Neyyoor - 629803', '04651 226209', '9488278088', 'frgomezktr@gmail.com', '2003.jpg', 'Diocese of Kottar', 'no'),
(41, 2004, 'Fr. Antony Jayakodi', '', '', '02.09.1978', 'Kurusady', '', '11.12.2011', '', '', 'Parish Priest, Elavuvilai', 'Church of St. Aloysius Elavuvilai 629171', '', '8760817448', 'antonyjayakodi@gmail.com', '2004.jpg', 'Diocese of Kottar', 'no'),
(42, 2005, 'Fr. Arulappan', '', '', '25.04.1946', 'Sarel', '', '21.12.1971', '', '', 'Parish Priest, Kanjiracode', '  Parish Priest, Church of O.L. of Rosary, Kanjiracode, Kanjiracode Post - 629155', '04651 272719', '9442365337', 'frarulappa@yahoo.com', '2005.jpg', 'Diocese of Kottar', 'no'),
(44, 2007, 'Fr. Benziger P.', '', '', '29.12.1963', 'Thittuvilai - Mathal', '', '30.04.2000', '', '', 'Parish Priest, Nullivilai ', 'Church of O.L.of Mount Carmel, Nullivilai, Karencadu 629809', '04651 230345', '9486269906', '', '2007.jpg', 'Diocese of Kottar', 'no'),
(45, 2008, 'Fr. Berchmans Michael Kenet F.', '', '', '11.10.1964', 'Punnai Nagar', '', '18.04.1993', '', '', 'Parish Priest, Vencode', '  Parish Priest, St. Xavier\'s Church, Vencode, Puthukadi -629171', '04651 270976', '9443482972', 'bmkenet@yahoo.com', '2008.jpg', 'Diocese of Kottar', 'no'),
(54, 2017, 'Fr. Selvaraj J.', '', '', '07.06.1974', 'Arockiapuram-Cape', '', '27.04.2003', '', '', 'Parish Priest, Attoor', 'Parish Priest, Church of St. Andrew, Attoor - 629191', '', '9489554444', 'selvaa.raj@rediffmail.com', '2017.jpg', 'Diocese of Kottar', 'no'),
(55, 2018, 'Fr. Soosai Antony P.', '', '', '05.02.1978', 'Kovalam', '', '19.04.2009', '', '', 'Parish Priest, Ambalakadai', '  Parish Priest, Sts. Peter and Paul Church Ambalakadai, Chitharal 629151', '', '9443130423', 'samsantosoo@gmail.com', '2018.jpg', 'Diocese of Kottar', 'no'),
(56, 2019, 'Fr. Lawrence S.P.', '', '', '19.08.1972', '', '', '07.04.2002', '', '', 'Parish Priest, Kuzhithurai', '  Parish Priest,Church of St. Michael the Archangel , Kuzhithurai - 629163', '04651 355455', '9442008557', '', '2019.jpg', 'Archdiocese of Trivandrum', 'no'),
(58, 2021, 'Fr. Amul Raj', '', '', '24.11.1983', '', '', '15.05.2011', '', '', 'Co-Pastor, Packiapuram', 'Co-Pastor, church of St. Eusthachius, Packiapuram, Arumanai - 629151', '', '8098756704', '', '2021.jpg', 'Heralds of Good News', 'yes'),
(59, 2022, 'Fr. Antony Xavier', '', '', '11.02.1960', 'Mulankanavilai ', '', '15.05.1990', 'Church of St. Antony, Mulankanavilai', 'Bishop Leon A. Dharmaraj', 'Priest-In-Charge, Maruthancode', '    Priest-In-Charge, Church of St. Antony, Maruthancode, Kuzhithurai - 629163', '', '9445949050, 8220197177', 'frtonyzavier@gmail.com', '2022.jpg', 'Diocese of Daltonganj', 'yes'),
(61, 2024, 'Fr. Christuraj', '', '', '25.12.1968', '', '', '10.05.1996', '', '', 'Priest-In-Charge, Kuttaicadu', '  Priest-In-Charge, Church of St. Jude Thadeus, Kuttaicadu, Kattathurai 629158', '04651 227755', '9698560707, 9487523381', 'frchristuraj@gmail.com', '2024.jpg', 'Diocese of Amravati', 'yes'),
(62, 2025, 'Fr. Jaya Kumar', '', '', '31.03.1983', '', '', '06.05.2014', '', '', 'Co-Pastor, Mulagumoodu', '  Co-Pastor, Church of O.L. of Nativity, Mulagumoodu - 629167', '', '7639416933', '', '2025.jpg', 'Heralds of Good News', 'yes'),
(64, 2027, 'Fr. Amaladhas F.A.', '', '', '01.09.1962', '', '', '21.05.1993', '', '', 'Priest-In-Charge, Kanjampuram', '  Priest-In-Charge, Church of St. Therese of Child Jesus, Kanjampuram - 629154', '', '9597265595', '', '2027.jpg', 'CMF', 'yes'),
(65, 2028, 'Fr. Sahaya Wilfred J.', '', '', '26.05.1970', '', '', '20.11.2004', '', '', 'Priest-In-Charge, Mathoor', '  Priest-In-Charge, Church of St.Joseph, Mathoor, Aruvikarai 629177', '04651 240420', '9865478900', '', '2028.jpg', 'Society of Jesus', 'yes'),
(67, 2030, 'Fr. Baskar', '', '', '15.01.1981', '', '', '09.12.2007', '', '', 'Priest-In-Charge, Poottetty ', '  Priest-in-charge, Church of St. Antony, Poottetty, (Via) Karungal - 629157', '04651 254444', '9444128235', '', '2030.jpg', 'Holy Family', 'yes'),
(68, 2031, 'Fr. Justin James', '', '', '31.05.1971', '', '', '09.08.2008', '', '', 'Priest-In-Charge, Mukkalampadu', '  Priest-In-Charge, Church of O.L. of Sorrows, Mukkalampadu, Kurunthencode - 629805', '', '9486577971', '', '2031.jpg', 'Arch-diocese of Delhi', 'yes'),
(69, 2020, 'Fr. Marconi Ravi Chandran', '', '', '', '', '', '', '', '', 'Parish Priest at Valvachakostam', '  ', '', NULL, '', '2020.jpg', NULL, 'no'),
(70, 2021, 'Fr. Jacksas Elango', '', '', '', '', '', '', '', '', 'Parochial Administrator at Chetticharvilai', '  ', '', NULL, '', '2021.jpg', NULL, 'no'),
(71, 2022, 'Fr. George Clement', '', '', '', '', '', '', '', '', 'Parish Priest at Manchadi', '  ', '', NULL, '', '2022.jpg', NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `openletters`
--

CREATE TABLE `openletters` (
  `letterID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `contributor` int(11) NOT NULL,
  `targetName` varchar(255) NOT NULL,
  `targetDetails` text NOT NULL,
  `headline` varchar(1) DEFAULT 'N',
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `timestamp` varchar(22) NOT NULL,
  `visits_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `pageID` int(11) NOT NULL,
  `contributor` int(11) NOT NULL,
  `pageSlug` varchar(255) NOT NULL,
  `pageTitle` text NOT NULL,
  `pageExcerpt` text NOT NULL,
  `pageContent` text NOT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `timestamp` int(22) NOT NULL,
  `visits_count` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pageID`, `contributor`, `pageSlug`, `pageTitle`, `pageExcerpt`, `pageContent`, `language`, `timestamp`, `visits_count`) VALUES
(6, 1, 'privacy-policy', 'Privacy Policy', 'This is privacy policy page in English', '<p>This is privacy policy page in English</p>', 'english', 1454234616, 3488),
(7, 1, 'terms-and-conditions', 'Terms and Conditions', 'Terms and conditions', '<p>Terms and conditions</p>', 'english', 1454234663, 3272),
(8, 1, 'about-us', 'About Us', 'ter', '<p>ter</p>', 'english', 1542834750, 2416),
(9, 1, 'help-center', 'Help Center', 'Knows about all features provided in this site', '<p>Knows about all features provided in this site</p>', 'english', 1454234828, 2757),
(0, 301, 'history', 'History', '2014 ஆம் ஆண்டு, டிசம்பர் திங்கள் 22 ஆம் நாள் தமிழகக்கத்தோலிக்க திருச்சபைக்கு மகிழ்ச்சி நிறைந்த ஒரு ப...', '<p>2014 ஆம் ஆண்டு, டிசம்பர் திங்கள் 22 ஆம் நாள் தமிழகக்கத்தோலிக்க திருச்சபைக்கு மகிழ்ச்சி நிறைந்த ஒரு பெருநாள். அன்று தான் மாண்பு மிகு திருத்தந்தை பிரான்சிசு, தமிழகத்தின் 18 ஆம் மறைமாவட்டமாக குழித்துறை மறைமாவட்டம் என்ற பெயரில் புதிய தொரு மறைமாவட்டத்தை நிறுவி, கத்தோலிக்க திருச்சபைக்கு வளம் சேர்த்தார்.</p><p>அந்தமகிழ்ச்சியைமேலும்அதிகரிக்கும்வகையில்புதியகுழித்துறைமறைமாவட்டப்பகுதியிலேயேபிறந்துவளர்ந்தஅருள்திருஜெரோம்தாஸ்வறுவேல் (சலேசிய சபை)அவர்கள்அம்மறைமாவட்டத்தின்முதல்ஆயராகநியமிக்கப்பட்டுள்ளார்என்றசெய்தியையும்திருத்தந்தைபிரான்சிசுஅதேநாளில்அறிவித்தார்.</p><p>கத்தோலிக்கதிருச்சபையின்தலைமைப்பீடமாகியவத்திக்கான்நகரிலிருந்துவெளியானஇந்தமகிழ்ச்சியானசெய்தியைக்கேட்டுகுழித்துறைமறைமாவட்டத்தின்கத்தோலிக்கமக்கள்மட்டுமன்றி, குமரிமாவட்டத்தின்அனைத்துமக்களுமேபெருமிதம்கொண்டனர்.</p><p>இருபதுஆண்டுகளுக்குமேலாகஎதிர்பார்த்துக்காத்திருந்தபுதியகுழித்துறைமறைமாவட்டம்உண்மையிலேயேஉருவாகிவிட்டதுஎன்றசெய்திஓர்இன்பஅதிர்ச்சிபோலவந்துசேர்ந்ததுஎன்றால்அதுமிகையாகாது.</p><p>1) மறைமாவட்டம்என்றால்என்ன?</p><p>குழித்துறைமறைமாவட்டத்தின்வரலாற்றைஎடுத்துக்கூறுமுன், மறைமாவட்டம்என்றால்என்னஎன்றகேள்விக்குச்சுருக்கமாகவாவதுபதில்காண்பதுதேவை. உலகளாவியகத்தோலிக்கதிருச்சபைஎன்பதுதந்தை, மகன், தூயஆவிஎன்னும்மூவொருஇறைவனின்பெயரால்ஒன்றுசேர்க்கப்பட்டு, இயேசுவின்சீடர்களாக உரோமைத்திருத்தந்தையின்தலைமையின்கீழ்வழிநடக்கின்றஅனைத்துலகஇறைமக்களின்திருக்கூட்டம்ஆகும். இந்தஇறைமக்கள்திருக்கூட்டத்தோடு, பிறகிறிஸ்தவர்கள், பிறசமயத்தினர், ஏன்எல்லாமக்களுமேவெவ்வேறுவகைகளில்தொடர்புடையவர்களே.</p><p>திருச்சபையின்நிர்வாகமுறைமைகளைநெறிப்படுத்துகின்றஏடாகிய “திருச்சபைச்சட்டத்தொகுப்பு” (Code of Canon Law) மறைமாவட்டத்தைக்கீழ்வருமாறுவரையறுக்கிறது:</p><p>”<em>மறைமாவட்டம் என்பது குருகுழாமின் ஒத்துழைப்புடன் மேய்ப்புப் பணிக்காக ஆயரிடம் ஒப்படைக்கப்பட்டுள்ள இறை மக்களின் ஒரு பகுதியாகும்</em><em>; </em><em>இவ்வாறு</em><em>, </em><em>தன் மேய்ப்பரோடு இணைந்து</em><em>, </em><em>தூய ஆவியில் நற்செய்தி</em><em>, </em><em>நற்கருணை வழியாக அவரால் ஒன்று கூட்டப்பட்டு அது ஒரு தனித்திருச்சபையாக உருப்பெறுகிறது</em><em>; </em><em>அதில் ஒரே</em><em>, </em><em>தூய கத்தோலிக்க</em><em>, </em><em>திருத்தூதுவர் திருச்சபை உண்மையாகவே உள்ளது</em><em>; </em><em>செயலாற்றுகிறது</em><em>” </em><em>- </em>(திருச்சபைச்சட்டம்எண்369).</p><p>உலகத்திருச்சபையின்தனிப்பகுதிகள்போலத்தம்மிலேமுழுமைகொண்டுசெயல்படுகின்றநம்பிக்கைசமூகங்கள்மறைமாவட்டங்கள்என்றால், அந்தமறைமாவட்டங்களைஉருவாக்குவதற்கும், அவற்றைஒன்றோடொன்றுஇணைப்பதற்கும், அவற்றைஅகற்றுவதற்கும்திருச்சபையின்உயர்தலைவரானதிருத்தந்தைக்குமட்டுமேமுழுஅதிகாரமும்உரிமையும்உண்டு. இதைத் திருச்சபைச் சட்டம் எண் 373 எடுத்துக் கூறுகிறது..</p><p>இவ்வாறு, இன்று ஆட்சிப் பொறுப்பில் உள்ள திருத்தந்தை பிரான்சிசின் முழு அதிகாரத்திற்கு உட்பட்டு, கன்னியாகுமரி மாவட்டத்தின் ஒரு குறிப்பிட்ட பகுதியிலே வாழ்கின்ற கத்தோலிக்கர், பிற கிறிஸ்தவர்கள், மற்றும் எல்லா மக்களின் நலனை மேம்படுத்துவதற்காக குழித்துறை மறைமாவட்டம் உருவாக்கம் பெற்றுள்ளது என்பதை அறிந்து உளம் மகிழ்கின்றது.</p><p>2) குழித்துறை மறைமாவட்டத்தின் நில ஆள்மைக் கூறுகள்</p><p>குழித்துறை மறைமாவட்டம் எந்த எல்லைகளுக்குள் அமைந்திருக்கும் என்பதையும் திருத்தந்தை பிரான்சிசு தமது ஆவண ஏட்டில் தெளிவாகக் குறிப்பிட்டுள்ளார். அதாவது, குழித்துறை மறைமாவட்டம் கோட்டாறு என்னும் தாய் மறைமாவட்டத்திலிருந்து பிரித்து உருவாக்கப்படுகிறது. குழித்துறை மறைமாவட்டத்தின் வடக்கிலும் வடகிழக்கிலும் பாளையங்கோட்டை மறைமாவட்டமும், கிழக்கிலும் தெற்கிலும் புதிய கோட்டாறு மறைமாவட்டமும், தென்மேற்காக இந்தியப் பெருங்கடலும், மேற்கில் திருவனந்தபுரம் உயர்மறைமாவட்டம் மற்றும் நெய்யாற்றின்கரை மறைமாவட்டமும் (கேரளம்) எல்லைகளாக அமையும் என்று திருத்தந்தை தமது ஆவணத்தில் தெளிவாக வரையறுத்துக் கூறியுள்ளார்.</p><p>கோட்டாறு மறைமாவட்டத்திலிருந்து பிரிக்கப்பட்டு புதிதாக உருவாகின்ற மறைமாவட்டமே குழித்துறை மறைமாவட்டம் என்பதால் அதன் வரலாறு கோட்டாறு மறைமாவட்டத்தின் வரலாற்றோடு தொடக்கத்திலிருந்தே பின்னிப் பிணைந்தது என்பது சொல்லாமலே விளங்கும். எனவே, குழித்துறை மறைமாவட்டத்தின் வரலாற்றைப் புரிந்துகொள்வதற்கு கோட்டாறு மறைமாவட்டத்தின் வரலாறு இன்றியமையாததாக உள்ளது.</p><p>(கோட்டாறு மறைமாவட்டத்தின் விரிவான வரலாற்றை அறிய, கீழ்வரும் நூல்களைக் காண்க: அருட்பணி. எம். வில்லவராயன் எழுதிய The Diocese of Kottar: A Review of Its Growth [வெளியான ஆண்டு: 1956]; அருட்பணியாளர்கள் சே. ரோ.நற்சீசன், இ. பிரான்சிஸ், வ. பவுல் லியோன், வில்பிரட் பெலிக்ஸ் ஆகியோர் எழுதிய Called to Serve: A Profile of the Diocese of Kottar [வெளியான ஆண்டு: 1983]; பவள விழா மலர்: கோட்டாறு மறைமாவட்டம் 1930-2005 [வெளியான ஆண்டு: 2005]).</p><p>3) கோட்டாறு தாய் மறைமாவட்டம் ஈன்ற குழந்தை குழித்துறை மறைமாவட்டம்</p><p>குழித்துறை மறைமாவட்டம், 1930ஆம் ஆண்டில் தன்னாட்சியோடு நிறுவப்பட்ட கோட்டாறு மறைமாவட்டத்திலிருந்து பிரிந்து ஒரு புதிய மறைமாவட்டமாக உருவெடுத்துள்ளது. கோட்டாறு தாய் என்றால் குழித்துறை அதன் சேய் எனலாம். அதே நேரத்தில் கோட்டாற்றுக்கும் குழித்துறைக்கும் உள்ள உறவை “சகோதர உறவு” என்றும் நாம் கூறலாம். குழித்துறை மறைமாவட்டம் கோட்டாறு மறைமாவட்டத்திலிருந்து பிரிந்து தனி மறைமாவட்டமாக நிறுவப்பட்டதைத் தொடர்ந்து அந்த இரு மறைமாவட்டங்களும் சம மதிப்பும் மாண்பும் கொண்ட திருச்சபைப் பகுதிகளாக விளங்குகின்றன.</p><p>குழித்துறை தனி மறைமாவட்டமாக உருவாகின்ற அதே நேரத்தில், கோட்டாறு என்னும் புதிய மறைமாவட்டமும் உருப்பெற்று விட்டது. எனவே, இரு மறைமாவட்டங்களும் ஒன்றுசேர்ந்து மகிழ்வது பொருத்தமே. கோட்டாறு-குழித்துறை மறைமாவட்டங்களின் வரலாற்றுப் பின்னணி என்ன?</p><p>குழித்துறை மறைமாவட்டம் உருவான வரலாற்றை எடுத்துக் கூறும் வகையில் அந்த வரலாற்றுக் காலத்தை மூன்று பெரிய காலக் கட்டமாகப் பார்க்கலாம்:</p><p>1) கோட்டாறு தனி மறைமாவட்டம் ஆவதற்கு முற்பட்ட காலம்</p><p>2) கோட்டாறு மறைமாவட்டத்தின் முதல் அறுபது ஆண்டுகள்</p><p>3) குழித்துறை மறைமாவட்ட உருவாக்கச் செயல்பாடு நிகழ்ந்த காலம்</p><p>முதல் கட்டம்</p><p>கோட்டாறு தனி மறைமாவட்டம் ஆவதற்கு முற்பட்ட காலம்</p><p>1) பண்டைய தடயங்கள்</p><p>தமிழகத்தின் தென்முனையாம் குமரி நிலத்தில், கோட்டாறு மறைமாவட்டப் பகுதியில், கிறிஸ்தவ சமய நம்பிக்கை தொன்றுதொட்டே நிலவியதற்கான அகழ்வுத் தடயங்கள் சின்னமுட்டத்தில் கண்டெடுக்கப்பட்டுள்ளன. திருத்தூதர் புனித தோமா கேரளத்திலும் கோட்டாறு மறைமாவட்டம் அமைந்துள்ள குமரி நிலப்பகுதியிலும் நற்செய்தியை அறிவித்து, வழிபாட்டு இடங்களை நிறுவினார் என்னும் தொல்மரபும் பல நூற்றாண்டுகளாக வழங்கிவருகின்றது. திருவிதாங்கோட்டில் அமைந்து, தற்போது சிரிய மலங்கரை ஆர்த்தடாக்ஸ் சபையினரின் பொறுப்பில் உள்ள “அரப்பள்ளி” என்ற சிறு கோவில், திருத்தூதர் புனித தோமா தொடங்கிய வழிபாட்டுத் தலத்தின் மீது எழுந்தது என்னும் மரபும் உள்ளது.</p><p>புனித தோமாவின் இந்திய மறைப்பணி பற்றிய மரபுவழிச் செய்தியை உறுதிப்படுத்துவதற்கு அறுதியான வரலாற்றுச் சான்றுகள் கிடைக்கவில்லை என்றாலும், குமரி நிலப்பகுதியில் புனித பிரான்சிஸ் சவேரியார் பணியாற்றத் தொடங்கிய காலத்திற்கு முன்னரே கிறிஸ்தவ நம்பிக்கை அங்கு வேரூன்றத் தொடங்கிவிட்டிருந்தது என்பதற்கு உறுதியான வரலாற்று ஆதாரம் உள்ளது.</p><p>2) பரவர் குலத்தவர் கிறிஸ்தவத்தைத் தழுவுதல்</p><p>16ஆம் நூற்றாண்டில் அரேபிய வணிகரும் முசுலிம்களும் சோழமண்டலக் கடற்கரைப் பகுதியில் மீன்பிடித்தலிலும் முத்துக்குளித்தலிலும் ஈடுபட்டிருந்த பரவர் குல மக்கள்மீது தாக்குதல்கள் நடத்திய வேளையில் பரவர் குலத் தலைவர்கள் போர்த்துகீசியரின் பாதுகாப்பை நாடினர். பாதுகாப்பு அளித்த போர்த்துகீசியர் குமரி முதல் இராமேசுரம் வரையிலான பகுதியில் வாழ்ந்த சுமார் இருபது ஆயிரம் பரவர்களுக்குத் திருமுழுக்கு அளித்து அவர்களைக் கிறிஸ்தவ மதத்தில் சேர்த்தனர். 1536-1537 ஆண்டளவில் இந்த “குழு மதமாற்றம்” நிகழ்ந்தது.</p><p>புதிதாக கிறிஸ்தவ சமயத்தைத் தழுவிய இவர்களுக்கு மறைப்பணி புரிய போதிய பணியாளர்கள் இல்லாததால் தளர்நிலையிலிருந்த அவர்களுடைய நம்பிக்கையை உறுதிப்படுத்தவும் மேலும் பலரைக் கிறிஸ்தவத்துக்குக் கொணரவும் புனித பிரான்சிஸ் சவேரியார் அவர்களிடையே 1542 அக்டோபர் மாதத்திலிருந்து 1543 செப்டம்பர் வரை பணிபுரிந்தார். சில மாத இடைவெளிக்குப் பின் மீண்டும் பெப்ருவரி 1544இல் தமது பணியைத் தொடர்ந்தார். இவ்வாறு, குமரி நிலப்பகுதியில், குறிப்பாக,கன்னியாகுமரி, கோவளம், இராஜாக்கமங்கலம் போன்ற பரவர் கிராம மறைப்பணித் தளங்களில் கத்தோலிக்க சமயம் தளிர்விடத் தொடங்கியது.</p><p>குமரிப் பகுதியில் சவேரியார் ஆற்றிய பணி மறைப்போதகம் மட்டுமன்று. புதிதாக கிறிஸ்தவத்தைத் தழுவிய பரவ மக்களுக்கு அவர் துன்பவேளையில் துணையாகவும் வந்தார்.</p><p>தம் மக்களாகிய கிறிஸ்தவர்களைக் கிறிஸ்தவரல்லாதவர்களின் தாக்குதல்களிலிருந்தும் போர்த்துகீசியர்களின் அட்டூழியங்களிலிருந்தும் பாதுகாத்த சவேரியாரை மக்கள் “பெரிய தந்தை” என்னும் பொருள்தருகின்ற ”வலிய பாதிரி” என்னும் பெயரிட்டு அன்புடன் அழைத்தார்கள்.</p><p>3) முக்குவர் குலத்தவர் கிறிஸ்தவத்தைத் தழுவுதல்</p><p>சவேரியாரின் அடுத்த மறைப்பணி திருவிதாங்கூர் இராச்சியத்தில் முக்குவர் நடுவே நிகழ்ந்தது. திருவிதாங்கூரை ஆட்சி செய்த இராம வர்மா என்ற உண்ணிகேரள திருவடியும் அவருடைய சகோதரர் மார்த்தாண்ட வர்மாவும் பாண்டிய மன்னன் படையெடுப்பிலிருந்து தம்மைப் பாதுகாக்க போர்த்துகீசியரின் உதவியை நாடினர். அவ்வாறு தமக்குப் படை உதவியும் பாதுகாப்பும் அளித்தால் திருவிதாங்கூர் இராச்சியத்தில் மீனவ மக்களாகிய முக்குவர் குலத்தாரிடையே கிறிஸ்தவ மதத்தைப் பரப்புவதற்கு அனுமதி அளிப்பதாகவும் வாக்குறுதி கொடுத்தனர். பரவ மக்களிடையே கிறிஸ்தவ மறையைப் பரப்பிய சவேரியார் தங்கள் பகுதியிலும் அவ்வாறே செய்யவேண்டும் என்று மணக்குடி முக்குவர் விரும்பிக் கேட்டனர். திருவிதாங்கூர் மன்னர்களும் முக்குவர்கள் தமக்குக் கீழ்ப்படிந்திருப்பது போலவே, “வலிய பாதிரி” (சவேரியார்) சொல்வதைக் கேட்டு, தங்களுக்கு விருப்பமானால் கிறிஸ்தவர்களாக மாறத் தடையில்லை என்று அறிவித்தனர். மேலும், திருவிதாங்கூர் மன்னரான இராம வர்மா 2000 பணத்தை சவேரியாரிடம் கொடுத்து அதைக் கொண்டு கோவில்கள் கட்ட அனுமதித்தார்.</p><p>பலவகையான வரிச்சுமைகளால் அழுத்தப்பட்டு, அரசு அதிகாரிகளால் ஒடுக்கப்பட்டு, சமூக மாண்பு மறுக்கப்பட்டு, வறுமையில் வாழ்ந்த அம்மக்கள், தங்களது இழிநிலையிலிருந்து விடுபட்டு, திருமுழுக்குப் பெற்று, போர்த்துகீசியரின் பாதுகாப்பைப் பெறுவதை ஒரு வரப்பிரசாதமாகவே கருதினர்.</p><p>இந்த நல்ல தருணத்தைப் பயன்படுத்திக் கொண்டு சவேரியார் முக்குவர் வாழ்ந்த கடலோரக் கிராமங்களை ஒவ்வொன்றாகக் கால்நடையாகச் சென்று சந்தித்து, 1544 நவம்பரிலிருந்து 1544 டிசம்பர் வரை அவர்களுக்குக் கிறிஸ்தவ மறையை அறிவித்து 10 ஆயிரத்துக்கு மேற்பட்டோருக்குத் திருமுழுக்கு அளித்து அவர்களை இந்து சமயத்திலிருந்து மனம் திருப்பி கிறிஸ்தவத்தைத் தழுவச் செய்தார்.</p><p>சவேரியார் தம்மோடு ஒருசில துணையாளர்களை அழைத்துக்கொண்டு, திருவிதாங்கூர் இராச்சியத்தின் வட எல்லையாகிய பூவாற்றிலிருந்து முக்குவ மக்களிடையே தம்முடைய மறைப்பணியைத் தொடங்கினார். இவ்வாறு அவர் கிறிஸ்தவ சமயத்தைப் போதித்த முக்குவர் கிராமங்கள் பூவாறு, கொல்லங்கோடு, வள்ளவிளை, தூத்தூர், புதுத்துறை, தேங்காப்பட்டணம், இனையம், மிடாலம், வாணியக்குடி, குளச்சல், கடியபட்டணம், முட்டம், பள்ளம் ஆகும். அத்தருணத்தில் யாழ்ப்பாண மன்னன் கிறிஸ்தவர்களைத் துன்புறுத்திக் கொல்கிறான் என்ற அதிர்ச்சிதரும் செய்தியைக் கேட்டு சவேரியார் முக்குவ கிராமங்களில் திருமுழுக்குக் கொடுப்பதை நிறுத்திவிட்டு கொச்சிக்கு விரைந்தார். இவ்வாறு, மணக்குடிக்கு மட்டும் சவேரியாரால் நேரடியாகச் சென்று திருமுழுக்குக் கொடுக்க இயலவில்லை. ஆனால் அங்கு சென்று திருமுழுக்குக் கொடுக்க அவர் தம் துணையாளரான மான்சீலாஸ் என்பவரை அனுப்பிவைத்தார்.</p><p>4) உள்நாட்டு மக்களிடையே கிறிஸ்தவம் பரவுதல்</p><p>கடலோரத்தில் மக்களுக்குத் திருமுழுக்குக் கொடுத்தபின் சவேரியார் குமரிப் பகுதியின் உள்நாட்டு மக்களையும் கிறிஸ்தவ மறையில் சேர்க்க ஆர்வம் கொண்டார். ஆனால் அன்றைய சமூக-அரசியல் நிலை அதற்குத் தடையாக அமைந்தது. உயர்ந்த சாதி தாழ்ந்த சாதி என்று வேறுபாடு கற்பித்து, பெரும்பாலான மக்கள் அடிமைகளைப் போல நடத்தப்பட்ட காலம் அது. இந்து சமயத்தின் சாதி அமைப்பைத் தளர்த்திவிட்டால் தம்முடைய அதிகாரம் பறிபோய்விடும் என்று உயர்சாதியினர் நினைக்க,நாட்டில் கிறிஸ்தவம் பரவினால் சமூகக் கட்டமைப்பு தளர்ந்துவிடும் என்று ஆட்சியாளர்கள் எண்ணிய காலம் அது.</p><p>இப்பின்னணியில்தான் திருவிதாங்கூர் மன்னர்கள் விஜயநகரப் படைகளோடு மோதினர். விஜயநகர அரசைப் பகைக்க விரும்பாத போர்த்துகீசியர்கள் திருவிதாங்கூர் மன்னர்களுக்கு உதவிசெய்ய மறுத்துவிட்டனர். இதனால் கோபமுற்ற திருவிதாங்கூர் மன்னர்கள் இந்தியாவில் பணிசெய்த போர்த்துக்கல் ஆளுநர்களையும் அவர்களுடைய மறைபரப்பாளர்களையும் தண்டிக்க எண்ணி, தமது இராச்சியத்தில் இனிமேல் கிறிஸ்தவத்தைப் பரப்பக் கூடாது என்று தடைவிதித்தனர். இயேசு சபையைச் சார்ந்த தந்தை பிரான்சிஸ் ஹென்றிக்கெஸ் என்பவரையும் அவருடைய ஒரே துணையாளரான சகோதரர் பல்தசார் நூனெஸ் என்பவரையும் இராச்சியத்திலிருந்து வெளியேற்றினர்.</p><p>இவ்வாறாக, கடலோரத்திலேயே முதலில் கவனம் செலுத்திய போர்த்துகீசிய மறைப்பணியாளர்கள் உள்நாட்டுப் பகுதிகளில் கிறிஸ்தவத்தைப் பரப்புவதற்குச் சிறிது காலம் பிடித்தது. இருப்பினும், கடலோரப் பரவர் மற்றும் முக்குவர் குழுவாகக் கிறிஸ்தவர்களான சுமார் 50 ஆண்டுகளில், அதாவது 1603இல் உள்நாட்டுப் பகுதிகளில் ஏழு கோவில்கள் கட்டப்பட்டன. கடற்கரை கிராமங்களில் திருமுழுக்குப் பெற்று, தொழில் காரணமாக உள்நாடு சென்ற மீனவருக்கு மறைப்பணி புரிய குருக்கள் இல்லாமையால் அவர்களது கிறிஸ்தவ நம்பிக்கை நலிவுற்றது.</p><p>இயேசு சபைக் குருவான அந்திரேயா புச்சேரியோ, திருவிதாங்கூர் மன்னர் வீர ரவிவர்மாவிடம் உதவிபெற்று கல்குளத்தில் பத்மநாபபுரம் அரண்மனைக்கு உள்ளேயும் வெளியேயும் இரு கோவில்கள் கட்டினார். மூன்றாவதொரு கோவில் கோட்டாற்றில் அரசன் அன்பளிப்பாகக் கொடுத்த ஒரு தோட்டப்பகுதியில் 1603இல் கட்டப்பட்டது. கல்லால் கட்டப்பட்டு, மூவொரு கடவுளுக்கு அர்ப்பணிக்கப்பட்ட அக்கோவிலில் தந்தை புச்சேரியோ புனித சவேரியாரின் திருப்படம் ஒன்றை நிறுவியதைத் தொடர்ந்து சவேரியார் பக்தி இன்னும் அதிகமாக வளர்ந்தது.</p><p>கோட்டாறு கோவிலைக் கட்ட மணக்குடி, பள்ளம், பெரியகாடு, ராஜாக்கமங்கலம் ஆகிய கிறிஸ்தவ கிராமங்களும் உதவிசெய்தன. சில ஆண்டுகளுக்குள் கோட்டாறு கோவில் சவேரியார் பக்திக்குப் புகழ்பெற்ற ஒரு திருத்தலமாக மாறியது.</p><p>கோட்டாற்றுக்குக் கிளைப்பங்குகளாக மார்த்தாண்ட நல்லூர் (மாத்தால்?), ஆளூர், கல்குளம் ஆகியவை அமைந்தன. இந்த கிளைப்பங்குகளின் பல கிராமங்களிலும் மலைப் பகுதிகளிலும் கிறிஸ்தவர்கள் பரவலாக வாழ்ந்தார்கள்.</p><p>6) நாடார் சமூகத்தினர் கத்தோலிக்க மறையைத் தழுவுதல்</p><p>கன்னியாகுமரி மற்றும் திருநெல்வேலி பகுதிகளில் வாழ்ந்த நாடார் சமூகத்தினர் 17ஆம் நூற்றாண்டில் அங்கும் இங்குமாக சிறு எண்ணிக்கையில் கிறிஸ்தவ சமயத்தை ஏற்று, திருமுழுக்குப் பெற்றனர். என்றாலும், அவர்களுள் பெரும்பான்மையோர்17ஆம் நூற்றாண்டின் இறுதிவரையும் இந்துக்களாகவே இருந்தனர்.</p><p>குமரி நிலப்பகுதியில் 1550-1600 காலக்கட்டத்தில் சமூக-அரசியல் குழப்பம் நிலவியது. விஜயநகரத்தின் பிடியிலிருந்து விடுபட்ட பாண்டிய நாடு திருவிதாங்கூரைத் தாக்கியது. திருவிதாங்கூர் மக்கள் வரிச்சுமையால் அழுத்தப்பட்டு அரசுக்கு எதிராகப் போர்க்கொடி தூக்கினார்கள்.</p><p>அதே நேரத்தில் போர்த்துகீசிய மன்னரின் பாதுகாப்பின் கீழ் பணிபுரிந்த கிறிஸ்தவ மறைபரப்பாளர்கள் பெரும்பாலும் கடற்கரையிலேயே கவனம் செலுத்தினர். கடல் வணிகத்தைத் தக்கவைப்பதில் போர்த்துகல் ஆட்சியாளர்கள் குறியாக இருந்தது இதற்கு ஒரு முக்கிய காரணம். மேலும் திருவிதாங்கூர் இராச்சியத்தைப் பொறுத்தமட்டில் உள்நாட்டு இந்துக்களைக் கிறிஸ்தவர்களாக்குவது தடைசெய்யப்பட்டிருந்தது. இந்நிலையில் ஐரோப்பாவில் நடந்த ஒரு சில வரலாற்று நிகழ்வுகள் குமரி,திருவிதாங்கூர், பாண்டிநாடு போன்ற பகுதிகளில் கிறிஸ்தவம் பரவிட வாய்ப்பாக அமைந்தன. திருச்சபையின் செயல்பாடுகளில் போர்த்துகல் ஆட்சியாளர்கள் தலையிடுவதைக் கட்டுப்படுத்தவும், குடியேற்ற நாடுகளில் புரட்டஸ்தாந்து கிறித்தவம் பரவுவதை நிறுத்தவும் வேண்டுமென்றால் குடியேற்ற அரசின் கட்டுப்பாட்டைத் தாண்டிய விதத்திலும் திருச்சபையின் நேரடி கண்காணிப்பிலும் செயல்படுகின்ற மறைபரப்புக் குருக்கள் தேவை என்ற அடிப்படையில் உரோமையில் “மறைபரப்புப் பேராயம்”(Congregation for the Propagation of the Faith) 1622இல் தொடங்கப்பட்டது. கத்தோலிக்க திருச்சபையின் துறவற சபைகள் சார்ந்த குருக்கள் மறைபரப்புவதற்காக அனுப்பப்பட்டார்கள். குறிப்பாக மதுரையைப் பணிமையமாகக் கொண்டு இயேசு சபையினர் போர்த்துகீசிய கட்டுப்பாட்டுக்கு உட்படாமல் உள்நாட்டுப் பகுதிகளிலும் கிறிஸ்தவத்தைக் கொண்டுசென்றனர்.</p><p>ஆனால், அரசியல் காரணங்களுக்காக ஐரோப்பாவில் 1773இல் இயேசு சபை தடைசெய்யப்பட்டது. எனவே, மதுரை பணித்தளத்தின் செயல்பாட்டில் தளர்ச்சி ஏற்பட்டது. 1814இல் இயேசு சபை மீண்டும் செயல்படத் தொடங்கியது. அதைத் தொடர்ந்து திருச்சியை மையமாகக் கொண்டு புதிய மதுரை பணித்தளம் செயல்படலாயிற்று.</p><p>மேற்கூறிய அரசியல் நிகழ்வுகளும், ஐரோப்பாவில் சீர்திருத்த கிறிஸ்தவம் பரவிய நிகழ்வும் குடியேற்ற நாடுகளில் கிறிஸ்தவம் பரவுவதில் பாதிப்பை ஏற்படுத்தின.</p><p>இப்பின்னணியில் தான் குமரி நிலப்பகுதியில் நாடார் சமூகத்தவர் கத்தோலிக்க சமயத்தைத் தழுவுவதற்கு இயேசு சபையினரின் மதுரைப் பணித்தளத்தின் கீழ் இருந்த கயத்தாறு மற்றும் காமநாயக்கன்பட்டியின் நாடார் கிறிஸ்தவ சமூகங்கள் துணையாக இருந்தன என்று இயேசு சபை குறிப்பு கூறுகிறது. 1653இல் கயத்தாற்றிலும், 1666இல் காமநாயக்கன்பட்டியிலும் நாடார் கத்தோலிக்கரும் அவர்களுக்கென்று கோவிலும் இருந்தது. 1684 அளவில் காமநாயக்கன்பட்டி இயேசு சபை மதுரைப் பணித்தளத்தின் தென்பகுதிக்கு மையமாயிற்று. ஆண்டு ஒன்றுக்கு சுமார் 600 பேர் புதிதாகத் திருமுழுக்குப் பெற்றனர். அங்கு கத்தோலிக்கராகத் திருமுழுக்குப் பெற்ற நாடார் சிலர் தங்கள் சமய நம்பிக்கையின் பொருட்டுத் துன்புறுத்தப்பட்ட வேளையில் குமரி நிலத்தில், கோட்டாறு பகுதிகளில் வந்து பதினெட்டாம் நூற்றாண்டில் குடியேறினர் என்பது வரலாறு.</p><p>குமரி நிலப் பகுதியில் நாடார் சமூகத்தினர் பலருக்கு 1685ஆம் ஆண்டளவில் முதன்முதலாகத் திருமுழுக்கு அளித்தவர் அருள்தந்தை பீட்டர் மொராத்தோ (Peter Morato) என்னும் இயேசு சபைக் குரு ஆவார். நாடார் சமூகத்தினர் நடுவே கிறிஸ்தவ சமயத்தை அறிவிக்கும் பொறுப்பு அப்போது கோட்டாறு பங்குத் தளத்திற்குப் பொறுப்பாக இருந்த அருள்தந்தை ஜாண் மேனார்து (John Maynard) என்னும் இயேசு சபைக் குருவிடம் 1698இல் அவருடைய மாநிலத் தலைவரான அந்திரேயா கோமஸ் என்பவரால் ஒப்படைக்கப்பட்டது. 1699இல் நிறுவப்பட்ட வடக்கன்குளம் பணித்தளத்தை மையமாகக் கொண்டு இயேசு சபைக் குரு பெர்னார்து தே சா என்பவரும் பிற இயேசு சபைக் குருக்களும் நாடார் மற்றும் வெள்ளாளர் நடுவே கிறிஸ்தவ மறையைப் பரப்பி, பலருக்குத் திருமுழுக்கு அளித்தனர்.</p><p>தந்தை மேனார்து நாடார் குல மக்கள் பலரைக் கிறிஸ்தவத்திற்குக் கொணர்ந்தார். மேலும் அவர் இந்திய சந்நியாசி போன்று உடையணிந்து நாயர்கள் நடுவே பணிபுரிந்து அவர்களையும் கிறிஸ்தவர்கள் ஆக்கினார். ஆனால், நாயர்கள், தம்மைவிடவும் சமூகநிலையில் தாழ்ந்தவர்களாகக் கருதப்பட்ட நாடார்களுக்கும் தந்தை மேனார்து கிறிஸ்தவத்தைப் போதித்து அவர்களைக் கிறிஸ்தவர்களாக்கினார் என்று குறைகூறி, இந்துமதத்திற்கே திரும்பிவிட்டனர்.</p><p>மேலும், தே சா அடிகள் கோட்டாற்றுக்குக் கிழக்கே சுமார் 5 மைல் தொலையில் உள்ள மருங்கூர் கிராமத்தில் ஒரு கோவில் கட்டி எழுப்பினார். அங்கும் நாடார் மற்றும் வெள்ளாளர் பலர் கிறிஸ்தவத்தைத் தழுவினார்கள். இவர்கள் புனித அருளானந்தரின் கைகளால் திருமுழுக்குப் பெற்றிருக்கலாம் என்று மதுரைப் பணித்தளத்தில் மறைப்பணி ஆற்றிய இயேசு சபை வரலாற்றாசிரியர் லியோன் பெஸ் (Leon Besse) என்பவர் கருதுகிறார்.</p><p>(ஆதாரம்: லியோன் பெஸ் எழுதிய The Madurai Mission என்னும் நூல். முதன்முறையாக பிரஞ்சு மொழியில் 1914இல் திருச்சிராப்பள்ளியில் வெளியானது. காண்க: பக்கங்கள் 570, 577)</p><p>மேற்கூறிய மறைப்பணி நிகழ்ந்த அதே காலக் கட்டத்தில் உள்நாட்டில் மீன்வியாபாரம் செய்து வாழ்ந்துவந்த மீனவர் சமூகங்களைச் சார்ந்த பலரும் கத்தோலிக்கராக மாறினார்கள். 1713இல் குமரி நிலப்பரப்பில் 24 முக்குவர் மற்றும் பரவர் சவளக்காரர் குடியிருப்புகள் இருந்ததாக இயேசு சபைக் குருவும் வரலாற்றாசிரியருமான தோமினிக் ஃபெரோலி என்பவர் கூறுகிறார்.</p><p>(ஆதாரம்: சே ரோ. நற்சீசன் எழுதிய “குமரிக் கிறிஸ்தவர்களின் பயணப் பாதை”, 2010 பதிப்பு, பக். 76)</p><p>7) சாந்தாயி நாடாத்தி என்னும் மறைபரப்பாளர்</p><p>இயேசு சபையைச் சார்ந்த பிரஞ்சு மறைபரப்பாளர் அருள்திரு அதிரியான் கவுசானல் இருதயகுளத்தில் “திரு இருதய சகோதரர்கள் சபை”யை 1925ஆம் ஆண்டில் தோற்றுவித்தவர். வடக்கன்குளத்தில் பணியாற்றிய அவர் பதித்துள்ள சில குறிப்புகளைக் கீழே காணலாம்:</p><p>சுமார் 1680ஆம் ஆண்டளவில், சாந்தாயி என்ற பெயர்கொண்ட சாணார் பெண் ஒருவர் தம் கணவர் ஞானமுத்து என்பவரோடு ஆனக்கரை பங்கின் தோப்புவிளை என்ற ஊரிலிருந்து வந்தார். சாந்தாயி இன்று வடக்கன்குளம் என்று அறியப்படுகின்ற ஊரில் கத்தோலிக்க கிறிஸ்தவ சமயம் பரவுவதற்குக் காரணமாக இருந்தவே அவரே. அவர் மனம் திருப்பியவர்களுள் மிகப் பலர் நாடார் சமூகத்தினரே. மேலும், திருவிதாங்கூரிலிருந்து பாண்டிய இராச்சியத்திற்குச் செல்லும் வழியில் வடக்கன்குளம் இருந்ததால் அங்கு நிறுவப்பட்ட மறைப்பணித் தளம் அன்றைய கோட்டாறு மறைமாவட்ட உள்நாட்டுப் பகுதிகளில் கத்தோலிக்க சமயம் பரவுவதற்கு மிகவும் துணையாக இருந்தது.</p><p>1720ஆம் ஆண்டளவில் வடக்கன்குளத்தை மையமாகக் கொண்ட தென் திருவிதாங்கூர் பகுதியில் சுமார் 3000 நாடார்கள் கத்தோலிக்கர் ஆயினர்.</p><p>இக்குறிப்புகள் மதுரை பணித்தளத்தில் பணிபுரிந்த இயேசு சபை குருக்களின் பதிவுகளிலிருந்து அறியக் கிடக்கின்றன.</p><p>(ஆதாரம்: அருள்திரு அதிரியான் கவுசானல், சே.ச., திருநெல்வேலி வரலாற்றுக் குறிப்புகள், திருநெல்வேலி, 1925, பக். 140-142).</p><p>1685இலிருந்துகுமரிப்பகுதிநாடார்குலமக்கள்பெருமளவில்கத்தோலிக்கர்கள்ஆனார்கள். அவர்களதுமுக்கியபணிமையங்களாககாரங்காடு(முளகுமூடுமறைவட்டம் – கல்குளம்வட்டம்), வேங்கோடு(திரித்துவபுரம்மறைவட்டம் – விளவங்கோடுவட்டம்) ஆகியவைஅமைந்தன. காரங்காட்டின்கிளைப்பணித்தளங்களாக18ஆம்நூற்றாண்டில்இரணியல், மாங்குழி, முளகுமூடு, மணலிக்கரை, மாத்திரவிளை, ஆலஞ்சி, முள்ளங்கினாவிளை, பழையகடைஆகியஇடங்கள்விளங்கின. அதுபோல,வேங்கோடுபணிமையத்தின்கீழ்புதுக்கடை, களியக்காவிளை, குழித்துறை, பாறசாலைஆகியகிளைப்பணித்தளங்கள்அமைந்தன.</p><p>1871ஆம் ஆண்டு புள்ளி விவரத்தின்படி கோட்டாறு மறைமாவட்டப் பகுதியில் சுமார் 44,500 கத்தோலிக்கர் வாழ்ந்தனர்.</p><table><colgroup><col></colgroup><tbody><tr><td>மறைத் தளம்</td><td>கத்தோலிக்கர் எண்ணிக்கை</td></tr><tr><td>1) கன்னியாகுமரி</td><td>4000</td></tr><tr><td>2) புத்தன்.துறை</td><td>3300</td></tr><tr><td>3) பிள்ளைத் தோப்பு</td><td>3200</td></tr><tr><td>4) குளச்சல்</td><td>6000</td></tr><tr><td>5) குறும்பனை</td><td>?</td></tr><tr><td>6) கோட்டாறு</td><td>6890</td></tr><tr><td>7) காரங்காடு</td><td>6500</td></tr><tr><td>8) வேங்கோடு</td><td>4000</td></tr><tr><td>9) இனயம் (தேங்காப்பட்டணம்)</td><td>3000</td></tr><tr><td>10) முளகுமூடு</td><td>7000</td></tr><tr><td>மொத்தம்</td><td>44,490</td></tr></tbody></table><p>மேலும், உள்நாட்டு மீனவர்களும் பிற மக்களும் கத்தோலிக்க சமயத்தைத் தழுவியதால் ஒருவர் மற்றவருக்குத் துணையாக இருந்திருப்பர் என்று கூறலாம்.</p><p>(ஆதாரம்: சே.ரோ. நற்சீசன், குமரிக் கிறிஸ்தவர்களின் பயணப் பாதை, நாஞ்சில் பதிப்பகம், 2010, பக். 79-83).</p><p>8) துன்பங்களுக்கு நடுவே கிறிஸ்துவுக்குச் சான்று பகர்ந்த மறைசாட்சிகள்</p><p>அருளாளர் தேவசகாயம் பிள்ளை (1712-1752)</p><p>குமரிப்பகுதியில்கத்தோலிக்கசமயம்வேரூன்றஉழைத்தவரானசவேரியார்இறந்துசரியாகஇருநூறுஆண்டுகளுக்குப்பின்னர், கோட்டாறுமறைமாவட்டத்தின்மறைசாட்சிதேவசகாயம்பிள்ளைகிறிஸ்தவநம்பிக்கைக்காக1752, சனவரி14நள்ளிரவில்ஆரல்வாய்மொழிகாற்றாடிமலையில்கொல்லப்பட்டார். அவருக்கு2012, டிசம்பர்2ஆம்நாளில் “முத்திப்பேறுபெற்றவர்” (அருளாளர்) பட்டம்வழங்கப்பட்டதுகோட்டாறுவரலாற்றில்மறக்கமுடியாதநிகழ்ச்சிஆகும்.</p><p>அருளாளரும்மறைசாட்சியுமானதேவசகாயம்கோட்டாறுமறைமாவட்டத்தில்நாயர்குலத்தில்உதித்தவராயினும்அனைத்துத்தரப்பினராலும்போற்றப்படுகின்றஒருகிறிஸ்தவநம்பிக்கைவீரராகத்திகழ்கின்றார்.</p><p>இன்றையகுழித்துறைமறைமாவட்டப்பகுதியில்நட்டாலம்ஊரில்1712ஆம்ஆண்டுபிறந்ததேவசகாயத்தின்இயற்பெயர்நீலம்பிள்ளை. எஸ்தாக்குடிலனாய்என்றடச்சுஇராணுவஅதிகாரிநீலம்பிள்ளைக்குக்கிறிஸ்தவமறையின்உண்மைகளைஎடுத்துக்கூறினார். நீலம்பிள்ளைதமதுபூர்வீகஇந்துசமயத்தைவிட்டுவிட்டு, வடக்கன்குளத்தில்இயேசுசபைமறைப்பணித்தளத்தில்கத்தோலிக்கராகத்திருமுழுக்குப்பெற்றார். மார்த்தாண்டவர்மாமன்னர்திருவிதாங்கூரில்ஆட்சிசெய்தஅக்காலத்தில்(1729-1758), தேவசகாயம்பிள்ளைதமதுகிறிஸ்தவநம்பிக்கையின்பொருட்டுபலதுன்பங்களையும்இன்னல்களையும்அனுபவித்தார். இறுதியாக, திருவிதாங்கூர்இராச்சியத்தின்தெற்குஎல்லையில்ஆரல்வாய்மொழிகாற்றாடிமலையில்சுட்டுக்கொல்லப்பட்டார். அவர்இறந்தஇடம்இன்றையபுதியகோட்டாறுமறைமாவட்டத்தில்உள்ளது.</p><p>தேவசகாயம்பிள்ளையின்வீரமரணத்தைக்கோட்டாறுமறைமாவட்டமக்கள்ஒருபோதும்மறந்ததில்லை. அவர்பிறந்துமூன்றுநூற்றாண்டுகளுக்குப்பின்அவருக்கு “அருளாளர்” (முத்திப்பேறுபெற்றவர்) என்னும்பட்டம்2012, டிசம்பர்2ஆம்நாள்வழங்கப்பட்டபோது, கோட்டாறுமறைமாவட்டம்அந்நிகழ்ச்சியைமிகச்சிறப்புடன்கொண்டாடியது.</p><p>இன்றுஅருளாளரும்மறைசாட்சியுமானதேவசகாயம்பிள்ளைபுதியகுழித்துறைமாவட்டத்திற்கும்புதியகோட்டாறுமறைமாவட்டத்திற்கும்பொதுவானபாதுகாவலராகஉள்ளார்என்பதுகுறிப்பிடத்தக்கது. அவர்பிறந்தஇடம்குழித்துறைமறைமாவட்டத்திலும்அவர்கிறிஸ்தவநம்பிக்கையின்பொருட்டுஉயிர்நீத்தஇடம்புதியகோட்டாறுமறைமாவட்டத்திலும்இருப்பதுஇந்தஇருமறைமாவட்டங்களும்நல்லுறவிலும்இணக்கத்திலும்தொடர்ந்துசெயல்படுவதற்குஒருமுன்குறியாகஉளதுஎனலாம்.</p><p>தேவசகாயம்பிள்ளைமறைசாட்சியாகஉயிர்துறந்தநிகழ்ச்சியைதிருவிதாங்கூர்பகுதியில்பணியாற்றியகார்மேல்சபைத்துறவியானபவுலீனுஸ்என்பவர்1794இல்இலத்தீனில்எழுதியநூலில்விவரிக்கிறார். (காண்க: கிழக்குநாடானஇந்தியாவில்கிறிஸ்தவம் – India Orientalis Christiana – பக். 167-168).</p><p>கத்தோலிக்கநாடார்துன்புறுத்தப்படுதல்</p><p>கார்மேல்சபைத்துறவிபவுலீனுஸ்மேலேகுறிப்பிட்டநூலில்தேவசகாயம்பிள்ளையின்வீரமரணம்பற்றிப்பேசியதைத்தொடர்ந்து, திருவிதாங்கூரில்கிறிஸ்தவநாடார்துன்புறுத்தப்பட்டதையும்விரிவாகஎடுத்துரைக்கிறார். அதன்சுருக்கம்இங்கேதரப்படுகிறது:</p><p>1780ஆம்ஆண்டில்திருவிதாங்கூர்இராச்சியத்தில்நாகம்பிள்ளைசர்வாதிகாரியக்காரன்என்றஅரசுநிர்வாகிபணஆசையால்தூண்டப்பட்டு, கிறிஸ்தவநாடார்மக்கள்தங்கள்வீட்டிலுள்ளபொன், வெள்ளிபோன்றஅனைத்துவிலையுயர்ந்தபொருள்களையும்எடுத்துதன்னிடம்கொண்டுவந்துகொடுக்கவேண்டும்என்றுகட்டாயப்படுத்தினார். அவ்வாறுசெய்யாவிட்டால்திருவிதாங்கூர்குலதெய்வமானபத்மநாபசுவாமிசிலையைவழிபடவேண்டும்அல்லதுஅவர்களுடையஉயிருக்கேஆபத்துஎன்றும்நிபந்தனைவிதித்தார். உயிருக்குஅஞ்சிபலமக்கள்மலைகளுக்குஓடிப்போயினர். கையில்அகப்பட்டசுமார்300 பேரில்சிலர்சிலையைவழிபட்டனர், ஆனால்எஞ்சியவர்கள்நாகம்பிள்ளையின்அச்சுறுத்தலுக்குமசியவில்லை.அவர்களைவேங்கோடு, தக்கலை, திருவிதாங்கோடுஆகியஇடங்களுக்குஇழுத்துச்சென்று, கட்டிமரத்திலிருந்துதலைகீழாகத்தொங்கவிட்டுஇரத்தம்சிந்தும்அளவுக்குக்கம்புகளால்அடித்துவதைத்தார்கள். விழுந்தஅடிகளைத்தாங்கமுடியாமல்பெலவேந்திரன், அருளன்என்றஇருவர்உயிர்நீத்தனர்.</p><p>தன்தந்தைஇவ்வாறுகொடூரமாகக்கொல்லப்பட்டதைஅங்குநின்றுகொண்டிருந்தபத்துவயதுசிறுவன்ஒருவன்பார்த்துநெஞ்சம்குமுறினான். அவன்தான்அருளன்மகனானஅருளப்பன். அவன்நீதிபதியைப்பார்த்து, “என்அப்பாகிறிஸ்தவர்என்பதற்காகஅவரைநீங்கள்இப்படிக்கொன்றீர்கள்என்னால், என்னையும்கொல்லுங்கள், நானும்ஒருகிறிஸ்தவன்தான்” என்றுசவால்விட்டுக்கூறினான். சிறுவனைநீதிபதிமிரட்டிப்பார்த்தார். ஆனால்அவன்உறுதியாகஇருந்தான். அவனுக்கும்அடிமேல்அடிகொடுத்துஅடிபணியவைக்கமுயன்றார்அதிகாரி. ஆனால்அருளப்பனோ, ”என்உடலைவேண்டுமென்றால்நீர்துண்டுதுண்டுஆக்கிவிடலாம். ஆனால்எனதுஆன்மாவைஎன்கடவுளிடமிருந்துநீர்பிரிக்கமுடியாது” என்றுவீரத்தோடுபதிலிறுத்தான்.</p><p>தோல்வியுற்றநீதிபதிகிறிஸ்தவர்களைமறுநாளும்அடித்துத்துன்புறுத்தி, அவர்களுடையகாயங்களில்மிளகுப்பொடிதூவிசித்திரவதைசெய்துபார்த்தான். அவர்கள்தங்கள்கிறித்தவநம்பிக்கையில்விடாப்பிடியாகஇருந்ததைக்கண்டு, தன்மேலதிகாரியானநாகம', 'tamil', 1552966214, 4463),
(0, 301, 'schools', 'Schools', 'PRIMARY SCHOOLS 1. St.Wenceslaus Primary School, Alamparai, Thickurichy 629 168  2. Immaculate Heart of Mary’s Primary School, Amsi, Thengapattanam 629 173  3. St.Antony’s Primary School, Appattuvilai, Thuckalay 629 175  4. St.Peter’s Primary School, Che...', '<h4>PRIMARY SCHOOLS</h4><p xss=\"removed\" xss=removed> 1. St.Wenceslaus Primary School, Alamparai, Thickurichy 629 168 <br> 2. Immaculate Heart of Mary’s Primary School, Amsi, Thengapattanam 629 173 <br> 3. St.Antony’s Primary School, Appattuvilai, Thuckalay 629 175 <br> 4. St.Peter’s Primary School, Chekkal, Thirparappu 629 161 <br> 5. R.C. Primary School, Chemparuthivilai, Mekkamandapam 629 166 <br> 6. St.Aloysius Primary School, Elavuvilai 629 171 <br> 7. St.Aloysius Primary School, Kaliakkavilai 629 153 <br> 8. St.Catherine Primary School, Kappiarai 629 156 <br> 9. St.Antony’s Primary School, Kappukadu 629 162 <br> 10. St.Aloysius Primary School, Karenkadu 629 809 <br> 11. R.C. Primary School, Konamkadu, West Neyyoor 629 803 <br> 12. Viagula Annai Primary School, Konnakuzhivilai, Villukury 629 180 <br> 13. St.Francis Primary School, Malayady 629 153 <br> 14. St.Thomas Primary School, Mancode 629 152 <br> 15. St.Francis Xavier Primary School, Manguzhy, Neyyoor 629 802 <br> 16. St.Mary’s Primary School, Melpalai 629 152 <br> 17. R.C.Primary School, Mukkalampadu, Kurunthencode 629 805 <br> 18. St.Joseph’s Primary School, Mulagumoodu 629 167 <br> 19. St.Joseph’s Primary School, Mulavilai, Veeyyannoor 629 177 <br> 20. St. Mary’s Primary School, Murasancode, Neyyoor 629 802 <br> 21. St. Michael’s Primary School, Mylacode, Alencode 629 802 <br> 22. St.Mary’s Primary School, Nellickavilai, Thickurichy 629 168 <br> 23. R.C.Primary School, Palliyady 629 169 <br> 24. St.James Primary School, Parakunnu, Vanniyoor 629 163 <br> 25. Christ The King Primary School, Piracode, Fathimanagar 629160 <br> 26. St.Joseph’s Primary School, Siluvaipuram, Kollencode 629 160 <br> 27. R.C.Primary School, Thirithuapuram, Kuzhithurai 629 163 <br> 28. Sacred Heart Primary School, Thumpaly, Irenipuram 629 197 <br> 29. St.Antony’s Primary School, Thundathuvilai, Karingal 629 157 <br> 30. St.Francis Primary School, Vavarai, S.T.Mangad 629 172 <br> 31. St.Francis Primary School, Vencode 629 171</p><p xss=\"removed\" xss=removed> 32. Little Flower R.C.Primary School, Venkanji, Palavilai, Fathimanagar 629 160</p><p xss=\"removed\"></p><h4>MIDDLE SCHOOLS</h4><p xss=\"removed\">33. Sacred Heart Middle School, Kadayal 629 101 <br>34. St.Joseph’s Middle School, Kalkurichy, Thuckalay 629 175 <br>35. St.Theresa’s Middle School, Kandanvilai 629 810 <br>36. Nallayan R.C.Middle School, Nallayanpuram, Moovottukonam, Palugal 629 170 <br>37. Arockia Annai Middle School, Palayam, Meycode 629 804 <br>38. St.Joseph’s Middle School, Puthenkadai, Thiruvattar 629 177 <br>39. St.Mary’s Middle School, Puthukadai 629 171 <br>40. St.Gabriel’s Middle School, Thickurichy 629 168 <br>41. St.Joseph’s Middle School, Valanoor, (Via) Kaliakkavilai, Chathencode 629 153 <br>42. R.C.Middle School, Vellicode, Mulagumoodu 629 167 </p><p xss=\"removed\"></p><h4>HIGH SCHOOLS</h4><p xss=\"removed\">43. R.C. High School, Chemparuthivilai <br>44. St.Aloysius High School, Elavuvilai 629 171 <br>45. St.Antony’s High School, Kappukadu 629 162 <br>46. St.Joseph’s High School, Mathiravilai, Thickanamcode 629 804 <br>47. St.Joseph’s High School, Mulavilai, Veeyyannoor 629 177 <br>48. Sacred Heart High School, Pacode, Thickurichy 629 168 <br>49. R.C. High School, Palliyady 629 169 <br>50. St.James High School, Parakunnu, Vanniyoor 629 163 <br>51. Christ The King High School, Piracode, Fathimanagar 629 160 <br>52. St.Joseph’s High School, Siluvaipuram, Kollencode 629 160 <br>53. St.Antony’s High School, Thundathuvilai, Karingal 629 157</p><p xss=\"removed\"></p><h4>HIGHER SECONDARY SCHOOLS</h4><p>54. St. Peter’s R.C. Higher Secondary School, Chekkal <br>55. R.C. Higher Secondary School, Konamkadu, West Neyyoor 629 803 <br>56. St. Aloysius Higher Secondary School, Karenkadu <br>57. St.Lawrence Higher Secondary School, Madathattuvilai, Villukury 629 280 <br>58. St.Francis Xavier Higher Secondary School, Manguzhy, Neyyoor 629 802 <br>59. St.Mary’s Higher Secondary School, Melpalai 629 152 <br>60. St.Joseph’s Higher Secondary School, Mulagumoodu 629 167 <br>61. St.Joseph’s Higher Secondary School, Thirithuapuram, Kuzhithurai 629 163 <br>62. St.Francis Higher Secondary School, Vavarai, S.T.Mangad 629 172 <br>63. St.Francis Higher Secondary School, Vencode 629 171\r\n</p><h4>ENGLISH MEDIUM SCHOOLS</h4><p>1. Little Flower English Primary School, Kanjampuram – 629 154 <br>2. Carmel English Primary School, Manalikarai, Manalikarai – 629 164 <br>3. Holy Angels Matric School, Melpuram, Pacode – 629 168 <br>4. St. Joseph’s Matric School, Mulagumoodu, Mulagumoodu – 629 167 <br>5. Arul Jothi English Primary School, Solapuram, Kumarapuram – 629 189 <br>6. Nirmal English Primary School, Swamiarmadam, Kattathurai – 629 158 <br>7. Infant Jesus English Primary School, Thirithuvapuram, Kuzhithurai – 629 163 <br>8. Amala Convent Matric School, Thuckalay – 629 175 <br>9. Sahayamatha English Primary School, Vavarai, S.T. Mangad – 629 172 <br>10. St. Antony’s English Primary School, Chemparuthivilai, Mekkamandapam – 629 166 <br>11. Carmel Metric School, Kolvel, Thiruvarambu– 629 189 <br>12. Carmel Matric School, Mathapuram, Tholayavattam P.O. <br>13. Munchirai Punitha Arockia Matha Matric School, Puthukadai – n629 171 <br>14. Holy Angels Matric School, Chentharai, Keezhkulam – 629 193 <br>15. Mother Theresa Matric H.S.S., Mylacode, Alencode – 629 802 <br>16. Child Jesus Matric H.S.S., Unnamalaikadai – 629 179 <br>17. Little Flower Nursery and Primary School, Chetticharvilai, Veeyanoor – 629 177 <br>18. Sacred Heart Matric School, Viricode, Marthandam – 629 165 <br>19. Nanchil CBSC School, Vahuthalampallam, Thickanamcode – 629 804 <br>20. Holy Trinity CBSC School, Chithirencode, Chithirencode P.O </p>', 'english', 1555004173, 3956),
(0, 301, 'institutions', 'Institutions', 'St. Xavier\'s Catholic College of Engineering, ChunkankadaiSt. Xavier\'s Catholic College of Engineering, ChunkankadaiThe dream of the Roman Catholic Diocese of Kottar to create professional higher education institutions, took shape as St. Xavier\'s Catholi...', '<p><a href=\"http://www.sxcce.edu.in/\"><img src=\"http://kuzhithuraidiocese.com/images/sxcce.jpg\" width=\"100%\" xss=removed></a></p><center><a href=\"http://www.sxcce.edu.in/\">\r\n<h4>St. Xavier\'s Catholic College of Engineering, Chunkankadai</h4></a><p><a href=\"http://www.sxcce.edu.in/\"></a></p></center><p><a href=\"http://www.sxcce.edu.in/\"></a></p><center><a href=\"http://www.sxcce.edu.in/\">\r\n<h4>St. Xavier\'s Catholic College of Engineering, Chunkankadai</h4></a></center>\r\n<p>The dream of the Roman Catholic Diocese of Kottar to create professional higher education institutions, took shape as St. Xavier\'s Catholic College of Engineering in the year 1998 under the nurturing leadership of (the late) Most Rev. Dr. Leon A. Tharmaraj, its founder and the first chairman. The Diocese of Kuzhithurai, bifurcated from the Diocese of kottar, within which, this college is situated, has gladly come forward to continue the rich legacy of SXCCE, with renewed vigor and fresh commitment, under the able leadership of the Most Rev. Dr. Jeromedhas Varuvel, the present chairman and our Bishop.</p><hr><p><a href=\"http://www.xaviersnsg.edu.in/\"><img src=\"http://kuzhithuraidiocese.com/images/sxccn.jpg\" width=\"100%\" xss=removed></a></p><center><a href=\"http://www.xaviersnsg.edu.in/\">\r\n<h4>St. Xavier\'s Catholic College of Nursing, Chunkankadai</h4></a><p><a href=\"http://www.xaviersnsg.edu.in/\"></a></p></center><p><a href=\"http://www.xaviersnsg.edu.in/\"></a></p><center><a href=\"http://www.xaviersnsg.edu.in/\">\r\n<h4>St. Xavier\'s Catholic College of Nursing, Chunkankadai</h4></a></center><p>Thirithuapuram and Mulagumoodu Vicariates are two integral parts of the Roman Catholic Diocese of Kottar in Kanyakumari Disitict. The long standing aspirations of the people of this area and their combined efforts have fructified into the establishment of St. Xavier\'s Catholic College of Nursing. The College aims at preparing graduates who will have the ability to approach health care from a broader and deeper knowledge base and from a greater capacity to apply analytic, synthetic and interpretative skills to their role. The B, Sc. Programme is intended to develop the student as a person who will strive to fulfill his/her role as member of the nursing profession to uphold the dignity of the profession and to establish professional autonomy in nursing education, practice and research</p><hr><p><a href=\"http://www.nanjilcatholiccollegekk.com/\"><img src=\"http://kuzhithuraidiocese.com/images/nanjilcol.jpg\" width=\"100%\" xss=removed></a></p><center><a href=\"http://www.nanjilcatholiccollegekk.com/\">\r\n<h4>Nanjil Catholic College of Arts and Science, Kaliyakkavilai</h4></a><p><a href=\"http://www.nanjilcatholiccollegekk.com/\"></a></p></center><p><a href=\"http://www.nanjilcatholiccollegekk.com/\"></a></p><center><a href=\"http://www.nanjilcatholiccollegekk.com/\">\r\n<h4>Nanjil Catholic College of Arts and Science, Kaliyakkavilai</h4></a></center>\r\n<p>Nanjil Catholic College of Arts and Science, Kaliyakkavilai has been established by Nanjil Milk Plant (a unit of the Diocese of Kuzhithurai), Mulagumoodu vide Government of Tamilnadu G.O. No. 150 dated 26.7.2012. Nanjil Milk Plant, Mulagumoodu, a dreamy and innovative project of the Diocese of Kuzhithurai, has been rendering noble service to the poor, the lowest and the lost through its manifold welfare and developmental programmes. Every year it offers several lakhs of rupees as scholarships to the needy and poor students of the region to pursue their higher studies in Professional Colleges and Arts & Science Colleges.</p><hr><p><a href=\"http://www.morningstarpoly.org/\"><img src=\"http://kuzhithuraidiocese.com/images/mspt.jpg\" width=\"100%\" xss=removed></a></p><center><a href=\"http://www.morningstarpoly.org/\">\r\n<h4>Morning Star Polytechnic College, Chunkankadai</h4></a><p><a href=\"http://www.morningstarpoly.org/\"></a></p></center><p><a href=\"http://www.morningstarpoly.org/\"></a></p><center><a href=\"http://www.morningstarpoly.org/\">\r\n<h4>Morning Star Polytechnic College, Chunkankadai</h4></a></center>\r\n<p>In keeping pace with the sweeping technological advancements, the necessity to provide technical education to the youth of this region, the Roman Catholic Diocese of Kottar in Kanyakumari district established this polytechnic college in august 1984. This polytechnic college was granted recognition by the government of Tamil nadu as a co-educational institution with a total intake of 180 seats vide G.O.763 EST/84 dt.13.6.1984, offering three branches of engineering such as Civil, Mechanical and Electronics & Communication. The three storeyed main black was officially declared open on 24.08.1987 by the founder patron of the college and Bishop of Kottar, the most Rev.Dr.M.Arokiasamy.D.D.</p><hr><p><a href=\"http://www.popejohnpauledu.com/\"><img src=\"http://kuzhithuraidiocese.com/images/pope1.jpg\" width=\"100%\" xss=removed></a></p><center><a href=\"http://www.popejohnpauledu.com/\">\r\n<h4>Pope John Paul II College Of Education, Mulagumoodu</h4></a><p><a href=\"http://www.popejohnpauledu.com/\"></a></p></center><p><a href=\"http://www.popejohnpauledu.com/\"></a></p><center><a href=\"http://www.popejohnpauledu.com/\">\r\n<h4>Pope John Paul II College Of Education, Mulagumoodu</h4></a></center>\r\n<p>Pope John Paul II College Of Teacher Education Mulagumoodu is a great learning centre managed by the Roman Cathilic Diocese of Kottar. This Institution offers high quality educatin with special focus on the total formation of each student. With the motto \"Create New Worlds\" the institute imparts human values on every student. It services the people of all castes and creeds with a special preference to the poorest of the poor. It is well estavlished with all the necessary infrastructure and advanced teaching technologies. It is located at Mulagumoodu, 20 Kms away from Nagercoil and 12 Kms from Marthandam on the National Highways.</p><hr><p><a href=\"http://www.mdtti.com.com/\"><img src=\"http://kuzhithuraidiocese.com/images/mdtti.jpg\" width=\"100%\" xss=removed></a></p><center><a href=\"http://www.mdtti.com.com/\">\r\n<h4>Martyr Devasagayam Teacher Training Institute, Unnamalaikadai</h4></a><p><a href=\"http://www.mdtti.com.com/\"></a></p></center><p><a href=\"http://www.mdtti.com/\"></a></p><center><a href=\"http://www.mdtti.com/\">\r\n<h4>Martyr Devasagayam Teacher Training Institute, Unnamalaikadai</h4></a></center>\r\n<p>The Roman Catholic Diocese of Kuzhithurai is the Agency of Martyr Devasahayam Teacher’s Training Institute. This institute is equipped with:</p><ul>\r\n<li>Functionally and artistically designed buildings</li><li>Fully equipped Laboratories</li><li>Full-fledged Library</li><li>Highly qualified and well-experienced faculty</li><li>Numerous facilities for various co-curricular and extra curricular activities.</li></ul>', 'english', 1555004447, 3521),
(0, 301, 'industries', 'Industries', '   ', '<div>\r\n  <a href=\"http://nanjilmilk.com/\"><img src=\"http://kuzhithuraidiocese.com/images/nanjilmilk.jpg\" width=\"100%\" xss=removed></a>\r\n \r\n</div>', 'english', 1555004691, 2333);
INSERT INTO `pages` (`pageID`, `contributor`, `pageSlug`, `pageTitle`, `pageExcerpt`, `pageContent`, `language`, `timestamp`, `visits_count`) VALUES
(0, 301, 'kidss', 'Kidss', 'HISTROY OF KIDSSKIDSS is the official Social Development Organization called KUZHITHURAI INTEGRAL DEVELPOMENT SOCIAL SERVICES (KIDSS) of the new Diocese of Kuzhithurai.GENESIS OF KIDSSKuzhithurai Integral Development Social Services (KIDSS) took its inception ...', '<p>HISTROY OF KIDSS</p><p>KIDSS is the official Social Development Organization called KUZHITHURAI INTEGRAL DEVELPOMENT SOCIAL SERVICES (KIDSS) of the new Diocese of Kuzhithurai.</p><p><u>GENESIS OF KIDSS</u></p><p>Kuzhithurai Integral Development Social Services (KIDSS) took its inception as a charitable organization in September 2002, with the specific aim and objective of helping the downtrodden and economically backward people of the society, irrespective of caste, religion, race, creed and colour for their total development.</p><p>Registered as a Trust : 23rd September 2002 under the leadership of Most Rev Bishop A. Leon Dharmaraj, Bishop of Kottar, as Patron. Now it is under the leadership of Most Rev. V. Jeromedhas, Bishop of Kuzhithurai.</p><center><img src=\"http://kuzhithuraidiocese.com/images/diocesepriest/1006.jpg\" xss=\"removed\"><br>KIDSS First Executive Director cum Secretary<br>Rev.Fr.V. Robert from 2002 – 2008</center><center><img src=\"http://kuzhithuraidiocese.com/images/diocesepriest/1038.jpg\" xss=\"removed\"><br>KIDSS Second Executive Director cum Secretary<br>Rev.Fr. Russel Raj B from 2008 – 2011</center><center><img src=\"http://kuzhithuraidiocese.com/images/diocesepriest/1058.jpg\" xss=\"removed\"><br>KIDSS Executive Director cum Secretary<br>ev.Fr.G.Jeyakumar from 2012 - 2015<p><img src=\"http://kuzhithuraidiocese.com/uploads/pages/575efe630cf8db8f98512cefe1368fd3.jpg\"></p><p xss=removed>KIDSS Present Executive Director cum Secretary</p><p xss=removed>Rev. Fr. John Michael Raj.</p><p xss=removed> from 2016 onwards</p></center>\r\n<p>OPERATIONAL AREA:</p><div><center>Country: INDIA<img src=\"http://kuzhithuraidiocese.com/images/kidss/India-Map.jpg\" width=\"100%\" xss=\"removed\"><br>Municipality : PADMANABAPURAM and KUZHITHURAI<br>Taluk : VILAVANKODE & KALKULAM<br>Blocks : 6 blocks - Kurunthancode, Thuckalay, Thiruvattar, Killiyoor, Munchirai, & Melpuram</center><center>State: TAMILNADU <img src=\"http://kuzhithuraidiocese.com/images/kidss/Tamilnadu-map.gif\" width=\"100%\" xss=\"removed\"></center><center>District: KANNYAKUMARI<br><img src=\"http://kuzhithuraidiocese.com/images/kidss/kktaluk.gif\" width=\"70%\" xss=\"removed\"><br><img src=\"http://kuzhithuraidiocese.com/images/kidss/kkdt-map.jpg\" width=\"70%\" xss=\"removed\"></center><p>VISION</p><p>“<em>Towards a Sustainable Humanistic and Just Society based on the principles of Love, Peace, Justice, Equality and Fraternity”.</em></p><p>MISSION</p><p>“<em>To restore the lost human dignity and human rights of the poor and the marginalized through a participatory process; so that they bring about basic changes in Socio- Economic, Political and Cultural realms including Internal & External and Personal & Societal spheres of Human Kind”.</em></p><p>LONG TERM OBJECTIVES</p><ul>\r\n<li>Analytical studies to be made available and used for the development of the identified target people.</li><li>Need based groups (Sangams) to be formed.</li><li>People to plan and to implement for their own transformation.</li><li>Instilling social concern and social responsibility among the people.</li><li>Special intervention plans be designed to improve the status of Children, Women, Fish Vendors, Cobblers, Children, Physically and Mentally challenged people ( Differently able persons), Scheduled castes, Scheduled tribes, etc.</li><li>Promote higher education with well planned intervention.</li><li>Availing information on the government welfare schemes and the ways to benefit them.</li><li>Self-employment opportunities to be made available.</li><li>Promote small scale industries.</li><li>Organize and encourage the agricultural labourers, fish vendors, artisans and construction works to participate in their respective government sponsored social welfare boards.</li><li>Encourage and promote active participation of men and women in democratic structures like Panchayats institutions.</li><li>Special target based groups be formed to approach the government to avail the benefits of all the public facilities and infrastructure necessary for better living condition.</li><li>Encourage people to participate in Self Help Groups (SHG).</li><li>Encourage and promote public reading rooms (library) and communication facilities.</li><li>Provide carrier guidance to choose job oriented professional studies.</li><li>Better Housing, Sanitation, Water and Electricity for all.</li><li>Increase the awareness on Sanitation, Environment and Ecology.</li><li>To promote organic farming and bio composed manure</li><li>Spread and promote the use of traditional medical practices like Sidda, Ayurvedic, Unani and Naturopathy.</li><li>Awareness education on changing socio, economic political and cultural situations</li><li>Introduce and promote counseling courses and family counseling.</li><li>To respond to the needs of the people according to the need of the hour.</li></ul><p><br><img src=\"http://kuzhithuraidiocese.com/images/kidss/1.JPG\" width=\"85%\" xss=\"removed\"> <br><br><img src=\"http://kuzhithuraidiocese.com/images/kidss/2.JPG\" width=\"85%\" xss=\"removed\"> <br><br><img src=\"http://kuzhithuraidiocese.com/images/kidss/3.JPG\" width=\"85%\" xss=\"removed\"></p><p>MAJOR ACTIVITIES OF KIDSS</p><p>There are ten units functioning under Kuzhithurai Integral Development Social Services, concentrating the various social ethnic groups and people engaged in particular profession.</p><p><em>Dalit development Programme (DDP)</em></p><p>From its inception, KIDSS concentrated more on the problems of the dalits who are very much discriminated by the high cast people. The target people of this programme belong to five communities viz. Barbers, Dhobis, Kaanis, Pulayars and Sambavars. Out of the total population of Dalits 50% are Dhobis, 25% are Barbers and 25% are Sambavars, Pulayars and Kaanis. The majority of the people of these communities are homeless, poverty stricken and leading a very miserable life.</p><p>The Dalit Development Programme is taking its maximum effort to develop the living of these people by way of organizing them into Dalit Development Units (Association) and giving awareness and empowerment inputs. Thus the Dalit Development Program and the target people have a strong hope that we can try for some daring steps to improve the status of the target people in respect of social, education and economic situation. There are 59 groups with 787 members at present</p><p><em>Rural Motivation Programme (RMP)</em></p><p>Rural Motivation Program started in the year 2002. Its target people are agrarian men and women and those who toil with the land. RMP, as a unit of KIDSS, has formed these browbeaten people into Sangams (Village Development Society) and now motivates them to take up issues and problems affecting the people and community at large.</p><p>These people’s welfare associations encourage and support the illiterate and the poor to become good leaders and train them to be sustainable and independent. 119 groups are formed with 3402 members and it has four people’s Bank.</p><p><em>Community Health Development Programme (CHDP)</em></p><p>Community Health Development Programme is spread over 35 villages. There are eleven staff members who go to these villages, giving awareness to the people on health and hygiene. Recently, a qualified doctor was appointed to treat the in-patients, who is also in-charge for conducting camps in the villages. Unlike the allopathic medicines, the naturopathy medicines have no side effects. The Community Health Development Program also concentrates on the mother’s health, particularly on their pregnancy period, HIV/AIDS infected people as well as affected people; promoting capsules like spirulina, preparing health mix at low price and distributing among the village people.</p><p><em>Interior Fisher-people Organization (IFO)</em></p><p>The interior fisher people have their origin at the sea coast; however, for their livelihood, they purchase fish from coast and sell in the interior villages, and thus, eventually proceeded to live in the inland villages. They do not go for fishing; rather, they are retail vendors of fish. Therefore, they are known as Inland Fisher People. In actual life, these interior fishermen do not have equal status as people who live at the sea coast.</p><p>KIDSS tries to organize them into <em>Sangams</em> (Associations) in order to prevent them from any type of enslavement. Right now, there are 50 Sangams at the village level, where people assemble each month, discuss their problems, resolve to settle the issues and thus get united in all endeavors. Acknowledging their problems for livelihood and human rights, KIDSS has set apart a separate unit for them, which is known as IFO, that is, Interior Fisher-people Organization.</p><p><em>Women Self Confidence Programme (WSCP)</em></p><p>The very concept of widows and their acceptance in the society even in this era of scientific advancement and technological progress is dejection, glumness and disheartenment. They are not supposed to have rights or needs or self-esteem for themselves. The outward appearance itself should mark a difference between the women who have husbands and widows.</p><p>The widows of Kanyakumari district are working as unskilled laborers in the following areas: cashew-nut factories, brick making industries, domestic servants, petty business like flowers, vegetables, fish, tamarind, coconut, tapioca sellers etc, assisting the masons, making baskets and scavengers who clean the public toilets and streets.</p><p>The income from these works is very minimal and it is very hard for them to manage their lives. There is no job security to these women. Many women do not enjoy good health due to various factors. Hospitalizations and medications throw them into great debts and to come out of such great money owing is inconceivable to them.</p><p>Kuzhithurai Integral Development Social Services has made a statistical study throughout the project area and identified 1113 widows who are deserving, helpless and drowning in life due to poverty, abandonment, sickness and unemployment. We formed 66 Sangams for all these widows.</p><p><em>Banana Farmers Development Programme (BFDP)</em></p><p>Banana Farmers are a sizeable number of workers in our project area. Most of them are landless farmers, who get land through lease and then do banana farming. The problems of these people are indescribable. They need to pay the lease amount for the land received from land owners, spend money for cultivation, work about 10 months in this land, and at the end, very often flood or heavy draught cause damages to the entire banana field. These farmers avail loan from bank or receive money for interest from private persons throughout these ten months, and finally lose everything. There are hundreds of suicides recorded due to such loss resulting great amount of debt.</p><p>In 2007, Kuzhithurai Integral Development Social Services made an effort to organize these banana farmers and now we have 147 Sangams in different villages, which are registered as Banana Farmers Self-Help Groups. The Unit for these people is called BFDP, that is, Banana Farmers Development Programme.</p><p><em>Vicariate Integral Development Social Services (VIDSS)</em></p><p>KIDSS works for the people of six vicariates of the diocese. Such a vicariate structure is called VIDSS. VIDSS is operative in our project area. These VIDSS coordinate the BIDSS at the parish level that is what we call Basic Integral Development Social Services. There are 147 BIDSS in the diocese.</p><p>Vicariate structures have executive committees and separate project directors to carry out the programme. All parishes and sub-parishes have become vibrant missionary centers due to the existing BIDSS programme.</p><p><em>Self Help Groups (SHG)</em></p><p>KIDSS and one of its units “Rural Motivation Programme” have jointly formed 198 Self Help Groups in this project area. There are three full-timers and several voluntary workers who organize these groups. Except a few, women are the members in all groups.</p><p><em>TASOSS ( New Thrust Programme (N.T. Program)</em></p><p>KIDSS is one of the 26 diocesan social service societies of Tamilnadu and Pondicherry States which is called TASOSS ( Tamilnadu Social Service Organisation). All these diocesan social service societies have a programme named New Trust Programme. This programme is aimed at the radical transformation in every sphere of people’s life in Tamilnadu and Pondicherry States.</p><p>Currently, the sixth phase of the New Thrust Programme is operative in KIDSS with 1 full time staff and ……. volunteers. Livelihood and Human Rights are the main target for this fourth phase. In addition to this, KIDSS has identified three areas of work for this fourth phase: a) Ecology (special attention to global warming); b) No to Drugs; c) Children’s Rights………………..</p><p><em>KIDSS Kolping India</em></p><p>KIDSS Kolping India project started in the year 2015with … groups. The objective of the project is</p><ul>\r\n<li>to help people especially the poor to live in freedom from hunger, injustice and lead a dignified human life befitting the creation.</li><li>To promote groups of the target people on the basis of the principles of KIDSS Kolping India and motivate them for savings.</li><li>To implement, various developmental and welfare programs for the group members.</li><li>To enable the group members to attain self-sufficiency in all spheres such as spiritual, economic, cultural and social and to live a community life based on harmony, fraternity and freedom.</li></ul><p>The various activities under this project is</p><ul>\r\n<li>Formation of groups and Capacity building</li><li>Individual Income Generation Program (IIGP)</li><li>Vocational Training Program (VTP)</li><li>Sanitation Program (SAP)</li><li>Promote small savings</li><li>Housing program (HP)</li><li>Collective Income Generation Program(CIGP)</li><li>Milch Animal Program( MAP)</li></ul><p>There are 33 groups with 655 members both men and women.</p><p><br><img src=\"http://kuzhithuraidiocese.com/images/kidss/4.JPG\" width=\"85%\" xss=\"removed\"> <br><br><img src=\"http://kuzhithuraidiocese.com/images/kidss/5.JPG\" width=\"85%\" xss=\"removed\"></p></div>', 'english', 1574334682, 3245),
(0, 301, 'thedal', 'Thedal', 'Sep 2016August 2016சூலை 2016', '<p><br><img src=\"http://kuzhithuraidiocese.com/images/thedal.jpg\" width=\"100%\" xss=removed></p><h3><a href=\"http://kuzhithuraidiocese.com/thedal/5.pdf\"><br>Sep 2016</a></h3><h3><a href=\"http://kuzhithuraidiocese.com/thedal/4.pdf\"><br>August 2016</a></h3><h3><a href=\"http://kuzhithuraidiocese.com/thedal/1.pdf\"><br>சூலை 2016</a></h3>', 'english', 1555005905, 2445),
(0, 301, 'thenaruvi-media', 'Thenaruvi Media', '', '<p>தேனருவி மீடியா நமது குழித்துறை மறைமாவட்டத்தின் சமூகத்தொடா்பு பணிக்குழுவின் கலைத்தொடா்பகம். இதன் வழி இணையவழி இறையாட்சிப் பணி முன்னெடுக்கப்படுகின்றது</p>', 'english', 1605765756, 2394);

-- --------------------------------------------------------

--
-- Table structure for table `parish`
--

CREATE TABLE `parish` (
  `id` int(11) NOT NULL,
  `churchid` int(11) DEFAULT NULL,
  `cimg` varchar(100) DEFAULT NULL,
  `chistory` varchar(2000) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `psaint` varchar(75) DEFAULT NULL,
  `estd` varchar(20) DEFAULT NULL,
  `substation` varchar(300) DEFAULT NULL,
  `institution` varchar(300) DEFAULT NULL,
  `anbiyam` varchar(30) DEFAULT NULL,
  `pious` varchar(300) DEFAULT NULL,
  `families` varchar(30) DEFAULT NULL,
  `population` varchar(30) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `sgroups` varchar(300) DEFAULT NULL,
  `pemail` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `slug` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `access_user` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parish`
--

INSERT INTO `parish` (`id`, `churchid`, `cimg`, `chistory`, `cname`, `psaint`, `estd`, `substation`, `institution`, `anbiyam`, `pious`, `families`, `population`, `website`, `address`, `telephone`, `sgroups`, `pemail`, `type`, `slug`, `access_user`) VALUES
(99, 1001, '1001.jpg', '     ', 'Alavnvilai', 'St Aloysius Gonsaga', '1778St. Aloysius Gon', '      St. Michael Church,Kuzhivilai. St. Antony Church,Nullivilai.', '              St.Aloysius Higher Secondary School', 'Parish Council,Finance Council', '              Little Way Association,YCS,Youth,Women Movement,CLC,Vincent De Paul Society,Franciscan 3rd Association,Catholic Action Society,Legion of Mary,KAIGAL', '', '', '', '        Karenkadu post', '', '              ', '', 'Parish', 'alavnvilai', NULL),
(100, 1002, '1002.jpg', '', 'Church of Our Lady of Nativity', NULL, '1860', 'Vilavooor', 'St.Josephs Matric Higher Secondary School', 'Parish Council,Finance Committ', 'Childrens Movement,Little Way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Legion of Mary,Christian Life Movement,Kolping Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-nativity', NULL),
(101, 1003, '1003.jpg', '', 'Church of St. Francis Xavier', NULL, '1910', 'Vadivilai', 'St.Francis Xavier Higher Secondary School', 'Parish Council,Finance Council', 'Legion of Mary,Christian Life Movement,KOPING,Womens Movement,Little Way Association,Childrens Movement,YCS,Youth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier', NULL),
(102, 1004, '1004.jpg', '', 'Church of Our Lady of Assumption', NULL, '1906', 'Arulanandapuram-St.John De Britto,Thickanamcode-St.Antony', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-assumption', NULL),
(103, 1005, '1005.jpg', '', 'Church of St. James', NULL, '1908', 'Kesavapuram,Thettiyode', 'St.Josephs Middle School', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Asociation,YCS,Youth,Legion of Mary,KAIGAL,IFO,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-james', NULL),
(104, 1006, '1006.jpg', '', 'Church of St.Antony', NULL, '1910', 'Tharathattu,Nattalam,Mankarai', NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society,Womens Movement,Rural Motivation Program,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(105, 1007, '1007.jpg', '', 'Church of St. Joseph, MANALIKARAI [1913]', NULL, '1909', 'Swamiyarmadam,Solapuram,Kumarapuram,Perumchilampu,Mukilankarai,Kallankuzhy', 'St.Mary Goretty HSS,Carmel Girls HSSSt.Josephs Primary School,Carmel Nursery and Primary School,Aruljothi Nursery and Primary School,Nirmala Institute of Technology,Carmel Boys Home for Children,Carmel Hospital', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,Young Christian Association,Youth Movement,Christian Workers Association,Catholic Action,Rural Motivation Program,Womens Movement,Christian Life Association,Vincent de Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-joseph-manalikarai-1913', NULL),
(106, 1008, '1008.jpg', '', 'Church of St. Sebastian, MADATHATTUVLIAI [1918]', NULL, '1918', 'Villukuri', 'St.Sebastian Matriculation School,Madathattuvilai', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-sebastian-madathattuvliai-1918', NULL),
(107, 1009, '1009.jpg', '', 'Church of the Most Holy Trinity, THIRITHUVAPURAM [1920]', NULL, '1910', '', 'R.C.Primary School Thirithuvapuram,Infant Jesus & Primary School Thirithuvapuram,St.Josephs Hr.Sec.School Thirithuvapuram', 'Parish Pastoral Council,Financ', 'Youth Commission,Christian Workers Movement,Womens Movement,Catholic Action Society,YCS,Rural Motivation Program,Christian Life Movement,Legion of Mary,Vincent De Paul Society,Catholic Sangam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-most-holy-trinity-thirithuvapuram-1920', NULL),
(108, 1010, '1010.jpg', '', 'Church of Our Lady of Assumption, PUTHUKADAI [1920]', NULL, '1911', '', NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth Movement,IFO,Legion of Mary,Vincent De Paul Society,Sacred Heart Pius association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-assumption-puthukadai-1920', NULL),
(109, 1011, '1011.jpg', '', 'Church of Our Lady of Mt. Carmel, VAVARAI [1924]', NULL, '1924', 'Our Lady of Ransom Church Kuzhivilai,St.Josephs Puthukkodu,St.Antonys Church Konaseri', 'St.Francis Primary School', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Workers Movement,Legion of Mary,Christian Life Movement,Vincent De Paul Society,KAIGAL,Rural Motivation Program,Dalit Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-mt-carmel-vavarai-1924', NULL),
(110, 1012, '1012.jpg', '', 'Church of St. Michael Archangel, CHERUVALLOOR [1930]', NULL, '1930', 'Thomayarpuram-St.Thomas,Mancode-St.Joseph,Kottarakonam(Mission Station', NULL, 'Parish Council, Finance Commit', 'Childrens Movement, YCS, Youth, Little way Associaion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-michael-archangel-cheruvalloor-1930', NULL),
(111, 1013, '1013.jpg', '', 'Church of the Sacred Heart of Jesus, PALLIYADY [1931]', NULL, '1931', 'St.Peters Church Cherikadai', 'Primary School and High School', 'Parish Council,Finance Council', 'Childrens Movement, YCS, Youth, Little way Associaion,Rural Motivation Program,KAIGAL,Women Movement,Legion of Mary,Vincent De Paul Society,Sacred Heart Pius Association,Franciscan 3rd Association,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-sacred-heart-of-jesus-palliyady-1931', NULL),
(112, 1014, '1014.jpg', '', 'Church of St. Augustine, KULASEKHARAM [1931]', NULL, '1930', 'Paicadu,Cheruthikonam', 'Primary and Higher Secondary School', 'Parish Council,Anbiam(BCC)-27,', 'Legion of Mary,Christian Life Movement,Vincent De Paul Society,Youth,YCS,Little Way Association,Childrens Movement,IFO,Christian Workers Association,KAIKAL,Dalit Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-augustine-kulasekharam-1931', NULL),
(113, 1015, '1015.jpg', '', 'Church of St. Eusthachius, PACKIAPURAM [1936]', NULL, '1936', NULL, NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Legion of Mary,Catholic Action Society,Catholic Sangam,Youth,Vincent De Paul Society,Sacred Heart of Jesus,Christian Workers of Movement,Young Christian Workers Movement,Womens Movement,KAIGAL,CRMI,Christian Life Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-eusthachius-packiapuram-1936', NULL),
(114, 1016, '1016.jpg', '', 'Church of St.John of the Cross, SILUVAIPURAM [1936]', NULL, '1936', 'Santhapuram-St.Therese of Child Jesus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-john-of-the-cross-siluvaipuram-1936', NULL),
(115, 1017, 'b6fbdfad2acd4b9360ad99ead7bfc28d.jpg', '', 'Church of St. Antony of Padua, CHEMPARUTHIVILAI [1939]', NULL, '1939', 'Eathavilai-Christ the King,Mekkamandapam-Our Lady of Assumption', 'R.C.Primary & High School', 'Parish Council,Finance Committ', 'Childrens Movement,Little Way Association,YCS,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Catholic Association,Christian Life Movement,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony-of-padua-chemparuthivilai-1939', '268'),
(116, 1018, '1018.jpg', '', 'Church of St.Therese of Child Jesus, KANDANVILAI [1944]', NULL, '07-04-1924', 'Eraniel,Chithenthoppu,Pandaravilai', 'St.Theresa Middle School', 'Parish Council,Finance Council', 'Youth,Catholic Action Society,Sacred Heart Pius Association,Francis 3rd Comittee,Rural Motivation Program,Christian Life Movement,Childrens Movement,Little Way Association,YCS,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-therese-of-child-jesus-kandanvilai-1944', '301'),
(117, 1019, '1019.jpg', '', 'Church of St. Francis Xavier, VENCODE [1949]', NULL, '1329', 'St.Michaels Church Vettuvilai', 'St.Francis Xaviers Primary School,St Francis Xaviers Higher Secondary School', 'Parish Council,Finance Council', 'Childrens Movemnt,Little Way Association,YCS,Youth,Vincent De Paul Society,Catholic Action Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier-vencode-1949', NULL),
(118, 1020, '1020.jpg', '', 'Church of the Sacred Heart of Jesus, KADAYAL [1952]', NULL, '1965', 'Kilathoor,Pongingkalai', 'Sacred Heart Middle School Kadayal', 'Parish Council,Finance Council', 'Youth,Childrens Movement,Childrens Life Movement,Catholic Action Society,Vincent De Paul Society,Legion of Mary,YCS,Little Way Association,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-sacred-heart-of-jesus-kadayal-1952', NULL),
(119, 1021, '1021.jpg', '', 'Church of St.Joseph, KALKURICHY [1954]', NULL, '1954', 'Paruthiaraithottam-St.Michael', 'St.Josephs Middle School,St.Josephs Nursery & Primary School', 'Parish Council,Finance Council', 'Youth Movement,Catholic Action Society,Catholic Society,Vincent De Paul Sangam,Holy Childhood,Little Way Association,Sacred Heart Pius Association,Legion of Mary,YCS,Christian Workers Movement,Christian Stone Workers Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-joseph-kalkurichy-1954', NULL),
(120, 1022, '1022.jpg', '', 'Church of St.Antony, KAPPUKAD [1955]', NULL, '1926', 'Annainager,Vilathurai', 'St.Antonys Primary and High School', 'Parish Council, Sunday Catechi', 'Little Way Association,YCS,Youth,Rural Motivation Program,KAIKAL,Kolping,Catholic Action Society,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony-kappukad-1955', NULL),
(121, 1023, '1023.jpg', '', 'Church of St. Antony of Pauda, POOTTETTY [1956]', NULL, '1956', 'Paloor-Church of St.Theresa of Child Jesus,Theruvukadai-Church of our Lady of Good Health', NULL, 'Parish Council,Anbiam(BCC)-18,', 'Little Way Association,YCS,Childrens Movement,Youth,Rural Motivation Program,Christian Life Movement,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony-of-pauda-poottetty-1956', NULL),
(122, 1024, '1024.jpg', '', 'Church of the Imm. Heart of Mary, AMSI [1958]', NULL, '1947', 'Fathima Nagar,Oottukuzhi', 'Immaculate Heart of Mary Primary School', 'Parish Council,Anbiam(BCC)-21,', 'Little Way Association,Childrens Movement,YCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-imm-heart-of-mary-amsi-1958', NULL),
(123, 1025, '1025.jpg', '', 'Church of the Sacred Heart, PACODE [1959]', NULL, '1959', 'Our Lady of Lourdes Nellikkavilai', 'Sacred Heart High School, Pacode', 'Parish Council,Finance Committ', 'Little Way Association,YCS,Youth Movement,Kolping,KAIGAL,Vincent De Paul Society,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-sacred-heart-pacode-1959', NULL),
(124, 1026, '1026.jpg', '', 'Church of O.L. of Mt. Carmel, MURASANCODE [1963]', NULL, '1963', 'Elanthavilai,Palayam,Kannode,Komanvilai,Kottavilai Mission,Aathivilai Mission', 'St.Marys Primary School Murasancode,Arockia Annai Middle School Palayam', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth Movement,Legion of Mary,Catholic Action Society,Vincent De Paul Society,Womens Movement,Rural Motivation Program,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-o-l-of-mt-carmel-murasancode-1963', NULL),
(125, 1027, '1027.jpg', '', 'Church of St. Francis Xavier, KONAMKADU [1964]', NULL, '1964', '', 'St.Xaviers Dispensary,Library,RC Primary School,RC Higher Secondary School', 'Parish Council,Finance Committ', 'Christian Workers Movement,Franciscan Movement 3rd Order,Legion of Mary,Youth,Childrens Movement,Little Way Association,YCS,Vincen De Paul Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier-konamkadu-1964', NULL),
(126, 1028, '1028.jpg', '', 'Church of St. Catherine, KAPPIARAI [1966]', NULL, '1986', '', 'St.Catherines Primary School', 'Parish Council,Anbiam(BCC)-10,', 'Childrens Movement,Little way Association,Altar Boys Association,YCS,Youth Group,Women Development Society,Kolping Movement,Catholic Service Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-catherine-kappiarai-1966', NULL),
(127, 1029, '1029.jpg', '', 'Church of St.Antony, THUNDATHHUVILAI [1966]', NULL, '1966', 'Church of St.Francis Xavier Karungal,Church of Our Lady of Perpectual Succour Kannanvilai,Church of Infant Jesus Perumankuzhy', 'Nirmala Hospital', 'Parish Council,Anbiam(BCC)-29,', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony-thundathhuvilai-1966', NULL),
(128, 1030, '1030.jpg', '', 'Church of the Holy Guardian Angel, MELPURAM [1967]', NULL, '1967', 'Vattavilai,Parakonam', 'Holy Angels Matric School', 'Parish Council,Finance Committ', 'Childrens Movement,Little way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Rural Motivation Program,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-holy-guardian-angel-melpuram-1967', NULL),
(129, 1031, '1031.jpg', '', 'Church of Our Lady of Lourdes, ALANVILAI [1968]', NULL, '1968', 'Kurunthancode', NULL, 'Parish Council,Finance Council', 'Little Way Association,Childrens Movement,Youth Movement,Womens Movement,YCS,Legion of Mary,Catholic Action Society,Education Committee,Sacred Heart Pius Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-lourdes-alanvilai-1968', NULL),
(130, 1032, '1032.jpg', '', 'Church of Our Lady of Sorrows', NULL, '1968', 'Soosaipuram', 'R.C.Middle School', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-sorrows', NULL),
(131, 1033, '1033.jpg', '', 'Church of the Sacred Heart of Jesus', NULL, '1968', 'Chemmankalai', 'St.James Primary & High School', 'Parish Council,Finance Committ', 'Little Way Association,YCS,Youth Movement,Liturgy Committee,Sacred Heart Society,Women Movement,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-sacred-heart-of-jesus', NULL),
(132, 1034, '1034.jpg', '', 'Church of St.Michael', NULL, '1971', 'Xavierpuram', 'St.Josephs Higher Secondary School,Mother Theresa Matric Higher Secondary School', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-michael', NULL),
(133, 1035, '1035.jpg', '', 'Church of Our Lady of Assumption', NULL, '1974', 'Transfiguration of our Lord Church Aikkiyanager,Our Lady of Fatima Church Mankalai', 'St.Marys Primary School,St.Marys Higher Secondary School', 'Parish Council,Finance Committ', 'Childrens Movement,Little Way Association,YCS,Youth Movement,Catholic Action Society,Vincent De Paul Society,Womens Movement,KAIGAL,Rural Motivation Program,Legion of Mary,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-assumption', NULL),
(134, 1036, '1036.jpg', '', 'Church of St. Elias', NULL, '1972', 'Padmanabhapuram', NULL, 'Parish Council,Anbiam(BCC)-16,', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Kolping Movement,Carmel 3rd Association,Vincent De Paul Society,Catholic Association,Christian Life Movement,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-elias', NULL),
(135, 1037, '1037.jpg', '', 'St. Aloysius Church', NULL, '1927', 'Chadayankuzhi', 'Aloysius High School,Aloysius Primary School', 'Parish Council,Anbiam(BCC)-15', 'Youth Commission,YCS,Children Movement,Legion of Mary,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'st-aloysius-church', NULL),
(136, 1038, '1038.jpg', '', 'Church of St.Therese of Child Jesus', NULL, '1972', 'Valanoor,Varuvilai', 'Little Flower Matriculation School,St.Josephs Middle School', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Womens Movement,Golping,Catholic Service Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-therese-of-child-jesus', NULL),
(137, 1039, '1039.jpg', '', 'Church of St. Antony', NULL, '1973', 'Paramanvilai', 'St.Aloysius Primary School', 'Parish Council,Finance Committ', 'Legion of Mary,YCS,Holy Childhood,IFO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(138, 1040, '1040.jpg', '', 'Church of Our Lady of Mount Carmel', NULL, '1973', 'Kuruvikkad,Ambankalai', 'Mount Carmel Matric.HSS', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society,Christian Workers Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-mount-carmel', NULL),
(139, 1041, '1041.jpg', '', 'Church of Our Lady of Rosary', NULL, '1974', 'Manjady,Eraviputhoorkadai,Chirayankuzhy', NULL, 'Parish Council,Finance Council', 'Altar Boys Association,Holy Childhood,Little Way Association,Catholic Action Society,Liturgy Committee,Rural Motivation Program,Youth,YCS,Vincent De Paul Sangam,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-rosary', NULL),
(140, 1042, '1042.jpg', '', 'Church of Our Lady of Lourdes', NULL, '1975', 'Our Lady of Rosary Pilavilai,St.Antony Manjalumoodu,St.Joseph Malamari', NULL, 'Parish Council,Finance Committ', 'Kolping India,Sacred Heart Pius Association,Womens Movement,Catholic Action Society,Christian Life Movement,Childrens Movement,Little Way Association,YCS,Youth,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-lourdes', NULL),
(141, 1043, '1043.jpg', '', 'Church of Our Lady of Snows', NULL, '1979', 'Pallavilai,Thalakulam', NULL, 'Parish Council,Audit Council,A', 'Little Way Association,YCS,Youth,Rural Motivation Program,Sacred ?Heart Pious Association,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Womens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-snows', NULL),
(142, 1044, '1044.jpg', '', 'Church of St. Francis Xavier', NULL, '1979', 'Nalloor-Christ the King,Unnamalakadai-Our Lady of Ransom', NULL, 'Parish Council,Finance Committ', 'Childrens Movement,Little Way Association,YCS,Youth Movement,Vincent De Paul Society,Kolping Movement,Legion of Mary,Womens Movement,IFO,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier', NULL),
(143, 1045, '1045.jpg', '', 'Church of Good Shepherd', NULL, '1965', 'Christurajapuram, Arokia Annai Nagar', NULL, 'Parish Council,Finance Committ', 'Little Way Association,YCS,Youth Movement,KAIGAL,Dalit Movement,Womens Movement,Legion of Mary,Vincent De Paul Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-good-shepherd', NULL),
(144, 1046, '1046.jpg', '', 'Church of St.Jude Thadeus', NULL, '1984', 'Saicode', 'St.Josephs Middle School', 'Parish Council,Finance Council', 'Youth Movement,Childrens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-jude-thadeus', NULL),
(145, 1047, '1047.jpg', '', 'Church of Christ the King', NULL, '1984', 'Elampilavilai', 'St.Josephs Primary and High Schools', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Catholic Action Society,Vincent De Paul Society,Women Movement,Rural Motivation Program,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-christ-the-king', NULL),
(146, 1048, '1048.jpg', '', 'Church of St.Antony', NULL, '1957', 'Mathapuram', NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(147, 1049, '1049.jpg', '', 'Church of Our Lady of Perpetual Help', NULL, '1964', NULL, NULL, 'Parish Council,Anbiam(BCC)-10,', 'Little Way Association,YCS,Youth,KAIKAL,Dalit Movement,Catholic Action Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-perpetual-help', NULL),
(148, 1050, '1050.jpg', '', 'Church of Our Lady of Assumption', NULL, '1989', 'Chitharal,Antoniyarpuram', NULL, 'Parish Council,Finance Council', 'Little Way Association,YCS,Youth,KAIGAL Movement,Dalit Movement,Christian Life Movement,Catholic Action Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-assumption', NULL),
(149, 1051, '1051.jpg', '', 'Church of St. Andrew', NULL, '1991', NULL, NULL, 'Parish Council,Anbiam(BCC)-5', 'Women Movement,Vincent De Paul Society,Childrens Movement,Little Way Association,YCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-andrew', NULL),
(150, 1052, '1052.jpg', '', 'Church of St.Michael Archangel', NULL, '1991', 'St.Theresas Church Manali', 'Little Flower Primary School Venkanji', 'Parish Council,Anbiam(BCC)-16,', 'Childrens movement,Little way Association,YCS,Youth,Catholic Action Society,Farmers Sangam,Vincent De Paul Sangam,Legion of Mary,Kolping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-michael-archangel', NULL),
(151, 1053, '1053.jpg', '', 'Church of St.Antony', NULL, '1995', 'Aramannam,Ittakaveli', NULL, 'Parish Council,Finance Council', 'Childrens movement,Little way Association,YCS,Youth Movement,Catholic Action Society,Kolping,Sacred Heart Pius Association,Vincent De Paul Society,Legion of Mary,KAIGAL,Womens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(152, 1054, '1054.jpg', '', 'Church of Good Shepherd', NULL, '1995', '', NULL, 'Parish Council,Finance Council', 'Vincent De Paul Society,Legion of mary,Youth,YCS,Little Way Association,Childrens Movement,KAIGAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-good-shepherd', NULL),
(153, 1055, '1055.jpg', '', 'Church of St. Michael', NULL, '1997', '', 'St.Michaels Play School', 'Parish Council,Anbiam(BCC)-16,', 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-michael', NULL),
(154, 1056, '1056.jpg', '', 'Church of St. Antony', NULL, '1997', 'Amalapuram', NULL, 'Parish Council,Finance Committ', 'Vincent De Paul Society,Catholic Action Society,Christian Workers Movement,Rural Motivation Program,Dalit Movement,Christian Life Movement,Legion of Mary,YCS,Little Way Association,Childrens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(155, 1057, '1057.jpg', '', 'Church of St. Joseph', NULL, '1998', 'Godhayar,Valiyela,Alamparai', NULL, 'Parish Council,Finance Council', 'Little way Association,Childrens Movement,Youth Movement,YCS,Christian Workers Movement,IFO,Legion of Mary,Vincent De Paul Society,CLC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-joseph', NULL),
(156, 1058, '1058.jpg', '    <p align=\"justify\">St. Josephs Church, Appattuvilai is one of the 101 parishes in the diocese of kuzhithurai which is located in the southern most tip of India. This beautiful and serene village is surrounded by green trees and ponds. This was established a Parish in 1999. The old church was built in 1964. The works of the new church was started in 2008 by Rev.Fr.Vargheese the then parish priest. The successive priests did their best to carry on the work. The work was successfully completed by Rev.Fr.George Ponnaiah in 2015. The Patron of the parish is St.JOSEPH. </p>\r\n<p align=\"justify\">The peoples hard work and generous contribution is commendable. There are 300 families. The total population is over 1000. People of other religion such as Hindus live with us. There is perfect unity and religious harmony among the people. </p>\r\n<p align=\"justify\">The lay people are the biggest asset to the Catholic community. Their systematic and active involvement in the parish is wonderful. </p>\r\n<p align=\"justify\">The entire community untiedly works for the social spiritual and pastoral improvement of the community. Special attention is paid to the upliftment of the poor and the down trodden. </p>', 'Church of St. Joseph', 'St. Joseph', '1999', '      ', '  St. Joseph Finance<br>Nutritious meal centre (for children)<br>St. Antony Primary school (Tamil Medium)<br>Appattuvilai People Welfare Centre.', 'Parish Council,Anbiam(BCC)-10,', '  Catholic Association,YCW,Youth,Legion of Mary,Sacred Heart Association', '250', '1000', 'www.stjosephsappattuvilai.com', '    Appattuvilai<br>Thuckalay Post - 629175<br>Kanyakumari District<br>  ', '91 4651 256147', '      Catholic Association (Political wing)', 'soosaiyappar@gmail.com', 'Parish', 'church-of-st-joseph', NULL),
(157, 1059, '1059.jpg', '', 'Church of St.Pius X', NULL, '1999', 'Thattanvilai', 'Pius Kindergarten School,St.Theresas Tailoring Centre', 'Parish Council,Anbiam(BCC)-11,', 'Little Way Association,YCS,Youth,Vincent De Paul Society,Legion of Mary,Womens Movement,KAIGAL,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-pius-x', NULL),
(158, 1060, '1060.jpg', '', 'Church of St. Antony of Padua', NULL, '2002', 'Moolachel,Palapalli', NULL, 'Parish Council,Finance Council', 'Youth,YCS,Legion of Mary,Sacred Heart Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony-of-padua', NULL),
(159, 1061, '1061.jpg', '', 'Church of the Holy Redeemer of the World', NULL, '2000', 'Chellankonam,Maruthancode', NULL, 'Parish Council,Finance Council', 'Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-holy-redeemer-of-the-world', NULL),
(160, 1062, '1062.jpg', '', 'Church of Our Lady of Good Health', NULL, '2000', 'Sebastiapuram', 'Arockiya Matha Matriculation School', 'Parish Council,Finance Council', 'Legion of Mary,Vincent De Paul Society,Rural Motivation Program,Youth,YCS,Little Way Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-good-health', NULL),
(161, 1063, '1063.jpg', '', 'Church of Our Lady of Perpetual Succour', NULL, '2001', NULL, NULL, 'Parish Council,Anbiam(BCC)-9,B', 'Women Committee,Education Committee,Rural Motivation Program(women),Commission for Evangelization,Catholic Action Society,Women Welfare Movement,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-perpetual-succour', NULL),
(162, 1064, '1064.jpg', '', 'Church of Infant Jesus', NULL, '2001', NULL, NULL, 'Parish Council,Anbiam(BCC)-6', 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-infant-jesus', NULL),
(163, 1065, '1065.jpg', '', 'Church of the Immaculate Heart of Mary', NULL, '2001', 'Karumpilavilai,Udavilai', 'Sacred Heart Primary School', 'Parish Council,Finance Committ', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,KOLPING,Rural Motivation Program,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-immaculate-heart-of-mary', NULL),
(164, 1066, '1066.jpg', '            a<br>  ', 'Church of Christ the King', 'a', '2002', 'Mannanvilai', 'Christ the King Primary & High Schools', 'Parish Council,Anbiam(BCC)-12,', 'Childrens Group,YCS,Little Way Association,Legion of Mary', 'a', 'a', 'a', '  a', 'a', '    a  ', 'a', 'Parish', 'church-of-christ-the-king', NULL),
(165, 1067, '1067.jpg', '', 'Church of the Ascension of Lord', NULL, '2004', NULL, NULL, 'Parish Council,Finance Council', 'Little Way Association,YCS,Youth Movement,Rural Motivation Program,Sacred Heart Pius Association,Christian Life Movement,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-ascension-of-lord', NULL),
(166, 1068, '1068.jpg', '', 'Church of the Sacred Heart', NULL, '2005', NULL, 'Sacred Heart Matric School', 'Parish Council,Finance Committ', 'Childrens Movement,Youth,Legion of Mary,Christian Life Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-the-sacred-heart', NULL),
(167, 1069, '1069.jpg', '', 'Church of St. Roch', NULL, '2006', 'Monday Market,Thachamparampu', NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth Movement,Christian Workers Movement,Kolping,Legion of Mary,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-roch', NULL),
(168, 1070, '1070.jpg', '', 'Church of St. Therese of Child Jesus', NULL, '2006', NULL, 'St.Peters RC Primary and Higher Secondary School Chekkal', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Catholic Action Society,Rural Development Program,Kolping Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-therese-of-child-jesus', NULL),
(169, 1071, '1071.jpg', '', 'Church of Our Lady of Fathima', NULL, '1987', 'Pilavilai', NULL, 'Parish Council,Finance Council', 'Youth,Vincent De Paul Society,Christian Life Movement,Childrens Movement,Little Way Association,YCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-fathima', NULL),
(170, 1072, '1072.jpg', '', 'Church of St. Michael', NULL, '2008', NULL, NULL, 'Parish Council,Finance Council', 'Kolping Movement,Rural Motivation Program,Christian Life Movement,Catholic Action Society,Vincent De Paul Society,Fransiscan Order III,Childrens Movement,Little Way Association,YCS,Youth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-michael', NULL),
(171, 1073, '1073.jpg', '', 'Church of Our Lady of Sorrows', NULL, NULL, 'Aloor', 'Viyagula Annai Primary School', 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Legion of Mary,Vincent De Paul Society,Christian Workers Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-sorrows', NULL),
(172, 1074, '1074.jpg', '', 'Church of St. Joseph', NULL, NULL, 'Tholayavattam', 'Jeevan Jotji', 'Parish Council,Finance Council', 'Little Way Association,Childrens Movement,Youth Movement,Womens Movement,YCS,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-joseph', NULL),
(173, 1075, '1075.jpg', '', 'Church of St. Antony', NULL, '2008', 'St.Michaels Church Thittavilai,St.Xaviers Church Pullenkuzhi', NULL, 'Parish Council,Finance Council', 'Little Way Association,YCS,Youth Movement,KAIGAL Movement,Womens Movement,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(174, 1076, '1076.jpg', '', 'Church of St. Francis Xavier', NULL, '2009', NULL, NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier', NULL),
(175, 1077, '1077.jpg', '', 'Church of Our Lady of Lourdes', NULL, '2009', 'Chittar,Channelkarai,Maruthamparai-Mission Station', NULL, 'Parish Council,Finance Council', 'Little Way Association,Childrens Movement,YCS,Legion of Mary,Christian Workers Movement,Christian Life Movement,KAIGAL,Carmel 3rd Committee,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-lourdes', NULL),
(176, 1078, '1078.jpg', '', 'Church of St. Joseph', NULL, '2009', 'Thachoor', NULL, 'Parish Council,Anbiam(BCC)-11', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-joseph', NULL),
(177, 1079, '1079.jpg', '', 'Sts.Peter & Paul Church', NULL, '2009', 'Mathoorkonam-Holy Redeemer', NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Assoiation,YCS,Youth,IFO,Sacred Heart Pius Association,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'sts-peter-paul-church', NULL),
(178, 1080, '1080.jpg', '', 'Church of Our Lady of Perpectual Help', NULL, '2009', 'Ponmanai,Perunchani', NULL, 'Parish Council,Anbiam(BCC)-16', 'Youth,YCS,Childrens Movement,Legion of Mary,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-perpectual-help', NULL),
(179, 1081, '1081.jpg', '', 'Church of St. George', NULL, '2010', 'Vasanthapuram', NULL, 'Parish Council,Audit Council,A', 'Little Way Assciation,YCS,Youth Movement,Womens Movement,Legion of Mary,Vincent De Paul Society,Catholic Action Society,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-george', NULL),
(180, 1082, '1082.jpg', '', 'Church of St. Little Flower', NULL, '2010', 'Verkilambi', 'Little Flower Nursery & Primary School', 'Parish Council,Finance Council', 'Banana Farmers Association,Womens Movement,Youth Movement,YCS,Christian Workers Movement,Childrens Movement,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-little-flower', NULL),
(181, 1083, '1083.jpg', '', 'Church of St. Antony', NULL, '2010', 'Kattuvilai', NULL, 'Parish Council,Anbiam(BCC)-9', 'Childrens Movement,Little Way Association,YCS,Youth Commission,Catholic Action Society,Legion of Mary,Vincent De Paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(182, 1084, '1084.jpg', '', 'Church of St. Antony', NULL, '2010', NULL, NULL, 'Parish Council,Anbiam(BCC)-6,S', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Christian Life Movement,Womens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(183, 1085, '1085.jpg', '', 'Church of St. Antony', NULL, '2010', NULL, NULL, 'Parish Council,Finance Committ', 'Little Way Association,YCS,Youth Movement,Kaigal Movement,Kolping Association,Legion of Mary,Rural Motivation Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(184, 1086, '1086.jpg', '', 'Church of St. Francis Xavier', NULL, '2007', 'Mathar', NULL, 'Parish Council,Anbiam(BCC)-9,B', 'Childrens Movement,Little Way Association,YCS,Youth,Vincent De Paul Society,Catholic Action Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier', NULL),
(185, 1087, '1087.jpg', '', 'Church of St. Francis Xavier', NULL, '2011', NULL, NULL, 'Parish Council,Finance Council', 'Childrens Movement,YCS,Youth Movement,Women Movement,Legion of Mary,Vincent De paul Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier', NULL),
(186, 1088, '1088.jpg', '', 'Church of Our Lady of Sorrows', NULL, '2011', 'Maavilai', 'St.Marys R.C.Primary School', 'Parish Council,Finance Council', 'Legion of Mary,Catholic Action Society,Christian Workers Movement,Don Bosco Youth Movement,YCS,Little Way Association,Childrens Movement,Kolping Movement,Franciscan 3rd Order,Vincent De Paul Sangam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-sorrows', NULL),
(187, 1089, '1089.jpg', '', 'Church of St. Antony', NULL, '1945', NULL, NULL, 'Parish Council,Finance & Audit', 'Catholic Action,RMP,YCS,Little Way Association,Childrens Movement,Youth Movement,Sacred Heart Society,Legion of Mary,Womens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(188, 1090, '1090.jpg', '', 'Church of Our Lady of Fatima', NULL, '2011', 'Muthalar,Machuvilai', NULL, 'Parish Council,Anbiam(BCC)-11,', 'Youth Group,YCS,Rural Motivation Program,Christian Workers Movement,Legion of Mary,Holy Childhood,Little Way Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-fatima', NULL),
(189, 1091, '1091.jpg', '', 'Church of St. Antony', NULL, '2012', NULL, NULL, 'Parish Council,Finance Committ', 'Legion of Mary,YCS,Catholic Action Society,Christian Workers Movement,Childrens Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(190, 1092, '1092.jpg', '', 'Church of Our Lady of Fatima', NULL, '2012', 'Kakkavilai', NULL, 'Parish Council,Anbiam(BCC)-7 S', 'Little way Association,YCS,Children Movement,Legion of Mary,Catholic Action Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-fatima', NULL),
(191, 1093, '1093.jpg', '', 'Church of St. Joseph', NULL, '2012', NULL, NULL, 'Parish Council,Finance Committ', 'Little way Association,YCS,Youth Movement,Rural Motivation Program,Catholic Action Society,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-joseph', NULL),
(192, 1094, '1094.jpg', '', 'Church of Our Lady of Mount Carmel', NULL, '2013', NULL, NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Womens Movement,Christian Life Movement,Rural Motivation Program,KAIGAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-our-lady-of-mount-carmel', NULL),
(193, 1095, '1095.jpg', '', 'Church of St. Francis Xavier', NULL, '2013', NULL, NULL, 'Parish Council,Anbiam(BCC)-9', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Legion of Mary,Vincent De Paul Society,KAIGAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-francis-xavier', NULL),
(194, 1096, '1096.jpg', '', 'Church of St. Gabriel', NULL, '2013', 'Church of Our Lady of Goog Health, Kallupalam', 'St.Gabriel R.C. Middle School', 'Parish Council,Finance Committ', 'Little way Association,YCS,Youth Movement,Rural Motivation Program,Catholic Action Society,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-gabriel', NULL),
(195, 1097, '1097.jpg', '', 'Church of St. Antony', NULL, '2014', NULL, NULL, 'Parish Council,Finance Council', 'Childrens Movement,Little Way Association,YCS,Youth,Catholic Action Society,Christian Workers Movement,Legion of Mary,Christian Life Movement,Vincent De Paul Society,KAIGAL,Rural Motivation Program,Dalit Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(196, 1098, '1098.jpg', '', 'Church of Sacred Heart of Jesus', NULL, '2014', 'Maruthoorkurichi', NULL, 'Parish Council,Finance Council', 'Youth Commission,YCS,Little Way Association,Legion of Mary,Catholic Action Movement,Christian Workers Movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-sacred-heart-of-jesus', NULL),
(197, 1099, '1099.jpg', '', 'Church of St. Antony', NULL, '2014', 'Veppuvilai', NULL, 'Parish Council,Finance Committ', 'Youth Movement,Legion of Mary,Christian Life Movement,Sacred Heart Pius Association,Catholic Action Society,YCS,Little Way Association', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-antony', NULL),
(198, 1100, '1100.jpg', '', 'Church of St.Michael the Archangel', NULL, '2014', NULL, NULL, 'Parish Council,Finance Committ', 'Kolping India,Sacred Heart Pious Association,Womens Movement,Catholic Action Society,Christian Life Movement, Childrens Movement,Little Way Association,YCS,Youth,Vincent De Paul Society,Legion of Mary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Parish', 'church-of-st-michael-the-archangel', NULL),
(202, 1101, '1101.jpg', '-', 'Martyr Devasahayampillai Shrine, Nattalam 629 195', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shrine', 'martyr-devasahayampillai-shrine-nattalam-629-195', NULL),
(203, 1102, '1102.jpg', '-', 'St. Antony Shrine, Vettuvenni, Kuzhithurai 629 163', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shrine', 'st-antony-shrine-vettuvenni-kuzhithurai-629-163', NULL),
(204, 1103, '1103.jpg', '-', 'Martyr Devasahayampillai Shrine, Puliyoorkurichy, Thuckalay 629 175', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shrine', 'martyr-devasahayampillai-shrine-puliyoorkurichy-thuckalay-629-175', NULL),
(205, 1104, '1104.jpg', '-', 'St. Antony Shrine, Chunkankadai 629 003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shrine', 'st-antony-shrine-chunkankadai-629-003', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parish_pages`
--

CREATE TABLE `parish_pages` (
  `id` int(11) NOT NULL,
  `pp_parish_id` int(11) DEFAULT NULL,
  `pp_page_name` varchar(256) NOT NULL,
  `pp_page_slug` varchar(256) CHARACTER SET utf8 NOT NULL,
  `pp_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(122) UNSIGNED NOT NULL,
  `user_type` varchar(250) DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `user_type`, `data`) VALUES
(1, 'Member', '{\"users\":{\"own_create\":\"1\",\"own_read\":\"1\",\"own_update\":\"1\",\"own_delete\":\"1\"}}'),
(2, 'admin', '{\"users\":{\"own_create\":\"1\",\"own_read\":\"1\",\"own_update\":\"1\",\"own_delete\":\"1\",\"all_create\":\"1\",\"all_read\":\"1\",\"all_update\":\"1\",\"all_delete\":\"1\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `contributor` int(11) NOT NULL,
  `postSlug` varchar(255) NOT NULL,
  `postTitle` text NOT NULL,
  `postExcerpt` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `postContent` text NOT NULL,
  `categoryID` text NOT NULL,
  `postHeadline` varchar(1) NOT NULL DEFAULT 'N',
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `timestamp` int(22) NOT NULL,
  `visits_count` int(22) NOT NULL,
  `commission_id` int(22) NOT NULL DEFAULT '0',
  `p_image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `contributor`, `postSlug`, `postTitle`, `postExcerpt`, `tags`, `postContent`, `categoryID`, `postHeadline`, `language`, `timestamp`, `visits_count`, `commission_id`, `p_image`) VALUES
(9, 301, 'அழிந்துவரும்-கிராமிய-விளையாட்டுகளும்-பண்பாட்டுச்-சவால்களும்', 'அழிந்துவரும் கிராமிய விளையாட்டுகளும் பண்பாட்டுச் சவால்களும்', '', 'kumariathavan,villagegames', '<p><img src=\"https://images.yourstory.com/production/document_image/mystoryimage/432fbmjr-Tamil-Games.png?fm=png&auto=format\"></p><p xss=\"removed\">விளையாட்டு என்ற கலை ஒவ்வொரு சமூகத்திலும் இயல்பாக அமைந்துள்ளது. இது சமூகத்துக்குச் சமூகம்</p><p xss=\"removed\">வேறுபாடுகளையும் வித்தியாசமான பயன்பாடுகளையும் கொண்டு விளங்கும். இந்த விளையாட்டுகள் அந்தந்தச்</p><p xss=\"removed\">சமூகத்தின் மனவெழுச்சி, அறிவு, பண்பாட்டு நிலை, இயற்கைச் சூழல் இவற்றுக்கேற்பக் கட்டமைக்கப்</p><p xss=\"removed\">பெற்றுள்ளன.</p><p xss=\"removed\">விலங்குகள் போல் திரிந்த நிலை, வேட்டையாடிய நிலை, நாடோடி நிலை, கால்நடைகள் மேய்த்த நிலை, உழவு</p><p xss=\"removed\">நிலை முதலியனவாக மக்களது பண்பாடு படிப்படியாக உயர்ந்து வந்துள்ளது. இவையே விளையாட்டில்</p><p xss=\"removed\">மிளிர்கின்றன என்பார் ஸ்டான்லி ஹால். விளையாட்டால் ஒருவருக்கு உடலுரம், உள்ளக்கிளர்ச்சி, மறப்பண்பு,</p><p xss=\"removed\">மதிவன்மை, கூட்டுறவுத்திறம், வாழ்நாள் நீட்டிப்பு முதலியன உண்டாகின்றன என்கிறார் பாவாணர்.</p><p xss=\"removed\">விளையாட்டு என்பது மனிதனுக்கு ஓர் உடல் சார்ந்த தேவை. அன்று அறுவடை முடிந்த வயல்வெளி, மேய்ச்சல்</p><p xss=\"removed\">நிலம் போன்றவை விளையாட்டுக்களமாக விளங்கினாலும், பெரும்பாலும் தெருக்கள்தாம் விளையாட்டிடமாக</p><p xss=\"removed\">இருந்தன. கிராமிய விளையாட்டுகளைக் கூர்ந்து நோக்கும் போது நம் சமூகக் கட்டமைப்புக்கு உட்பட்டும்,</p><p xss=\"removed\">செய்யும் தொழில், உழைப்பின் தன்மை, வாழும் பகுதியின் தட்ப வெட்ப நிலை, மொழி, கலாச்சாரம், ஓய்வு நேரம்</p><p xss=\"removed\">ஆகியவற்றைச் சார்ந்து உருவாகி வளர்ந்தன என்பது புலனாகும். இந்த நிலைப்பாடு உலாகளாவிய</p><p xss=\"removed\">விளையாட்டுகளுக்கு இல்லை.</p><p xss=\"removed\">உலாகளாவிய விளையாட்டுகள், ஒரு குறிப்பிட்ட சமூகத்தில் தோற்றம் பெற்றிருந்தாலும் இன்று,</p><p xss=\"removed\">பண்பாடுகளின் கட்டமைப்பிலிருந்து வெளிக்கொண்டு வரப்பட்டு பொதுவாக்கப்பட்டுள்ளது. இந்த</p><p xss=\"removed\">விளையாட்டுகள் மனிதனுக்கு உடல், அறிவு தொடர்பான பயன்பாட்டிற்கு உதவுமே தவிர உணர்வு சார்ந்த</p><p xss=\"removed\">மனவெழுச்சி நிலைக்குப் பயன்படாது. ஆனால் கிராமிய விளையாட்டுகளுக்குச் சமூகம் சார்ந்த, இலக்கியம்,</p><p xss=\"removed\">கலை இவற்றோடு நெருக்கம் அதிகமாகவே அமைந்திருக்கும்.</p><p xss=\"removed\">தகவல் தொடர்பு மற்றும் போக்குவரத்து வசதிகளின் அதிநவீன வளர்ச்சி காரணமாக நமது</p><p xss=\"removed\">சமூகங்களுக்கிடையே பண்பாட்டுக் கலப்புகள் பல தளங்களில் நிகழ்ந்து வருகின்றன. மனிதனை ஆட்கொள்கிற</p><p xss=\"removed\">இயற்கைக்கு அப்பாற்பட்ட சக்திகள் நமது பண்பாட்டுக் கூறுகளில் மாறுபாட்டை ஏற்படுத்த வாய்ப்புண்டு.</p><p xss=\"removed\">வணிகம், படையெடுப்புகள், மதமாற்றங்கள் மூலமாக ஒரு சமூகத்தவரது பண்பாட்டு கூறுகள் இன்னொரு</p><p xss=\"removed\">சமூகத்தவரது பண்பாட்டுக் கூறுகளோடு கலந்திருக்கவும் வாய்ப்புண்டு.</p><p xss=\"removed\">இதன் விளைவாகச் சிலவற்றைப் பண்பாட்டுக் கட்டமைப்புக்கு அப்பால் சென்று மனிதன் பெற்றுக் கொள்கிறான்.</p><p xss=\"removed\">இந்தத் தன்மை விளையாட்டுத் துறையையும் விட்டு வைக்கவில்லை. இதன் விளைவாக உலகளாவிய</p><p xss=\"removed\">விளையாட்டுகள் பண்பாடு சார்ந்த, வட்டாரம் சார்ந்த விளையாட்டுகளோடு கலந்துவிடுகின்றன அல்லது</p><p xss=\"removed\">அவைகளை ஆக்கிரமித்து விடுகின்றன. இதனால் சொந்த மண்ணின் பண்பாடு சார்ந்த கிராமிய விளையாட்டுகள்</p><p xss=\"removed\">அழிந்து வரும் அபாயத்தில் உள்ளன. கிராமிய விளையாட்டுகளின் இடத்தை உலகளாவிய விளையாட்டுகள்</p><p xss=\"removed\">பிடித்துக் கொள்வதால் இங்கு ஏற்பட்டுக் கொண்டிருக்கும் பண்பாட்டு அடிப்படையிலான மாற்றங்கள்</p><p xss=\"removed\">வலுவானவை.</p><p xss=\"removed\">கிராமிய விளையாட்டுகள் இயற்கையோடு இயைவன. வீரம், உறுதி, ஊக்கம், உழைப்பு, நட்பு, இரக்கம், நேர்மை,</p><p xss=\"removed\">அறம் என்னும் உயர்ந்த பண்புகள் மனிதர் உள்ளங்களில் கிராமிய விளையாட்டுகள் வழியாகவே</p><p xss=\"removed\">வளர்க்கப்பட்டன. இதன் விளைவாகவே சடுகுடு விளையாட்டில் நாட்டுப்புற பாடல்கள் பயன்படுத்தப்படுவதும்,</p><p xss=\"removed\">களியல் ஆட்டத்தில் பாடல் முறை பின்பற்றப்படுவதும், இவ்விளையாட்டுகளின் தோற்றுவாய்க்குப் பழம் தமிழ்</p><p xss=\"removed\">மரபு சார்ந்த காரண காரியங்களைச் சொல்ல முடிவதும் இயலுகின்றது.</p><p xss=\"removed\">சிறுவர்களுக்கும், இளையோருக்கும், பெரியவர்களுக்கும் நல்ல பொழுது போக்காகவும், உடற்பயிற்சியாகவும்,</p><p xss=\"removed\">கலை ஆசானாகவும், உளவியல் மருத்துவராகவும், வாழ்வு மதிப்பீடுகளை பயிற்றுவிக்கும் ஆசிரியராகவும்</p><p xss=\"removed\">இருந்த இந்த விளையாட்டுகள் இப்பொழுது அருகி விட்டன.</p><p xss=\"removed\">ஒரு காலத்தில் குழந்தைகள் முதல் பெரியோர் வரை உடற்பயிற்சிக்குப் பயன்படுத்திய விளையாட்டுகள் தான்</p><p xss=\"removed\">ஏராளம். இவ்விளையாட்டுகள் உடலுக்குப் பயிற்சியைத் தருவதோடல்லாமல் மனதுக்குப் புத்துணர்ச்சியையும்</p><p xss=\"removed\">கொடுத்தன. மாலையில் களைக்கக் களைக்கப் பல விளையாட்டுகளை விளையாடிய பிறகு குளித்துவிட்டுப்</p><p xss=\"removed\">படிக்க அமரும் போது மனதும் உடலும் அதற்கு ஈடுகொடுக்கும். இன்று காலம் மாறிவிட்டது. பள்ளியிலிருந்து</p><p xss=\"removed\">வந்துவிட்டால் உடனே டியூசன் போக வேண்டும். விளையாட நேரமில்லை. அப்படிக் கிடைக்கும் சிறிது</p><p xss=\"removed\">நேரத்தையும் தொலைக்காட்சிப் பெட்டிகள் அபகரித்து விடுகின்றன.</p><p xss=\"removed\">கிராமிய விளையாட்டுகள் அழிந்து வருவதால் இன்று பண்பாட்டின் மூலங்களுள் ஒன்றான மொழி</p><p xss=\"removed\">விளையாட்டுகளில் பயன்படுத்தப்படுவது குறைக்கப்பட்டுள்ளது. விளையாட்டின் போது அணியப்படும்</p><p xss=\"removed\">ஆடைகளó வித்தியாசப் படுகின்றன. இதனால், கிராமிய விளையாட்டுகளைத் தவிர்த்து உலகளாவிய</p><p xss=\"removed\">விளையாட்டுகளை விளையாடுவதை உயர்வானதாகக் கருதும் நிலை உருவாகிறது. எந்த நிலையிலும் கிராமிய</p><p xss=\"removed\">விளையாட்டுகள் குறிப்பிட்ட பண்பாட்டோடு பெற்றுள்ள உறவு நிலையை, நெருக்கத்தை உலகளாவிய</p><p xss=\"removed\">விளையாட்டுக்களால் தரமுடியாது.</p><p xss=\"removed\">மேற்சொன்ன சிக்கலைத் தீர்க்க இன்று கல்வி, அரசு, சமுதாயம், ஊடகம் போன்றவை உதவ வேண்டும். ஆனால்</p><p xss=\"removed\">அவைகள் உலகளாவிய விளையாட்டுக்களை வளர்ப்பதிலும், அவற்றை எப்படி நம் பண்பாட்டிற்கு உகந்த</p><p xss=\"removed\">விளையாட்டு ஆக்குவது என்பதிலும்தான் கவனமாக இருக்கின்றன. கிரிக்கெட் வீரர்களின் வாழ்க்கை</p><p xss=\"removed\">பாடமாக்கப் பட்டுள்ளதுடன், நம் பண்பாடு சார்ந்த விளையாட்டுப் போல் கிரிக்கெட்டை நம் சமூகத்துக்கு மிக</p><p xss=\"removed\">நெருக்கமான, உறவுடைய ஒன்றாகக் காட்டும் முயற்சியும் கல்வித் திட்டத்தில் அமைந்துள்ளது. இதனால் நம்</p><p xss=\"removed\">சமூகத்தில் உலகளாவிய விளையாட்டின் நுழைவு இலகுவாகõ விடுகிறது.</p><p xss=\"removed\">இன்று தொலைக்காட்சி போன்ற ஊடகங்கள் இந்த உலகளாவிய விளையாட்டுகளைக் கவர்ச்சிகரமாகக் காட்டி</p><p xss=\"removed\">வருவதால், அதில் நடைபெறும் அரசியல் விளையாட்டுகளையோ மோசடிகளையோ ஊழல்</p><p xss=\"removed\">கேவலங்களையோ உணராமல் இன்றைய மாணவர்கள் மற்றும் இளைஞர்கள் தாங்கள் விளையாடும் நிலை</p><p xss=\"removed\">மறந்து சோம்பிக் கிடக்கிறார்கள்.</p><p xss=\"removed\">இன்று ஆளும் வர்க்கம் விரும்பிச் செய்யும் விஷயங்களை ஒட்டுமொத்த மக்களும் பின்பற்ற வேண்டும் என்கிற</p><p xss=\"removed\">ஒரு கோட்பாடு மறைமுகமாகப் புகுத்தப்பட்டு வருவதைக் காண முடிகிறது. இத்தகைய ஊடுருவல்</p><p xss=\"removed\">விளையாட்டுத் துறையையும் விட்டு வைக்கவில்லை. இதன் எதிரொலியாகத்தான் இன்று கிரிக்கெட் உள்ளிட்ட</p><p xss=\"removed\">நவீன விளையாட்டுகள் நம் சமூகத்தில் அரசு, கல்வித்துறை, ஊடகங்கள் வழியாகப் புகுத்தப்படுகின்றன. இதன்</p><p xss=\"removed\">தாக்கத்தால் சமூகம் சார்ந்த விளையாட்டு மன்றங்கள் கூட இந்தச் சூழலுக்கு ஆட்பட வேண்டிய நிர்ப்பந்த</p><p xss=\"removed\">நிலையில் உள்ளன.</p><p xss=\"removed\">ஒவ்வொரு தனி மனிதனையும் அவனவனுடைய பண்பாட்டோடுத் தொடர்புடையவனாக ஆக்கப் பட</p><p xss=\"removed\">வேண்டியது காலத்தின் கட்டாயம் ஆகும். பண்பாட்டிலிருந்து விலகி வாழும் மனிதன் தன் முழுமையான</p><p xss=\"removed\">ஆளுமையை இழந்து விடுகிறான். பழமை மிக்க தமிழ் போன்ற பண்பாடுகளில் இந்த உலகளாவிய</p><p xss=\"removed\">விளையாட்டுகளின் தாக்கம் மிக மோசமான விளைவுகளை உருவாக்கும். எனவே பண்பாட்டுத் தொடர்புடைய</p><p xss=\"removed\">கிராமிய விளையாட்டுக்களை ஊக்குவிக்க வேண்டும். அல்லது இவ்விளையாட்டுக்களை நவீன காலத்துக்கேற்ப</p><p xss=\"removed\">மாற்றங்களைச் செய்து பயன்படுத்த வேண்டும். இதற்கு அரசு, கல்வி நிறுவனம், ஊடகம், சமுதாயம் ஆகியவை</p><p xss=\"removed\">முன் வரவேண்டும்.</p><p xss=\"removed\">தகவல் தொடர்புச் சாதனங்களின் பிரமாண்டமான வளர்ச்சியும், உலக அளவிலான விளையாட்டுப்போட்டிகளின்</p><p xss=\"removed\">அதிகரிப்பும், நடத்துபவர்கள் மற்றும் விளையாட்டு வீரர்களுக்குக் கிடைக்கும் வருமானத்தின் கவர்ச்சியும்,</p><p xss=\"removed\">வேலைவாய்ப்புக்கான அதிகச் சாத்தியகூறுகளும் இளைஞர்களை உலகளாவிய விளையாட்டுகளை நோக்கி</p><p xss=\"removed\">கவர்ந்து இழுப்பதால் பாரம்பரிய விளையாட்டுகளில் பங்கேற்பு கிட்டத்தட்ட நின்றுபோய்விட்டது.</p><p xss=\"removed\">இந்தியா அடிமைப்பட்டிருந்த காலத்தில் இங்கே தங்கியிருந்த ஆங்கில அதிகாரிகளும், இராணுவ வீரர்களும்</p><p xss=\"removed\">தங்களது நாட்டு விளையாட்டுகளை இங்கேயும் விளையாடத் துவங்கினர். ஹாக்கி, கிரிக்கெட், கோல்ப் போன்ற</p><p xss=\"removed\">விளையாட்டுகள் அவை. ஆங்கிலேய ராணுவ வீரர்களின் முக்கிய விளையாட்டாக இருந்தது ஹாக்கியை</p><p xss=\"removed\">விளையாட இந்தியர்களை அனுமதிக்கவில்லை. காலப்போக்கில் ஆங்கில ராணுவத்தில் பணியாற்றிய இந்திய</p><p xss=\"removed\">வீரர்களையும் தங்களோடு ஹாக்கி விளையாடச் சேர்த்துக் கொண்டனர்.</p><p xss=\"removed\">ராணுவ வீரர்கள் ஏழை விவசாயக் குடும்பங்களிலிருந்தும், கீழ்த்தட்டு மற்றும் நடுத்தர குடும்பங்களிலிருந்தும்</p><p xss=\"removed\">வருகிறவர்கள். அவ்வகையில் அது ஒரு அடித்தட்டு மக்கள் பிரிவினர் விளையாடும் விளையாட்டாக</p><p xss=\"removed\">அமைந்தது.. போர்க்குணமிக்க இப்பிரிவினர் விளையாடியதால் ஹாக்கியில் இந்தியா குறிப்பிடத்தக்க</p><p xss=\"removed\">முன்னேற்றத்தைப்பெற்றது. இவ்விளையாட்டு நம்மூர் மாங்கொட்டையடித்தல் விளையாட்டின் மறு</p><p xss=\"removed\">வடிவமாகும்.</p><p xss=\"removed\">கிரிக்கட், கோல்ப் போன்றவற்றைப் பெரும் தலைவர்களும், உயர் அதிகாரிகளுமான ஆங்கிலேயாóகள்தான்</p><p xss=\"removed\">இந்தியாவில் முதலில் ஆடத்துவங்கினர். சிறிது காலங்களுக்குப் பின்னால் இந்தியாவில் இருந்த</p><p xss=\"removed\">மன்னர்களையும், இளவரசர்களையும் விளையாட அனுமதித்தனர். எனவே இது ஒரு ஆளும் வர்க்க</p><p xss=\"removed\">விளையாட்டாக இருந்தது. சுதந்திரத்திற்குப் பிறகும் இந்நிலை தொடர்ந்து, கிரிக்கெட் நீண்டகாலம்</p><p xss=\"removed\">நகர்ப்புறத்தைச் சார்ந்தவர் விளையாட்டாகவே இருந்தது.</p><p xss=\"removed\">ஐந்து நாட்கள் ஆடும் ஒரு உதவாத விளையாட்டாகவே பெரும்பான்மையான மக்கள் இதைக் கருதினர்.</p><p xss=\"removed\">அண்மைக் காலத்தில் இதை ஒரு நாள் போட்டியாக நடத்தத் துவங்கி, தொலைக்காட்சிகள் இவ்விளையாட்டைக்</p><p xss=\"removed\">காட்டத் தொடங்கிய போதுதான் இதனுடைய கவர்ச்சி அதிகரித்தது. பன்னாட்டுக் கம்பனிகள் தங்களது</p><p xss=\"removed\">வியாபாரத்தைப் பெருக்கும் நோக்கங்களுகóகாக இவ்விளையாட்டைப் பயன்படுத்தத் துவங்கின. இதற்காகக்</p><p xss=\"removed\">கோடிக்கணக்கானப் பணத்தைச் செலவு செய்தனர். விளையாட்டு வீரர்களை உயர்ந்த விலை கொடுத்து வாங்கி,</p><p xss=\"removed\">அவர்களைத் தங்களது விளம்பரப் பலகைகளாகப் பயன்படுத்தியதால் கோடிக்கணக்கான பணம் புழங்கும் ஒரு</p><p xss=\"removed\">விளையாட்டாக இது மாறியது.</p><p xss=\"removed\">பணவெறி பிடித்த பெற்றோர்கள் தங்கள் பிள்ளைகளை, கோடீஸ்வரர் ஆக்க வேண்டுமென்ற சுயநல</p><p xss=\"removed\">எண்ணத்தோடு கிரிக்கெட் மற்றும் டென்னிஸ் விளையாட்டுகளில் வலிந்து ஈடுபடுத்தி வருகின்றனர். இங்கே</p><p xss=\"removed\">விளையாட்டின் நோக்கம் வீணாகி விடுவதோடு, விளையாட்டு ஒரு தொழிலாகவும் மாறிவிட்டது. இதனால்</p><p xss=\"removed\">மனமகிழ்ச்சி, திருப்தி, அறிவாற்றல், வாழ்வியல், உடல்நலம், கலை போன்ற அம்சங்கள் காணாமல்</p><p xss=\"removed\">போய்விட்டன.</p><p xss=\"removed\">பண்பாட்டுச் சீரழிவுக்கு விளையாட்டுகளைப் பன்னாட்டு அமைபóபுகளும், ஆளும் வர்க்கமும்</p><p xss=\"removed\">பயன்படுத்துகின்றன. பண்பாட்டைச் சீரழிக்கும், உடல் நலத்திற்கு ஊறு விளைவிக்கும் பொருட்களை விளம்பரம்</p><p xss=\"removed\">செய்வதற்கு விளையாட்டு வீரர்கள் பயன்படுத்தப்படுகின்றனர். கோகோ þ கோலா, பெப்ஸி போன்ற விஷ</p><p xss=\"removed\">மயமான பானங்கள், சிகரெட், மதுவகைகள் போன்றவற்றைத் தயாரிக்கும் கம்பெனிகள் தான் இன்று கிரிக்கெட்</p><p xss=\"removed\">போட்டிகளை ஒளிபரப்பு செய்கின்றன. விளையாட்டு வீரர்கள் இவற்றைப் பயன்படுத்தி விளம்பரங்களில்</p><p xss=\"removed\">நடிப்பதால் அவர்களை விரும்பும் ரசிகர்களும் இந்தப் பழக்கங்களுக்கு அடிமையாகி விடுகின்றனர்.</p><p xss=\"removed\">கோகோ கோலா, பெப்ஸி போன்ற பானங்களில் விஷமயமான ரசாயனப் பொருட்கள் இருப்பதை விஞ்ஞான</p><p xss=\"removed\">ஆய்வுகள் உறுதி செய்தபோது நாடு முழுவதும் இப்பானங்களைப் பருகுவதற்கும், விற்பதற்கும் பல்வேறு</p><p xss=\"removed\">அமைப்புகள் எதிர்ப்பு தெரிவித்தன. இவைகளின் விற்பனைக் கணிசமாகக் குறைந்தது. இதை மாற்றுவதற்காக</p><p xss=\"removed\">இக்கம்பெனிகள் கிரிக்கெட் வீரர்களைப் பயன்படுத்தின. இப்பானங்கள் பருகுவது சிறந்ததென தொலைக்</p><p xss=\"removed\">காட்சிகளில் கிரிக்கெட் நட்சத்திரங்கள் தோன்றிக் கூறியபோது இவற்றின் விற்பனை மீண்டும் அதிகரித்தது.</p><p xss=\"removed\">பண்பாடு சார்ந்த கிராமிய விளையாட்டுகள் அழிவதற்கு நமது தாழ்வு மனப்பான்மையும் ஒரு காரணமாகும்.</p><p xss=\"removed\">மேற்கத்திய மக்கள் உயர்வானவர்கள், அவர்களது விûயாட்டுகள் உயர்ந்தவை என்கிற மனோநிலை நமது</p><p xss=\"removed\">மக்களிடமிருந்து மாற வேண்டும். இன்று கிராமப்புற விளையாட்டுகளை ஊக்குவிப்பாரும் இல்லை.</p><p xss=\"removed\">குக்கிராமங்களில் கூட பெரும்பாலான விளையாட்டுகள் அழிந்துவிட்டன. புதிய தலைமுறைக்கு இப் பண்பாடு</p><p xss=\"removed\">சார்ந்த விளையாட்டுகள் தெரியவில்லை. குழந்தைகள் திட்டமிட்டுச் சூதாடப்படுகிறார்கள். இவற்றைப்</p><p xss=\"removed\">பாதுகாக்க ஒரு பண்பாட்டுப் பேரெழுச்சி தேவைப்படுகிறது.</p><p xss=\"removed\">பண்பாட்டுப் பேரெழுச்சி என்பது ஒரு குறுகிய இனவாதமோ, வெறித்தன்மையோ கொணóடதாக இருத்தல்</p><p xss=\"removed\">ஆகாது. பண்பாட்டின் சிறந்த அம்சங்களைப் பாதுகாப்பதும், அவற்றைப் பலப்படுத்துவதும், நிறைவான</p><p xss=\"removed\">மனமகிழ்ச்சியைத் தருகின்ற விளையாட்டுகளை விளையாடுவதற்கு இளைஞர்களை ஊக்குவிப்பதுமாகும்.</p><p xss=\"removed\">உலக அளவிலான விளையாட்டுகளை முழுமையாக ஒதுக்க இயலாது என்பதும் ஓரளவு உண்மைதான். ஆனால்</p><p xss=\"removed\">அதற்காக நமது மூதாதையர் உருவாக்கிய பண்பாடு சார்ந்த கிராமிய விளையாட்டுகளை மறந்துவிட வேண்டிய</p><p xss=\"removed\">அவசியம் இல்லை. இது பெற்ற தாயை கொன்று மறைப்பது போன்றதாகும்.</p><p xss=\"removed\">ஏழைப் பெண்கள் பாண்டி ஆடினர். மன்னர் குலப் பெண்கள் பந்து விளையாடினர். உழைக்கும் ஏழைகள்</p><p xss=\"removed\">சிலம்பமும், சடுகுடுவும் விளையாடிக் கொண்டிருந்த போது ஆள்வோர் சதுரங்கமும், குதிரைப் பயிற்சியும்</p><p xss=\"removed\">செய்து கொண்டிருந்தனர். வில்வித்தை கற்றதற்காக ஏகலைவன் விரலை இழந்த வரலாறு அனைவருக்கும்</p><p xss=\"removed\">தெரியும். இன்று, அன்னியர் விளையாட்டுகளை ஆள்வோர் பாதுகாக்கின்றனர். அடித்தட்டு மக்களின்</p><p xss=\"removed\">விளையாட்டுகளை ஆள்வோரும் ஒதுக்கிவிடுகின்றனர். குதிரை சவாரி, வில்வித்தை, வாட்போர் போன்ற</p><p xss=\"removed\">விளையாட்டுகள் ஒலிம்பிக்கில் இடம்பெறுகின்றன. சதுரங்கம் சர்வதேச விளையாட்டாக மாறியது. ஆனால்</p><p xss=\"removed\">அடித்தட்டு மக்களின் விளையாட்டுகளான சிலம்பமும், களரியும், சடுகுடுவும் எவருக்கும் விளையாட</p><p xss=\"removed\">விருப்பமில்லாமலும் விளையாடத் தெரியாமலும் போய்விட்டன.</p><p xss=\"removed\">அடித்தட்டு மக்களின் விளையாட்டுகளைப் பாதுகாக்கக் கிராமப்புற இளைஞர்களுக்கு உணர்வூட்ட வேண்டும்.</p><p xss=\"removed\">பண்பாடு சார்ந்த கிராமிய விளையாட்டுப் போட்டிகளை அவ்வப்போது நடத்த முயற்சி எடுத்தல் வேண்டும்.</p><p xss=\"removed\">விளையாட்டுக் கழகங்கள் நம் பண்பாடு சார்ந்த விளையாட்டுகளிலேயே போட்டிகளை நடத்த முன்வர</p><p xss=\"removed\">வேண்டும். அரசு உலகளாவிய விளையாட்டுகளுக்கு முக்கியத்துவம் கொடுப்பதைத் தவிர்த்து பண்பாடு சார்ந்த</p><p xss=\"removed\">விளையாட்டுகளுக்கு முன்னுரிமை தர வேண்டும். அப்போதுதான் தனது சொந்த தேசத்தை நேசிக்கின்ற</p><p xss=\"removed\">இளையதலைமுறையை உருவாக்க முடியும். இல்லையென்றால் இந்தியாவில் இருந்து கொண்டு பிறநாட்டை</p><p xss=\"removed\">நேசிப்பவனாகவும், இந்த நாட்டு ரகசியங்களை அன்னிய நாட்டுக்கு விற்பவனாகவும்தான் இருப்பான்.</p><p xss=\"removed\">நமது பண்பாட்டின் இரத்த ஓட்டமாகிய கிராமிய விளையாட்டுகள், நமது சொத்து. இந்தப் புதையலை மிகவும்</p><p xss=\"removed\">சிரமப்பட்டு தேடிக்கண்டு பிடித்து தூசு தட்டி, அவற்றின் தன்மைகள் மாறாமல் வாழ்வியல், அறநெறி, அறிவுத்</p><p xss=\"removed\">திறன், உடற்பயிற்சி, பொழுது போக்கு, கலைவடிவும் என ஆறு பகுதிகளாகப் பிரித்து, இன்றைய</p><p xss=\"removed\">தலைமுறைக்கும் அடுத்த தலைமுறைக்கும் பயன்படும் சொத்தாக குலைகுலையா முந்திரிக்கா என்ற நூலாகத்</p><p xss=\"removed\">வெளிவந்துள்ளது. 114 விளையாட்டுகள் விளையாடும் முறையோடு கிடைத்துள்ளன. சங்கஇலக்கியத்தில்</p><p xss=\"removed\">ஆய்வுசெய்து இந்த விளையாட்டுகளில் சுமார் நாற்பது விளையாட்டுகள் இரண்டாயிரம் ஆண்டுகளுக்கு</p><p xss=\"removed\">முற்பட்ட தொன்மை கொண்டவை என நிரூபிக்கப்பட்டுள்ளது. இந்த விளையாட்டுகளின் இழப்பால் ஏற்பட்டுள்ள</p><p xss=\"removed\">பண்பாட்டு மாற்றத்தையும் பதிவு செய்துள்ளேன்.</p><p xss=\"removed\">சுமார் இருபது ஆண்டுகளுக்கு முன் எந்த கிராமத்தில் பார்த்தாலும் மாலையில் குழந்தைகள் இளைஞர்கள்</p><p xss=\"removed\">அனைவரும் விளையாடுவார்கள். இன்றைக்கு கிராமங்களில் மைதானங்கள் வெறிச்சோடிக் கிடக்கின்றன.</p><p xss=\"removed\">குடும்பம் ஒட்டு மொத்தமாக சினிமா சீரியல்களில் மூழ்கிப்போய்க் கிடக்கிறது.</p><p xss=\"removed\">இன்றைய தொடர்புச் சாதனங்கள் நமது பண்பாட்டையும், பாரம்பரிய விளையாட்டுகளையும், கலைகளையும்</p><p xss=\"removed\">சீரழித்து, நமது வாழ்விலும் பல பாதிப்புகளை ஏற்படுத்தியுள்ளது. தனியார் தொலைக் காட்சிகள் லாபம்</p><p xss=\"removed\">சம்பாதிக்கும் எண்ணம் தவிர்த்து தாய்நாட்டுப் பற்றோடு நம் மண் சார்ந்த விளையாட்டுகளை</p><p xss=\"removed\">ஒளிபரப்பவேண்டும். கல்வித்துறை மாணவர்களுக்கான உடற்கல்விப் பாடத் திட்டத்தில் நம் மரபு சார்ந்த</p><p xss=\"removed\">விளையாட்டுகளை அறிமுகப்படுத்திப் பயிற்சியளிக்கப் வேண்டும். அப்போது கிராமிய விளையாட்டுகளை</p><p xss=\"removed\">இன்னும் புத்தெழுச்சியோடு உலாவரச் செய்யலாம்.</p><p xss=\"removed\">முகவரி</p><p xss=\"removed\">குமரி ஆதவன், குமாரபுரம் அஞ்சல் - 629 164</p><p xss=\"removed\">குமரி மாவட்டம். அலைபேசி- 9442303783</p><p xss=\"removed\">Kumariaathavan1970@gmail.com</p><p><img src=\"http://kuzhithuraidiocese.com/uploads/posts/25c486a75ea900f44f45841e06675c9b.jpg\" xss=\"removed\"></p>', '[\"1\"]', 'Y', 'english', 1569667911, 1084, 1, NULL),
(11, 301, 'கிறிஸ்து-வாழ்கிறார்', 'கிறிஸ்து வாழ்கிறார்', 'Fr. Titus Mohanஇளைஞர்களுக்கான திருத்தந்தையின் திருத்தூது அறிவுரை மடல்கிறிஸ்து வாழ்கிறார் (CHRISTUS VIVIT) இளையோர...', '', '<p><img src=\"http://kuzhithuraidiocese.com/uploads/posts/eee2d6d6a1020bbdb4b5d2b6bd5abed0.JPG\" xss=\"removed\"><strong><br></strong></p><h4><strong>Fr. Titus Mohan</strong></h4><h4 xss=\"removed\"><span xss=\"removed\"><inline><inline xss=\"removed\">இளைஞர்களுக்கான திருத்தந்தையின் திருத்தூது அறிவுரை மடல்</span></inline></inline></h4><p><strong><br></strong></p><h2><span xss=\"removed\"><b xss=\"removed\">கிறிஸ்து வாழ்கிறார்</b> </span><strong xss=\"removed\"><span xss=\"removed\">(CHRISTUS VIVIT)</span></strong></h2><h4 xss=\"removed\"> இளையோர் என்றாலே தலைவலி, குழப்பவாதிகள், தொந்தரவுகள், மூர்க்கத்தனம் கொண்டவர்கள், கோபக்காரர்கள், அடங்காப் பிடாரிகள், பெற்றோர் பெரியோரை மதிக்காதவர்கள், உணர்ச்சி வசப்படக்கூடியவர்கள், சோம்பேறிகள், எல்லா கெட்ட பழக்கங்களையும் கைவசம் கொண்டவர்கள் என்றெல்லாம்; விசாரணையின்றியே எதிர்மறை கருத்துகளால் தீர்ப்புகளை வழங்குவோர் இன்றளவும் குறைந்தபாடில்லை. இங்ஙனம் இளையோரைப் பற்றிய பார்வையில் எப்பொழுதும் எதிர்மறை எண்ணம் கொண்ட மனிதர்கள் மத்தியில் நம் திருத்தந்தை பிரான்சிஸ் மிகவே வித்தியாசமானவர்.</h4><h4 xss=\"removed\"> என்றும் இளமையாய் இருக்கின்ற திருஅவைக்கு இளையோர்கள் தேவை என்பதை உரக்க முழங்குகின்றார். “உலகின் அனைத்து இளையோரிலும் நான் எப்போதும் எனது நம்பிக்கையை வைத்துள்ளேன். இப்பூமியெங்கும் புதுவசந்தம் பரவ இளையோர் வழியாக கிறிஸ்து ஏற்பாடு செய்கிறார்” என்று அடிக்கடி கூறுகிறார். அவர் பார்வையில் நாமும் இளைஞர்களை நேர்மறையோடு அணுகிட இளையோர் தங்கள் கடமைகள் என்னவென்பதை உணர்ந்து செயல்பட, இளைஞர்களின் அருள்வாழ்வை புடமிட புதிதாய் மலர்ந்திருக்கிறது திருத்தந்தை பிரான்சிஸ் அவர்களின் “கிறிஸ்து வாழ்கிறார்” எனும் திருத்தூது அறிவுரை ஏடு.</h4><h4 xss=\"removed\"><span xss=\"removed\">இளையோர் கரிசனையில் உலக ஆயர் மாமன்றம்</span> </h4><h4 xss=\"removed\"> வழக்கமான பாரம்பரிய முறைகளுக்கு அப்பாற்பட்டு இளையோர் மீது தனிக்கரிசனை கொண்ட நம் திருத்தந்தை இளைஞர்களைப் பற்றி சிந்திப்பதற்காக கடந்த 2016 அக்டோபர் 6 ஆம் நாள் உலக ஆயர் மாமன்றத்திற்கான அறிவிப்புதனை வெளியிட்டார். 2017 சனவரி 13 மாமன்றத்திற்கான தயாரிப்பு ஏடு வெளியிடப்பட்டது. தொடர்ந்து 2017 செப்டம்பர் 11 முதல் 15 வரை சிறப்பு உலக கருத்தரங்கு ஏற்பாடு செய்யப்பட்டது. கருத்தரங்கில் விவாதிக்கப்பட்டவற்றின் அடிப்படையில் 2017 மே 8 ஆம் நாள் ஏட்டின் இறுதி வரைவு தயாரிக்கப்பட்டது. அதன்பின் மார்;ச் 19 முதல் 24 வரை இளையோர் கலந்தாய்வு நடைபெற்றது. அதில் அகில உலகின் சார்பாக மொத்தம் 44 இளைஞர்கள் பங்கேற்க வாய்ப்பு வழங்கப்பட்டது. இது தனிச்சிறப்பே. இந்தியாவிலிருந்து மூன்று கத்தோலிக்கர், ஒரு சீக்கியர் மற்றும் ஒரு இஸ்லாமியர் என ஐந்து இளைஞர்கள் பங்கெடுத்தார்கள். ‘இளையோரே இளைஞர் பணியின் தூதுவர்கள்’ என்று மடலில் திருத்தந்தை குறிப்பிடுவதற்கு இளைஞர்களின் பங்கேற்பே நற்சான்று. </h4><h4 xss=\"removed\"> ‘இளையோர் - நம்பிக்கை, அழைத்தல், தேர்ந்து தெளிதல்’ என்கிற மையக்கருவில் சிறப்பு உலக ஆயர் மாமன்றத்தைக் கூட்டுகையில் நம் திருத்தந்தை “இளையோரே, நீங்கள் புதிய சமுதாயத்தை கனவு காண்கிறவர்கள் திருச்சபைக்கு நீங்கள் தேவை, முக்கியமானவர்கள் நீங்கள் திருஅவைவின் நம்பிக்கை உங்கள் வழியாக எளிதாக நற்செய்தியை அறிவிக்க முடியும் உங்களால் வேகமாக மாற்றங்களை கொண்டு வரமுடியும்” என்றார். இதுதான் உண்மை. மாற்றத்தின் நாற்றங்கால்கள் நம் இளைய சமூகம்.</h4><h4 xss=\"removed\"> எதற்காக இந்த மாமன்றம்? என்கிற கேள்விக்கு பதில் மாமன்றத்தின் இயல்பில்(யேவரசந) இயம்பப்பட்டுள்ளது. அதாவது 1) இளையோரின் உலகிற்குள் நுழைவது 2) இளையோரின் கருத்துக்களை ஓங்கி ஒலிக்கச் செய்வது 3) இளையோரோடு இணைந்து இருப்பது 4) இளையோரின் கருத்துகளுக்கு முன்னுரிமை கொடுப்பது. ஒட்டுமொத்தத்தில் ‘எல்லோரும் மகிழ்ச்சியாக மாண்போடு வாழும் புதிய உலகை உருவாக்குவது’ உலக ஆயர் மாமன்றம் நோக்கமாகும். </h4><h4 xss=\"removed\"> <span xss=\"removed\"> </span><span xss=\"removed\">‘கிறிஸ்து வாழ்கிறார்’ - மடல்</span></h4><h4 xss=\"removed\"> இத்திருத்தூது அறிவுரை மடலானது பத்து தலைப்புகளில் 299 பத்திகளை உள்ளடக்கியுள்ளது. ஓவ்வொரு தலைப்பும் இறையியல் மற்றும் வாழ்வியல் கூறுகளை விவிலியத்தின் அடிப்படையில் மையங்கொண்டுள்ளது.</h4><h4 xss=\"removed\"> முதல் தலைப்பு ‘கிறிஸ்து வாழ்கிறார்’ என்கிற மறையுண்மையை நமக்கு விலாவாரியாக சுட்டிக்காட்டுகிறது. கிறிஸ்துவே நம் நம்பிக்கை. வியப்பான முறையில் அவர் இளமையை நம் உலகுக்குக் கொணர்கிறார். அவர் தொடுகின்ற ஒவ்வொன்றும் இளமையாக புதியதாக முழுமையான வாழ்வாக மாறுகின்றன. கிறிஸ்து வாழ்கிறார்! மற்றும் நீங்கள் உயிர்த்துடிப்புடன் வாழ வேண்டுமென ஒவ்வோர் இளம் கிறிஸ்தவர்களுக்கும் நான் சொல்ல விரும்புகிறேன் என்கிறார் திருத்தந்தை. அவர் உங்களில் இருக்கின்றார். அவர் உங்களோடு இருக்கின்றார் மற்றும் அவர் ஒருபோதும் உங்களை கைவிடமாட்டார். நீங்கள் எவ்வளவு தூரத்தில் இருந்தாலும் உயிர்த்தெழுந்த கிறிஸ்து எப்போதும் அங்கே இருக்கின்றார். அவர் உங்களை அழைக்கின்றார். தம்மிடம் திரும்பிவந்து வாழ்வை மீண்டும் தொடங்க வேண்டுமென அவர் உங்களுக்காகக் காத்திருக்கிறார். துயரத்தால் சினத்தால் அச்சத்தால் சந்தேகத்தால் அல்லது தோல்வியால் நீங்கள் வயது முதிர்ந்ததைப் போல உணரும்போது உங்கள் வலிமையையும் உங்கள் நம்பிக்கையையும் நிலைநிறுத்த அவர் எப்போதும் உங்களோடு அங்கே இருக்கின்றார் (ஊhசளைவரள ஏiஎவைஇ 1-4) என்கிற நம்பிக்கையை விதைக்கிறது மடலின் முதற்பகுதி. </h4><h4 xss=\"removed\"> இரண்டாவது தலைப்பின் கீழ் கடவுளின் வார்த்தை இளைஞர்களுக்கு என்ன சொல்கிறது (எண் 5) என்கிற செய்தியும் பழைய ஏற்பாட்டு காலத்து இளையோர் (6-11) புதிய ஏற்பாட்டு காலத்து இளையோர் (12-21) பற்றிய பல தரவுகளும்; விளக்கப்பட்டுள்ளன. மக்கள் நலனுக்காகவும் சமூக மாற்றத்திற்காகவும் துடிப்போடு செயல்படும் இளமைப்பருவத்தை சரியாக பயன்படுத்துவதற்கான அழைப்பாகவே இப்பகுதி விளக்கப்பட்டுள்ளது. யோசேப்பு சாமுவேல் தாவீது ஏரேமியா போன்றவர்களின் வாழ்வு உதாரணமாக தரப்பட்டுள்ளது.</h4><h4 xss=\"removed\"> மூன்றாவது தலைப்பில் இயேசு என்றும் இளமையானவர் (22) இயேசுவின் இளமைப் பருவம் (23-29) இயேசுவின் இளமைப் பருவம் நமக்கு கற்பிப்பது (30-33) திருஅவையில் இளமை (34) திறந்த மனதோடு புதுப்பித்தலுக்கு தயார் நிலையிலுள்ள திருஅவை (35-38)காலத்தின் அறிகுறிகளுக்கு செவிமடுக்கும் திருஅவை (39-42) நாசரேத்து இளம் மங்கை மரியா (43-48) இளம் வயது புனிதர்கள் (29-63) போன்ற தலைப்புகளின் கீழ் நற்சிந்தனைகள் பல தரப்பட்டுள்ளன. இயேசு என்றும் இளமையானவர், குடும்பத்தோடும் சமூகத்தோடும் முழு தொடர்பிலும் உறவிலும் நிலைத்திருந்தவர். அவர் தனது அனுபவத்திலிருந்து தன் இளமைத் துடிப்பையும், கனவுதனையும் இளையோரோடு பகிர்;ந்து கொள்கிறார்.</h4><h4 xss=\"removed\"> நான்காவது தலைப்பு, இளையோர் கடவுளின் நிகழ்காலம் (64) என்கிறது. எனவே இளைஞர்களை திருஅவையின், சமூகத்தின் எதிர்காலம் என சுருக்கி விட முடியாது, கூடாது என எச்சரிக்கிறது. இளைஞர்கள் நிகழ்காலத்தில் நேர்மறை எண்ணங்களில் (65-67) துலங்குவதற்கான வழிகளை எடுத்தியம்புகிறது. இளமையோடு இருக்க பல வழிகள் (68-70) விளக்கப்பட்டுள்ளன. இளையோரின் சில அனுபவங்கள் (71-85) பகிரப்பட்டுள்ளன. போர்கள், சுரண்டல், கடத்தப்படுதல் திட்டமிட்ட குற்றச் செயல்கள், மனித வியாபாரம், அடிமைத்தனங்கள், பாலியல் சுரண்டல், வன்முறை, பயங்கரவாதம் என குழப்பம் நிறை உலகில் வாழ்கிறோம் (72-80) என்கிற அச்சுறுத்தல்கள்; சுட்டிக்காட்டப்பட்டுள்ளன. பழமைவாதம், பிளவுபடுத்தும் கருத்தியல்கள் போன்றவற்றால் ஈர்க்கப்பட்டு அரசியல் மற்றும் பொருளாதார சக்திகளின் கைப்பாவைகளாகச் செயல்படும் இளையோர் போதை, சூதாட்டம், நீலப்படம், தவறான உறவு முறையில் கருத்தரிப்பு கருச்சிதைப்பு போன்ற இன்றைய இளைய சமூகத்தின் சவால்கள் இனம் காணப்பட்டுள்ளன. இளைஞர்களின் ஆசைகள் வெறுப்புகள் மற்றும் ஏக்கங்கள் (81-85) வெளிப்படுத்தப்பட்டுள்ளன. ஊடகச் சூழமைவால் (86-90) ஏற்படும் தனிமைப்படுத்துதல் சுரண்டப்படுதல் வன்முறைக்கு உள்ளாக்குதல் இடம் பெயர்தல் பற்றியும் ஏடு பேசுகிறது எல்லாவிதமான சீண்டல்களையும் முடிவுக்கு கொண்டு வருதல் (91-110) பற்றியும் குறிப்பிடப்பட்டுள்ளது. </h4><h4 xss=\"removed\"> ஐந்தாவது தலைப்பு எல்லா இளையோருக்கும் சிறப்பான செய்தியொன்றை (111) எடுத்துரைக்கிறது. அதில் அன்பு செய்யும் கடவுள் (112-117) பற்றியும் கிறிஸ்து நம்மை மீட்பது (118-123) பற்றியும் கிறிஸ்து வாழ்கிறார் (124-129) அவரோடு தூய ஆவியின் இயக்கமும் (130-133) இணைந்து நம்மை வழிநடத்துகிறது என்கிற அருள்வாழ்வின் உண்மைதனை இளைஞர்களுக்கு உரக்கச் சொல்கிறது. ஆறாவது தலைப்பு இளையோரின் பாதைகள் (134-135) கனவுகள் மற்றும் முடிவுகள் (136-143) சமூகப் பணிகள் வாழ்வதற்கும், அனுபவம் பெறுவதற்குமான தாகம் (144-149) கிறிஸ்துவோடு நட்புறவு (150-157) முதிர்ச்சியும் வளர்ச்சியும் (158-162) சகோதரத்துவ மனநிலை(163-167) துணிச்சல்மிகு ஆற்றல்மிகு பணியாளர்கள் (175-178) உண்மைக்கு சான்று பகர்தல் வாழ்வில் எதிர்நீச்சல் போன்றவைப் பற்றி எடுத்துரைக்கிறது. </h4><h4 xss=\"removed\"> ஏழாவது தலைப்பு தங்களது வேர்களுடன் இளையோர் (179) இணைந்திருக்க அழைப்பு விடுக்கிறது. வேர்களிலிருந்து பிடுங்கி எறியப்பட அனுமதிக்காதீர்கள் (180-186) என்கிறது. இளையோர் முதியவர்களோடு கொண்டுள்ள உறவுநிலை (187-197) நல்வாழ்விற்கான படிக்கல் என பறைசாற்றுகிறது. அனைத்திற்கும் மேலாய் சவால்களை துணிவோடு சந்திப்பது (198-201) தேவை என்கிறது. எட்டாவது தலைப்பின் கீழ் இளையோர் பணிகள் (202) மேய்ப்புப்பணி கரிசனை (203-208) செயல்பாட்டிற்கான முக்கிய தளங்கள் (209-215) தகுந்த சூழமைப்பு (216-220) கல்வி நிறுவனங்களில் இளையோர் பணிகள் (221-223) வளர்ச்சிப் பாதைக்கான பகுதிகள் (224-229) ஒரு ‘பிரபலமான’ இளைஞர் பணி (230-238) எப்பொழுதும் துறவிகளாய் (239-241) இளைஞர்களோடு கரம் கோர்த்தல் (241-247) பற்றிய சிந்தனைகள் வழங்கப்பட்டுள்ளன. </h4><h4 xss=\"removed\"> ஒன்பதாவது தலைப்பு அழைத்தல் (248-249) பற்றி எடுத்துரைக்கிறது. நட்பிற்கான இறைவனின் அழைப்பு (250-252) மற்றவர்களுக்காக வாழ அழைப்பு (253-258)அன்பு மற்றும் குடும்பம் (259-267) வேலை (268-273) துறவு வாழ்வுக்கான அழைப்பு (274-277) போன்ற தலைப்புகளில் வாழ்வுக்கான அழைப்பு நட்புக்கான அழைப்பு புனிதத்துவத்திற்கான அழைப்பு மையப்படுத்தப்பட்டுள்ளது. அன்பு செய்யவும் குடும்பத்தை கட்டியெழுப்பவும் குடும்பத்திற்கான அழைப்பு தரப்படுகிறது. பிறருக்காக வாழ நட்பு அழைப்பு விடுக்கிறது.</h4><h4 xss=\"removed\"> பத்தாவது பிரிவு தேர்ந்து தெளிதல் (278-282) பற்றி எடுத்துரைக்கிறது. நமது தேர்ந்து தெளிதலில் கடவுளின் திட்டமும் வாழ்வின் அர்த்தமும் அடங்கியுள்ளது. அழைத்தலை தேர்ந்து தெளிதல் (283-286) அவசியம். கடவுளின் திட்டப்படி அடுத்தவர் நலனுக்கான நமது அழைத்தல் அமைய வேண்டும். நம் நண்பரான இயேசுவின் அழைப்பு (287-290) நமக்கு முன்மாதிரி. செவிமடுத்தல் மற்றும் உடன் பயணித்தல் (191-298) இன்றைய காலச்சூழலில் மிகமிக அவசியம். இறுதியாக முடிவுரையோடு (299) திருத்தந்தையின் அறிவுரை மடல் நிறைவு பெற்றுள்ளது.</h4><h4 xss=\"removed\"><span xss=\"removed\">இளையோரே திருஅவைக்கு நீங்கள் தேவை!</span></h4><h4 xss=\"removed\">அசிசி நகர் புனித பிரான்சிஸ் வாழ்வில் நடந்த ஒரு சம்பவத்தை இங்கு நினைவுகூர்வோம். சிலுவையின் முன் நின்ற பிரான்சிஸ் இயேசுவின் குரலைக் கேட்டார். “பிரான்சிஸ் என் இல்லத்தை மீண்டும் கட்டியெழுப்புவாய்”. இளையவரான பிரான்சிஸ் அக்கட்டளையை உடனடியாகத் தாராள மனத்தோடு ஏற்றார். எந்த இல்லத்தைக் கட்டியெழுப்புவது என்றக் கேள்வி எழுந்தது. கற்களால் ஆன ஒரு கட்டிடத்தை அல்ல மாறாக திருஅவையின் வாழ்வைக் கட்டியெழுப்ப வேண்டும் என்பதைப் பிரான்சிஸ் உணர்ந்தார். கிறிஸ்துவின் முகம் திருஅவையிடம் இன்னும் தெளிவாக ஒளிரும்படி செய்வதே அப்பணி என்பதை அவர் உணர்ந்தார்.</h4><h4 xss=\"removed\">இன்றும் இளையோரே நம் திருத்தந்தை பிரான்சிஸ் சொல்வதுபோன்று திருஅவைக்கு நீங்கள் தேவை. இன்றும் கிறிஸ்து உங்களை அழைக்கிறார். தன்னைப் பின்தொடர திருஅவையின் பணியாளராக மாற உங்களை நீங்கள் அறிந்து கொள்ள சமூகத்தின் அழுக்குகளை அகற்றிட… இது எவ்வகையில் சாத்தியம்? நீங்கள் இருக்கும் இடத்திலிருந்தே கிறிஸ்துவின் சீடராக மறைப்பணியாளராக வாழ்வது எப்படி? வரும் நாட்களில் தொடர்ந்து சிந்தித்து செயல்பாட்டிற்கான காரியங்களை திருத்தூது அறிவுரை மடலின் அடிப்படையில் முன்னெடுப்போம்.</h4><h4 xss=\"removed\"></h4>', 'null', 'N', 'english', 1571490462, 736, 0, NULL),
(12, 301, '-fr-maria-william', 'குடும்பங்களில் செய்தித் தொடர்பு - Fr. Maria William', '', '', '<p><b xss=removed>Rev. Fr. Maria William,</b></p><p><strong>The Correspondent</strong></p><p><strong>St Xavier\'s Catholic college of Engineering</strong></p><p xss=removed><strong>குடும்பங்களில் செய்தித் தொடர்பு</strong></p><p xss=removed>ஆளுக்கொரு பக்கம் அலைபேசியின் மீது தலையைக் கவிழ்த்துக்கொண்டு பக்கத்தில் இருப்பவர்களையே மறந்து இருக்கும் மனிதர்களும் தொலைக்காட்சித் தொடர்களில் மூழ்கி கற்பனை உணர்ச்சிகளில் மூச்சுத்  திணறி தன்னோடு வாழும் நிஜவாழ்வு மனிதர்களின் உணர்ச்சிகள் பற்றிய சுரணையே இன்றி வாழ்ந்திடும் குடும்ப உறுப்பினர்களும்; அதிகமாகிக் கொண்டிருக்கும் காலமிது.</p><p xss=removed>அதற்கேற்ப குடும்பங்களில் விரிசல்களும் கணவர் மனைவியர் மத்தியில் பிரச்சனைகளும் மணமுறிவுகளும் அதிகமான வண்;ணம் உள்ளன. குழந்தைகள் ஒரு புறத்தில் அவர்களின் தேவைகள் பற்றிய புரிதலோ அல்லது பொறுமையோ இன்றி துன்புறுத்தப்படுகின்றனர் மறுபுறத்தில் போதிய கவனிப்பும் வழக்காட்டுதலும் இன்றி குடும்பத்திலிருந்து கற்றுக்கொள்ள வேண்டிய அடிப்படைப் பாடங்களை ஊடகங்களிலிருந்தும் தவறான தோழமைகளிலிருந்தும் கற்றுக்கொண்டு  வழிதவறிச் செல்லும் நிலையில் உள்ளனர்.</p><p xss=removed>குடும்ப உறுப்பினர்கள் மத்தியில் நேரடியான, உண்மையான ஆழமான உரையாடல் இல்லாதிருப்பது இப்பிரச்சினைகளுக்கு முக்கியமான ஒரு காரணம் என்பதில் ஐயமில்லை. குடும்ப உறுப்பினர்கள். ஒன்று சேர்ந்து பேசி சிரித்து விளையாடி மகிழ்ந்திருந்த நிலை போய் அவரவர் உலகுக்குள் மூழ்கி தனிமைப்பட்டிருக்கும் நிலை உண்மையில் பல குடும்பங்களைப் பீடித்திருக்கும் பெரும் நோய் என்றே சொல்லலாம். உளவியல் வல்லுநர்கள் நலமானக் குடும்பங்;;களின் குணங்களைக் குறிப்பிடும் போது முதல் குணமாக குடும்ப உறுப்பினாக்ள் மத்தியில் இருக்கும் நலமானச் செய்தித் தொடர்பினையே குறிப்பிடுகின்றனர்.</p><p xss=removed><strong>செய்தித் தொடர்பின் தேவையும் பயன்களும்:-</strong></p><p xss=removed>தம்மை வெளிப்படுத்துவது நம் இயல்பு நம் வாழ்வின் அடிப்டை தேவை. மூச்சு விடுதல் போல நம் சுயவெளிப்பாட்டின் முதல் தளம் நமது குடும்பம் தான். நம் தேவைகள், மன ஓட்டங்கள், ஆசைகள் கரிசனைகள் நம் மகிழ்ச்சி, கோபம், கவலை, அச்சம் என அனைத்தையும் நம் குடும்பத்தினரிடம் தான் வெளிப்படுத்துகிறோம். அவ்வாறு நம்மை வெளிப்படுத்தவும், அவைகளுக்குத் தீர்ப்பிடும் மனநிலையின்றி செவிமடுக்கவும் பதில் தரவும் குடும்ப உறுப்பினர்களிடையே இருக்கும் நலமானச் செய்தித் தொடர்பு நம் வாழ்வின் மிக்ப்பெரும் கொடை.</p><p xss=removed>உண்மையில் உறவுகளும் உறவின் தன்மைகளும் செய்தித் தொடர்புகளால் கட்டுமானம் செய்யப்படுபவை தாம். நம் செய்தித்தொடர்புகளின் தன்மைக்கேற்ப நம் உறவுகளின் தன்மை அமைகிறது. நம் உறவுகளின் தன்மைக்கேற்ப நம் வாழ்வின் தன்மையும் அமைகிறது என்பதில் ஐயமில்லை. எனவே நலமானச் செய்தித் தொடர்புகளே சிறப்பான வாழ்க்கை அமைத்துக் கொள்ளும் வழியாகவும் அமைகிறது. </p><p xss=removed>குடும்ப உறுப்பினர்களிடையே இருக்கும் செய்தித்தொடர்பின் முதல் பயனே நம்மை அறிந்துகொள்வது தான். நம் இயல்பானப் பண்புகளையும், நம் முக்கியத்துவத்தையும் நம் குடும்ப உறுப்பினர்களோடு உள்ள உறவில் தான் புரிந்துக்கொள்கிறோம். ஒருவர் தனது தனித்தன்மைகளையும், தன்னிடம் இருக்கும் நலமானத் தன்மைகளையும், வளர்ச்சிக்குத் தடையானப் பண்புகளையும் தன் குடும்ப உறுப்பினர்களின் பாராட்டுதல் மற்றும் சுட்டிக்காட்டுதல்கள் வழியாகத் தான் அறிந்துகொள்கிறார். நம் செயல்களுக்கு நம்; குடும்ப உறுப்பினர்கள் சொல்லால் அல்லது உடல்மொழியால் தரும் எதிர்வினைகள் நம் ஆளுமையைக் கட்டுமானம் செய்யும் முக்கியக் காரணியாகிறது. எனவே தன்மதிப்பு, தன்னிலைத் தெளிவு போன்ற அடிப்படை வளர்ச்சி சாதனைகளுக்கு குடும்ப உறுப்பினர்களுக்கிடையே நிகழும்  செய்தித்; தொடர்பே அடித்தளம்.</p><p xss=removed>நம் குடும்பத்தில் நம்மோடு வாழும் நம் உறவினர்களைப் புரிந்துகொள்ளவும், அவர்களின் தேவைகள் மற்றும் மனநிலைகளை அறிந்து, அவர்களின் சூழ்நிலையினைத் தெரிந்துகொண்டு அவர்களோடு பேசவும் பழகவும், அவர்களின் வளர்ச்சிக்குப் பங்களிக்கவும் நம் குடும்ப உறுபடப்பினர்களிடையே இருக்கும் நலமானச் செய்தித்தொடர்புகள் முக்கியமானவை.</p><p xss=removed>எல்லாவற்றிற்கும் மேலாக, நலமானச் செய்திதொடர்பினால் தான் குடும்ப உறுப்பினர்களிடையே பாசத்தையும் அன்பையும் வளர்த்து அனுபவிக்க முடியும். நமது நெருக்கமானவர்களின் அன்பை அனுபவிக்கவும், அவர்கள் மீது நமக்கிருக்கும் அன்பினை வெளிப்படுத்தவும் பொருத்தமான சொற்கள், உடல்மொழி, மற்றும் செயல்பாடுகளைக் குடும்பத்தில் நடக்கும் செய்திதொடர்புகளிலிருந்தே கற்றுக்கொள்கிறோம். </p><p xss=removed> வாழ்வு பற்றிய அடிப்படைக் கல்வியும், நம் கலாச்சாரத்தின் அடிப்படை வேர்களையும் குடும்ப உரையாடல்களிலிருந்தே கற்றுக்கொள்கிறோம். எது உகந்தது, எது தவிர்;க்க வேண்டியது என்பதைக் கற்றுக்கொள்வதும் அடிப்படை அறநெறிகளைப் புரிந்துகொள்வதும் குடும்பங்களில் நடைபெறும் செய்திதொடர்பினால் தான்.</p><p xss=removed>குடும்ப உறுப்பினர்களிடையே கருத்து வேற்றுமைகளோ அல்லது மனக்குறைகளோ இருக்கும் போது, உண்மையான மற்றும் தெளிவானச் செய்தித் தொடர்பினால் அவைகளை வெளிப்படுத்தவும், உரையாடவும் தீர்வு காணவும் உதவுகின்றது.</p><p xss=removed>எல்லா குடும்பங்களிலும் உறுப்பினர்களிடையே பிரச்சினைகள் வரும் வாய்ப்பு உண்டு. நலமானக் குடும்பத்தினர் தமக்குள் இருக்கும் செய்திதொடர்பினால் எளிதாகப் பிரச்சினைகளுக்குத் தீர்வுகண்டு மகிழ்ச்சியாக இருக்கின்றனர். ஆனால் போதியச் செய்தித் தொடர்பு திறன் இல்லாதாவர்கள் தங்களுக்குள்ளேயே சண்டையிட்டுக் கொள்கின்றனர் அல்லது அமுக்கி வைத்துக்கொண்டு மனநோய்களை உருவாக்கிக் கொள்கின்றனர்.</p><p xss=removed>நலமானச் செய்தித்தொடர்பு உடைய குடும்ப உறுப்பினர்கள் தங்கள் குடும்ப வாழ்க்கை தொடர்பாக அதிக திருப்தியையும் மன நிறைவினையும் கொண்டுள்ளனர் என்பது ஆராய்சிசகளின் முடிவு. மார்க்மென் (1981) என்பவர்; எந்த அளவுக்கு தம்பதியர் தமக்குள் இரு;ககும் செய்தித்தொடர்பினை நேர்நோக்காகப் பார்க்கின்றனரோ அந்த அளவுக்கு தம் திருமண வாழ்வில் திருப்தியும் இருப்பதாகக் கூறுகின்றனர் என்ற ஆய்வு முடிவினை வெளியிட்டுள்ளார்.</p><p xss=removed>நம் சமூகம் பல்வேறு பிரச்சினைகளால் நிறைந்துள்ளுது. சமூக வாழ்வு நமக்கு தரும் நெருக்கடிகள், மன அழுத்தங்கள் இவைகளிலிருந்து குணம்பெற, ஆற்று பெற்றிட குடும்பங்களே நமக்குப் புகலிடம். அங்கு நலமான செய்தித்தொடர்புகள் முக்கியமானவை.</p><p xss=removed>என்ன தான் சாதித்திருந்தாலும், கல்வியில் உயர்ந்திருந்தாலும் சகமனிதர்களோடு இயல்பாகப் பேசி நலமான உறவுகளை வளர்க்கத் தெரியவில்லையெனில் வாழ்வில் மகிழ்ச்சி அற்றுப்போய்விடும் அல்லவா. அதற்கானச் செய்தித்தொடர்புத் திறன்களை வளர்த்துக் கொள்வது முக்கியமல்லவா?</p><p xss=removed><strong>செய்தி தொடர்பின் தன்மை:-</strong></p><p xss=removed>குடும்பத்;தில் செய்தித்தொடர்பு என்பது என்ன? குடும்ப உறுப்பினர்கள் தங்களுக்கிடையே சொற்கள், உடல்மொழி மற்றும் செயல்பாடுகள் வழி செய்திகளைப் பரிமாறிக்கொள்வது தான். செய்தித்தொடர்பில் உடல்மொழி கிட்டதட்ட 55 விழுக்காடு பங்கினையும், நமது குரலின் தன்மை 38 விழுக்காடு பங்கினையும், நம் சொற்கள் 7 விழுக்காடு பங்;கினையும் ஆற்றுகின்றன என்னும் புள்ளிவிபரம் அடிக்கடி மேற்கோள் காட்டப்படுவது தான். எனவே வாழ்மொழியைவிட உடல்மொழி எந்த அளவுக்கு முக்கியம் என்பதைப் புரிந்து கொள்வது நல்லது.</p><p xss=removed>செய்தித்தொடர்பில் மூலக்கூறாக இருப்பவை, செய்தியைப் பெறுதலும், அதற்கேற்ப பதல் செய்தி தருவதும் ஆகும். மூன்றாவது அம்சம் செய்தியைச் சுமந்து செல்லும் ஊடகம் ஆகும். அதாவது வாழ்மொழி அல்லது உடல்மொழி மற்றும் ஊடகக் கருவிகள் இதில் அடங்கும்.</p><p xss=removed>செய்தியைப் பெறுதலில் முக்கிய பங்கு வகிப்பது செவிமடுத்தல் மற்றும் கவனித்தல். இருகாதுகளும் ஒரு நாவும் இருப்பது, இரட்டிப்பு மடங்கு பிறர் தரும் செய்திகளுக்குச் செவிமடுக்க வேண்டும் என்பதை அடையாளப்படுத்தவே எனச் சொல்வர். இன்னும் ஒரு படி போய், மூளையில் நியூரான்கள் செய்தியைப் பெறுவதற்கென நூற்றுக்கணக்கான டெண்ட்ரைட்டுகளைக் கொண்டுள்ளன எனினும், செய்தி கொடுப்பதற்கென ஒரு ஆக்சோன் மட்டுமே கொண்டுள்ளன என அடையாள வகையில் சுட்டிக்காட்டுபவர்களும் உண்டு.</p><p xss=removed>செவிமடுக்கும் போது முழுக்கவனத்தையும் செலுத்திச் செவிமடுப்பது முக்கியமானது. விடுக்கப்படும் வார்த்தைகள் மட்டுமன்றி, உடலின் மொழியையும், செய்தி விடுக்கப்படும் பின்னணியையும் கவனிக்க வேண்டும். குரலின் தன்மை, உடல் அசைவுகள், பார்வை, தோரணையாவையும் உற்றுக் கவனிக்கப்பட்டால் தான் உண்மையானச் செய்தியைக் கண்டுகொள்ள முடியும். ஏனென்றால், சொல்லப்படும் வார்த்தைக்கும் உடல்மொழிக்கும் முரண்பாடு இருக்கும் வாய்ப்பு உண்டு. பெரும்பாலும் வாழ்மொழி பொய்த்தாலும் உடல்மொழி பொய்ப்பதில்லை.</p><p xss=removed>தரப்படும் செய்தியைப் பெறும் போது, அச்செய்தியை நாம் அப்படியே பெற்றுக்கொள்வதில்லை என்பதை நினைவில் நிறுத்துவதும் முக்கியமானது. ஏனென்றால், நமது நினைவில் இருக்கும் பழைய அனுபவங்கள், செய்தி விடுப்பவர் பற்றி நாம் கொண்டுள்ள நம்பிக்கைகள், செய்தி பெறும்போது நாம் இருக்கும் சூழல், நமது மனநிலை, உணர்ச்சிநிலை, நலநிலை, ஆற்றல் நிலை போன்ற பல அமசங்கள் செய்திபெறுதல் என்னும் நம் செயல்பாட்டின் மீது தாக்கம் செலுத்தலாம். அதற்கேற்ப இவைச் செய்தியின் அர்த்தத்தைப் புரிந்துகொள்ளுதலைப் பாதிக்கலாம். உண்மைச் செய்தியை விட்டு மாற்றுச் செய்தியாகப் புரிந்துக்கொள்ளும் நிலையினை இவை ஏற்படுத்தலாம். எனவே கவனமாக இருப்பது முக்கியம்.</p><p xss=removed>எல்லாவற்றிற்கும் மேலாக, நாம் செய்திவிடுத்தலில் கவனமாகவும் பொறுப்பாகவும் இருப்பது தேவை. நாம் பெற்ற செய்தியைச் சரியாக, பின்னணிகளோடு தெரிந்து புரிந்துகொள்வது தேவை. சரியான புரிதலுக்கு ஏற்ப, பொருத்தமான வகையில், சூழ்நிலைக்கு ஏற்ப வழங்குதல் நலமானச் செய்தித்தொடர்புக்கு முக்கியமானது.</p><p xss=removed>பெற்ற செய்திக்குப் பதில் தரும் போது, எதிர்வினையாக நமது உணர்ச்சிகள், எண்ணங்கள், நினைவுகள், எதிர்பார்ப்புகள், திட்டங்கள், மனநிலைகள் யாவும் தாக்கம் தருகின்றன. நமக்குள் இவை தரும் தாக்கங்கள் பற்றிய விழிப்புணர்வோடு, நாம் கொடுக்கும் செய்தி அல்லது பதில் எத்தகைய விளைவினை அடுத்தவரில் உருவாக்கும் என்பது பற்றிய திறனாய்வோடு செய்தி விடுத்தல் நம் பொறுப்பாகும். நாம் எத்தகைய ஊடகத்தை அதாவது வாய்மொழி, உடல்மொழி அல்லது ஊடக்கருவிகளைப் பயன்படுத்துகிறோம் என்பதையும்; அவைகளில் ஆற்றல்கள் மற்றும் பலவீனங்களையும்; உணர்ந்திருத்தலும் செய்திவிடுதலில் முக்கியமானது.</p><p xss=removed>செய்தித்தொடர்பின்; முக்கிய நோக்கம் நலமான உறவுகளை உருவாக்கி மேம்படுத்துவதாகும். அதற்கேற்ப நம் செய்திகளை மனதில் தயாரித்து பொருத்தமாக விடுத்தல் வேண்டும். செய்தித்தொடர்பினை அதன் நோக்கத்திற்கேற்ப இரு வகைகளாகப் பிரிக்கின்றனர். 1. செயல்நிறைவேற்றித்திற்காக (iளெவசரஅநவெயட). 2. உணர்ச்சிகளைப் பகிர்தலுக்காக (யககநஉவiஎந).</p><p xss=removed>காரியம் நடப்பதற்காக அல்லது நாம் செயல்படும் நோக்கம் நிறைவேறுவதற்காக சாதாரணமாக அறிவியல் உண்மைகளை, வேண்டுதல்களை, கட்டளைகளை, வழிகாட்டுதல்களைக் கொடுக்கிறோம். இவை எப்போதும் நடந்துகொண்டிருப்பவை தான். இவைகளில் அதிகமாக நம் தனிப்பட்ட  உணர்ச்சிகிள் தொடர்புபடாது மேலோட்டமாகவே அமைந்துவிடுகின்றன.</p><p xss=removed><strong>நலமான செய்திக்தொடர்பின் பண்புகள்:-</strong></p><p xss=removed>பொதுவாக நலமானச் செய்திதொடர்பின் மூன்று இன்றியமையா பண்புகளை வல்லுநர்கள் குறிப்பிடுவர்: உண்மையானவை, நேரடியானவை, தெளிவானவை.</p><p xss=removed>உண்மையானவை:-</p><p xss=removed>திறந்த மனதோடு, மனதில் இருக்கும் உண்மைகளைப் பொருத்தமாக வெளிப்படுத்திச் செய்தித்தொடர்பு கொள்வது நலமான உறவுகளுக்கு அடிப்படை. உள்ளொன்று வைத்துப் புறம் ஒன்று பேசுதலும், உண்மைகளைச் சொல்லாது பொய்களைச் சொல்லி சமாளிப்பதும் அடிப்படை நம்பகத் தன்மையை இழக்கச் செய்யும். அது காலப்போக்கில் உறவுகளைக் கொன்றுவிடும். நம் வாழ்வின் இரகசியங்கள் நம் உரிமைகள், எனவே எல்லாவற்றையும் பகிர்நதுகொள்ளும் கட்டாயம் இல்லை எனினும், பழகும் போது உண்மையாகப் பழகுவதும், நடைமுறையில் தன் தவறுகளாக இருந்தாலும் உண்மைகளை ஏற்றுக்கொள்வதும்,முகமூடி இன்றி உணர்ச்சிகளைப் பகிந்துகொள்வதும் நெருக்கமான அன்புறவுகளுக்கு அச்சாணி. இது ஒருவரை ஒருவர் முழுமையாக ஏற்றுக்கொண்டு, உண்மையானப்பகிர்தலுக்கு மதிப்பும் மரியாதையும் தந்து, தீர்ப்பிடா தன்மையும் கொண்டு செயல்படும் குடும்ப உறுப்பினர்களிடையே தான் சாத்தியம்.</p><p xss=removed><strong>நேரடியானவை:-</strong></p><p xss=removed>செய்தித்தொடர்பு எப்போதுமே நேரடியாக இருப்பது நலமானது. மறைமுகச் செய்தித்தொடர்புகளே பெரும்பாலும் உறவுகளில் குழப்பங்களையும் புரிந்துகொள்ளாத் தன்மையையும் உருவாக்கி, சண்டைச் சச்சரவுகளுக்குக் காரணமாகின்றன. குத்திப் பேசுதல், அடுத்தவர்கள் வழியாக மறைமுகச் செய்தி விடுதல், உளவிளையாட்டுகள் முதலியவை நல்ல உறவுகளுக்கு ஊக்கம் தருபவை அல்ல. அச்சத்தினாலோ அல்லது அடுத்தவரைத் திருப்திப்படுத்த வேண்டும் என்ற கட்டாயத்தினாலோ மறைமுகத் தொடர்புகளை மேற்கொள்ளும் வாய்ப்பு உண்டு. எனவே நேரடி செய்திதொடர்புகளுக்கு ஊக்கம் கொடுக்க உணர்ச்சிபூர்வமானப் பாதுகாப்புச் சூழல் குடும்பத்தில் இருப்பது நன்மை பயக்கும்.</p><p xss=removed>தெளிவானவை:-</p><p xss=removed>‘உங்கள் பேச்சு ஆம் என்றால் ஆம் என்றும் இல்லை என்றால் இல்லை என்றும் இருக்கட்டும். மற்றவை அனைத்தும் சாத்தானிடமிருந்து வருபவை’ என்றார் கிறிஸ்து. செய்திதொடர்பு தெளிவானதாக இருக்க வேண்டும் என்பதை இதைவிடத் தெளிவாக ஒருவர் சொல்ல முடியாது. நாம் எல்லா வேளைகளிலும் சிந்தித்துச் செயல்படுவது முக்கியமானது எனின், செய்தித்தொடர்பில் அது இன்றியமையாதது. என்ன செய்தி சொல்ல வேண்டும் என்பதை மனதில் தெளிவாக்கிக்கொண்டு,அதனைப் பொருத்தமான மொழியில் சரியான நேரத்தில்  வெளிப்படுத்துவது முக்கியம்.  செய்தி தெளிவாக இருக்க நம் வாழ்மொழியும் உடல்மொழியும் ஒத்துப்போவது முக்கியமானது.</p><p xss=removed>நாம் விடுக்கும் செய்திகளுக்கு நாமே பொறுப்பெடுத்துக்கொள்ளும் விதமாக ‘இது என் உணர்வு, நான் எப்படி நினைக்கிறேன்’ போன்ற வாக்கியங்களை அதிகம் பயன்படுத்துதல் சிறப்பு. சில குடும்பங்களில் தங்களை அறிவாளிகள் என எண்ணிக்கொண்டு, இராஜதந்திரத்தால் தம் குடும்பத்தினரை மேலாண்மை செய்துகொள்ளலாம் என நினைக்கும் மனிதர்கள் உண்டு. அது காலப்போக்கில் பெருந்தோல்வியாகவே முடியும். இராஜதந்திரத்தை மனிதர்களின் உள்ளுணர்ச்சிகள் சீக்கிரமாகக் காட்டிக்கொடுத்துவிடும்.</p><p xss=removed>மேலும், தீர்ப்பிடாதிருத்தல், பிறரை, அவர்களின் தனித்தன்மையை, தனிப்பாணியை மதித்தல் வயதுக்கேற்ப செய்திகளைச் சொல்லுதல்,எப்போதும் அடுத்தவர் நன்றாக இருக்க வேண்டும் என்ற நல்லெண்ணத்தில் செயல்படுதல் முதலியவை நலமானச் செய்திதொடர்பின் முக்கியப் பண்புகள்.</p><p xss=removed>நலமானச் செய்தித் தொடர்பு வளர சில பரிந்துரைகள்:-</p><p xss=removed>நலமானச் செய்தித்தொடர்பு நடக்கும் சூழல்களையும் வாய்ப்புகளையும் உருவாக்கிக் கொடுப்பது பெற்றோர்கள் அல்லது பெரியோர்களின் பொறுப்பு. எப்போதும் வேலைப்பளு உணர்வோடு ‘பிஸி பிஸி’ என இருந்து, குடும்ப உறுப்பினர்களின் உணர்வுகளைக் கண்டுகொள்ளாமல் இருப்பது தான் தற்போதைய குடும்பங்களின் பெருங்குறையாகக் கருதப்படுகிறது.</p><p xss=removed>செய்தித்தொடர்புக்கான நிகழ்வுகளைத் திட்டமிட்டு கொள்வது நல்லது. எடுத்துக்காட்டாக, தினமும் ஒரு வேளை உணவானது குடும்ப உறுப்பினர்கள் யாவரும் சேர்ந்திருந்து உண்ண வேண்டும், என்பது பாசமான நெய்திதொடர்புக்கு அதிக வழி வகுக்கும். பிறந்த நாள் போன்ற நிகழ்வுகளில்பெரிய ஆடம்பரங்களை விட,குறிப்பிட்ட நபர் தங்களுக்கு எவ்வளவு முக்கியமானவர் என்பதைக் கூறியும் அவரது சிறந்த பங்களிப்பையும், திறமைகளையும் பாராட்டியும், அவர் தங்களோடு இருப்பது எவ்வளவு மகிழ்ச்சி என்பதையும் குறிப்பிட்டு அவரோடு குடும்பமாகச் சேர்ந்து இருந்து உரையாடுதல் பெரும்பலனைத் தரும். அவ்வப்போது ஏற்பாடு செய்யும் குடும்ப சுற்றுலாக்கள் விழா கொண்டாட்டங்கள் சாதனைகளைக் கொண்டாடுதல் ஒரு தோல்வி அல்லது க~;டத்தில் உடனிருத்தல் முதலிய பொழுதுகள் ஆழமானச் செய்தித்; தொடர்புக்கான வாய்ப்புக்கள். செய்தித்தொடர்பினை வளர்ப்பதில் குடும்பமாக இணைந்து விளையாடுதல் மற்றும் நகைச்சவை கொண்டாடுதலுக்கும் நல்ல இடமுண்டு.</p><p xss=removed>தீர்ப்பிடாத மனநிலையும் தன் உணர்ச்சிகளையும் எண்ணங்களையும் வெளியிடும் சுதந்திர சூழலினையும் மாற்றுக்கருத்துக்களை சொல்லும் அனுமதியும் எல்லா வாழ்வின் எல்லா அம்சங்களைப் பற்றியும் பேசும் பாதுகாப்புச் சூழலும், தன் வாழ்வின் சந்தேகங்கள், நடந்த நிகழ்வுகள், தன் பலவீனங்கள், வெட்கங்கள் முதலியவைகளைத் தயக்கமின்றி பேசும் சூழ்நிலையும் குடும்பத்தில் உருவாக்குவது முக்கியம். இவைகளைப் பகிர்ந்து கொண்ட பின், அதனைச் சுட்டிக்காட்டி பிற்காலங்களில் அவரைத் தாக்கி, மனதைப் புணபடுத்தாத பாதுகாப்பு உத்திரவாதத்தையும் உருவாக்குதல் குடும்பத்தின் பொறுப்பு.</p><p xss=removed>குடும்ப உறுப்பினர்களிடையே மனத்தாங்கலோ அல்லது பிரச்சினைகளோ ஏற்பட்டால், பொருத்தமாக இருந்தால்,குடும்பமாக இணைந்திருந்து தம் சிந்தனைகளையும் உணர்ச்சிகளைஞம் வெளிப்படுத்தி பொருத்தமானத் தீர்வுகளைக் கண்டுகொள்வது குடும்பச் செய்தித்தொடர்பின் சிறந்த சாதனையாக அமையும். பிரச்சினைகள் தீர்வில், பிரச்சினைகளைத் தீர்க்க முயற்ச்சிக்க வேண்டுமே தவிர ஆட்களைத் தீர்த்துக் கட்டிவிடக்கூடாது. எடுத்துக்காட்டாக, ஒரு குழந்தை ஒரு தேர்வில் தோல்வி அடைந்துவிட்டால், அக்குழந்தையே தோல்வி, அவர் வாழ்க்கையே தோல்வி என்ற நிலைக்கு பேசிவிடக்கூடாது.  தோல்வியைத் தற்காலிகத் தடையாகப் பார்க்கவும் எதிர்கால வெற்றிக்குப் படிக்கல்லாக மாற்றவும் கூடிய ஊக்கம் தரும் செய்தித்தொடர்புகளையே மேற்கொள்ளுதல் வேண்டும்.</p><p xss=removed>குடும்பமாக மட்டுமல்ல குடும்பத்தில்; ஒருவருக்கொருவர் நெருக்கமானச் செய்திதொடர்புகள் இருக்கவும் வாய்ப்பளிக்க வேண்டும். குடும்ப அமைப்பு முறையில் கணவர்-மனைவி உறவுக்குத்; தனியிடம் உண்டு. அந்த தனியுரிமைப் பாதுகாக்கப்பட வேண்;டும். ஆயினும் அப்பா-பிள்ளை, அம்மா-பிள்ளை, உடன்பிறப்புகளுக்குள் பாசம் முதலியவையும் வளர்க்கப்பட வேண்டும். அதற்கேற்பாபோல உள்ள ஆர்வங்களை வளர்க்கவும் செய்தித்தொடர்புகளை ஊக்கப்படுத்தவும் வேண்டும்.</p><p xss=removed>அடிக்கடி பாராட்டுவதும், நேர்நோக்கான உரையாடல்களுக்கு முக்கியத்துவம் கொடுப்பதும், அடுத்தவர்களின் தேவையை அவர்கள் சொல்லாமலே அறிந்து, பரிகாரம் தேட முன்வருவதும் அன்பான உறவுகளை இன்னும் வலுப்படுத்தும்.</p><p xss=removed>சிறப்பாக ஊடகங்கள் பயன்படுத்துவது பற்றிய தெளிவான கொள்கைக் குடும்பத்தில் இருக்க வேண்டும. ஊடகங்கள் மகிழ்ச்சிக்கானக் கருவிகள் என்றாலும், நலமானச் செய்தித்தொடர்புக்கும், நல்லுறவுக்கும் தடையாக இருந்து அன்னியத் தன்மையினை உருவாக்கும் காரணங்களாகிவிடக்கூடாது.</p><p><img src=\"http://kuzhithuraidiocese.com/uploads/posts/47e945446e2bd39f964b8ca24f17e1b4.jpg\" alt=\"\" xss=removed></p>', 'null', 'N', 'english', 1572852867, 501, 0, NULL),
(19, 301, 'அறிஞர்-அண்ணாவின்-தலைமைப்-பண்பு', 'அறிஞர் அண்ணாவின் தலைமைப் பண்பு', '<p>வாசி யோசி நேயர்களுக்கு,\r\nஉங்கள் குமரி மலரவனின் மகிழ்வான வணக்கங்கள்!</p><p>\r\nஊரடங்கு உத்தரவு நீட்டிக்கப்பட்டுள்ளது. கொரோனாவால் இறப்பவர்களின் பட்டியலும் நீண்டு கொண்டே போகிறது. பாதிக்கப்படுபவர்களின் பட்டியலும் நீண்டு நீடித்துச் செல்கிறது. எனவே நாம் நிம்மதி இழந்து இருக்கிறோம். கொரோனா அமைதியை அழித்திருக்கிறது. வாழ்வை அழிப்பதற்கு அலை மோதிக்கொண்டே இருக்கிறது. எனவே அமைதியாய் வீட்டில் இருப்போம்! சமூகத்தில் சமூக விலகலைக் கடைபிடிப்போம்! வாழ்வை காத்துக் கொள்வோம்! </p><p>இன்றைய வாசி யோசி பகுதியில் அதிகாரம் நிலைத்திருப்பது அல்ல. அது நிலையற்றது எனவே அதிகாரத்தில் அமரும்போது தன்னுயிரைப் போல் பிறரையும் நேசிக்கவேண்டும் என்பதை யோசிப்போம்!\r\nஅதிகாரம் என்பது அடுத்த நிமிடமே பறிபோகக் கூடியது. அதிகாரம் என்கிற போதை மேதையையும் கூட பேதையாக்குகிறது. அதிகாரத்தில் அமர்ந்துவிட்டால் தரைமட்டும் தாழ்ந்து போகும் தாழ்ச்சி தலைக்கேற வேண்டும். முதிர்ந்து நிற்கும் கதிர் போல் தலை சாய வேண்டும். தலைவனுக்கு தலைக்கனம் இருக்கக்கூடாது. அதில் அவன் தனிக்கவனம் செலுத்த வேண்டும். அதிகாரத்தில் அமரும்போது வார்த்தைகளை கவனமாக கையாள வேண்டும். அந்த வார்த்தைக்கு கையளவு அல்ல மலையளவு நம்பிக்கை உண்டு.</p><p>\r\nஅறிஞர் அண்ணா ஒருநாள் திடீரென தன் கட்சி பிரமுகரை கோட்டையில் அவரது அலுவலகத்திற்கு வரச்சொன்னார். அவரது அறையின் பக்கத்தில் கடல் இருந்தது, அண்ணா அந்த கடலையே உற்றுப் பார்த்துக் கொண்டே இருந்தார். அவரது எதிரே பிரமுகர் அமர்ந்திருந்தார். பிரமுகரை பார்க்காமல் கடலையே மிக கவனமாகப் பார்த்துக் கொண்டு தீவிர சிந்தனையில் இருந்தார் அண்ணா.அதிக நேர சிந்தனைக்குப் பிறகு \"நாம் மக்களுக்கு நிறைய வாக்குறுதிகளை வாரி வழங்கி இருக்கிறோம். ஆனால் அவற்றை நிறைவேற்ற முடியவில்லை. எனவே ஆட்சி அதிகாரத்தை விட்டு விலக வாய்ப்பு இருக்கிறதா என்பதை ஜனநாயக ரீதியில் சிந்தித்துச் சொல்\" என்றார் அண்ணா. பிரமுகருக்கு இதைக் கேட்டவுடன் தூக்கிவாரிப் போட்டது. அவர் பதில் எதுவும் பேசாமல் மௌனியாக நின்றார். கிடைத்த அதிகாரத்தை எப்படியாவது அணைபோட்டு காத்துக் கொள்ள நினைக்கும் இக்காலகட்டத்தில், கிடைத்த அதிகாரத்தினை எப்படி துறப்பது என்று யோசித்தவர் அண்ணா.\r\nஅதிகாரத்தில் அமரும்போது மக்கள் வாழ்வு சிறக்க வில்லை என்றால் துறப்பதே நல்லது. </p><p>அதிகாரத்தில்\r\nவீரத்தை விட ஈரம் முக்கியம்! இறுக்கத்தை விட இரக்கம் முக்கியம்! ஆணவத்தை விட அன்பு முக்கியம்!\r\nதன்னை விட பிறர் முக்கியம்!\r\nஅதிகாரம் அபகரித்துக் கொள்வதற்காக அல்ல,\r\nஅர்ப்பணிப்பதற்காக என்பதை புரிந்து கொள்வோம்!\r\nஅருட்பணி.எ. ஒய்சிலின் சேவியர்,\r\nபங்குத்தந்தை, கொல்வேல்.\r\nதேனருவி மீடியாவின் youtube Channel <a href=\"https://www.youtube.com/channel/UCxgfr5Dr8udb-VwAEdkXDTw\"> https://www.youtube.com/channel/UCxgfr5Dr8udb-VwA...</a>\r\nSubscribe பண்ணுங்க</p>', '', '<p>வாசி யோசி நேயர்களுக்கு,\r\nஉங்கள் குமரி மலரவனின் மகிழ்வான வணக்கங்கள்!</p><p>\r\nஊரடங்கு உத்தரவு நீட்டிக்கப்பட்டுள்ளது. கொரோனாவால் இறப்பவர்களின் பட்டியலும் நீண்டு கொண்டே போகிறது. பாதிக்கப்படுபவர்களின் பட்டியலும் நீண்டு நீடித்துச் செல்கிறது. எனவே நாம் நிம்மதி இழந்து இருக்கிறோம். கொரோனா அமைதியை அழித்திருக்கிறது. வாழ்வை அழிப்பதற்கு அலை மோதிக்கொண்டே இருக்கிறது. எனவே அமைதியாய் வீட்டில் இருப்போம்! சமூகத்தில் சமூக விலகலைக் கடைபிடிப்போம்! வாழ்வை காத்துக் கொள்வோம்! </p><p>இன்றைய வாசி யோசி பகுதியில் அதிகாரம் நிலைத்திருப்பது அல்ல. அது நிலையற்றது எனவே அதிகாரத்தில் அமரும்போது தன்னுயிரைப் போல் பிறரையும் நேசிக்கவேண்டும் என்பதை யோசிப்போம்!\r\nஅதிகாரம் என்பது அடுத்த நிமிடமே பறிபோகக் கூடியது. அதிகாரம் என்கிற போதை மேதையையும் கூட பேதையாக்குகிறது. அதிகாரத்தில் அமர்ந்துவிட்டால் தரைமட்டும் தாழ்ந்து போகும் தாழ்ச்சி தலைக்கேற வேண்டும். முதிர்ந்து நிற்கும் கதிர் போல் தலை சாய வேண்டும். தலைவனுக்கு தலைக்கனம் இருக்கக்கூடாது. அதில் அவன் தனிக்கவனம் செலுத்த வேண்டும். அதிகாரத்தில் அமரும்போது வார்த்தைகளை கவனமாக கையாள வேண்டும். அந்த வார்த்தைக்கு கையளவு அல்ல மலையளவு நம்பிக்கை உண்டு.</p><p>\r\nஅறிஞர் அண்ணா ஒருநாள் திடீரென தன் கட்சி பிரமுகரை கோட்டையில் அவரது அலுவலகத்திற்கு வரச்சொன்னார். அவரது அறையின் பக்கத்தில் கடல் இருந்தது, அண்ணா அந்த கடலையே உற்றுப் பார்த்துக் கொண்டே இருந்தார். அவரது எதிரே பிரமுகர் அமர்ந்திருந்தார். பிரமுகரை பார்க்காமல் கடலையே மிக கவனமாகப் பார்த்துக் கொண்டு தீவிர சிந்தனையில் இருந்தார் அண்ணா.அதிக நேர சிந்தனைக்குப் பிறகு \"நாம் மக்களுக்கு நிறைய வாக்குறுதிகளை வாரி வழங்கி இருக்கிறோம். ஆனால் அவற்றை நிறைவேற்ற முடியவில்லை. எனவே ஆட்சி அதிகாரத்தை விட்டு விலக வாய்ப்பு இருக்கிறதா என்பதை ஜனநாயக ரீதியில் சிந்தித்துச் சொல்\" என்றார் அண்ணா. பிரமுகருக்கு இதைக் கேட்டவுடன் தூக்கிவாரிப் போட்டது. அவர் பதில் எதுவும் பேசாமல் மௌனியாக நின்றார். கிடைத்த அதிகாரத்தை எப்படியாவது அணைபோட்டு காத்துக் கொள்ள நினைக்கும் இக்காலகட்டத்தில், கிடைத்த அதிகாரத்தினை எப்படி துறப்பது என்று யோசித்தவர் அண்ணா.\r\nஅதிகாரத்தில் அமரும்போது மக்கள் வாழ்வு சிறக்க வில்லை என்றால் துறப்பதே நல்லது. </p><p>அதிகாரத்தில்\r\nவீரத்தை விட ஈரம் முக்கியம்! இறுக்கத்தை விட இரக்கம் முக்கியம்! ஆணவத்தை விட அன்பு முக்கியம்!\r\nதன்னை விட பிறர் முக்கியம்!\r\nஅதிகாரம் அபகரித்துக் கொள்வதற்காக அல்ல,\r\nஅர்ப்பணிப்பதற்காக என்பதை புரிந்து கொள்வோம்!\r\nஅருட்பணி.எ. ஒய்சிலின் சேவியர்,\r\nபங்குத்தந்தை, கொல்வேல்.\r\nதேனருவி மீடியாவின் youtube Channel <a href=\"https://www.youtube.com/channel/UCxgfr5Dr8udb-VwAEdkXDTw\"> https://www.youtube.com/channel/UCxgfr5Dr8udb-VwA...</a>\r\nSubscribe பண்ணுங்க</p>', '4', 'N', 'english', 1593692504, 83, 0, '96531ba75082240404f0de8cb4389b75.jpg'),
(20, 301, 'Daily-Reflection-I-Fr-Benitto-I-02-07-2020', 'Daily Reflection I Fr Benitto I 02-07-2020', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/-x196nPuEG0 \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/-x196nPuEG0 \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '6', 'N', 'english', 1593693247, 112, 0, 'ba81c4df40b1e2be58633f508d59b946.jpg');
INSERT INTO `posts` (`postID`, `contributor`, `postSlug`, `postTitle`, `postExcerpt`, `tags`, `postContent`, `categoryID`, `postHeadline`, `language`, `timestamp`, `visits_count`, `commission_id`, `p_image`) VALUES
(21, 301, 'daily-reflection-i-rev-fr-benitto-i-04-07-2020', 'Daily Reflection I Rev. Fr Benitto I 04/07/2020', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/vLc5nOfqHrk \r\n    \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/vLc5nOfqHrk \r\n    \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '1', 'N', 'english', 1593860573, 229, 0, '87b8c83646b186888e85566ed077ccb8.jpeg'),
(22, 301, 'Matha-TV-Mass-_Kuzhiturai-(Pallavilai)', 'Matha TV Mass _Kuzhiturai (Pallavilai)', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/yoZzd1E8-WE \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/yoZzd1E8-WE \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '1', 'N', 'english', 1593863432, 9, 0, '808d2f0e2032aefe1d42299cdbe033aa.jpg'),
(23, 301, 'sunday-sermon-14th-sunday-in-ordinary-time-rev-fr-benitto-14-', 'Sunday Sermon | 14th Sunday In ordinary Time | Rev. Fr Benitto | ஆண்டின் பொதுக்காலம் 14 ம் ஞாயிறு மறையுரை', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/YM0DYm8h3qM \r\n    \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/YM0DYm8h3qM \r\n    \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '1', 'N', 'english', 1593875527, 384, 0, '752ce5bd5a7a5091dedcf06ccb660df5.jpeg'),
(24, 301, 'sunday-sermon-in-tamil-14-04-07-202-by-rev-fr-martin-m', 'Sunday Sermon In Tamil | ஞாயிறு மறையுரை - ஆண்டின் பொதுக்காலம் 14 ம் ஞாயிறு (04/07/202) | By Rev. Fr Martin M', '<p>இன்றைய இறை சிந்தனை</p><p>05/07/2020 | ஞாயிறு</p><p>செக்கரியா: 9: 9-10  உரோ:8: 9, 11-13, மத்:11: 25-30</p><p>இறை இயேசுவின் அன்பர்களே! </p><p>இன்று திருஅவை பொதுக்காலம் 14 - ம் ஞாயிறு சிறப்பிக்கின்றது. இன்றைய முதல் வாசகத்தில் வருங்கால அரசர்,  எளிமையுள்ளவர், நீதியுள்ளவர், அமைதியை அறிவிப்பவர் என்று மெசியாவை பற்றி குறிப்பிடுகிறது. அவர் வன்முறையை இல்லாமல் செய்கிறவர். எனவே தேர்ப்படை இருக்காது, குதிரைப்படை  ஒழிந்துபோகும். வில் ஒடிந்து போகும். அமைதி மட்டுமே நிலைபெறும்.</p><p>அமைதியின் அரசராக அவர் இருப்பார் என செக்கரியா முன்னறிவிக்கிறார். இந்த உலகில் எல்லா அரசும் பிற நாடுகளுடன் மோதல் வருகிற போது நாங்கள் அமைதியை விரும்புகிறோம் என்பார்கள். ஆனால் எல்லா அரசும் ஆயுதக் குவிப்பில் ஈடுபடுவதும் எதார்த்தம். அமைதிப் பேச்சில் மட்டும் இருக்கும் செயலிலே படைபல அதிகரிப்பு காணப்படும். ஆனால் வரவிருக்கும் மெசியா அமைதியை அறிவிப்பவர். ஆயுதங்கள் இல்லாதவர். எனவே இந்த மெசியாவை பின்பற்றி வாழும் நாமும் அமைதியின் தூதுவர்களாய் மாறுவோம்!</p><p>இயேசு தன் சீடரை பார்த்து \"நீங்கள் எந்த வீட்டுக்குச் சென்றாலும் இந்த வீட்டுக்கு அமைதி உண்டாகுக என முதலில் கூறுங்கள்\" (லூக் 10 : 5) என்கிறார்.</p><p>மேலும் \"அமைதி ஏற்படுத்துவோர் பேறுபெற்றோர் ஏனெனில் அவர்கள் கடவுளின் மக்கள் என அழைக்கப்படுவர்\" </p><p>(மத் 5 : 9) என்கிறார். எனவே கிறிஸ்துவின் பிள்ளைகள் அமைதியை விரும்ப வேண்டும். வன்முறை அல்லது பழிக்குப்பழியை அல்ல. மன்னிப்பு இருக்கும் இடத்தில் அமைதி இருக்கும். </p><p>இறங்கிச் செல்லும் மனநிலையில் அமைதி வளரும். பிறர் உணர்வுகளை மதிக்கும் மனிதரில் அமைதி தங்கும். பேச்சு வார்த்தை மீது நம்பிக்கை உள்ளவர்களால் அமைதி நிலைநிறுத்தப்படும். இல்லை என்றால் அமைதி பேச்சில் இருக்கும் செயலில் வராது. </p><p>அமைதியை விரும்புவோம்!</p><p>அமைதியாய் வாழ்வோம்!</p><p><strong>அருட்பணி. M. மார்ட்டின்,</strong></p><p>பங்குத்தந்தை, சூழால்.</p><p>தேனருவி மீடியா  https://www.youtube.com/channel/UCxgfr5Dr8udb-VwAEdkXDTw </p><p> Subscribe பண்ணுங்க.</p>', '', '<p>இன்றைய இறை சிந்தனை</p><p>05/07/2020 | ஞாயிறு</p><p>செக்கரியா: 9: 9-10  உரோ:8: 9, 11-13, மத்:11: 25-30</p><p>இறை இயேசுவின் அன்பர்களே! </p><p>இன்று திருஅவை பொதுக்காலம் 14 - ம் ஞாயிறு சிறப்பிக்கின்றது. இன்றைய முதல் வாசகத்தில் வருங்கால அரசர்,  எளிமையுள்ளவர், நீதியுள்ளவர், அமைதியை அறிவிப்பவர் என்று மெசியாவை பற்றி குறிப்பிடுகிறது. அவர் வன்முறையை இல்லாமல் செய்கிறவர். எனவே தேர்ப்படை இருக்காது, குதிரைப்படை  ஒழிந்துபோகும். வில் ஒடிந்து போகும். அமைதி மட்டுமே நிலைபெறும்.</p><p>அமைதியின் அரசராக அவர் இருப்பார் என செக்கரியா முன்னறிவிக்கிறார். இந்த உலகில் எல்லா அரசும் பிற நாடுகளுடன் மோதல் வருகிற போது நாங்கள் அமைதியை விரும்புகிறோம் என்பார்கள். ஆனால் எல்லா அரசும் ஆயுதக் குவிப்பில் ஈடுபடுவதும் எதார்த்தம். அமைதிப் பேச்சில் மட்டும் இருக்கும் செயலிலே படைபல அதிகரிப்பு காணப்படும். ஆனால் வரவிருக்கும் மெசியா அமைதியை அறிவிப்பவர். ஆயுதங்கள் இல்லாதவர். எனவே இந்த மெசியாவை பின்பற்றி வாழும் நாமும் அமைதியின் தூதுவர்களாய் மாறுவோம்!</p><p>இயேசு தன் சீடரை பார்த்து \"நீங்கள் எந்த வீட்டுக்குச் சென்றாலும் இந்த வீட்டுக்கு அமைதி உண்டாகுக என முதலில் கூறுங்கள்\" (லூக் 10 : 5) என்கிறார்.</p><p>மேலும் \"அமைதி ஏற்படுத்துவோர் பேறுபெற்றோர் ஏனெனில் அவர்கள் கடவுளின் மக்கள் என அழைக்கப்படுவர்\" </p><p>(மத் 5 : 9) என்கிறார். எனவே கிறிஸ்துவின் பிள்ளைகள் அமைதியை விரும்ப வேண்டும். வன்முறை அல்லது பழிக்குப்பழியை அல்ல. மன்னிப்பு இருக்கும் இடத்தில் அமைதி இருக்கும். </p><p>இறங்கிச் செல்லும் மனநிலையில் அமைதி வளரும். பிறர் உணர்வுகளை மதிக்கும் மனிதரில் அமைதி தங்கும். பேச்சு வார்த்தை மீது நம்பிக்கை உள்ளவர்களால் அமைதி நிலைநிறுத்தப்படும். இல்லை என்றால் அமைதி பேச்சில் இருக்கும் செயலில் வராது. </p><p>அமைதியை விரும்புவோம்!</p><p>அமைதியாய் வாழ்வோம்!</p><p><strong>அருட்பணி. M. மார்ட்டின்,</strong></p><p>பங்குத்தந்தை, சூழால்.</p><p>தேனருவி மீடியா  https://www.youtube.com/channel/UCxgfr5Dr8udb-VwAEdkXDTw </p><p> Subscribe பண்ணுங்க.</p>', '5', 'N', 'english', 1593878981, 965, 0, '7a980eb563eab05972e5873e40bf3e95.jpg'),
(25, 301, 'திருப்பலி---19.11.2020-(Madha-TV)', 'திருப்பலி - 19.11.2020 (Madha TV)', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/NPi81zJ3HEs \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '', '<iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/NPi81zJ3HEs \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '1', 'N', 'english', 1605767131, 50, 0, 'd104a6aea3bd1a106eeab3fc3269e378.jpg'),
(26, 301, 'இன்றைய-இறை-சிந்தனை', 'இன்றைய இறை சிந்தனை', '<p>அருடபணி. பெனிட்டோ, முரசங்கோடு</p><iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/6ZQ-M7cUn_M \r\n    \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', 'thenaruvimedia,tamilsermon,tamilnews,kuzhithuraidiocese', '<p>அருடபணி. பெனிட்டோ, முரசங்கோடு</p><iframe width=\"100%\" height=\"315\" src=\"//www.youtube.com/embed/6ZQ-M7cUn_M \r\n    \" frameborder=\"0\" allowfullscreen=\"\"></iframe>', '1', 'N', 'english', 1605767085, 632, 0, '78f9122802f33a727df63925136fe686.jpg'),
(27, 301, 'kuzhithuraidiocese.in', 'kuzhithuraidiocese.in', '<p>Our diocesan domain address is now changed. The new web address of Kuzhithurai diocese is http://www.kuzhithuraidiocese.in/</p>', '', '<p>Our diocesan domain address is now changed. The new web address of Kuzhithurai diocese is http://www.kuzhithuraidiocese.in/</p>', '1', 'N', 'english', 1621431029, 1768, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts_category`
--

CREATE TABLE `posts_category` (
  `categoryID` int(11) NOT NULL,
  `categoryTitle` varchar(255) NOT NULL,
  `categorySlug` varchar(255) NOT NULL,
  `categoryDescription` text NOT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `timestamp` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_category`
--

INSERT INTO `posts_category` (`categoryID`, `categoryTitle`, `categorySlug`, `categoryDescription`, `language`, `timestamp`) VALUES
(1, 'THENARUVI', 'thenaruvi', 'thenaruvi communication thenaruvi communication', 'english', 1592571981),
(2, 'PUTHIYA THEDAL', 'puthiya-thedal', 'puthiya thedal', 'english', 1592571906),
(4, 'வாசி யோசி', '-', 'வாழ்வியல் சிந்தனைகள் | தேனருவி', 'english', 1593691946),
(5, 'இன்றைய இறைசிந்தனை', '-', 'அன்றாட அருளுரை| தேனருவி', 'english', 1593692006),
(6, 'இறைசெய்தி |காணொளி', '-', 'you tube வழி நற்செய்தி அறிவிப்பு பணி', 'english', 1593692287),
(9, 'News & Events', 'news-events', 'மறைமாவட்ட செய்திகள்', 'english', 1593692464);

-- --------------------------------------------------------

--
-- Table structure for table `priest`
--

CREATE TABLE `priest` (
  `id` int(11) NOT NULL,
  `priestid` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `pfname` varchar(100) DEFAULT NULL,
  `pmnane` varchar(100) DEFAULT NULL,
  `pdob` varchar(20) DEFAULT NULL,
  `pplace` varchar(75) DEFAULT NULL,
  `pseminary` varchar(100) DEFAULT NULL,
  `porddate` varchar(30) DEFAULT NULL,
  `pordplace` varchar(100) DEFAULT NULL,
  `pordby` varchar(100) DEFAULT NULL,
  `pminstring` varchar(100) DEFAULT NULL,
  `paddress` varchar(200) DEFAULT NULL,
  `pphone` varchar(30) DEFAULT NULL,
  `pmobile` varchar(30) DEFAULT NULL,
  `pemail` varchar(50) DEFAULT NULL,
  `pimg` varchar(50) DEFAULT NULL,
  `pdiocese` varchar(30) DEFAULT NULL,
  `contract` varchar(10) DEFAULT NULL,
  `home_priest` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(80) NOT NULL DEFAULT 'no-slug'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priest`
--

INSERT INTO `priest` (`id`, `priestid`, `pname`, `pfname`, `pmnane`, `pdob`, `pplace`, `pseminary`, `porddate`, `pordplace`, `pordby`, `pminstring`, `paddress`, `pphone`, `pmobile`, `pemail`, `pimg`, `pdiocese`, `contract`, `home_priest`, `slug`) VALUES
(1, 1001, 'Fr. Mathias. M', 'Mr. Maria Michael', 'Mrs. Annammal', '13.06.1931', 'Mathiravilai', '', '28.03.1960', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J.', 'Retired', '              14/23rd Main Road<div></div><div>Srinivasa Nagar</div><div>Trichy 620 017</div>', '0431-2782798', '9443466617', '', '1001.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-mathias-m'),
(2, 1002, 'Fr. Wenceslaus C.M. (Late)', 'Mr. Chinnayyan Michael', 'Mrs. Cecily', '27.05.1933', 'Thiruvithancode', 'St. Raphael\\\'s Seminary  Quilon,St. Paul\\\'s Seminary Trichy ', '24.03.1961', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Deceased', '                    South Gate,Near Government Mid. Sch.,Thiruvithancode P.O. 629 174', '', '9443579750', '', '1002.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-wenceslaus-c-m-late'),
(3, 1003, 'Fr. Mariadhas A.', 'Mr. Arockiam', 'Mrs. Annammal', '06.05.1937', 'Kuzhivilai', 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy', '27.03.1963', 'St.Xavier\\\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J.', 'Spiritual Father, puliyoorkurichy', '            Martyr Devasahayampillai Shrine, Puliyoorkurichy, Thuckalay 629175', '', '8220695762', '', '1003.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-mariadhas-a'),
(4, 1004, 'Fr. Jesudhasan Thomas', 'E.Thomas', 'Annammal', '28.03.1935', 'Arockiapuram', 'St.Aloysius Pune, St.Gorgan Germany', '25.07.1963', 'Eschweiler Germany', 'Bishop John Pohlschmener', 'Spiritual Director, St. Aloysius Minor seminary', '        Spiritual Director, St. Aloysius Minor seminary, PB No:17, Asaripallam Road, Nagercoil - 629001', '', '9442076656', 'jesudason@gmx.de', '1004.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jesudhasan-thomas'),
(5, 1006, 'Fr. Robert V', 'Mr. Varuvel Antony', 'Mrs. Maria Raja Retinam', '10.02.1945', 'Mela Ramanputhoor', 'St. Aloysius Seminary, Nagercoil,  St. Joseph\\\'s Seminary, Alwaye', '20.12.1968', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J', 'Parish priest, Kappiarai', '    <span lang=\"EN-IN\" style=\"line-height: 115%; font-family: Arial, sans-serif;\"><font size=\"3\">&nbsp;Parish Priest, Church of St. Catherine, Kappiarai</font></span>', '', '9487411988', 'robertvaruvel@gmail.com', '1006.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-robert-v'),
(6, 1007, 'Fr. Joseph Raj A.', 'Mr. Albert', 'Mrs. Pragasi', '16.06.1943', 'Madathattuvilai', 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary, Poonamallee ', '19.12.1969', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Kanjiracode', '      <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span lang=\"EN-IN\" style=\"font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif;\">Church\r\nof O.L. of Rosary, Kan', '', '9443940064', '', '1007.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-joseph-raj-a'),
(7, 1008, 'Fr. Mariadhasan. S', 'Mr. Savarimuthu', 'Mrs. Gnanapooammal', '01.06.1943', 'Chithenthope', 'St. Paul\\\'s Seminary, Trichy ', '19.12.1969', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Co- Pastor, Pannavilai', '    <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">Church\r\nof the Holy Redeemer of the World, Pannavilai</span></p>', '', '9487108765', '', '1008.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-mariadhasan-s'),
(8, 1009, 'Fr. Hilary A.M.', 'Antony Muthu', 'Mariaanthony', '29.01.1946', 'Mylacode', 'St.Joseph\\\'s ', '21.12.1970', 'Kottar', 'Bishop Agnisamy', 'Vicar Forane, Vicariate of Mulagumoodu', '    <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">St.\r\nMichaelâ€™s Shrine, Puliyurkurichi</span></p>', '9443180972', '9488911972', 'hilaryam2015@gmail.com, muthu416@yahoo.com', '1009.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-hilary-a-m'),
(9, 1010, 'Fr. Chellaiyan P.K. ', 'Mr. Kumaravel', 'Mrs. Kochukali', '22.05.1942', 'Nallayanpuram', 'St. Paul\\\'s Seminary, Trichy', '21.12.1971', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Retired ', '    ', '', '9442304254', '', '1010.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-chellaiyan-p-k'),
(10, 1011, 'Fr. Wilfred Felix A.', '', '', '21.02.1948', 'Puthenkadai', '', '18.03.1972', '', '', '', '          Asian Centre for Cross Cultural Studies,40/6A Panayur Kuppam Road,Panayur, Sholinganallur P.O.,Chennai 600 119', '044 24530206,24530682', '9444034665', 'felixwilfred@gmail.com', '1011.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-wilfred-felix-a'),
(11, 1012, 'Fr. Innocent J.', 'Mr. S.Jones', 'Mrs. Ronickam', '02.05.1946', 'Karungal ', 'St. Aloysius Seminary, Nagercoil,St. Joseph\\\'s Pont.Seminary, Alwaye', '21.12.1972', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish priest, Kaliakkavilai', '    <span lang=\"EN-IN\" style=\"font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif; color: black;\">Parish Priest,<b>&nbsp;</b>Church of St. Antony, Kaliakkavilai</span>', '9443791058', '7708755017', 'innocent020546@gmail.com', '1012.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-innocent-j'),
(12, 1013, 'Fr. Peter M.', 'Mr. Mariakkan', 'Mrs. Gnanasoundari', '31.07.1950', 'Chithenthopue Kandanvilai', 'St. Aloysius Seminary, Nagercoil ,St. Joseph\\\'s Seminary, Alwaye ', '22.12.1974', 'St. Xavier\\\'s Cathedral, Kottar', 'Archbishop M. Arockiaswamy', 'Parish priest, Thundathuvilai', '              Parish Priest ,Church of St. Antony of Padua,Thundathuvilai,Karungal 629 157', '9443993582', '9965590625', 'avcpeter@yahoo.com', '1013.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-peter-m'),
(13, 1014, 'Fr. Jesu Marian A.', 'Mr. Arockiam', 'Mrs. Mariammal', '28.05.1946', 'Arockiapuram', 'St. Aloysius Seminary, Nagercoil,Sacred Heart Seminary, Ponnamallee ', '04.02.1975', 'St. Francis Xavier\\\'s Church Manguzhy', 'Archbishop M. Arockiaswamy', 'Sacred Heart Seminary', '                <p>Sacred Heart Seminary</p><p>Karayanchavadi</p><p>Poonamalle</p><p>Chennai</p>', '', '9442525044', 'jesumarian@gmail.com', '1014.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jesu-marian-a'),
(14, 1015, 'Fr. Antony R. ', 'Mr. Rajendran', 'Mrs. Arockiam', '25.06.1944', 'Palliady', 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy, St. Paul\\\'s Seminary, Trichy ', '12.05.1975', 'Palliadi', 'Archbishop Arockiaswami M.', 'Confessor', '                    Church of O.L. of Nativity, Mulagumoodu 629 167', '', '9488425144', '', '1015.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-antony-r'),
(15, 1016, 'Fr. Arul Devadhason M. ', 'Mr. S. Maria Arockiam', 'Mrs. Maria Kavalal', '06.05.1948', 'Punnai Nagar', 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary Poonamallee, Regency Viyasarpady, Chennai, P', '14.04.1977', 'Carmel High School, Ramanputhoor', 'Archbishop. Arockiaswami M.', 'Shrine of St. Antony,Vettuvenni', '                Shrine of St. Antony,Vettuvenni, Kuzhithurai 629 163', '', '9443129153', 'fr_addhason@rediffmail.com', '1016.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-arul-devadhason-m'),
(16, 1017, 'Fr. Jesu Retnam S.', 'Mr. Stanislaus', 'Mrs. Maria Packiam', '01.01.1950', 'Mankuzhy', 'St. Paul\\\'s Seminary, Trichy', '17.04.1977', 'Mankuzhy', 'Archbishop M. Arockiaswamy', 'Vicar General', '        <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\">Parish Priest, Church of St. Joseph, Manchady, Kattathurai- 629158</p>', '', '9442788275', 'jco_ordinator@yahoo.co.in', '1017.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jesu-retnam-s'),
(17, 1018, 'Fr. Vargheese S', 'Mr. Savarimuthu', 'Mrs. Theresammal', '27.03.1948', 'Thickurichy', 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary Poonamallee', '02.05.1978', 'Thickurichy', 'Archbishop M. Arockiaswamy', 'Parish Priest, Kamplar', '  Church of St.Joseph, Kamplar, Tholaiyavattam - 629159', '04651 269077', '9486248535', '', '1018.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-vargheese-s'),
(18, 1019, 'Fr. Vincent Raj S.', 'Mr. Savarimuthu', 'Mrs. Rajammal', '24.06.1953', 'Kalkurichy', 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary  Poonamallee  ', '03.10.1979', 'Kalkurichy', 'Archbishop M. Arockiaswamy', 'Vicar Forane, Vicariate of Mathiravilai', '  &nbsp;Church of St.Michael the Archangel, Manalikuzhivilai&nbsp;<div><br></div>', '9486933818', '9443370360', 'frsvincentraj@gmail.com', '1019.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-vincent-raj-s'),
(19, 1020, 'Fr. Maria Alphonse V.', 'Mr. V. Wenceslaus', 'Mrs. Agathammal', '17.12.1954', 'Vellicode', 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor, Theology  Papal Seminary, Pune, Philosop', '27.05.1980', 'Vellicode', 'Bishop Antonymuthu Bishop of Vellore', 'Vicar General', '        Bishop\'s House, P.B.No: 1,Unnamalaikadai 629179,K.K. Dist', '', '9486249262', 'vmalphonse@gmail.com', '1020.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-alphonse-v'),
(20, 1021, 'Fr. Raphael V.', 'Mr. A. Varuvel', 'Mrs. Maria Sebastiaye', '22.02.1952', 'Appattuvilai', 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee Christ Hall, Karumathoor', '15.06.1981', 'Appattuvilai', 'Most Rev. M. Arockiaswamy', 'Formator, St. Paul\'s Seminary, Trichy', '          St. Paul\'s Seminary ,P.B.No.36,Trichy 620 001', '0431 2402500, 2402501', '9442383326', 'raphaelvbible@yahoo.co.in', '1021.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-raphael-v'),
(21, 1022, 'Fr. Paschal S. Prosper', 'Mr. Singarayan', 'Mrs. Rosammal', '17.05.1952', 'Puthenkadai', 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor,St. Paul\\\'s Seminary, Trichy', '18.04.1982', 'Puthenkadai', 'Archbishop M. Arockiaswamy', '', '      Rua 7 De Setembro,No 348, Tabuleiro Do Martins,CEP 57.061 140 Maceio AL,Brazil.    ', '', '0055 8299814195', 'paschalprosper@yahoo.com.br', '1022.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-paschal-s-prosper'),
(22, 1023, 'Fr. Xavier Bruce. R', 'P. Rajendran', 'A. Nesammal', '31.07.1957', 'Thalavaipuram', 'Papal Seminary, Pune', '27.10.1982', 'Carmel Nagar', 'Bishop M. Arokiasamy', 'Co - Pastor Munchirai', 'Church of O.L.of Good Health. Munchirai, Puthukadai - 629171', '', '9597055386', 'xavierbrucer@yahoo.com', '1023.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-xavier-bruce-r'),
(23, 1024, 'Fr. Francis S.', '', '', '25.05.1956', 'Chemparuthivilai', '', '10.04.1983', '', '', 'USA', '      USA', '', '', '', '1024.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-francis-s'),
(24, 1025, 'Fr. George Ponnaiah', 'Mr. Swaminathan Ponnaiah', 'Mrs . Maria Chellammal', '06.12.1957', 'Moolachael', 'St. Aloysius Seminary, Nagercoil.  St. Peter\\\'s Seminary, Madurai.  Papal Seminary, Pune', '10.12.1983', 'Moolachel', 'Archishop M. Arockiaswamy', 'Parish Priest, Panavilai', '          Parish Priest, Church of the Holy Redeemer of the World, Panavilai.', '04651 256147', '9488282787', 'fr_ponnaiah@yahoo.com', '1025.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-george-ponnaiah'),
(25, 1026, 'Fr. Mary John R.', 'Mr. Rayappan', 'Mrs. Savariai', '28.01.1957', 'Melpuram', 'St. Aloysius Seminary, Nagercoil, St. Peter\\\'s Seminary, Madurai,St. Paul\\\'s Seminary, Trichy ', '29.04.1984', 'Assisi Campus, Nagercoil', 'Bishop M. Arokiasamy', 'Parish Priest, Irudhayapuram', '        Parish Priest,Church of Sacred Heart of Jesus, Irudhayapuram, Kuzhicode - 629 167', '', '9443450709', 'rmaryjohn@yahoo.co.uk', '1026.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-mary-john-r'),
(26, 1027, 'Fr. Augustine P. ', 'Mr. K. Ponnaian', 'Mrs. Annammal', '14.11.1958', 'Elavuvilai', 'St. Aloysius Seminary, Nagercoil, St. Paul\\\'s Seminary, Trichy', '14.04.1985', 'St. Xavier\\\'s Cathedral,Kottar', 'Bishop M. Arockiaswamy', 'Procurator of the Diocese', '          Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K. Dist, Tamilnadu. ', '', '9486249201', 'ponaugustine@gmail.com', '1027.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-augustine-p'),
(27, 1028, 'Fr. Vincent S.', 'Mr. Joachim (Subakian)', ' Mrs. Rosammal', '11.08.1957 ', 'Vencode', 'St. Aloysius Seminary Nagercoil, St. Peter\\\'s Seminary Karumathoor, St. Paul\\\'s Seminary Trichy', '14.04.1985', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, VelliaVilai', '          Parish Priest,Church of Good Shepherd ,Velliavilai,Palapallam 629 159', '', '9444051816', '', '1028.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-vincent-s'),
(28, 1029, 'Fr. Antony M. Muthu', 'Mr. Maria Siluvai', 'Mrs. Maria Isidorial', '25.08.1958', 'Mavilai, Mukkalampaddu', 'St. Peter\\\'s Seminary, Madurai, Sacred Heart Seminary, Poonamallee, College Studies Christ Hall, Kar', '06.04.1986', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, Melpalai', '        Church of Assumption of Our Lady, Melpalai 629 152', '', '9444688225', 'frmamuthu@yahoo.co.in', '1029.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-antony-m-muthu'),
(29, 1030, 'Fr. Elphinston Joseph J.', 'Mr. K.S. John', ' Mrs. P. Rajammal', '23.03.1961', 'Kandanvilai', 'St. Aloysius Seminary Nagercoil,St. Peter\\\'s Seminary Madurai,Christ Hall Seminary Madurai,St. Paul\\', '26.04.1987', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Italy ', '            Italy', '', '', 'elphinj@yahoo.com', '1030.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-elphinston-joseph-j'),
(30, 1031, 'Fr. Maria Arputham R.', 'Mr. M. Rayappan', 'Mrs. S. Mathavadial', '13.12.1955', 'Vencode', 'St. Peter\\\'s Seminary, Madurai.St. Paul\\\'s Seminary, Trichy', '26.04.1987', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, Alencholai', '        Parish Priest,Church of O.L. of Lourdes,Pilankalavilai (Alencholai), Kaliyal 629161', '', '9486942860', 'arpyroy@yahoo.com', '1031.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-arputham-r'),
(31, 1032, 'Fr. Maria Martin S.', 'Mr. V. Sinkarayan', 'Mrs. T. Maria Muthu', '29.03.1960', 'Sahayanagar', 'St. Aloysius Seminary, Nagercoil,St. Peter\\\'s Seminary, Madurai, St. Paul\\\'s Seminary, Trichy', '26.04.1987', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Secretary, Puthuvasantham', '        Secretary, Puthuvasantham, Near Block Office, Tholayavattam - 629157', '', '9442761150', 'singhmark@yahoo.com', '1032.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-martin-s'),
(32, 1033, 'Fr. Joseph Jeyaseelan S.', 'Mr. M. Stanislaus', 'Mrs. Palpeenammal', '21.11.1962', 'Karenkadu', 'St. Aloysius Seminary, Nagercoil,St. Peter\\\'s Seminary, Madurai,Christ Hall, Karumathur,St. Paul\\\'s ', '04.04.1988', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev, M.Arockiasamy', 'Kalaikaviri', '  Kalaikaviri College, 18-Benwells Road, Trichy-620001', '', '9443118725', 'frjeyaseelan@gmail.com, frjeyaseelan@yahoo.co.in', '1033.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-joseph-jeyaseelan-s'),
(33, 1034, 'Fr. Maria William M.', 'Mr. M. Maria Soosai', 'Mrs. Mary Angel', '08.01.1962', 'Nullivilai', 'St. Aloysius Minor Seminary, Nagercoil, St. Peter\\\'s Madurai,Sacred Heart Seminary, Poonamallee', '29.05.1988', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Iruthayaraj,', 'Correspondant, St. Xavier\'s Catholic College of Engineering, Chunkankadai', '            Correspondant, St. Xavier\'s Catholic College of Engineering, Chunkankadai, Nagercoil - 629003', '', '9488881212', 'mahizh6218@yahoo.com', '1034.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-william-m'),
(34, 1035, 'Fr. George K.', 'Mr. Kamalies', 'Mrs. Pragacy', '06.04.1964', 'Vencode', 'St. Aloysius Seminary, Nagercoil.Sacred Heart Seminary, Poonamallee', '22.04.1990', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Elanthavilai', '          Parish Priest,Church of  Holy Family, Elanthavilai, Meycode -629804', '', '9487643191', 'george28kamalies@gmail.com', '1035.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-george-k'),
(35, 1036, 'Fr. Xavier Benedict. S', 'Mr. S. Sathianathan', 'Mrs. Ronickal', '12.03.1964', 'Vencode', 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy', '22.04.1990', 'St. Xavier\\\'s Cathedral, Kottar', 'Rev. Leon A. Tharmaraj', 'St. Paul\'s Seminary', '  St. Paul\'s Seminary, P.B.No: 36, Trichy - 620001', '', '9442456818', 'sbenxavier@gmail.com', '1036.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-xavier-benedict-s'),
(36, 1037, 'Fr. Gaspar Raj M. ', 'Mr. Maria Paulian E.', 'Mrs. Maria Pushpam G.', '22.01.1966', 'Kanjampuram', 'St. Aloysius Seminary Nagercoil,Sacred Heart Seminary Poonamallee', '07.04.1991', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Thamizh Maiyam', '    Goodwill Communications Ltd., New No. 68, (Old No.150), Luz Church Road, Mylapore, Chennai 600 004', '044 24994344', '9444072217', '', '1037.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-gaspar-raj-m'),
(37, 1038, 'Fr. Russel Raj B.', 'Mr. Bhakthinathan', 'Mrs. Rajammal', '01.12.1963', 'Cheriakolla', 'St. Aloysius Seminary, Nagercoil, St. Paul\\\'s Seminary, Trichy', '07.04.1991', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Chancellor, Judicial Vicar and Rector of Nattalam shrine', '              Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K.Dist, Tamilnadu. ', '', '9486516374', 'chancellor.kuzhithurai@gmail.com', '1038.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-russel-raj-b'),
(38, 1039, 'Fr. Sebastian F.', 'Mr. A. Francis', 'Mrs. Mary John', '15.05.1966', 'Kulavilai, Konamcadu', 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee', '26.04.1992', ' St. Xavier\\\'s Cathedral, Kottar', ' Most Rev. Leon A.Tharmaraj', 'SIGARAM', '  Sigaram, Main Road, Mulagumoodu.&nbsp;', '', '9443450063', 'mail_seba@yahoo.com', '1039.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-sebastian-f'),
(39, 1040, 'Fr. Sekhar Michael', 'Mr. K. Savarimuthu', 'Mrs. S. Kamala Josephine', '14.11.1966', 'Thuckalay', 'St. Aloysius Seminary Nagercoil (1984 1986), Christ Hall Seminary  Karumathoor(1986 1987)', '26.04.1992', ' St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Appattuvilai', '              Parish Priest,Church of St. Antony, Appattuvilai , Thuckalay - 629175', '', '9487422061', 'sekharmichael@yahoo.com', '1040.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-sekhar-michael'),
(40, 1041, 'Fr. Maria Selvaraj S.', '', '', '13.05.1959', 'Mukkalampadu', '', '19.12.1992', '', '', '', '  ', '', '9443993323', '', '1041.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-selvaraj-s'),
(41, 1042, 'Fr. Maria Susai P.', 'Mr. Ponnaiyan', 'Mrs. Dasammal', '18.05.1961', 'Melpalai', 'St. Aloysius Minor Seminary, Nagercoil(1978),St. Pauls Seminary, Trichy (1979 1982)', '15.04.1993', 'Jerusalam, Trichy', 'Most Rev. Thomas Fernando', 'Parish Priest, Kappu Kadu', '          Parish Priest,Church of Kallithattu St. Antony,Kappucadu,Kunnathoor 629 162', '', '9443208639', 'mariasusaimari@yahoo.co.in', '1042.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-susai-p'),
(42, 1043, 'Fr. Dominic Kadatcha Dhas M. ', 'Mr. Moses Motcha Dhas', 'Mrs. Gnana Retna Bai', '10.04.1967', 'Thundathuvilai', 'Christ Hall Karumathoor,St. Paul\\\'s Seminary Trichy', '18.04.1993', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Mulagumoodu', '            Church of O.L. of Nativity, Mulagumoodu 629 167 ', '', '9442383119', 'dominickdhas@yahoo.com', '1043.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-dominic-kadatcha-dhas-m'),
(43, 1044, 'Fr. John Michel Raj M.', 'Mr. M.A. Malayappan', 'Mrs. Swarnam', '11.10.1967', 'Mulavilai', 'St. Aloysius Seminary, Nagercoil 1984 1985,Philosophy Christ Hall, Madurai 1985 1988,Theology St. Pa', '18.04.1993', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Cherukol, Director KIDSS', '        Parish Priest, Church of  St. Antony,Cherukol,Karumputhottam, Kattathurai 629 158', '', '9443129831', 'michael_raj2000@yahoo.com', '1044.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-john-michel-raj-m'),
(44, 1045, 'Fr. Steephen C.', 'Mr. Chellan', 'Mrs. Therasammal', '04.04.1966', 'Kolvel', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Sacred Heart Seminary Poonamallee', '10.04.1994', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study', '  Anugraha, Friary, Nochiodaipatti, Dindigul - 624003', '', '9443134495', ' chellan.ste@gmail.com', '1045.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-steephen-c'),
(45, 1046, 'Fr. Benedict M.D. Anelin ', 'Mr. J. Maria Dhasan', 'Mrs. R. Leela', '21.04.1968', 'Thuckalay', 'St. Aloysius Seminary, Nagercoil, Arul Anandar College, Karumathor, Theology St. Paul\\\'s, Trichy', '23.04.1995', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Palliady', '  Parish Priest, Church of Sacred Heart of Jesus, Palliady - 629169', '', '9443416414', 'franelin@rediffmail.com', '1046.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-benedict-m-d-anelin'),
(46, 1047, 'Fr. Benjamin D. ', 'Mr. Davidson', 'Mrs. Ganapragasi', '02.02.1968', 'Cherikkadai', 'St. Aloysius Seminary, Nagercoil, Arulanandar College, Karumathoor, Theology St. Paul\\\'s Seminary, T', '23.04.1995', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest ,Munchirai, Vicar Forane (Vencode)', '          Church of O.L. Good Health, Munchirai , Puthukkadai  629 171', '', '9443595872', 'benjaminkottar@yahoo.com', '1047.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-benjamin-d'),
(47, 1048, 'Fr. David Michael M. ', 'Mr. Maria Michael V.', 'Mrs. Mary Archangel M.', '20.09.1967', 'Madathattuvilai', 'St. Aloysius Seminary Nagercoil,Philosophy Sacred Heart  Poonamallee,Theology Sacred Heart Poonamall', '23.04.1995', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'USA', '  USA', '04651 273009', '9442312212', 'frdavidmichael@gmail.com', '1048.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-david-michael-m'),
(48, 1049, 'Fr. Antony William F.', '', '', '08.02.1966', 'Mallanvilai', '', '14.04.1996', '', '', 'USA', '    Holy Family Church, 15, Gender Road, New York, DE 1973, USA', '', '', 'fantonywilliam@yahoo.co.in', '1049.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-antony-william-f'),
(49, 1050, 'Fr. Gelastin Gerald A. ', 'Mr. A. Antonypillai', 'Mrs. C. Annammal', '09.03.1968', 'Puthenkadai', 'St. Aloysius\\\' Seminary, Nagercoil  Philosophy Arulananthar  Karumathoor,Theology St. Paul\\\'s, Trich', '14.04.1996', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Bishop\'s House Unnamalaikadai', '        Bishop\'s House, P.B.No: 1, Unnamalaikadai 629 179', '', '9442730307', 'aggerald@rediffmail.com', '1050.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-gelastin-gerald-a'),
(50, 1051, 'Fr. Jayaprakash S.', 'Mr. Singarayan', 'Mrs. Nesammal', '20.02.1969', 'Thundathuvilai', 'St. Aloysius\\\' Minor Seminary, Nagercoil,Philosophy Christ Hall, Karumathoor,Theology St. Paul\\\'s Se', '14.04.1996', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai', '            Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai, Nagercoil - 629003', '', '9443011181', '', '1051.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jayaprakash-s'),
(51, 1052, 'Fr. Jose Robinson S.K.', 'Mr. S. Singarayan', 'Mrs. C. Kamalam', '10.09.1969', 'Thundathuvilai', 'St. Aloysius Seminary, Nagercoil,Philosophy Papal Seminary, Pune,Theology Papal Seminary, Pune', '14.04.1996', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Nanjil Career Academy ', '          Annai Ada Centre, Azhahiyamandapam', '', '9486377227', 'nanjilsrobin@gmail.com', '1052.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jose-robinson-s-k'),
(52, 1053, 'Fr. Martin N.', 'Mr. Neelakandan Asari', 'Mrs. Monica (Kolammal)', '22.05.1967', 'Pacode', 'St. Aloysius, Nagercoil, Philosophy ChristHall,Karumathoor Theology  St. Paul\\\'s, Trichy', '14.04.1996', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Manali', '    parish Priest, Church of St. Antony of Padua, Manali, Thuckalay- 629175', '', '9442653803', 'martinkottar@gmail.com', '1053.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-martin-n'),
(53, 1054, 'Fr. Callistus M. ', 'Mr. Maria Sebastian A.', 'Mrs. Maria Nesam', '05.01.1965', 'Kuzhivilai', 'Karumathur  Minor Seminary, Kumbakonam  Philosophy Christ Hall, Karumathoor Arulananthar College, Ka', '22.04.1996', 'Kuzhivilai', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Amsi', '<div>Parish Priest,Church of Imm. Heart of Mary,Amsi, Maniaramkuntu,Thengapattanam 629 173<br></div>', '', '9443607766', '', '1054.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-callistus-m'),
(54, 1055, 'Fr. Gnanamuthu V.', 'Mr. Varuvel', 'Mrs. Rosammal', '22.05.1968', 'Pullani', 'St. Aloysius, Nagercoil 1988,Philosophy Christ Hall, 1993 Karumathoor,Theology St. Paul\\\'s, Trichy 1', '06.04.1997', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'St. Paul\'s Seminary', '          St. Paul\'s Seminary, P.B.No:36, 620001', '', '9489264680', 'vgnana2002@yahoo.com', '1055.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-gnanamuthu-v'),
(55, 1056, 'Fr. Anthireya alias Andrew D.', 'Mr. Devasahayam', 'Mrs. Chellammal', '22.11.1959 ', 'Themanoor', 'Philosophy Dharmaram, Bangalore Theology Dharmaram, Bangalore,', '19.04.1998', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kuzhivilai', '            Church of St. Francis Xavier, kuzhivilai, Prakadai, Kappiarai - 629156', '', '9443415475', 'frandrew.1960@gmail.com', '1056.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-anthireya-alias-andrew-d'),
(56, 1057, 'Fr. Antony Jeya S. ', 'Mr. Siluvai Rayan', 'Mrs. Lourdu Mary', '11.08.1970', 'Konamcadu', 'St. Aloysius\\\' Seminary, Nagercoil, Philosophy Christ Hall Seminary, Karumathur, Theology Sacred Hea', '11.04.1999', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'USA', '  USA', '', '9442831807', 'santonyjeya@yahoo.com', '1057.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-antony-jeya-s'),
(57, 1058, 'Fr. Jeya Kumar G.', 'Mr. Gnanapragasam', 'Mrs. Maria Pushpam', '24.09.1971', 'Pallavilai (Pattarivilai)', 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall Seminary , Karumathoor,Theology St. Paul\\\'s ', '11.04.1999', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Madathattuvilai', '  Parish Priest, Church of St. Sebastian, Madathattuvilai', '', '9487688033', '', '1058.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jeya-kumar-g'),
(58, 1059, 'Fr. Maria Rajendran S.', 'Mr. Savariar Adimai', 'Mrs. Theresammal', '14.05.1969', 'Mathiravilai', 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall, Karumathur ,Theology Sacred Heart, Poonamal', '11.04.1999', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Vavarai & Corresspondant, Nanjil Catholic Arts and Science College', '      Secretary, Nanjil Catholic College of Arts and Science, Kaliyakkavilai.', '', '9443606008', 'rajendranmaria@yahoo.com', '1059.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-rajendran-s'),
(59, 1060, 'Fr. Paul Richard Joseph R.', 'Mr. Rayappan', 'Mrs. Mary Leela', '10.03.1972', 'Palliady', 'St. Aloysius Seminary, Nagercoil', '11.04.1999', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest- Thikurichy, Co-Correspondent Trinity School', '              Paish Priest<div>Church of St. Gabriels</div><div>Thickurichy - 629 168</div>', '04651 230144, 230244', '9443693505', 'paulrichardjoseph@hotmail.com', '1060.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-paul-richard-joseph-r'),
(60, 1061, 'Fr. Robert Benni M.', 'Mr. Sahaya Marcose', 'Mrs. Saral Mary', '06.05.1971', 'Mylacode', 'St. Aloysius Seminary, Nagercoil,  Philosophy Christ Hall, Karumathoor,  Theology St. Paul\\\'s, Trich', '11.04.1999', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Chetticharvilai', '          Parish Priest, Church of St. Little Flower, Chetticharvilai', '', '9443808823', 'frmrbenni@yahoo.co.in,  frmrbenni@gmail.com', '1061.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-robert-benni-m'),
(61, 1062, 'Fr. Manohim Xavier F.', 'Mr. A.R. Francis', 'Mrs. Rajammal', '28.06.1972', 'Mathiravilai', 'St. Aloysius\\\' Minor Seminary, Nagercoil,Philosophy Christ Hall Seminary, Karumathur,St. Pauls\\\' Sem', '30.04.2000', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Muttaicadu, Correspondent Trinity School & Asst. Director Nanjil Milk Plant', '              Parish Priest, Church of St. Francis Xavier, Muttaicadu, Kumarapuram - 629189', '', '9443579345', 'frmano2010@gmail.com', '1062.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-manohim-xavier-f'),
(62, 1063, 'Fr. Leo Alex A.', 'Mr. Ambrose', 'Mrs. Annammal', '01.08.1970', 'Nagacode', 'St. Aloysius\\\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Paul\\\'s Seminary, Trichy', '27.12.2000', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Vellicode', '        Parish Priest,Church of Our Lady of Sorrows,Vellicode,Mulagumoodu 629 167', '', '9443595664', 'frleoalex2000@gmail.com', '1063.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-leo-alex-a'),
(63, 1064, 'Fr. P. Sahaya Dhason.', 'Mr. Pathrose', 'Mrs. Retna Bai', '22.11.1972', 'Kandanvilai', 'St. Aloysius\\\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\\\'s Seminary, Trichy', '27.12.2000', ' St. Xavier\\\'s Cathedral, Kottar', ' Most Rev. Leon A.Tharmaraj', 'Parish Priest, Vattam & Asst. Procurator ', '            Parish Priest, St.Antony\'s Church Vattom, Thiruvithancode PO', ' 04651 253360, 248122', '9487422704', 'dhasu.saha@gmail.com', '1064.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-p-sahaya-dhason'),
(64, 1065, 'Fr. Christopher S. ', 'Mr. Siluvairayan', 'Mrs. Jesu Mary', '24.05.1973', 'Karenkadu', 'St. Aloysius\\\' Minor Seminary, Nagercoil, Sacred Heart, Poonamallee', '22.04.2001', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Ithayapuram (Viricode), MD VSCS', '          Church of Sacred Heart of Jesus, Ithayapuram, Viricode - 629165', '', '9443118067', 'frchristo_rexputh@yahoo.co.in', '1065.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-christopher-s'),
(65, 1066, 'Fr. Isaac Raj R.', 'Mr. Rayappan', 'Mrs. Rethna Bai', '05.05.1971', 'Kappiyarai', 'St. Aloysius\\\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathur,St. Paul\\\'s Seminary, Tric', '22.04.2001', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Mylacode, ', '        Parish Priest, Church of St. Micheal, Mylacode, Alancode, Neyyoor - 629802', '', '8903253253', 'frisaacraj@gmail.com', '1066.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-isaac-raj-r'),
(66, 1067, 'Fr. Maria Vincent A.', 'Mr. Alangaram (Late)', 'Mrs. Ronickam', '12.03.1957', 'Thuckalay', 'St. Aloysius\\\' Minor Seminary, Nagercoil  St.Pauls, Trichy', '22.04.2001', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Packiapuram', '          Parish Priest,Church of St. Eusthachius,<br>Packiapuram,Arumanai 629 151', '9344431629', '8903476560', 'frmariavincent@gmail.com', '1067.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-vincent-a'),
(67, 1068, 'Fr. Victor V.', 'Mr. Varuvel', 'Mrs. Santhai', '17.04.1973', 'Pacode', ' St. Aloysius Seminary Nagercoil,Christ Hall Seminary Karumathur,Sacred Heart Poonamallee .', '22.04.2001', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Director, TLS, Trichy', '             T.L.S. Trust , 49 J, Bharathiar Salai , Trichy 620 001', '0431 2412833', '9443500408', 'victor_priest@yahoo.co.in', '1068.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-victor-v'),
(68, 1069, 'Fr. Bright Simsa Raj A. ', 'Mr. A. Antony Muthu', 'Mrs. A. Agnes', '31.07.1971', 'Kallukoottam', 'St. Aloysius\\\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\\\'s Seminary, Trichy', '07.04.2002', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Melpuram', '        Church of the Holy Guardian Angels, Melpuram, Pacode 629 168', '', '9443692480', ' ', '1069.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-bright-simsa-raj-a'),
(69, 1070, 'Fr. Densingh M. ', 'Mr. Muthaiah N.S.', 'Mrs. Rosammal ', '23.05.1962', 'Mathicode Sahayanager', 'St. Aloysius\\\' Minor Seminary Nagercoil,St. Joseph\\\'s Mangalore', '07.04.2002', 'St.Francis Xavier Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Soosaipuram', '              Church of St. Antony, Valvachakostam, Kunnamparai, kattathuirai- 629158', '04651 268277', '9443500655', '', '1070.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-densingh-m'),
(70, 1071, 'Fr. Dominic Savio V. ', 'Mr. Varghese M.S', 'Mrs. Jesu Retnam A.', '12.05.1975', 'Madathattuvilai', 'St. Aloysius\\\' Seminary Nagercoil,St. Joseph\\\'s Seminary Mangalore, Paul Seminary Pune', '07.04.2002', 'St. Francis Xavier Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Arockiapuram', '          Church of St. Roch, Arokiapuram Monday Market, Neyyoor PO', '', '9443483466', 'frvsavio@yahoo.com', '1071.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-dominic-savio-v'),
(71, 1072, 'Fr. Jerald Justin D.', 'Mr. R. Deva Sahayam R.', 'Mrs. R.Theresammal', '19.01.1970', 'Kallukoottam', 'Sacred Heart, Poonamalle', '07.04.2002', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Managing Director, Nanjil Milk Plant', '  Nanjil Milk Plant, (Res) Church of St. Mary, Mulagumoodu - 629167', '', '9442079448', 'frjervy02@gmail.com', '1072.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jerald-justin-d'),
(72, 1073, 'Fr. Sujan Kumar D.M.', 'Mr. J. Devanesan', 'Mrs. A. Maria Rose (Late)', '13.06.1972', 'Kanjampuram', 'St. Aloysius\\\' Seminary, Nagercoil, St. Paul\\\'s, Trichy', '07.04.2002', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study', '  St. Little Flower Mission Centre, Bharathiyar University, Coimbatore', '', '9486473063', 'frsujankumar13@gmail.com', '1073.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-sujan-kumar-d-m'),
(73, 1074, 'Fr. Wiselin Xavier. E', 'Mr. A. Elias (Late)', 'Mrs. Rajam', '28.10.1973', 'Vellicode', 'St. Aloysius Seminary, Nagercoil,St. Paul\\\'s Seminary, Trichy', '07.04.2002', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kolvel, Editor - \"Puthiya Thedal\" ', '          Church of Our Lady of Mount Carmel, Kolvel, Thiruvarampu- 629161', '', '9443607097', 'frwiselinxavier2015@gmail.com', '1074.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-wiselin-xavier-e'),
(74, 1075, 'Fr. Romeric Thadeus K.M.', 'P. Kulandai Swamy', 'K. Crispina Mary', '08.12.1970', 'Ramanathichenputhur', 'For Philosopy, Trinity College, Jalandhar, Punjab for Theolory, Papal Seminary Pune', '27.04.2003', 'St. Xavier\\\'s Cathedral, Kottar', 'Bishop Leon A. Tharmaraj', 'Parish Priest Mankuzhy', '          Parish Priest,Church of St. Francis Xavier, Mankuzhy ,Neyyoor 629 802   ', '', '8903901169', 'frthadeus@gmail.com ', '1075.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-romeric-thadeus-k-m'),
(75, 1076, 'Fr. Thatheu Leon Jose A.S.', 'Mr. Selva Mony', 'Mrs. Amalorpavam', '11.07.1973', 'Kuzhivilai, Mulagumoodu', 'St. Aloysius\\\' Seminary Nageroil,Theology : St. Paul\\\'s Trichy,Philosophy : Christ Hall  Karumathoor', '27.04.2003', ' St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kootamavu ', '          Parish Priest, Church of Our Lady of Perpetual Succor, Kootamavu, Mulagumoodu - 629167', '04651 283276', '9442076599', 'frthatheu@yahoo.com', '1076.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-thatheu-leon-jose-a-s'),
(76, 1077, 'Fr. George Eugin Raj A', 'Mr. S. Antony', 'Mrs. D. Alphonsal', '20.06.1977', 'Elanthavilai', 'St. Aloysius\\\' Seminary , Nagercoil.St. Pius College, Mumbai.', '18.04.2004', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study, Germany', '  ', '', '9442301467', 'george.eugeneraj@gmail.com', '1077.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-george-eugin-raj-a'),
(77, 1078, 'Fr. Robert John Kennedy G.', 'Mr. George', 'Mrs. Mary Ritammal', '31.08.1974', 'Kandanvilai', 'St. Aloysius\\\' Seminary , Nageroil, St. Joseph\\\'s Seminary, Mangalore', '18.04.2004', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Chemparuhi Vilai', '        Parish Priest , Church of St. Antony, Chemparuthivilai 629 166 ', '9443490023', '8903417068', 'revrojokennedy@gmail.com', '1078.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-robert-john-kennedy-g'),
(78, 1079, 'Fr. Suresh Kumar P.', 'Mr. Pankiraj A.', 'Mrs. Annammal C.', '16.02.1977', 'Mulagumoodu', 'St. Aloysius\\\' Seminary Nageroil, Papal Seminary Pune', '18.04.2004', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Corporate Manager', 'Church of O.L.of Good Health Munchirai', '', '9443164272', 'sureshmlg1977@gmail.com', '1079.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-suresh-kumar-p'),
(79, 1080, 'Fr. Xavier Sundar. A', 'Savaria Pitchai', 'Philominal', '05.06.1972', 'Aral Arockia Nagar', 'St.Paulin', '18.04.2004', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Yettacode', '          Parish Priest,Church of St. Francis Xavier,Yettacode,Veeyanoor 629 177', '', '9443681899', 'sundarxavier@gmail.com', '1080.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-xavier-sundar-a'),
(80, 1081, 'Fr. Chandra Sekar C.P. ', 'Mr. Paul Raj C.', 'Mrs. Thanga Bai', '31.07.1977', 'Chentharai', 'St. Aloysius\\\' Seminary, Nagercoil  Arulanandar College, Karumathur  Christ Hall, Karumathur  St. Pa', '03.04.2005', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'USA', '      USA', '04651 222368', '9443559724', 'chandracpsekar@yahoo.co.in', '1081.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-chandra-sekar-c-p'),
(81, 1082, 'Fr. Godwin Soundar Raj M.', 'Mr. Maria Antony', 'Mrs. Cecily', '21.01.1977', 'Mankuzhy', 'St. Aloysius\\\' Seminary , Nageroil,Papal Seminary , Pune ,', '03.04.2005', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Nallayan Puram', '          Parish Priest,Church of Good Shepherd Nallayan puram, Palugal - 629170', '04651 236150', '9487064600', 'godsrajm@yahoo.in', '1082.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-godwin-soundar-raj-m'),
(82, 1083, 'Fr. Jegan Bose U.', 'Mr. Uttaria Muthu M.', 'Mrs. Mary Vincent S.', '21.04.1977', 'Nullivilai', 'St. Aloysius\\\' Seminary , Nageroil,Papal Seminry, Pune, St.Pauls, Trichy', '03.04.2005', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Study, Rome', '        Rome&nbsp;', '', '9486533218', 'frjbose@gmail.com', '1083.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jegan-bose-u'),
(83, 1084, 'Fr. John Francis M.', 'Mr. Mathias V.', 'Mrs. Maria Pushpam Y', '12.09.1977', 'Vencode', 'St. Aloysius\\\' Seminary , Nageroil,Christ Hall, Karumathur,St. Paul\\\'s Seminary, Trichy', '03.04.2005', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Rest', 'Priests Home, Nirmala Hospital, Krungal', '', '9842928612', 'frjohnfranchis@gmail.com', '1084.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-john-francis-m'),
(84, 1085, 'Fr. Eckermens Michael M. ', 'Mr. Michael', 'Mrs. Mary Margaret Michael ', '28.01.1976', 'Madathattuvilai', 'St. Aloysius\\\' Seminary Nageroil,St. Pius College Mumbai ', '23.04.2006', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study, Thanjavur', '                Church of Our Lady of Good Health, Thirukanurpatti, Thanjavur', '04651 263098', '9360331148', 'fr.eckermens@gmail.com', '1085.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-eckermens-michael-m'),
(85, 1086, 'Fr. Maria Thomas Austin M.', 'Mr. Michael Pillai', 'Mrs. Pushpa Virgin', '21.04.1979', 'Mdavilagam - Marthandamthurai', 'St. Aloysius\\\' Seminary , Nageroil, Christ Hall, Karumathur,Sacred Heart Seminary, Poonamallee ', '23.04.2006', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Leave', '  ', '04651 268658', '9597779546', 'maustindiaz@gmail.com', '1086.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-maria-thomas-austin-m'),
(86, 1087, 'Fr. Primas Singh M.', 'Mr. Maria Rethna George', 'Mrs. Selvi Mary', '24.03.1979', 'Mukkalampadu', 'St. Aloysius\\\' Seminary  Nageroil, Papal Seminary Pune', '23.04.2006', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Correspondent, Morning Star Polytechnic College, Chunkankadai', '        Correspondent, Morning Star Polytechnic College, Chunkankadai 629003', '', '9486178919', 'frprimas@gmail.com', '1087.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-primas-singh-m'),
(87, 1088, 'Fr. Pushpa Raj A.', 'Mr. Asirvatham D.', 'Mrs. Rajammal A.', '01.10.1974', 'Thumbaly', 'St. Aloysius\\\' Seminary , Nageroil Krishu Jyothi College, Bangalore', '23.04.2006', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Palavilai', '        Parish Priest, Church of St. Antony, Palavilai, Kuzhithurai - 629163', '', '9486325298', 'frpushpa197@gmail.com', '1088.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-pushpa-raj-a'),
(88, 1089, 'Fr. Arockia Shelly Rose A.M. ', 'Mr. Ambrose P.', 'Mrs. Mary Elizabeth', '17.04.1978', 'Iruthayapuram', 'St. Aloysius\\\' Seminary , Nagercoil, St. Paul\\\'s Seminary, Trichy', '15.04.2007', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Tiruthuvapuram', '        Cathedral of the Most Holy Trinity,Thirithuvapuram,Kuzhithurai 629 163', '', '9487251004', 'frshelleyrose@hotmail.com', '1089.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-arockia-shelly-rose-a-m'),
(89, 1090, 'Fr. Benny L. ', 'Mr. Lucas', 'Mrs. Jalarthacy', '02.10.1975', 'Puthenkadai', 'St. Aloysius\\\' Seminary , Nagercoil,Christ Hall Seminary, Karumathur,Sacred Heart Seminary, Poonamal', '15.04.2007', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Manjakonan, Vicar Forane (Puthenkadai)', '        Church of St. Therese of Child Jesus, Manjakonam, Thirparapu - 629161', '', '9578120866', 'fr.bennyl@yahoo.com', '1090.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-benny-l'),
(90, 1091, 'Fr. Godwin Selva Justus S.', 'M. Selva Raj', 'Marianthony', '04.11.1979', 'Alenchy', 'St. Aloysius\\\' Seminary , Nagercoil. Christ Hall, Karumathoor. Papal Seminary Pune', '15.04.2007', 'St. Xavier\\\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Alanvilai', '      Financial Adminstrator SXCCN, Chunkankadai, Parish Priest, Church of O.L. of Lourdes, Alanvilai, Karenkadu - 629809', '', '9486910526', 'godwin411@gmail.com', '1091.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-godwin-selva-justus-s'),
(91, 1092, 'Fr. Arockia Jose G. ', 'Mr. Gnanasigamoni', 'Mrs. Roselet Mary', '09.06.1978', 'Konnakuzhivilai', 'St. Aloysius\\\' Seminary, Nagercoil, St. Pius College, Mumbai', '19.04.2009', 'St. Francis Xavier\\\'s Cathedral, Kottar', '', 'Studies, Italy', '        Italy', '', '', 'arockia1978jose@gmail.com', '1092.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-arockia-jose-g'),
(92, 1093, 'Fr. Geo Giltus G.', 'Mr. George Maria Arputham', 'Mrs. Barbara', '18.02.1974', 'Pandaravilai Kandanvilai', 'MSS.CC Bangalore, Dharmaram College Bangalore, St. Paul\\\'s Seminary Trichy', '19.04.2009', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest,Vellayambalam', '          Church of St.  Antony, Vellayambalam, Puthukadai 629 171', '', '9486671566', 'frgeogkuz@gmail.com', '1093.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-geo-giltus-g'),
(93, 1094, 'Fr. Gilbert Lingson V.', 'Mr. Varuvel', 'Mrs. Mary Rethinam', '07.07.1976', 'Appattuvilai', 'St. Aloysius\\\' Seminary, Nagercoil.Christ Hall Seminary, Karumathur.St. Paul\\\'s Seminary, Trichy', '19.04.2009', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Mullanganavilai', '  Church of St. Antony, Mullanganavilai, (Via) Karungal 629 157', '', '7373354728', 'fr.lingson@gmail.com', '1094.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-gilbert-lingson-v'),
(94, 1095, 'Fr. Andrews V.', 'Mr. Varghese', 'Mrs. Maria Thangam A.', '15.09.1981', 'Appattuvilai', 'St. Aloysius\\\' Seminary, Nagercoil, Christ Hall Seminary, Karumathur, St. Paul\\\'s Seminary, Trichy', '18.04.2010', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Kallu Kootam, Treasurer (Nanjil Milk Plant)', '          Church of O.L. of Fathima, Kallukkoottam 629 802', '', '9443159308', 'joyandrewson27@yahoo.com', '1095.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-andrews-v'),
(95, 1096, 'Fr. Jokens A.', 'Mr. Antony R.', 'Mrs. Ronickam A.', '11.09.1979', 'Chemparuthivilai', 'St. Aloysius\\\' Seminary, Nagercoil,St. Joseph\\\'s Seminary, Mangalore', '18.04.2010', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Mula Vilai', '      Parochial Administrator, Church of  Christ the King,Mula Vilai,Veeyanoor 629 177', '', '9442858706', 'jokinsantorony@gmail.com', '1096.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-jokens-a'),
(96, 1097, 'Fr. Titus Mohan M.', 'Mr. Maria Alphonse S.', 'Mrs. Yesumarial D. ', '17.06.1983', 'Chemparuthivilai ', 'St. Aloysius\\\' Seminary Nagercoil, Christ Hall Seminary Karumathur,Papal Seminary Pune  ', '11.12.2011', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Sahaya Nagar', '        Parochial Administrator,  Church of O.L. of Perpetual Succour,Sahaya Nagar,Palapallam 629 159', '', '9443447814', 'titusmohan@gmail.com ', '1097.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-titus-mohan-m'),
(97, 1098, 'Fr. Shine S.', 'Mr. Simon S.P.', 'Mrs. Maria Pushpam', '02.10.1984', 'Kalaiakkavilai', 'St. Aloysius\\\' Seminary Nagercoil, Arulanandar College  Madurai, St. Paul\\\'s Seminary Trichy', '15.12.2012', 'St. Francis Xavier\\\'s Cathedral, Kottar', ' Most Rev. Peter Remigius', 'Parish Priest, Fatimapuram, Director (Youth Comission)', '  Church of Our lady of Fatima, Fathimapuram, Kollencode - 629169', '', '9952862474', ' fr.shinekottar@gmail.com', '1098.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-shine-s'),
(98, 1099, 'Fr. Suresh Raj R.', 'Mr. Rajayan A.', 'Mrs. Rethina Bai', '09.08.1981', 'Vellicode', 'St. Aloysius\\\' Seminary Nagercoil,Sacred Heart Seminary Poonamallee', '09.12.2013', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Kottoorkonam', '          Parish Priest, Church of Infant Jesus, Kottoorkonam  ,Kulasekharam 629 161', '04651 280868', ' 9444132216', 'sureshraj882@gmail.com', '1099.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-suresh-raj-r'),
(99, 1100, 'Fr. Florence A.', 'Mr. Antony Kruz J. (Late)', 'Mrs. Alphonse Ammal K. ', '24.11.1980', 'Aaloor', 'St. Aloysius\\\' Seminary Nagercoil,St. Joseph\\\'s Seminary Mangalore ', '06.09.2014', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Study ', '  ', '', '9786472448', 'florencevijay2411@gmail.com', '1100.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-florence-a'),
(100, 1101, 'Fr. John Benhar N.', 'Mr. Nasamony V', 'Mrs. Marial V', '14.03.1984', 'Vencode', 'St. Aloysius\\\' Seminary, Nagercoil,Sacred Heart Seminary, Poonamallee ', '06.09.2014', 'St. Francis Xavier\\\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Leave', '    ', '', '9884831859', 'benhar14@gmail.com', '1101.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-john-benhar-n'),
(101, 1102, 'Fr. Benitto V. ', 'Mr. L. Varghese', 'Mrs. S. Joice Chellammal', '24.01.1985', 'Alanvilai', 'St. Aloysius\\\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Peter\\\'s Seminary, Viraganoor', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Murasancode', '  Parish Priest, Chruch of Our Lady of Mount Carmel, Murasancode.&nbsp;', '', '9488504009', 'benialv@gmail.com', '1102.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-benitto-v'),
(102, 1104, 'Fr. Martin M.', 'Mr. Michael J.', 'Mrs. K. Rosammal', '13.01.1986', 'Vavarai', 'St. Aloysius\\\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathoor,St. Pauls Seminary, Trich', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Choozhal ', '        Parish Priest, Church of St. Michael Archangel, Choozhal, Fatimanagar - 629160', '', '9597989948', 'mmmartinrose@gmail.com', '1104.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-martin-m'),
(103, 1105, 'Fr. Pencer Xavier R.', 'Mr. Rajamony', 'Mrs. Thangammal', '07.06.1985', 'Yettacode', 'St. Aloysius\\\' Minor Seminary Nagercoil,Morning Star College Kolkata,St. Peter\\\'s Pontifical Seminar', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Mathiravilai', '  Parish Priest, Church of Our Lady of Assumption, Mathiravilai, Thikanamcode - 629804', '', '8903935323', 'pencerxavier@gmail.com', '1105.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-pencer-xavier-r'),
(104, 1106, 'Fr. Sujin D.', 'Mr. S. Dennis', 'Mrs. Mary Lizzie', '27.02.1986', 'Amsi', 'St. Aloysius\\\' Minor Seminary  Nagercoil,Christ Hall Seminary Karumathur Madurai, St. Paul Seminary ', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Lourdugiri', '  Parish Priest, Church of Our Lady of Lourdes, Lourdugiri - Anducode - 629168&nbsp;', '', '9677936244', 'sujindennis@gmail.com', '1106.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-sujin-d');
INSERT INTO `priest` (`id`, `priestid`, `pname`, `pfname`, `pmnane`, `pdob`, `pplace`, `pseminary`, `porddate`, `pordplace`, `pordby`, `pminstring`, `paddress`, `pphone`, `pmobile`, `pemail`, `pimg`, `pdiocese`, `contract`, `home_priest`, `slug`) VALUES
(105, 1107, 'Fr. Xavier Raj', 'G. Rajamony', 'Maria Puspam', '06.05.1984', 'Yettacode', 'Sacred Heart Seminary, Poonamallee', '10.05.2015 ', 'Holy Trinity Cathedral Thirithuvapuram', 'xavier.mum@gmail.com', 'Parish Priest, Eanchacode', '  Parish Priest, Church of Our Lady of Perpetual Succor, Eanchacode, Ponmanai - 629161', '', '9626660889', 'xavier.mum@gmail.com ', '1107.jpg', 'Diocese of Kuzhithurai', NULL, 1, 'fr-xavier-raj'),
(106, 1108, 'Fr. Francis Xavier M', 'Madavadiyan', 'Ronikam', '10.06.1979', 'Kappiyarai', 'St.Peter Pontifical Seminary, Bangalore', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Konnakuzhivilai', '  <font size=\"3\">Parish Priest, Church of Our Lady of Sorrows, Konnakuzhivilai, Villukury - 629180</font><style type=\"text/css\">\r\n		body,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:\"Calibri\";', '', '7598112014', 'xfrancis35@gmail.com', '1108.jpg', NULL, NULL, 1, 'fr-francis-xavier-m'),
(107, 1109, 'Fr. Maria Anto Halvin', 'Joseph Alexander', 'Maria Sebastiaye', '17.11.1981', 'Madathattuvilai', 'St. Pius X Mumbai', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Padarnilam', '  Parish Priest, Church of St. Pius X, Padarnilam, Manavalakurichy - 629252', '', '9629209055', 'halvin.j@gmail.com', '1109.jpg', NULL, NULL, 1, 'fr-maria-anto-halvin'),
(108, 1113, 'Fr. Michael Alocious M.A', 'S. Michael Antony', 'G. Mary Joice', '29.04.1987', 'Kuzhivilai', 'Sacred Heart Seminary, Poonamalle', '01.05.2016', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Appattuvilai', '                                              <p>St.Joseph\'s Church&nbsp;</p><p>Appattuvilai</p>', '04651272077', '8903148050', 'alomic29@gmail.com', '1113.jpg', 'Kuzhithurai Diocese', NULL, 1, 'fr-michael-alocious-m-a'),
(109, 1110, 'Fr. Sargin Rubas B', 'V. Barnapas', 'R. Agnes', '30.05.1986', 'Chemparuthivilai', 'St. Aloysius Seminary, Nagercoil, St.Joseph\\\'s Seminary Mangalore', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Paramanvilai', '        Parish Priest, Paralogamatha Church, Paramanvilai, Padanthalumoodu - 629163', '', '9597909745', 'srubas@gmail.com', '1110.jpg', NULL, NULL, 1, 'fr-sargin-rubas-b'),
(110, 1112, 'Fr. Domi Lilil Raja A', 'Antony M', 'George Mary V', '07.10.1986', 'Konnakuzhivilai', 'St.Aloysis Seminary, Sacred Heart Seminary Poonamallee', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Parakunnu ', '  Parish Priest, Church of Sacred Heart of Jesus, Parakunnu, Vanniyur, (Via) Kuzhithurai - 629163', '', '7402586774', 'domilililraja@gmail.com', '1112.jpg', NULL, NULL, 1, 'fr-domi-lilil-raja-a'),
(111, 1103, 'Fr. Charles Viju A.', 'M. Arockiam', 'S. Annammal', '30.08.1984', 'Konamkadu', 'St. Aloysius\\\' Minor Seminary, Nagercoil, St.Josephs Interdiocesan Seminary, Mangalore', '10.05.2015', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Vizhunthayampalam', '              Church of St. Antony,&nbsp;Vizhunthayampalam, Thenkapattanam - 629173', '', '9487015472', 'charlesviju@gmail.com', '1103.jpg', NULL, NULL, 1, 'fr-charles-viju-a'),
(112, 1111, 'Fr. Cyril Mesmin', 'Vincent', 'Pushpamary', '10.06.1986', 'Kolvel', 'St.Pauls Major Seminary Trichy', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Varthanvilai', '  Parish Priest, Church of St. Antony, Varthanvilai, Bethelpuram - 629803', '', '9787595552', 'cyrilmesmin@yahoo.com', '1111.jpg', NULL, NULL, 1, 'fr-cyril-mesmin'),
(113, 1117, 'Fr. Edwin Raj C.', 'K. Chinnathurai', 'J.Omanal', '27-09-1987', 'Melpuram', 'Papal Seminary, Pune.', '07-05-2017', 'Cathedral of the Most Holy Trinity', 'Most. Rev. Jeromedhas V.', 'Secretary to the Bishop', '            Bishop\'s house&nbsp;<div>Post.Box. No:1<br><div>Unnamalaikadai</div><div>K.K.Dist- 629179</div></div><div>Tamil Nadu, South India</div>', '04651-272077', '8149863115', 'edwinchinna@yahoo.co.in', '1117.jpg', NULL, NULL, 1, 'fr-edwin-raj-c'),
(114, 1114, 'Fr. Jees Raymond', 'Mr. S. Raymond (Late)', 'Mrs. A. Rethinammal (Late)', '09.07.1977', 'Thoothoor', 'Jyothir Bhavan, Kalamassery.', '07.05.2017', 'The Cathedral of Most Holy Trinity, Thirithuvapuram.', 'Most. Rev. Jeromedhas SDB', 'Co- Pastor, Mathiravilai', '    Church of Our Lady of Assumption, Mathiravilai.&nbsp;', '', '9444643805', 'jeesdenn@gmail.com', '1114.jpg', NULL, NULL, 1, 'fr-jees-raymond'),
(115, 1115, 'Fr. Vinso Antony V. ', 'Mr. A. Vensaslaus', 'Mrs. S. maria Sathai', '01.07.1984', 'Kallukootam', 'Christ Hall Seminary, Papal Seminary', '07.05.2017', 'The Cathedral of the Most Holy Trinity, Thirithuvapuram.', 'Most. Rev. Jeromedhas SDB', 'Parish Priest, Alancholai', '            ', '', '8939707671', 'vinso84@gmail.com', '1115.jpg', NULL, NULL, 1, 'fr-vinso-antony-v'),
(116, 1116, 'Fr. Albin Jose E.', 'Mr. Eliyas', 'Mrs. sarasamma', '26.03.1985', 'Varuvilai, Kanjampuram', 'St. Paul\\\'s Seminary', '07.05.2017', 'The Cathedral of Most Holy Trinity, Thirithuvapuram.', 'Bishop Jeromedhas SDB', 'Co- Pastor,Thundathuvilai', '          ', '', '9486893800', 'ealbinjose@gmail.com', '1116.jpg', NULL, NULL, 1, 'fr-albin-jose-e'),
(117, 1118, 'Fr. Alwin Vijay M', 'Mr. C. Mohan', 'Mrs. S. Glory', '01-01-1988', 'Nattalam', 'St.Paul\\\'s, Trichy', '07-05-2017', 'The Cathedral of the Most Holy Trinity, Thirithuvapuram', 'Most.Rev. Jeromedhas V. SDB', 'Co - Pastor Madathattuvilai', '          ', '', '9488807775', 'malwinvijay1988@gmail.com', '1118.jpg', NULL, NULL, 1, 'fr-alwin-vijay-m'),
(118, 1119, 'Fr Arul', 'Mr. Rajaiyan', 'Mrs. Radha', '24/09/1988', 'Maruthancode', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, St.Paul\\\'s Semnary, Trichy', '15.04.2018', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Co-pastor at Munchirai', 'Sasthanpottai,&nbsp;<div>Maruthancode Post</div><div>629163</div>', '', '8270863652', 'aruljoe1989@gmail.com', '1119.jpg', NULL, NULL, 1, 'fr-arul'),
(119, 1120, 'Fr. Jeya Sunder Singh', 'Mr. Chellakkan', 'Mrs. Maria Rackini', '01.10.1989', 'Muzhavilai', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Papal Seminary Pune.', '15.04.2018', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most. Rev. Jeromedhas SDB', 'Secretary to the Bishop', 'Melaputhichari vilai,<div>Muzhavilai,&nbsp;</div><div>Veeyanoor post - 629177</div>', '', '9786936426', 'dearsundersingh@gmail.com', '1120.jpg', NULL, NULL, 1, 'fr-jeya-sunder-singh'),
(120, 1121, 'Fr. Arul Raj', '', '', '', '', '', '', '', '', '', '  ', '', '', '', '1121.jpg', NULL, NULL, 1, 'fr-arul-raj'),
(128, 2001, 'Fr. Amaladhas Densingh R.A.', '', '', '06.12.1973', 'Kurusady', '', '07.04.2002', '', '', 'Parish Priest, Nullivilai', '        Parish Priest, Church of O.L. of Mount Carmel, Nullivilai, Karenkadu - 629 809', '04651 231412', '9488271741', 'singh27star@yahoo.co.uk', '2001.jpg', 'Diocese of Kottar', 'no', 0, 'fr-amaladhas-densingh-r-a'),
(129, 2002, 'Fr. Amutha Valan M.', '', '', '06.03.1982', 'Kovalam', '', '18.04.2010', '', '', 'Parish Priest, Kallaraivilai', '  Parish Priest, Church Of O.L.of Fatima, Kallaraivilai, Chenkodi 629177', '04651 221576', '8903701818', 'amuthavalan82@gmail.com', '2002.jpg', 'Diocese of Kottar', 'no', 0, 'fr-amutha-valan-m'),
(130, 2003, 'Fr. Antony Gomez P.', '', '', '02.06.1974', 'Manakudy', '', '18.04.2004', '', '', 'Parish Priest, Konamcadu', '  Parish Priest,Church of St. Francis Xavier, Konamcadu, West Neyyoor - 629803', '04651 226209', '9488278088', 'frgomezktr@gmail.com', '2003.jpg', 'Diocese of Kottar', 'no', 0, 'fr-antony-gomez-p'),
(131, 2004, 'Fr. Antony Jayakodi', '', '', '02.09.1978', 'Kurusady', '', '11.12.2011', '', '', 'Parish Priest, Elavuvilai', 'Church of St. Aloysius Elavuvilai 629171', '', '8760817448', 'antonyjayakodi@gmail.com', '2004.jpg', 'Diocese of Kottar', 'no', 0, 'fr-antony-jayakodi'),
(132, 2005, 'Fr. Arulappan', '', '', '25.04.1946', 'Sarel', '', '21.12.1971', '', '', 'Parish Priest, Kanjiracode', '  Parish Priest, Church of O.L. of Rosary, Kanjiracode, Kanjiracode Post - 629155', '04651 272719', '9442365337', 'frarulappa@yahoo.com', '2005.jpg', 'Diocese of Kottar', 'no', 0, 'fr-arulappan'),
(133, 2007, 'Fr. Benziger P.', '', '', '29.12.1963', 'Thittuvilai - Mathal', '', '30.04.2000', '', '', 'Parish Priest, Nullivilai ', 'Church of O.L.of Mount Carmel, Nullivilai, Karencadu 629809', '04651 230345', '9486269906', '', '2007.jpg', 'Diocese of Kottar', 'no', 0, 'fr-benziger-p'),
(134, 2008, 'Fr. Berchmans Michael Kenet F.', '', '', '11.10.1964', 'Punnai Nagar', '', '18.04.1993', '', '', 'Parish Priest, Vencode', '  Parish Priest, St. Xavier\'s Church, Vencode, Puthukadi -629171', '04651 270976', '9443482972', 'bmkenet@yahoo.com', '2008.jpg', 'Diocese of Kottar', 'no', 0, 'fr-berchmans-michael-kenet-f'),
(135, 2017, 'Fr. Selvaraj J.', '', '', '07.06.1974', 'Arockiapuram-Cape', '', '27.04.2003', '', '', 'Parish Priest, Attoor', 'Parish Priest, Church of St. Andrew, Attoor - 629191', '', '9489554444', 'selvaa.raj@rediffmail.com', '2017.jpg', 'Diocese of Kottar', 'no', 0, 'fr-selvaraj-j'),
(136, 2018, 'Fr. Soosai Antony P.', '', '', '05.02.1978', 'Kovalam', '', '19.04.2009', '', '', 'Parish Priest, Ambalakadai', '  Parish Priest, Sts. Peter and Paul Church Ambalakadai, Chitharal 629151', '', '9443130423', 'samsantosoo@gmail.com', '2018.jpg', 'Diocese of Kottar', 'no', 0, 'fr-soosai-antony-p'),
(137, 2019, 'Fr. Lawrence S.P.', '', '', '19.08.1972', '', '', '07.04.2002', '', '', 'Parish Priest, Kuzhithurai', '  Parish Priest,Church of St. Michael the Archangel , Kuzhithurai - 629163', '04651 355455', '9442008557', '', '2019.jpg', 'Archdiocese of Trivandrum', 'no', 0, 'fr-lawrence-s-p'),
(138, 2021, 'Fr. Amul Raj', '', '', '24.11.1983', '', '', '15.05.2011', '', '', 'Co-Pastor, Packiapuram', 'Co-Pastor, church of St. Eusthachius, Packiapuram, Arumanai - 629151', '', '8098756704', '', '2021.jpg', 'Heralds of Good News', 'yes', 0, 'fr-amul-raj'),
(139, 2022, 'Fr. Antony Xavier', '', '', '11.02.1960', 'Mulankanavilai ', '', '15.05.1990', 'Church of St. Antony, Mulankanavilai', 'Bishop Leon A. Dharmaraj', 'Priest-In-Charge, Maruthancode', '    Priest-In-Charge, Church of St. Antony, Maruthancode, Kuzhithurai - 629163', '', '9445949050, 8220197177', 'frtonyzavier@gmail.com', '2022.jpg', 'Diocese of Daltonganj', 'yes', 0, 'fr-antony-xavier'),
(140, 2024, 'Fr. Christuraj', '', '', '25.12.1968', '', '', '10.05.1996', '', '', 'Priest-In-Charge, Kuttaicadu', '  Priest-In-Charge, Church of St. Jude Thadeus, Kuttaicadu, Kattathurai 629158', '04651 227755', '9698560707, 9487523381', 'frchristuraj@gmail.com', '2024.jpg', 'Diocese of Amravati', 'yes', 0, 'fr-christuraj'),
(141, 2025, 'Fr. Jaya Kumar', '', '', '31.03.1983', '', '', '06.05.2014', '', '', 'Co-Pastor, Mulagumoodu', '  Co-Pastor, Church of O.L. of Nativity, Mulagumoodu - 629167', '', '7639416933', '', '2025.jpg', 'Heralds of Good News', 'yes', 0, 'fr-jaya-kumar'),
(142, 2027, 'Fr. Amaladhas F.A.', '', '', '01.09.1962', '', '', '21.05.1993', '', '', 'Priest-In-Charge, Kanjampuram', '  Priest-In-Charge, Church of St. Therese of Child Jesus, Kanjampuram - 629154', '', '9597265595', '', '2027.jpg', 'CMF', 'yes', 0, 'fr-amaladhas-f-a'),
(143, 2028, 'Fr. Sahaya Wilfred J.', '', '', '26.05.1970', '', '', '20.11.2004', '', '', 'Priest-In-Charge, Mathoor', '  Priest-In-Charge, Church of St.Joseph, Mathoor, Aruvikarai 629177', '04651 240420', '9865478900', '', '2028.jpg', 'Society of Jesus', 'yes', 0, 'fr-sahaya-wilfred-j'),
(144, 2030, 'Fr. Baskar', '', '', '15.01.1981', '', '', '09.12.2007', '', '', 'Priest-In-Charge, Poottetty ', '  Priest-in-charge, Church of St. Antony, Poottetty, (Via) Karungal - 629157', '04651 254444', '9444128235', '', '2030.jpg', 'Holy Family', 'yes', 0, 'fr-baskar'),
(145, 2031, 'Fr. Justin James', '', '', '31.05.1971', '', '', '09.08.2008', '', '', 'Priest-In-Charge, Mukkalampadu', '  Priest-In-Charge, Church of O.L. of Sorrows, Mukkalampadu, Kurunthencode - 629805', '', '9486577971', '', '2031.jpg', 'Arch-diocese of Delhi', 'yes', 0, 'fr-justin-james'),
(146, 2020, 'Fr. Marconi Ravi Chandran', '', '', '', '', '', '', '', '', 'Parish Priest at Valvachakostam', '  ', '', NULL, '', '2020.jpg', NULL, 'no', 0, 'fr-marconi-ravi-chandran'),
(147, 2021, 'Fr. Jacksas Elango', '', '', '', '', '', '', '', '', 'Parochial Administrator at Chetticharvilai', '  ', '', NULL, '', '2021.jpg', NULL, 'no', 0, 'fr-jacksas-elango'),
(148, 2022, 'Fr. George Clement', '', '', '', '', '', '', '', '', 'Parish Priest at Manchadi', '  ', '', NULL, '', '2022.jpg', NULL, 'no', 0, 'fr-george-clement');

-- --------------------------------------------------------

--
-- Table structure for table `religiouspriest`
--

CREATE TABLE `religiouspriest` (
  `id` int(11) NOT NULL,
  `priestid` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `pfname` varchar(100) DEFAULT NULL,
  `pmnane` varchar(100) DEFAULT NULL,
  `pdob` varchar(20) DEFAULT NULL,
  `pplace` varchar(75) DEFAULT NULL,
  `pseminary` varchar(100) DEFAULT NULL,
  `porddate` varchar(30) DEFAULT NULL,
  `pordplace` varchar(100) DEFAULT NULL,
  `pordby` varchar(100) DEFAULT NULL,
  `pminstring` varchar(100) DEFAULT NULL,
  `paddress` varchar(200) DEFAULT NULL,
  `pphone` varchar(30) DEFAULT NULL,
  `pmobile` varchar(30) DEFAULT NULL,
  `pemail` varchar(50) DEFAULT NULL,
  `pimg` varchar(50) DEFAULT NULL,
  `pdiocese` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `religiouspriest`
--

INSERT INTO `religiouspriest` (`id`, `priestid`, `pname`, `pfname`, `pmnane`, `pdob`, `pplace`, `pseminary`, `porddate`, `pordplace`, `pordby`, `pminstring`, `paddress`, `pphone`, `pmobile`, `pemail`, `pimg`, `pdiocese`, `status`) VALUES
(113, 3001, 'Fr. Cyril Stanislaus [C.Ss.R]', '', '', '14.03.1962', '', '', '15.05.1990', '', '', 'Parish Priest, Pilavilai', '    Parish Priest, Church of St. George, Pilavilai - 629 251', '', '9940098960, 9487613492', '', '3001.jpg', 'Congregation of the Most Holy Redeemer', 'priest'),
(114, 3002, 'Fr. Louis Raj [C.Ss.R]', '', '', '02.02.1985', '', '', '03.05.2014', '', '', 'Parish Priest, Pilavilai', 'Parish Priest, Church of St. George, Pilavilai - 629 252', '', '9585655191', '', '3002.jpg', 'Congregation of the Most Holy Redeemer', 'priest'),
(116, 3004, 'Fr. Andrew Santha Kumar [OCD]', '', '', '20.05.1977', '', '', '16.04.2005', '', '', '', 'St. Jude\'s Shrine, Swaiarmadam - 629159', '04651 276170', '9842454183', '', '3004.jpg', 'Order of the Discalced Carmelites', 'priest'),
(117, 3005, 'Fr. Anastase [OCD]', '', '', '25.06.1932', '', '', '30.06.1962', '', '', '', 'St. Jude\'s Shrine, Swaiarmadam - 629160', '04651 276170', '', '', '3005.jpg', 'Order of the Discalced Carmelites', 'priest'),
(118, 3006, 'Fr. Vincent [OCD]', '', '', '31.12.1972', '', '', '21.04.2006', '', '', '', 'St. Jude\'s Shrine, Swaiarmadam - 629161', '04651 276170', '', '', '3006.jpg', 'Order of the Discalced Carmelites', 'priest'),
(119, 3007, 'Fr. Stephen Babu [OCD]', '', '', '06.11.1978', '', '', '06.05.2009', '', '', '', 'St. Jude\'s Shrine, Swaiarmadam - 629162', '04651 276170', '', '', '3007.jpg', 'Order of the Discalced Carmelites', 'priest'),
(120, 3008, 'Fr. Stanislaus [OCD]', '', '', '21.03.1965', '', '', '13.05.1996', '', '', 'Parish Priest, Thuckalay', 'Parish Priest, St. Elias Mount, Thuckalay - 629 175', '04651 250237', '9486060589', '', '3008.jpg', 'Order of the Discalced Carmelites', 'priest'),
(121, 3009, 'Fr. Arul Raj [OCD]', '', '', '29.08.1951', '', '', '30.10.1980', '', '', '', 'Parish Priest, St. Elias Mount, Thuckalay - 629 176', '04652 250237', '9443846582', '', '3009.jpg', 'Order of the Discalced Carmelites', 'priest'),
(122, 3010, 'Fr. Dias Regin S. [OCD]', '', '', '10.04.1977', '', '', '21.04.2006', '', '', '', 'Parish Priest, St. Elias Mount, Thuckalay - 629 177', '04653 250237', '9865431528', '', '3010.jpg', 'Order of the Discalced Carmelites', 'priest'),
(123, 3011, 'Fr. James [OCD]', '', '', '04.04.1976', '', '', '02.04.2008', '', '', '', 'Parish Priest, St. Elias Mount, Thuckalay - 629 178', '04654 250237', '8903600505', '', '3011.jpg', 'Order of the Discalced Carmelites', 'priest'),
(124, 3012, 'Fr. Gnanaprakasam [OCD]', '', '', '09.05.1983', '', '', '15.05.2012', '', '', '', 'Parish Priest, St. Elias Mount, Thuckalay - 629 179', '04655 250237', '9025376698', 'pragasa.gnanam@gmail.com', '3012.jpg', 'Order of the Discalced Carmelites', 'priest'),
(125, 3013, 'Fr. Sahayadhas [OCD]', '', '', '27.03.1963', '', '', '23.04.1993', '', '', 'Superior & Parish Priest, Manalikarai', 'Superior & Parish Priest, St. Josephs Mission, Manalikarai - 629 244', '04651 289244', '9487980804', 'sahayatraj@yahoo.co.in', '3013.jpg', 'Order of the Discalced Carmelites', 'priest'),
(126, 3014, 'Fr. Christu Doss S. [OCD]', '', '', '12.08.1964', '', '', '28.04.1992', '', '', 'Correspondent', 'St. Josephs Mission, Manalikarai - 629 245', '04652 289244', '9445268314', '', '3014.jpg', 'Order of the Discalced Carmelites', 'priest'),
(127, 3015, 'Fr. Paul Andrews [OCD]', '', '', '11.08.1974', '', '', '21.04.2006', '', '', 'Correspondent', 'St. Josephs Mission, Manalikarai - 629 246', '04653 289244', '9585050019', '', '3015.jpg', 'Order of the Discalced Carmelites', 'priest'),
(128, 3016, 'Fr. Peter [OCD]', '', '', '19.11.1961', '', '', '14.05.1993', '', '', 'Manager of Carmel Estate', 'St. Josephs Mission, Manalikarai - 629 247', '04654 289244', '9444793394', '', '3016.jpg', 'Order of the Discalced Carmelites', 'priest'),
(129, 3017, 'Fr. Benjamin Kennedy [OCD]', '', '', '05.01.1979', '', '', '21.05.2010', '', '', 'House Procurator', 'St. Josephs Mission, Manalikarai - 629 248', '04655 289244', '9500781210', '', '3017.jpg', 'Order of the Discalced Carmelites', 'priest'),
(130, 3018, 'Fr. Jeyaseelan [OCD]', '', '', '09.04.1978', '', '', '11.05.2011', '', '', 'Correspondent', 'St. Josephs Mission, Manalikarai - 629 249', '04656 289244', '8760408986', '', '3018.jpg', 'Order of the Discalced Carmelites', 'priest'),
(131, 3019, 'Fr. Susayan Sathyanesan [SAC]', '', '', '22.10.1947', '', '', '24.10.1976', '', '', 'Parish Priest', 'Church of St. Augustine, Kulasekharam - 629161', '04651 277254', '9487536867', 'kulasaipollottines@gmail.com', '3019.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(133, 3021, 'Fr. Francis Sahaya Rajan [SAC]', '', '', '29.07.1969', '', '', '02.05.1998', '', '', '', 'Church of St. Augustine, Kulasekharam - 629163', '04653 277254', '8940074956', 'kulasaipollottines@gmail.com', '3021.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(134, 3022, 'Fr. Gnana Sikamani [SAC]', '', '', '24.04.1980', '', '', '27.04.2010', '', '', 'Parish Priest', 'Church of St. Joseph, Pechiparai - 629161', '04651 281013', '9488830995', '', '3022.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(135, 3023, 'Fr. Siluvai Edwin [SAC]', '', '', '21.02.1974', '', '', '29.04.2003', '', '', 'Estate Manager', 'Prakash Estate, Padappachai, Kaliyal - 629101', '04651 286168', '9489248109', '', '3023.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(136, 3024, 'Fr. Christu Amal Ral [SAC]', '', '', '07.11.1986', '', '', '29.04.2015', '', '', 'Bursar', 'Prakash Estate, Padappachai, Kaliyal - 629102', '04652 286168', '8110099864', '', '3024.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(137, 3025, 'Fr. Soosai Raj MSFS [SAC]', '', '', '21.05.1976', '', '', '14.04.2004', '', '', 'Parish Priest', 'Church of the Sacred Heart of Jesus, Kadayal - 629101', '04651 281007', '9486489391', 'soosairaj14@gmail.com', '3025.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(138, 3026, 'Fr. Maria John Franklin MSFS [SAC]', '', '', '27.02.1987', '', '', '30.04.2015', '', '', 'Co-Pastor', 'Church of the Sacred Heart of Jesus, Kadayal - 629102', '04651 281007', '9841220792', 'frankmsfs@gmail.com', '3026.jpg', 'Pallotines - Society of the Catholic Apostolate', 'priest'),
(139, 3027, 'Fr. Johnson Britto S. [SSS]', '', '', '19.05.1964', '', '', '04.12.1999', '', '', 'Parish Priest', 'Church of O.L. of Fatima, Kallaravilai, Chenkodi - 629177', '', '9940213597', '', '3027.jpg', 'Congregation of the Blessed Sacrament', 'priest'),
(140, 3028, 'Bro. Paul Savarimuthu [C.M.S.F]', '', '', '15.04.1969', '', '', '04.10.2001', '', '', 'Superior', 'Assisi Boys Home, Pacode - 629168', '04651 260064', '9488334698', '', '3028.jpg', 'Missionary Brothers of St. Francis of Assisi', 'men'),
(141, 3029, 'Bro. Joseph C.J. [C.M.S.F]', '', '', '20.02.1970', '', '', '04.10.2001', '', '', 'Assistant', 'Assisi Boys Home, Pacode - 629169', '04651 260064', '9488921601', '', '3029.jpg', 'Missionary Brothers of St. Francis of Assisi', 'men');

-- --------------------------------------------------------

--
-- Table structure for table `reposts`
--

CREATE TABLE `reposts` (
  `repostID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `repostType` int(11) NOT NULL COMMENT '0 = updates, 1 = posts, 2 = snapshots, 3 = openletters',
  `messages` text NOT NULL,
  `timestamp` varchar(22) NOT NULL,
  `is_viewed` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reposts`
--

INSERT INTO `reposts` (`repostID`, `userID`, `itemID`, `repostType`, `messages`, `timestamp`, `is_viewed`) VALUES
(0, 301, 7, 0, '', '1555349061', NULL),
(0, 301, 1, 2, '', '1557473358', NULL),
(0, 301, 33, 2, '', '1582549079', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `searchID` int(22) NOT NULL,
  `query` varchar(60) NOT NULL,
  `type` varchar(22) NOT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `count` int(22) NOT NULL,
  `timestamp` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`searchID`, `query`, `type`, `language`, `count`, `timestamp`) VALUES
(0, 'Religion', 'posts', 'indonesia', 30, '1564637769'),
(0, 'kumariathavan', 'posts', 'indonesia', 2516, '1569566284'),
(0, 'villagegames', 'posts', 'indonesia', 2910, '1569904320'),
(0, 'kuzhithuraidiocese', 'posts', 'indonesia', 2853, '1606017499'),
(0, 'thenaruvimedia', 'posts', 'indonesia', 2368, '1606199621'),
(0, 'tamilsermon', 'posts', 'indonesia', 2605, '1606199622'),
(0, 'tamilnews', 'posts', 'indonesia', 1404, '1606199623'),
(0, 'Ret', 'snapshots', 'indonesia', 3, '1609322378'),
(0, 'tv', 'posts', 'indonesia', 0, '1613998784'),
(0, 'Address', 'posts', 'indonesia', 1626, '1636722290'),
(0, 'M', 'posts', 'indonesia', 1, '1644210384'),
(0, 'Feast', 'snapshots', 'indonesia', 1395, '1695723940');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(122) UNSIGNED NOT NULL,
  `keys` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `keys`, `value`) VALUES
(1, 'website', 'Kuzhithurai Diocese'),
(2, 'logo', 'dc5cc8314658dcbce4536affc4772f78_1534224217.png'),
(3, 'favicon', ''),
(4, 'SMTP_EMAIL', ''),
(5, 'HOST', ''),
(6, 'PORT', ''),
(7, 'SMTP_SECURE', ''),
(8, 'SMTP_PASSWORD', ''),
(9, 'mail_setting', 'simple_mail'),
(10, 'company_name', 'kuzhuthurai Diocese'),
(11, 'crud_list', 'users,User'),
(12, 'EMAIL', 'edwin18g@gmail.com'),
(13, 'UserModules', 'yes'),
(14, 'register_allowed', '1'),
(15, 'email_invitation', '1'),
(16, 'admin_approval', '0'),
(17, 'user_type', '[\"Member\"]');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `siteID` int(11) NOT NULL,
  `siteTitle` text NOT NULL,
  `siteDescription` text NOT NULL,
  `siteLogo` text NOT NULL,
  `siteTheme` varchar(250) NOT NULL,
  `siteFooter` text NOT NULL,
  `siteLang` text NOT NULL,
  `siteAddress` text NOT NULL,
  `sitePhone` varchar(255) NOT NULL,
  `siteFax` varchar(255) NOT NULL,
  `siteEmail` varchar(255) NOT NULL,
  `siteYM` text NOT NULL,
  `siteBBM` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`siteID`, `siteTitle`, `siteDescription`, `siteLogo`, `siteTheme`, `siteFooter`, `siteLang`, `siteAddress`, `sitePhone`, `siteFax`, `siteEmail`, `siteYM`, `siteBBM`) VALUES
(0, 'Kuzhithurai Diocese', 'diocese', 'logo.png', 'default/', 'Copyright © 2016 - ea dream Media, All Rights Reserved', 'tamil', 'Diocese of Kuzhithurai\r\nBishop’s House,\r\nP.B. No.1\r\nUnnamalaikadai – 629171\r\nK.K.Dist, Tamil Nadu', '04651-272077', '04651-272077', 'rcdiocesekuzhithurai@gmail.com', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `snapshots`
--

CREATE TABLE `snapshots` (
  `snapshotID` int(11) NOT NULL,
  `contributor` int(22) NOT NULL,
  `snapshotContent` text NOT NULL,
  `snapshotFile` text NOT NULL,
  `snapshotSlug` varchar(60) NOT NULL,
  `snapshotCredits` text NOT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `timestamp` int(22) NOT NULL,
  `visits_count` int(22) NOT NULL,
  `parish_id` int(11) DEFAULT NULL,
  `home_slider` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapshots`
--

INSERT INTO `snapshots` (`snapshotID`, `contributor`, `snapshotContent`, `snapshotFile`, `snapshotSlug`, `snapshotCredits`, `language`, `timestamp`, `visits_count`, `parish_id`, `home_slider`) VALUES
(1, 1, 'nyslider', 'ccd19045a72e184e71d29381b775ef2f.png', '92240ec64e0dcaeb547656dd818749b6', '', 'english', 1542831007, 395, NULL, 0),
(2, 1, 'new', '22ef3b91d456b1b97246f68e8867d057.jpg', '256a2b3706d9059f99dfbea59288010f', '', 'english', 1542834171, 398, NULL, 0),
(3, 1, 'ingration', '1c8b56847bb2844e1925ad30ce6e437e.jpg', '3c549137960c27f0587cc7991a1749f1', '', 'english', 1543433086, 467, NULL, 0),
(6, 268, '', '19fcd2ac62e80e98a4cc114970d8e3e5.jpg', '78761b3391fa342a7114b4d1cc1c607f', '', 'english', 1546891054, 255, 115, 0),
(7, 301, '', 'b0f54c317f48e0b1f10c740d2ac0f795.jpg', '9d7f0d76367e20e455d454670af21a31', '', 'english', 1551860381, 251, NULL, 0),
(9, 268, '', '6d5b6cbece40dab76d0a04b97638e6e0.jpg', 'db19aac79d703a11cec00075605e698c', '', 'english', 1552319508, 283, NULL, 0),
(12, 301, '', 'd6999740f6ea98771f9dfaa3e2be3191.jpg', '3e6bdaf226d8c490849f2c52ddebc3fa', '', 'english', 1554136417, 258, NULL, 0),
(13, 301, '', '9a173168e4a6e1477addeef4f7d15367.jpg', '811921847692094564c3c0bcb453b351', '', 'english', 1554136656, 247, NULL, 0),
(14, 301, '', '6fa3bbd859ce3cedec9e6c40a7cd9628.jpg', '5a5de7130dd91e51162ce1f1db916e4e', '', 'english', 1554136776, 264, NULL, 0),
(15, 301, 'Chrism Mass - 2019', 'c5982da65316d1df86c44fd2b1b1007c.jpg', '4c04e913c185a417a1aaf8660ad35df1', '', 'english', 1555411762, 283, NULL, 0),
(16, 301, 'Chrism Mass - 2019', '1931d2bbc3ed2ba2ac61b87e43d0d289.jpg', '2c9b7aaa121b3691e2fa0b4e9d904b5a', '', 'english', 1555412165, 269, NULL, 0),
(17, 301, '', '0f7375ffb35f4b7b205115dfb68baf18.jpg', '2dea23f325f39afbb0400b1376d55fff', '', 'english', 1568826228, 175, NULL, 0),
(18, 301, '', '868a15e2c84f02f8f309aa12d7daf3b7.JPG', '728831e5908804f293c6ea23eb02fad7', '', 'english', 1568826588, 214, NULL, 0),
(19, 301, 'Annual Retreat - 2019 at Cotton Hill, Trivandrum', '0ae47d3380532f15c3c007af23d83894.jpg', 'a934706f3de49dded3b1a8a48d59ad70', '', 'english', 1570775050, 175, NULL, 0),
(20, 301, 'Annual Retreat - 2019 at Cotton Hill, Trivandrum', 'd0b8940843d07fc690c2b992a6a368d7.jpg', '3cdfdc1de089fcd5bba3a44f75c3b9bb', '', 'english', 1570775130, 187, NULL, 0),
(21, 301, 'Annual Retreat - 2019 at Cotton Hill, Trivandrum', 'fc3616b6c811db079e6c06dabe4e3e0d.JPG', '9a27879986604b23f9c07c84d9cfd1aa', '', 'english', 1570776080, 158, NULL, 0),
(22, 301, 'Annual Retreat - 2019 at Cotton Hill, Carmal Monastery, Trivandrum', '8888a873c7dbd4df870094a7416054e2.JPG', 'f50d05a8751a80dc11e5c0a339ec0b01', '', 'english', 1570778692, 164, NULL, 0),
(23, 301, ' பணிக்குழுக்களின் கலந்தாய்வு கூட்டம்', 'dab13990367c7f4ae53ea403cd89cc96.jpg', 'e90a49c3eb1bec09ff978f4dc32279bd', 'தேனருவி', 'english', 1575695580, 156, NULL, 0),
(24, 301, ' பணிக்குழுக்களின் கலந்தாய்வு கூட்டம்', '37860657c0a9ddcca20a326fe49ce23e.jpg', 'd64afdbb95a9812bf10ce1f607d6c6e0', 'தேனருவி', 'english', 1575714937, 154, NULL, 0),
(25, 301, 'Feast mass at Chemparuthivilai on 11/02/2020', '15c49c3c7d080e49722001450a831eed.jpeg', '5ac4078e7146e511e12425e35b3f56c8', 'Thenaruvi', 'english', 1581493256, 132, NULL, 0),
(26, 301, 'Feast mass at Vettuvenni on 21.02.2020', '7a1b9a6492ec721de5e0bb0e0742fb97.jpeg', '833d4dbab8fc8f9c810439b6dce9582e', 'Dicese', 'english', 1582294127, 147, NULL, 0),
(27, 301, '', '4682d32bfd730d065e020a5d93e4c56e.jpeg', '5647acb1e5166194512ec2ea950f1611', '', 'english', 1582294612, 119, NULL, 0),
(28, 301, '', '66bc2bef53a65c9563502736a20023f9.jpeg', '5a1918257accb47e4428993ab5081ad5', 'Ezhuvom Iyakkam (cancer care campaign) 22.02.2020 at 3.30 pm', 'english', 1582366565, 138, NULL, 0),
(29, 301, '', '2af29ae717f2d6585b55f076c5dcb210.jpeg', '6ac1e37b51369af3dfca31762384a783', '', 'english', 1582366833, 127, NULL, 0),
(31, 301, 'Feast Mass at Vattam on 23.02.2020. 8.30 a.m', '1a7a2eca2f7635f15b3f59450154568c.jpeg', 'e47bd69648d8f56b402f0d473b5d10dc', '', 'english', 1582428576, 174, NULL, 0),
(32, 301, 'New Church Blessing at Varuvilai (kanjampuram) on 22.02.2020', '8871ca93618e2b2e09f822f0fbfe4504.jpeg', 'ee553e80388068ac35f04d2ae73a790d', '', 'english', 1582429400, 201, NULL, 0),
(34, 301, '5th EPISCOPAL ORDINATION DAY (24.02.2020)', 'ffd1a94c39eb6b4abc33d688b0e02372.jpeg', '5549a9508bbd7de04b09979f3eaad590', '', 'english', 1582548520, 175, NULL, 0),
(35, 301, '5th EPISCOPAL ORDINATION DAY (24.02.2020)', 'a5b99f1c4bbdacf9efd8324f04f7b2ad.jpeg', 'b63a4661709b2d634aff3ee644026af6', '', 'english', 1582549465, 173, NULL, 0),
(36, 301, '', '05ae864e8a3cf0bca1c81526e622aeab.jpeg', '6e433a0d0fc726257ac16a86ede49a57', 'Diocese', 'english', 1583478509, 156, NULL, 0),
(37, 301, '', '2816e424d670221b493a1c36980cec8e.jpg', 'd44b6ba6bace4c569a0c8b6fdbf5f4cf', 'Diocese', 'english', 1583593296, 163, NULL, 0),
(38, 301, 'Graceful', 'd8f0670bfa1ead13862b631f47902131.jpg', 'daec8af48fcccd7d1ded84fe03704e4b', 'Diocese', 'english', 1583593407, 158, NULL, 0),
(39, 301, 'Kuzhithurai   Diocese   Choir  Manadu was held at Nanjil College of Arts and Science, Kaliyakkavilai', '08608277a56d25717c55e41cd852771c.jpeg', '1525195bd21e4cf862070149ca8d0d9f', 'Diocese', 'english', 1583821961, 179, NULL, 0),
(40, 301, 'Confirmation Mass at Chemparuthivilai on 15.03.2020', '915bf4e985c6253cbdeae00445ac479b.jpeg', '3b042401568cefbdd6fee67e9013386e', 'Diocese', 'english', 1584246221, 190, NULL, 0),
(41, 301, 'Confirmation Mass at Chemparuthivilai on 15.03.2020', '3110cba8b4cac4edd228e631f1c39b7b.jpeg', 'efc2a6d6e838010c8987a92fe246bdbc', 'Kuzhithurai Diocese', 'english', 1584246301, 186, NULL, 0),
(42, 301, 'Confirmation Mass at Chemparuthivilai on 15.03.2020', '102e6d78ba67c3c21b832ac3ef261673.jpeg', 'd9c8fb4c74f4b7908aefc80419a5662d', '', 'english', 1584246360, 237, NULL, 0),
(43, 301, 'Confirmation Mass at Chemparuthivilai on 15.03.2020', '4ece64a0157632db9f62c5ff155cec62.jpeg', 'd626c8cd4aa18577f8fcc8a8a2ad809f', 'Diocese', 'english', 1584246433, 255, NULL, 0),
(44, 301, 'Priestly Ordination 2021', '100038ec9f8ae1947dfb7e084d60e945.jpg', '00e911f4104e12f6ff5d1083536a7614', 'Kuzhithurai Diocese', 'english', 1619541817, 119, NULL, 1),
(45, 301, 'Priestly Ordination - 2021', 'd071d1a1c0790f341c52f2fef0f9d160.jpg', '1160f749cf161cf21f99ca9ee5bb0f15', 'Kuzhithurai Diocese', 'english', 1619541866, 142, NULL, 0),
(46, 301, 'Priestly Ordination - 2021', 'cb63cc569367929ad0db21e467a97b75.jpg', '764fb832bcf02c423b132ed50294bea0', 'Kuzhithurai Diocese', 'english', 1619541920, 90, NULL, 1),
(47, 301, 'Priestly Ordination - 2021', '337a4b567636f64d25254040eedddcfb.jpg', 'dc66664c420e7a0e70fde96559e1369b', 'Kuzhithurai Diocese', 'english', 1619541967, 110, NULL, 0),
(48, 301, 'Priestly Ordination - 2021', 'cfa20aba76725b9a52a8d81778b1998d.jpg', '475ae5a1503cdc4eb0c26dc043213de3', 'Kuzthiturai Diocese', 'english', 1619542020, 92, NULL, 0),
(49, 301, 'Priestly Ordination - 2021', '567851b7c6b3de4f520856441117d504.jpg', '0ff4e9b0d4fdbc3d55865ff77b68c9e5', 'Kuzhithurai Diocese', 'english', 1619542259, 116, NULL, 0),
(50, 301, 'Priestly Ordination - 2021', '32c9dba19f30d16e2c9930876d9db4e1.jpg', 'b19d33c702437a029b8ae6678774b653', 'Kuzhithurai Diocese', 'english', 1619542299, 101, NULL, 0),
(51, 301, 'Priestly Ordination - 2021', '1be60bdd4ebe2b1a38e5d92d9875803a.jpg', '82a4ccb75079a09885f576b8be39dad5', 'Kuzhithurai Diocese', 'english', 1619542342, 145, NULL, 0),
(53, 301, 'bishop', 'aa045c82e690f7c445bcf2d8c1619a5a.jpg', '9d26eedf89d617c87d2d69162f05a4b7', 'thenaruvi', 'english', 1706178119, 9, NULL, 0),
(54, 301, 'Bishop Announcement', '8f22ff3e25c3aa3b67bfd21d5fb6612e.jpeg', '3a9235268d94cfa30f8bfc45ea96a5e5', 'Diocese', 'english', 1706178481, 10, NULL, 1),
(55, 301, 'Bishop Announcement 1', '951a1eb086469de0a958e7e9d9fbfa62.jpeg', 'b8f6a01b3307547ab07083ec4e131401', 'Diocese', 'english', 1706178518, 8, NULL, 1),
(56, 301, 'Bishop Announcement 2', 'b3d8d146266d51fb73e28146df8bfffc.jpeg', '6ca9b4239b123f2ba2d8d3c6905e2412', 'Thenaruvi', 'english', 1706178557, 13, NULL, 1),
(57, 301, 'Bishop 2', 'a0e3c1e2d8beecb0e70fc931e7cfa791.jpg', '98df0498573b90e40c8b53ffb5c5c2c4', 'thenaruvi', 'english', 1706542773, 7, NULL, 0),
(58, 301, 'Most Rev. Bishop Albert George Alexandar', '55ae04a2b7c71a68d12972532339e34b.jpg', '11ba8ed8032f2ed04754eed985b328df', 'Thenaruvimedia', 'english', 1706544097, 8, NULL, 0),
(59, 301, 'Most Rev. Bishop Albert George Alexander', '800cb71f49b70cb704417f17f5f9c993.jpg', 'a66a7ad6f319ee7cb8a5614622a36ffb', 'Thearvui', 'english', 1706545065, 9, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

CREATE TABLE `social` (
  `socialName` varchar(250) NOT NULL,
  `socialLink` varchar(250) NOT NULL,
  `socialEnabled` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(121) UNSIGNED NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `html` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `module`, `code`, `template_name`, `html`) VALUES
(1, 'forgot_pass', 'forgot_password', 'Forgot password', '<html xmlns=\"http://www.w3.org/1999/xhtml\"><head>\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n  <style type=\"text/css\" rel=\"stylesheet\" media=\"all\">\n    /* Base ------------------------------ */\n    *:not(br):not(tr):not(html) {\n      font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif;\n      -webkit-box-sizing: border-box;\n      box-sizing: border-box;\n    }\n    body {\n      \n    }\n    a {\n      color: #3869D4;\n    }\n\n\n    /* Masthead ----------------------- */\n    .email-masthead {\n      padding: 25px 0;\n      text-align: center;\n    }\n    .email-masthead_logo {\n      max-width: 400px;\n      border: 0;\n    }\n    .email-footer {\n      width: 570px;\n      margin: 0 auto;\n      padding: 0;\n      text-align: center;\n    }\n    .email-footer p {\n      color: #AEAEAE;\n    }\n  \n    .content-cell {\n      padding: 35px;\n    }\n    .align-right {\n      text-align: right;\n    }\n\n    /* Type ------------------------------ */\n    h1 {\n      margin-top: 0;\n      color: #2F3133;\n      font-size: 19px;\n      font-weight: bold;\n      text-align: left;\n    }\n    h2 {\n      margin-top: 0;\n      color: #2F3133;\n      font-size: 16px;\n      font-weight: bold;\n      text-align: left;\n    }\n    h3 {\n      margin-top: 0;\n      color: #2F3133;\n      font-size: 14px;\n      font-weight: bold;\n      text-align: left;\n    }\n    p {\n      margin-top: 0;\n      color: #74787E;\n      font-size: 16px;\n      line-height: 1.5em;\n      text-align: left;\n    }\n    p.sub {\n      font-size: 12px;\n    }\n    p.center {\n      text-align: center;\n    }\n\n    /* Buttons ------------------------------ */\n    .button {\n      display: inline-block;\n      width: 200px;\n      background-color: #3869D4;\n      border-radius: 3px;\n      color: #ffffff;\n      font-size: 15px;\n      line-height: 45px;\n      text-align: center;\n      text-decoration: none;\n      -webkit-text-size-adjust: none;\n      mso-hide: all;\n    }\n    .button--green {\n      background-color: #22BC66;\n    }\n    .button--red {\n      background-color: #dc4d2f;\n    }\n    .button--blue {\n      background-color: #3869D4;\n    }\n  </style>\n</head>\n<body style=\"width: 100% !important;\n      height: 100%;\n      margin: 0;\n      line-height: 1.4;\n      background-color: #F2F4F6;\n      color: #74787E;\n      -webkit-text-size-adjust: none;\">\n  <table class=\"email-wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"\n    width: 100%;\n    margin: 0;\n    padding: 0;\">\n    <tbody><tr>\n      <td align=\"center\">\n        <table class=\"email-content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%;\n      margin: 0;\n      padding: 0;\">\n          <!-- Logo -->\n\n          <tbody>\n          <!-- Email Body -->\n          <tr>\n            <td class=\"email-body\" width=\"100%\" style=\"width: 100%;\n    margin: 0;\n    padding: 0;\n    border-top: 1px solid #edeef2;\n    border-bottom: 1px solid #edeef2;\n    background-color: #edeef2;\">\n              <table class=\"email-body_inner\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" style=\" width: 570px;\n    margin:  14px auto;\n    background: #fff;\n    padding: 0;\n    border: 1px outset rgba(136, 131, 131, 0.26);\n    box-shadow: 0px 6px 38px rgb(0, 0, 0);\n       \">\n                <!-- Body content -->\n                <thead style=\"background: #3869d4;\"><tr><th><div align=\"center\" style=\"padding: 15px; color: #000;\"><a href=\"{var_action_url}\" class=\"email-masthead_name\" style=\"font-size: 16px;\n      font-weight: bold;\n      color: #bbbfc3;\n      text-decoration: none;\n      text-shadow: 0 1px 0 white;\">{var_sender_name}</a></div></th></tr>\n                </thead>\n                <tbody><tr>\n                  <td class=\"content-cell\" style=\"padding: 35px;\">\n                    <h1>Hi {var_user_name},</h1>\n                    <p>You recently requested to reset your password for your {var_website_name} account. Click the button below to reset it.</p>\n                    <!-- Action -->\n                    <table class=\"body-action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"\n      width: 100%;\n      margin: 30px auto;\n      padding: 0;\n      text-align: center;\">\n                      <tbody><tr>\n                        <td align=\"center\">\n                          <div>\n                            <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"{{var_action_url}}\" style=\"height:45px;v-text-anchor:middle;width:200px;\" arcsize=\"7%\" stroke=\"f\" fill=\"t\">\n                              <v:fill type=\"tile\" color=\"#dc4d2f\" />\n                              <w:anchorlock/>\n                              <center style=\"color:#ffffff;font-family:sans-serif;font-size:15px;\">Reset your password</center>\n                            </v:roundrect><![endif]-->\n                            <a href=\"{var_varification_link}\" class=\"button button--red\" style=\"background-color: #dc4d2f;display: inline-block;\n      width: 200px;\n      background-color: #3869D4;\n      border-radius: 3px;\n      color: #ffffff;\n      font-size: 15px;\n      line-height: 45px;\n      text-align: center;\n      text-decoration: none;\n      -webkit-text-size-adjust: none;\n      mso-hide: all;\">Reset your password</a>\n                          </div>\n                        </td>\n                      </tr>\n                    </tbody></table>\n                    <p>If you did not request a password reset, please ignore this email or reply to let us know.</p>\n                    <p>Thanks,<br>{var_sender_name} and the {var_website_name} Team</p>\n                   <!-- Sub copy -->\n                    <table class=\"body-sub\" style=\"margin-top: 25px;\n      padding-top: 25px;\n      border-top: 1px solid #EDEFF2;\">\n                      <tbody><tr>\n                        <td> \n                          <p class=\"sub\" style=\"font-size:12px;\">If you are having trouble clicking the password reset button, copy and paste the URL below into your web browser.</p>\n                          <p class=\"sub\"  style=\"font-size:12px;\"><a href=\"{var_varification_link}\">{var_varification_link}</a></p>\n                        </td>\n                      </tr>\n                    </tbody></table>\n                  </td>\n                </tr>\n              </tbody></table>\n            </td>\n          </tr>\n        </tbody></table>\n      </td>\n    </tr>\n  </tbody></table>\n\n\n</body></html>'),
(3, 'users', 'invitation', 'Invitation', '<p>Hello <strong>{var_user_email}</strong></p>\n\n<p>Click below link to register&nbsp;<br />\n{var_inviation_link}</p>\n\n<p>Thanks&nbsp;</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `thedal`
--

CREATE TABLE `thedal` (
  `id` int(11) NOT NULL,
  `ctitle` varchar(100) DEFAULT NULL,
  `cfilename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thedal`
--

INSERT INTO `thedal` (`id`, `ctitle`, `cfilename`) VALUES
(3, 'à®šà¯‚à®²à¯ˆ 2016', '1.pdf'),
(4, 'August 2016', '4.pdf'),
(5, 'Sep 2016', '5.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tv`
--

CREATE TABLE `tv` (
  `tvID` int(11) NOT NULL,
  `tvTitle` varchar(255) NOT NULL,
  `tvContent` text NOT NULL,
  `tvFile` varchar(255) NOT NULL,
  `tvURL` varchar(255) NOT NULL,
  `tvSlug` varchar(255) NOT NULL,
  `contributor` int(11) NOT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'indonesia',
  `timestamp` int(22) NOT NULL,
  `last_visits` int(22) NOT NULL,
  `visits_count` int(22) NOT NULL,
  `video_type` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `updateID` int(22) NOT NULL,
  `userID` int(22) NOT NULL,
  `updateContent` text NOT NULL,
  `visibility` int(1) NOT NULL COMMENT '0 = public, 1 = followers, 2 = friends',
  `timestamp` varchar(22) NOT NULL,
  `visits_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`updateID`, `userID`, `updateContent`, `visibility`, `timestamp`, `visits_count`) VALUES
(6, 301, 'Test', 1, '1553675733', 0),
(7, 255, 'Change is not a miracle. Change doesn\'t just happen. We have to make it happen.', 1, '1555348930', 0),
(8, 301, 'dasfd', 1, '1586026850', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `facebookUID` varchar(255) DEFAULT NULL,
  `userName` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `RS` varchar(15) NOT NULL,
  `level` int(1) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(2) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `bio` text NOT NULL,
  `photo` varchar(200) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `language` varchar(22) NOT NULL,
  `register_since` varchar(22) NOT NULL,
  `last_login` varchar(22) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1 = aktif, 0 = pending',
  `visits_count` int(11) NOT NULL,
  `pr_father_name` varchar(50) DEFAULT NULL,
  `pr_mother_name` varchar(50) DEFAULT NULL,
  `pr_birth_date` varchar(50) DEFAULT NULL,
  `pr_birth_place` varchar(50) DEFAULT NULL,
  `pr_seminary` text,
  `pr_ordination_date` varchar(50) DEFAULT NULL,
  `pr_place_ordination` text,
  `pr_ordination_by` varchar(150) DEFAULT NULL,
  `pr_parish` text,
  `access_user` text,
  `pr_type` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `facebookUID`, `userName`, `email`, `password`, `RS`, `level`, `full_name`, `gender`, `age`, `address`, `mobile`, `bio`, `photo`, `cover`, `language`, `register_since`, `last_login`, `status`, `visits_count`, `pr_father_name`, `pr_mother_name`, `pr_birth_date`, `pr_birth_place`, `pr_seminary`, `pr_ordination_date`, `pr_place_ordination`, `pr_ordination_by`, `pr_parish`, `access_user`, `pr_type`) VALUES
(1, '100000619009511', 'bishop', 'bpjeromedhas@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', 'cQdRT4hWMn6F', 1, 'Jeromedhas Varuvel SDB', 'l', 61, 'Diocese of Kuzhithurai\r\nBishop’s House,\r\nP.B. No.1\r\nUnnamalaikadai – 629171\r\nK.K.Dist, Tamil Nadu', '04651270277', 'The Most Rev. Msgr. V. Jeromedhas, SDB was born on October 21, 1951 at Paduvoor, Diocese of Kottar. After his primary education in the ICM Primary School, Velliavilai, he joined St. Aloysius\' Minor Seminary, Kottar diocese on sunday 24th May 1964, and did his high school studies at Carmel High School, Nagercoil and completed his SSLC in March 1967. He did his P.U.C at Scott Christian College, Nagercoil from June 1967 to March 1968. After two years of Initiation course he joined the Sacred Heart Seminary, Poonamallee, Madras on 12th June 1970.', '1a6d63b83473a6c96ba53b7c09e56553.jpg', '76f52cac08e0a270b17da7c7bee452c0.jpg', 'english', '0', '2019-03-23 13:31', 0, 632408, '', '', '21-10-1951', 'Paduvoor', 'St. Aloysius\' Minor Seminary, Kottar diocese', '02-06-1985', '', '', 'Bishop', NULL, 1),
(160, NULL, 'fr-mathias-m', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Mathias. M', 'm', 34, '              14/23rd Main Road<div></div><div>Srinivasa Nagar</div><div>Trichy 620 017</div>', '9443466617', '', 'eca0eee71e1cc4c03518e83ee82f231f.png', '', 'english', '', '', 0, 31398, 'Mr. Maria Michael', 'Mrs. Annammal', '13.06.1931', 'Mathiravilai', '', '28.03.1960', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J.', 'Retired', NULL, 1),
(161, NULL, 'fr-wenceslaus-c', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Wenceslaus C.M. (Late)', 'm', 34, '                    South Gate,Near Government Mid. Sch.,Thiruvithancode P.O. 629 174', '9443579750', '', '1002.jpg', '', 'english', '', '', 0, 6472, 'Mr. Chinnayyan Michael', 'Mrs. Cecily', '27.05.1933', 'Thiruvithancode', 'St. Raphael\'s Seminary  Quilon,St. Paul\'s Seminary Trichy ', '24.03.1961', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Deceased', NULL, 1),
(162, NULL, 'fr-mariadhas-a', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Mariadhas A.', 'm', 34, '            Martyr Devasahayampillai Shrine, Puliyoorkurichy, Thuckalay 629175', '8220695762', '', '1003.jpg', '', 'english', '', '', 0, 6792, 'Mr. Arockiam', 'Mrs. Annammal', '06.05.1937', 'Kuzhivilai', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy', '27.03.1963', 'St.Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J.', 'Spiritual Father, puliyoorkurichy', NULL, 1),
(163, NULL, 'fr-jesudhasan-t', 'jesudason@gmx.de', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jesudhasan Thomas', 'm', 34, '        Spiritual Director, St. Aloysius Minor seminary, PB No:17, Asaripallam Road, Nagercoil - 629001', '9442076656', '', '1004.jpg', '', 'english', '', '', 0, 4998, 'E.Thomas', 'Annammal', '28.03.1935', 'Arockiapuram', 'St.Aloysius Pune, St.Gorgan Germany', '25.07.1963', 'Eschweiler Germany', 'Bishop John Pohlschmener', 'Spiritual Director, St. Aloysius Minor seminary', NULL, 1),
(164, NULL, 'fr-robert-v', 'robertvaruvel@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Robert V', 'l', 34, 'Fr. Robert V.\r\nParish Priest\r\nChurch of St. Catherine\r\nKAPPIYARAI  629 156', '9487411988', '', '1006.jpg', '', 'english', '', '', 0, 27862, 'Mr. Varuvel Antony', 'Mrs. Maria Raja Retinam', '10.02.1945', 'Mela Ramanputhoor', 'St. Aloysius Seminary, Nagercoil, St. Joseph\'s Seminary, Alwaye', '20.12.1968', 'St. Francis Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswami S.J', 'Parish priest, church of St. Catherine,Kappiarai', NULL, 1),
(165, NULL, 'fr-joseph-raj-a', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Joseph Raj A.', 'm', 34, '      <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span lang=\"EN-IN\" style=\"font-size: 12pt; line-height: 115%; font-family: Arial, sans-serif;\">Church\r\nof O.L. of Rosary, Kan', '9443940064', '', '1007.jpg', '', 'english', '', '', 0, 4114, 'Mr. Albert', 'Mrs. Pragasi', '16.06.1943', 'Madathattuvilai', 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary, Poonamallee ', '19.12.1969', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Kanjiracode', NULL, 1),
(166, NULL, 'fr-mariadhasan-', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Mariadhasan. S', 'm', 34, '    <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">Church\r\nof the Holy Redeemer of the World, Pannavilai</span></p>', '9487108765', '', '1008.jpg', '', 'english', '', '', 0, 7924, 'Mr. Savarimuthu', 'Mrs. Gnanapooammal', '01.06.1943', 'Chithenthope', 'St. Paul\'s Seminary, Trichy ', '19.12.1969', 'St. Xavier\'s Cathedral, Kottar', 'Bishop T.R. Agniswamy S.J.', 'Co- Pastor, Pannavilai', NULL, 1),
(167, NULL, 'fr-hilary-a-m', 'hilaryam2015@gmail.com, muthu416@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Hilary A.M.', 'l', 34, 'Fr. A. M. Hilary\r\nParish Priest\r\nChurch of St. Antony’s\r\nMaruthancode\r\nKUZHITHURAI 629 163', '9488911972', '', '1009.jpg', '', 'english', '', '', 0, 10646, 'Antony Muthu', 'Mariaanthony', '29.01.1946', 'Mylacode', 'St.Joseph\'s ', '21.12.1970', 'Kottar', 'Bishop Agnisamy', 'Parish Priest, Chruch of st. Antony\'s ,maruthancode', NULL, 1),
(168, NULL, 'fr-chellaiyan-p', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Chellaiyan P.K. ', 'm', 34, '    ', '9442304254', '', '1010.jpg', '', 'english', '', '', 0, 926, 'Mr. Kumaravel', 'Mrs. Kochukali', '22.05.1942', 'Nallayanpuram', 'St. Paul\'s Seminary, Trichy', '21.12.1971', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Retired ', NULL, 1),
(169, NULL, 'fr-wilfred-feli', 'felixwilfred@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Wilfred Felix A.', 'l', 34, 'Fr. Wilfred Felix A.\r\nAsian Centre for Cross & Cultural Studies\r\n40/6A Paniyurkuppam Road\r\nPanaiyur, Sholinganallur P.O\r\nCHENNAI 600 119', '9444034665', '', '1011.jpg', '', 'english', '', '', 0, 2268, '', '', '21.02.1948', 'Puthenkadai', '', '18.03.1972', '', '', 'Asian Centre for Cross & Cultural Studies, Chennai', NULL, 1),
(170, NULL, 'fr-innocent-j', 'innocent020546@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Innocent J.', 'l', 34, 'Fr. Innocent\r\nParish Priest\r\nChurch of St. Antony’s\r\nVarthanvilai\r\nBETHELPURAM  629 803', '7708755017', '', '1012.jpg', '', 'english', '', '', 0, 2452, 'Mr. S.Jones', 'Mrs. Ronickam', '02.05.1946', 'Karungal ', 'St. Aloysius Seminary, Nagercoil,St. Joseph\'s Pont.Seminary, Alwaye', '21.12.1972', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish priest, Church of St. Antony\'s Varthanvilai', NULL, 1),
(171, NULL, 'fr-peter-m', 'avcpeter@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Peter M.', 'l', 34, 'Fr. Peter\r\nParish Priest\r\nCathedral of the Most Holy Trinity\r\nThirithuvapuram\r\nKUZHITHURAI 629 163', '9965590625', '', '1013.jpg', '', 'english', '', '', 0, 71686, 'Mr. Mariakkan', 'Mrs. Gnanasoundari', '31.07.1950', 'Chithenthopue Kandanvilai', 'St. Aloysius Seminary, Nagercoil ,St. Joseph\'s Seminary, Alwaye ', '22.12.1974', 'St. Xavier\'s Cathedral, Kottar', 'Archbishop M. Arockiaswamy', 'Parish Priest Cathedral of the Most Holy Trinity Thirithuvapuram', NULL, 1),
(172, NULL, 'fr-jesu-marian-', 'jesumarian@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jesu Marian A.', 'l', 34, 'Fr. Jesu Marian\r\nSacred Heart Seminary\r\nPoonamalle\r\nCHENNAI 600 056', '9442525044', '', '1014.jpg', '', 'english', '', '', 0, 35058, 'Mr. Arockiam', 'Mrs. Mariammal', '28.05.1946', 'Arockiapuram', 'St. Aloysius Seminary, Nagercoil,Sacred Heart Seminary, Ponnamallee ', '04.02.1975', 'St. Francis Xavier\'s Church Manguzhy', 'Archbishop M. Arockiaswamy', 'Sacred Heart Seminary, Poonamalle', NULL, 1),
(173, NULL, 'fr-antony-r', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony R. ', 'm', 34, '                    Church of O.L. of Nativity, Mulagumoodu 629 167', '9488425144', '', '1015.jpg', '', 'english', '', '', 0, 4672, 'Mr. Rajendran', 'Mrs. Arockiam', '25.06.1944', 'Palliady', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy, St. Paul\'s Seminary, Trichy ', '12.05.1975', 'Palliadi', 'Archbishop Arockiaswami M.', 'Confessor', NULL, 1),
(174, NULL, 'fr-arul-devadha', 'fr_addhason@rediffmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Arul Devadhason M.', 'l', 34, 'Fr. Arul Devadasan\r\nParochial Administrator\r\nChurch of Our Lady of Velankanni\r\nAnnai Nagar\r\nIRENIPURAM  629 162', '9443129153', '', '1016.jpg', '', 'english', '', '', 0, 81578, 'Mr. S. Maria Arockiam', 'Mrs. Maria Kavalal', '06.05.1948', 'Punnai Nagar', 'St. Aloysius Seminary, Nagercoil, Sacred Heart Seminary Poonamallee, Regency Viyasarpady, Chennai, P.U.C. Karumathoor, Madurai', '14.04.1977', 'Carmel High School, Ramanputhoor', 'Archbishop. Arockiaswami M.', 'Parochial Administrator Church of Our Lady of Velankanni Annai Nagar', NULL, 1),
(175, NULL, 'fr-jesu-retnam-', 'jco_ordinator@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jesu Retnam S.', 'l', 34, 'Fr Jesu Retnam\r\nVicar General\r\nDiocese of Kuzhithurai\r\nBishop’s House,\r\nP.B. No.1\r\nUnnamalaikadai – 629171\r\nK.K.Dist, Tamil Nadu', '9442788275', '', '9e49ab14879fed7c7c538bbe32ffbe27.jpg', '', 'english', '', '2019-04-13 12:02', 0, 27396, 'Mr. Stanislaus', 'Mrs. Maria Packiam', '01.01.1950', 'Mankuzhy', 'St. Paul\'s Seminary, Trichy', '17.04.1977', 'Mankuzhy', 'Archbishop M. Arockiaswamy', 'Vicar General', NULL, 1),
(176, NULL, 'fr-vargheese-s', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Vargheese S', 'm', 34, '  Church of St.Joseph, Kamplar, Tholaiyavattam - 629159', '9486248535', '', '1018.jpg', '', 'english', '', '', 0, 7354, 'Mr. Savarimuthu', 'Mrs. Theresammal', '27.03.1948', 'Thickurichy', 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary Poonamallee', '02.05.1978', 'Thickurichy', 'Archbishop M. Arockiaswamy', 'Parish Priest, Kamplar', NULL, 1),
(177, NULL, 'fr-vincent-raj-', 'frsvincentraj@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Vincent Raj S.', 'l', 34, ' Church of St.Michael the Archangel, Manalikuzhivilai <div><br></div>', '9443370360', '', '1019.jpg', '', 'english', '', '', 0, 49178, 'Mr. Savarimuthu', 'Mrs. Rajammal', '24.06.1953', 'Kalkurichy', 'St. Aloysius Seminary Nagercoil, Sacred Heart Seminary Poonamallee ', '03.10.1979', 'Kalkurichy', 'Archbishop M. Arockiaswamy', 'Vicar Forane, Vicariate of Mathiravilai', NULL, 1),
(178, NULL, 'fr-maria-alphon', 'vmalphonse@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Alphonse V.', 'l', 34, 'Fr. Maria Alphonse V.\r\nParish Priest\r\nChurch of St. Francis Xavier\r\nKuzhivilai, Parakkadai\r\nKAPPIYARAI 629 156', '9486249262', '', '1020.jpg', '', 'english', '', '', 0, 7642, 'Mr. V. Wenceslaus', 'Mrs. Agathammal', '17.12.1954', 'Vellicode', 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor, Theology Papal Seminary, Pune, Philosophy Pune', '27.05.1980', 'Vellicode', 'Bishop Antonymuthu Bishop of Vellore', 'Parish Priest Church of St. Francis Xavier Kuzhivilai, Parakkadai', NULL, 1),
(179, NULL, 'fr-raphael-v', 'raphaelvbible@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Raphael V.', 'l', 34, 'Parish Priest\r\nChurch of St. Francis Xavier\r\nKuzhivilai, Parakkadai', '9442383326', '', '1021.jpg', '', 'english', '', '', 0, 2828, 'Mr. A. Varuvel', 'Mrs. Maria Sebastiaye', '22.02.1952', 'Appattuvilai', 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee Christ Hall, Karumathoor', '15.06.1981', 'Appattuvilai', 'Most Rev. M. Arockiaswamy', 'Parish Priest Church of St. Francis Xavier Kuzhivilai, Parakkadai', NULL, 1),
(180, NULL, 'fr-paschal-s-pr', 'paschalprosper@yahoo.com.br', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Paschal S. Prosper', 'm', 34, '      Rua 7 De Setembro,No 348, Tabuleiro Do Martins,CEP 57.061 140 Maceio AL,Brazil.    ', '0055 8299814195', '', '1022.jpg', '', 'english', '', '', 0, 2852, 'Mr. Singarayan', 'Mrs. Rosammal', '17.05.1952', 'Puthenkadai', 'St. Aloysius Seminary, Nagercoil, Christ Hall, Karumathoor,St. Paul\'s Seminary, Trichy', '18.04.1982', 'Puthenkadai', 'Archbishop M. Arockiaswamy', '', NULL, 1),
(181, NULL, 'fr-xavier-bruce', 'xavierbrucer@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Xavier Bruce. R', 'l', 34, 'Fr. Xavier Bruce R. \r\nParish Priest\r\nChurch of Our Lady of Good Health\r\nMunchirai\r\nPUTHUKKADAI  629 171', '9597055386', '', '1023.jpg', '', 'english', '', '', 0, 6220, 'P. Rajendran', 'A. Nesammal', '31.07.1957', 'Thalavaipuram', 'Papal Seminary, Pune', '27.10.1982', 'Carmel Nagar', 'Bishop M. Arokiasamy', 'Parish Priest Church of Our Lady of Good Health Munchirai', NULL, 1),
(182, NULL, 'fr-francis-s', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Francis S.', 'm', 34, '      USA', '', '', '1024.jpg', '', 'english', '', '', 0, 3834, '', '', '25.05.1956', 'Chemparuthivilai', '', '10.04.1983', '', '', 'USA', NULL, 1),
(183, NULL, 'fr-george-ponna', 'fr_ponnaiah@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. George Ponnaiah', 'l', 34, 'Fr. George Ponnaiah \r\nParish Priest  \r\nChurch of the Holy Redeemer of the World\r\nPanavilai - Mancode   \r\nTHICKANAMCODE 629 804', '9488282787', '', '1025.jpg', '', 'english', '', '', 0, 8230, 'Mr. Swaminathan Ponnaiah', 'Mrs . Maria Chellammal', '06.12.1957', 'Moolachael', 'St. Aloysius Seminary, Nagercoil. St. Peter\'s Seminary, Madurai. Papal Seminary, Pune', '10.12.1983', 'Moolachel', 'Archishop M. Arockiaswamy', 'Parish Priest		 Church of the Holy Redeemer of the World Panavilai - Mancode		', NULL, 1),
(184, NULL, 'fr-mary-john-r', 'rmaryjohn@yahoo.co.uk', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Mary John R.', 'l', 34, 'Fr. Mary John\r\nCathedral of the Most Holy Trinity\r\nThirithuvapuram\r\nKUZHITHURAI 629 163', '9443450709', '', '1026.jpg', '', 'english', '', '', 0, 3420, 'Mr. Rayappan', 'Mrs. Savariai', '28.01.1957', 'Melpuram', 'St. Aloysius Seminary, Nagercoil, St. Peter\'s Seminary, Madurai,St. Paul\'s Seminary, Trichy ', '29.04.1984', 'Assisi Campus, Nagercoil', 'Bishop M. Arokiasamy', 'Cathedral of the Most Holy Trinity Thirithuvapuram', NULL, 1),
(185, NULL, 'fr-augustine-p', 'ponaugustine@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Augustine P.', 'l', 34, 'Bishop\'s House, P.B.No: 1, Unnamalaikadai 629179, K.K. Dist, Tamilnadu.', '9486249201', '', '1027.jpg', '', 'english', '', '', 0, 30404, 'Mr. K. Ponnaian', 'Mrs. Annammal', '14.11.1958', 'Elavuvilai', 'St. Aloysius Seminary, Nagercoil, St. Paul\'s Seminary, Trichy', '14.04.1985', 'St. Xavier\'s Cathedral,Kottar', 'Bishop M. Arockiaswamy', 'Procurator of the Diocese', NULL, 1),
(186, NULL, 'fr-vincent-s', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Vincent S.', 'm', 34, '          Parish Priest,Church of Good Shepherd ,Velliavilai,Palapallam 629 159', '9444051816', '', '1028.jpg', '', 'english', '', '', 0, 1780, 'Mr. Joachim (Subakian)', ' Mrs. Rosammal', '11.08.1957 ', 'Vencode', 'St. Aloysius Seminary Nagercoil, St. Peter\'s Seminary Karumathoor, St. Paul\'s Seminary Trichy', '14.04.1985', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest, VelliaVilai', NULL, 1),
(187, NULL, 'fr-antony-m-mut', 'frmamuthu@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony M. Muthu', 'l', 34, 'Fr. Antony M. Muthu\r\nRector\r\nShrine of St. Antony’s\r\nVettuvenni\r\nMARTHANDAM  629 165', '9444688225', '', '1029.jpg', '', 'english', '', '', 0, 8072, 'Mr. Maria Siluvai', 'Mrs. Maria Isidorial', '25.08.1958', 'Mavilai, Mukkalampaddu', 'St. Peter\'s Seminary, Madurai, Sacred Heart Seminary, Poonamallee, College Studies Christ Hall, Karumathoor', '06.04.1986', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Rector Shrine of St. Antony’s Vettuvenni', NULL, 1),
(188, NULL, 'fr-elphinston-j', 'elphinj@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Elphinston Joseph J.', 'm', 34, '            Italy', '', '', '1030.jpg', '', 'english', '', '', 0, 2712, 'Mr. K.S. John', ' Mrs. P. Rajammal', '23.03.1961', 'Kandanvilai', 'St. Aloysius Seminary Nagercoil,St. Peter\'s Seminary Madurai,Christ Hall Seminary Madurai,St. Paul\'s Seminary Trichy', '26.04.1987', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Italy ', NULL, 1),
(189, NULL, 'fr-maria-arputh', 'arpyroy@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Arputham R.', 'l', 34, 'Fr. Maria Arputham\r\nParish Priest\r\nChurch of St. Antony’s\r\nThundathuvilai\r\nKARUNGAL 629 157', '9486942860', '', '1031.jpg', '', 'english', '', '', 0, 7792, 'Mr. M. Rayappan', 'Mrs. S. Mathavadial', '13.12.1955', 'Vencode', 'St. Peter\'s Seminary, Madurai.St. Paul\'s Seminary, Trichy', '26.04.1987', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest Church of St. Antony’s Thundathuvilai', NULL, 1),
(190, NULL, 'fr-maria-martin', 'singhmark@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Martin S.', 'l', 34, 'Fr. Maria Martin S.\r\nParish Priest\r\nShrine of St. Antony’s\r\nVettuvenni\r\nMARTHANDAM  629 165', '9442761150', '', '1032.jpg', '', 'english', '', '', 0, 28932, 'Mr. V. Sinkarayan', 'Mrs. T. Maria Muthu', '29.03.1960', 'Sahayanagar', 'St. Aloysius Seminary, Nagercoil,St. Peter\'s Seminary, Madurai, St. Paul\'s Seminary, Trichy', '26.04.1987', 'St. Xavier\'s Cathedral, Kottar', 'Bishop M. Arockiaswamy', 'Parish Priest Shrine of St. Antony’s Vettuvenni', NULL, 1),
(191, NULL, 'fr-joseph-jeyas', 'frjeyaseelan@gmail.com, frjeyaseelan@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Joseph Jeyaseelan S.', 'l', 34, 'Fr. S. Joseph Jeyaseelan\r\nKalai Kaviri College\r\n18-Benwells Road\r\nTRICHY 620 001', '9443118725', '', '1033.jpg', '', 'english', '', '', 0, 28014, 'Mr. M. Stanislaus', 'Mrs. Palpeenammal', '21.11.1962', 'Karenkadu', 'St. Aloysius Seminary, Nagercoil,St. Peter\'s Seminary, Madurai,Christ Hall, Karumathur,St. Paul\'s Seminary,Trichy', '04.04.1988', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev, M.Arockiasamy', 'Kalai Kaviri College 18-Benwells Road, Trichy', NULL, 1),
(192, NULL, 'fr-maria-willia', 'mahizh6218@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria William M.', 'l', 34, 'Fr. Maria William M.\r\nCorrespondent\r\nSt. Xavier’s Catholic College of Engineering\r\nChunkankadai\r\nNAGERCOIL  629 003', '9488881212', '', '1034.jpg', '', 'english', '', '', 0, 8864, 'Mr. M. Maria Soosai', 'Mrs. Mary Angel', '08.01.1962', 'Nullivilai', 'St. Aloysius Minor Seminary, Nagercoil, St. Peter\'s Madurai,Sacred Heart Seminary, Poonamallee', '29.05.1988', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Iruthayaraj,', 'Correspondent St. Xavier’s Catholic College of Engineering Chunkankadai', NULL, 1),
(193, NULL, 'fr-george-k', 'george28kamalies@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. George K.', 'l', 34, 'Fr. George K.\r\nVicar Forane\r\nVicariate of Karencadu\r\nM.K.Plaza, Nagercoil Road\r\nMONDAY MARKET  629 802', '9487643191', '', '1035.jpg', '', 'english', '', '', 0, 30492, 'Mr. Kamalies', 'Mrs. Pragacy', '06.04.1964', 'Vencode', 'St. Aloysius Seminary, Nagercoil.Sacred Heart Seminary, Poonamallee', '22.04.1990', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Vicar Forane Vicariate of Karencadu M.K.Plaza, Nagercoil Road, Monday Market', NULL, 1),
(194, NULL, 'fr-xavier-bened', 'sbenxavier@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Xavier Benedict. S', 'l', 34, 'St. Paul\'s Seminary, P.B.No: 36, Trichy - 620001', '9442456818', '', '1036.jpg', '', 'english', '', '', 0, 5252, 'Mr. S. Sathianathan', 'Mrs. Ronickal', '12.03.1964', 'Vencode', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy', '22.04.1990', 'St. Xavier\'s Cathedral, Kottar', 'Rev. Leon A. Tharmaraj', 'St. Paul\'s Seminary', NULL, 1),
(195, NULL, 'fr-gaspar-raj-m', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Gaspar Raj M. ', 'm', 34, '    Goodwill Communications Ltd., New No. 68, (Old No.150), Luz Church Road, Mylapore, Chennai 600 004', '9444072217', '', '1037.jpg', '', 'english', '', '', 0, 15540, 'Mr. Maria Paulian E.', 'Mrs. Maria Pushpam G.', '22.01.1966', 'Kanjampuram', 'St. Aloysius Seminary Nagercoil,Sacred Heart Seminary Poonamallee', '07.04.1991', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Thamizh Maiyam', NULL, 1),
(196, NULL, 'fr-russel-raj-b', 'chancellor.kuzhithurai@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Russel Raj B.', 'l', 34, 'Fr. Russel Raj B.\r\nRector\r\nMartyr Devasahayampillai Shrine\r\nNATTALAM  629 195', '9486516374', '', '1038.jpg', '', 'english', '', '', 0, 39846, 'Mr. Bhakthinathan', 'Mrs. Rajammal', '01.12.1963', 'Cheriakolla', 'St. Aloysius Seminary, Nagercoil, St. Paul\'s Seminary, Trichy', '07.04.1991', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Fr. Russel Raj B. Rector Martyr Devasahayampillai Shrine Nattalam', NULL, 1),
(197, NULL, 'fr-sebastian-f', 'mail_seba@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Sebastian F.', 'l', 34, 'Fr. Sebastian F.\r\nDirector, SIGARAM\r\n6- 96A, Johnson Tower\r\nTVM Main Road\r\nMULAGUMOODU 629 167', '9443450063', '', '1039.jpg', '', 'english', '', '', 0, 6806, 'Mr. A. Francis', 'Mrs. Mary John', '15.05.1966', 'Kulavilai, Konamcadu', 'St. Aloysius Seminary, Nagercoil Sacred Heart Seminary, Poonamallee', '26.04.1992', ' St. Xavier\'s Cathedral, Kottar', ' Most Rev. Leon A.Tharmaraj', 'SIGARAM', NULL, 1),
(198, NULL, 'fr-sekhar-micha', 'sekharmichael@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Sekhar Michael', 'l', 34, 'Fr. Sekhar Michael\r\nParish Priest\r\nChurch of Our Lady of Perpetual Help\r\nKOOTTAMAVU  629 167', '9487422061', '', '1040.jpg', '', 'english', '', '', 0, 4738, 'Mr. K. Savarimuthu', 'Mrs. S. Kamala Josephine', '14.11.1966', 'Thuckalay', 'St. Aloysius Seminary Nagercoil (1984 1986), Christ Hall Seminary Karumathoor(1986 1987)', '26.04.1992', ' St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of Our Lady of Perpetual Help, Kuttamavu', NULL, 1),
(199, NULL, 'fr-maria-selvar', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Selvaraj S.', 'm', 34, '  ', '9443993323', '', '1041.jpg', '', 'english', '', '', 0, 5160, '', '', '13.05.1959', 'Mukkalampadu', '', '19.12.1992', '', '', '', NULL, 1),
(200, NULL, 'fr-maria-susai-', 'mariasusaimari@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Susai P.', 'l', 34, 'Fr. Maria Susai P.\r\nParish Priest\r\nChurch of Kallithattu St. Antony\r\nKAPPUCADU 629 162', '9443208639', '', '1042.jpg', '', 'english', '', '', 0, 4478, 'Mr. Ponnaiyan', 'Mrs. Dasammal', '18.05.1961', 'Melpalai', 'St. Aloysius Minor Seminary, Nagercoil(1978),St. Pauls Seminary, Trichy (1979 1982)', '15.04.1993', 'Jerusalam, Trichy', 'Most Rev. Thomas Fernando', 'Parish Priest,church of Kallithattu, Kappu Kadu', NULL, 1),
(201, NULL, 'fr-dominic-kada', 'dominickdhas@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Dominic Kadatcha Dhas M.', 'l', 34, 'Fr. Dominic Kadatcha Dhas M.\r\nParish Priest\r\nChurch of Our Lady of Nativity\r\nMULAGUMOODU 629 167', '9442383119', '', '1043.jpg', '', 'english', '', '', 0, 8870, 'Mr. Moses Motcha Dhas', 'Mrs. Gnana Retna Bai', '10.04.1967', 'Thundathuvilai', 'Christ Hall Karumathoor,St. Paul\'s Seminary Trichy', '18.04.1993', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Church of Our Lady of Nativity Mulagumoodu', NULL, 1),
(202, NULL, 'fr-john-michel-', 'michael_raj2000@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. John Michel Raj M.', 'l', 34, 'Fr. John Michael Raj M.\r\nExecutive Director - KIDSS\r\nTHEDAL, 10/8-46C\r\nBridge Ward, Near Fire Station\r\nKUZHITHURAI 629 163\r\n Parish Priest, Church of St. Antony,Cherukol,Karumputhottam, Kattathurai 629 158', '9443129831', '', '1044.jpg', '', 'english', '', '', 0, 6394, 'Mr. M.A. Malayappan', 'Mrs. Swarnam', '11.10.1967', 'Mulavilai', 'St. Aloysius Seminary, Nagercoil 1984 1985,Philosophy Christ Hall, Madurai 1985 1988,Theology St. Paul\'s, Trichy 1989 1993', '18.04.1993', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Cherukol, Director KIDSS', NULL, 1),
(203, NULL, 'fr-steephen-c', 'chellan.ste@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Steephen C.', 'l', 34, 'Fr. Steephen C.\r\nAnugragha\r\nAnimation Centre\r\nNochiodaipatti\r\nDINDIGUL 624 003', '9443134495', '', '1045.jpg', '', 'english', '', '', 0, 37292, 'Mr. Chellan', 'Mrs. Therasammal', '04.04.1966', 'Kolvel', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Sacred Heart Seminary Poonamallee', '10.04.1994', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Anugragha Animation Centre Nochiodaipatti, Dindigul', NULL, 1),
(204, NULL, 'fr-benedict-m-d', 'franelin@rediffmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Benedict M.D. Anelin', 'l', 34, 'Fr. Benedict M.D. Anelin\r\nParish Priest\r\nChurch of Sacred Heart of  Jesus\r\nPALLIYADY  629 169', '9443416414', '', '1046.jpg', '', 'english', '', '', 0, 8064, 'Mr. J. Maria Dhasan', 'Mrs. R. Leela', '21.04.1968', 'Thuckalay', 'St. Aloysius Seminary, Nagercoil, Arul Anandar College, Karumathor, Theology St. Paul\'s, Trichy', '23.04.1995', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Church of Sacred Heart of  Jesus Palliady', NULL, 1),
(205, NULL, 'fr-benjamin-d', 'benjaminkottar@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Benjamin D.', 'l', 34, 'Fr. Benjamin D.\r\nVicar Forane\r\nVencode Vicariate Office\r\nMatha Building, Thengapattinam Road\r\nPUTHUKADAI 629 171', '9443595872', '', '1047.jpg', '', 'english', '', '', 0, 62638, 'Mr. Davidson', 'Mrs. Ganapragasi', '02.02.1968', 'Cherikkadai', 'St. Aloysius Seminary, Nagercoil, Arulanandar College, Karumathoor, Theology St. Paul\'s Seminary, Trichy', '23.04.1995', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Vicar Forane Vencode Vicariate Office Matha Building, Thengapattinam Road, Puthukadai', NULL, 1),
(206, NULL, 'fr-david-michae', 'frdavidmichael@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. David Michael M. ', 'm', 34, '  USA', '9442312212', '', '1048.jpg', '', 'english', '', '', 0, 5998, 'Mr. Maria Michael V.', 'Mrs. Mary Archangel M.', '20.09.1967', 'Madathattuvilai', 'St. Aloysius Seminary Nagercoil,Philosophy Sacred Heart  Poonamallee,Theology Sacred Heart Poonamallee', '23.04.1995', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'USA', NULL, 1),
(207, NULL, 'fr-antony-willi', 'fantonywilliam@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony William F.', 'l', 34, 'USA', '00000000', '', '48101913c9cb99e9adada3378f2f3e9d.jpg', '', 'english', '', '2020-02-21 23:44', 0, 34606, 'S.R. Francis', 'V. Maria Rosammal', 'February 8', 'Mallanvilai', 'St. Paul, Tiruchirappalli', '14.04.1996', '', '', 'USA', NULL, 1),
(208, NULL, 'fr-gelastin-ger', 'aggerald@rediffmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Gelastin Gerald A.', 'l', 34, 'Fr. Gelastin Gerald A.\r\nParish Priest\r\nChurch of Ascension of Our Lord\r\nR. C Street\r\nTHIRUVITHANCODE 629 174', '9442730307', '', '1050.jpg', '', 'english', '', '', 0, 61818, 'Mr. A. Antonypillai', 'Mrs. C. Annammal', '09.03.1968', 'Puthenkadai', 'St. Aloysius\' Seminary, Nagercoil Philosophy Arulananthar Karumathoor,Theology St. Paul\'s, Trichy', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of Ascension of Our Lord R. C Street, Thiruvithancode', NULL, 1),
(209, NULL, 'fr-jayaprakash-', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jayaprakash S.', 'm', 34, '            Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai, Nagercoil - 629003', '9443011181', '', '1051.jpg', '', 'english', '', '', 0, 1012, 'Mr. Singarayan', 'Mrs. Nesammal', '20.02.1969', 'Thundathuvilai', 'St. Aloysius\' Minor Seminary, Nagercoil,Philosophy Christ Hall, Karumathoor,Theology St. Paul\'s Seminary, Trichy', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Corresspondant, St. Xavier\'s Catholic College of Nursing, Chunkankadai', NULL, 1),
(210, NULL, 'fr-jose-robinso', 'nanjilsrobin@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jose Robinson S.K.', 'l', 34, 'Fr. Jose Robinson S.K.\r\nChurch of Our Lady of Nativity\r\nMULAGUMOODU 629 167', '9486377227', '', '1052.jpg', '', 'english', '', '', 0, 7804, 'Mr. S. Singarayan', 'Mrs. C. Kamalam', '10.09.1969', 'Thundathuvilai', 'St. Aloysius Seminary, Nagercoil,Philosophy Papal Seminary, Pune,Theology Papal Seminary, Pune', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Church of Our Lady of NativityNanjil, Mulagumoodu Career Academy ', NULL, 1),
(211, NULL, 'fr-martin-n', 'martinkottar@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Martin N.', 'l', 34, 'Diocese of Kuzhithurai\r\nBishop’s House,\r\nP.B. No.1\r\nUnnamalaikadai – 629171\r\nK.K.Dist, Tamil Nadu', '9442653803', '', '1053.jpg', '', 'english', '', '', 0, 4842, 'Mr. Neelakandan Asari', 'Mrs. Monica (Kolammal)', '22.05.1967', 'Pacode', 'St. Aloysius, Nagercoil, Philosophy ChristHall,Karumathoor Theology St. Paul\'s, Trichy', '14.04.1996', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Secretary to Bishop', NULL, 1),
(212, NULL, 'fr-callistus-m', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Callistus M. ', 'm', 34, '<div>Parish Priest,Church of Imm. Heart of Mary,Amsi, Maniaramkuntu,Thengapattanam 629 173<br></div>', '9443607766', '', '1054.jpg', '', 'english', '', '', 0, 5504, 'Mr. Maria Sebastian A.', 'Mrs. Maria Nesam', '05.01.1965', 'Kuzhivilai', 'Karumathur  Minor Seminary, Kumbakonam  Philosophy Christ Hall, Karumathoor Arulananthar College, Karumathoor Theology Morning Star College, Calcutta', '22.04.1996', 'Kuzhivilai', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Amsi', NULL, 1),
(213, NULL, 'fr-gnanamuthu-v', 'vgnana2002@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Gnanamuthu V.', 'l', 34, 'Fr. Gnanamuthu V.\r\nSt. Paul\'s Seminary\r\nP.B. No. 36\r\nTRICHY 620 001', '9489264680', '', '1055.jpg', '', 'english', '', '', 0, 4856, 'Mr. Varuvel', 'Mrs. Rosammal', '22.05.1968', 'Pullani', 'St. Aloysius, Nagercoil 1988,Philosophy Christ Hall, 1993 Karumathoor,Theology St. Paul\'s, Trichy 1997 ', '06.04.1997', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'St. Paul\'s Seminary', NULL, 1),
(214, NULL, 'fr-anthireya-al', 'frandrew.1960@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Anthireya alias Andrew D.', 'l', 34, 'Church of St. Francis Xavier, kuzhivilai, Prakadai, Kappiarai - 629156', '9443415475', '', '1056.jpg', '', 'english', '', '', 0, 13562, 'Mr. Devasahayam', 'Mrs. Chellammal', '22.11.1959 ', 'Themanoor', 'Philosophy Dharmaram, Bangalore Theology Dharmaram, Bangalore,', '19.04.1998', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kuzhivilai', NULL, 1),
(215, NULL, 'fr-antony-jeya-', 'santonyjeya@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony Jeya S.', 'l', 34, 'USA', '9442831807', '', '1057.jpg', '', 'english', '', '', 0, 2040, 'Mr. Siluvai Rayan', 'Mrs. Lourdu Mary', '11.08.1970', 'Konamcadu', 'St. Aloysius\' Seminary, Nagercoil, Philosophy Christ Hall Seminary, Karumathur, Theology Sacred Heart, Poonamallee', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'USA', NULL, 1),
(216, NULL, 'fr-jeya-kumar-g', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jeya Kumar G.', 'm', 34, '  Parish Priest, Church of St. Sebastian, Madathattuvilai', '9487688033', '', '1058.jpg', '', 'english', '', '', 0, 7562, 'Mr. Gnanapragasam', 'Mrs. Maria Pushpam', '24.09.1971', 'Pallavilai (Pattarivilai)', 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall Seminary , Karumathoor,Theology St. Paul\'s Seminary, Trichy ', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Madathattuvilai', NULL, 1),
(217, NULL, 'fr-maria-rajend', 'rajendranmaria@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Rajendran S.', 'l', 34, 'Fr.  S. Maria Rajendran\r\nRector\r\nMartyr Devasahayampillai  Shrine\r\nPuliyoorkurichy\r\nTHUCKALAY  629 175\r\nFr. Maria Rajendran S.\r\nVicar Forane\r\nVicariate of Mulagumoodu\r\nUdhaya Tharagai, Near Matha Kurusady\r\nTHUCKALAY 629 175', '9443606008', '', '1059.jpg', '', 'english', '', '', 0, 90162, 'Mr. Savariar Adimai', 'Mrs. Theresammal', '14.05.1969', 'Mathiravilai', 'St. Aloysius Seminary, Nagercoil,Philosophy Christ Hall, Karumathur ,Theology Sacred Heart, Poonamallee', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Vicar Forane Mulagumoodu', NULL, 1),
(218, NULL, 'fr-paul-richard', 'paulrichardjoseph@hotmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Paul Richard Joseph R.', 'l', 34, 'Fr. Paul Richard Joseph R.\r\nParish Priest\r\nChurch of St. Gabriel the Archangel\r\nTHICKURICHY 629 168', '9443693505', '', '1060.jpg', '', 'english', '', '', 0, 3872, 'Mr. Rayappan', 'Mrs. Mary Leela', '10.03.1972', 'Palliady', 'St. Aloysius Seminary, Nagercoil', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of St. Gabriel the Archangel, Thickurichy', NULL, 1),
(219, NULL, 'fr-robert-benni', 'frmrbenni@yahoo.co.in,  frmrbenni@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Robert Benni M.', 'm', 34, '          Parish Priest, Church of St. Little Flower, Chetticharvilai', '9443808823', '', '1061.jpg', '', 'english', '', '', 0, 3158, 'Mr. Sahaya Marcose', 'Mrs. Saral Mary', '06.05.1971', 'Mylacode', 'St. Aloysius Seminary, Nagercoil,  Philosophy Christ Hall, Karumathoor,  Theology St. Paul\'s, Trichy 1998', '11.04.1999', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Chetticharvilai', NULL, 1),
(220, NULL, 'fr-manohim-xavi', 'frmano2010@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Manohim Xavier F.', 'l', 34, 'Fr. Manohiam Xavier F.\r\nParish Priest\r\nChurch of St. Francis Xavier\r\nMuttaicadu\r\nKUMARAPURAM  629 189', '9443579345', '', '1062.jpg', '', 'english', '', '', 0, 24972, 'Mr. A.R. Francis', 'Mrs. Rajammal', '28.06.1972', 'Mathiravilai', 'St. Aloysius\' Minor Seminary, Nagercoil,Philosophy Christ Hall Seminary, Karumathur,St. Pauls\' Seminary, Trichy', '30.04.2000', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest, Church of St. Francis Xavier, Muttaicadu, Correspondent Trinity School & Asst. Director Nanjil Milk Plant', NULL, 1),
(221, NULL, 'fr-leo-alex-a', 'frleoalex2000@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Leo Alex A.', 'l', 34, 'Fr. Leo Alex A.\r\nThirukalyana Madha Shrine\r\nPOTHAKALAN VILAI 628 702\r\nThoothukudi Dt.', '9443595664', '', '1063.jpg', '', 'english', '', '', 0, 13400, 'Mr. Ambrose', 'Mrs. Annammal', '01.08.1970', 'Nagacode', 'St. Aloysius\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Paul\'s Seminary, Trichy', '27.12.2000', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Thirukalyana Madha Shrine, Pothakalan Vilai, Thoothukudi', NULL, 1),
(222, NULL, 'fr-p-sahaya-dha', 'dhasu.saha@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. P. Sahaya Dhas.', 'l', 34, 'Fr. Sahaya Dhas P.\r\nParish Priest\r\nChurch of St. Antony’s\r\nVattam\r\nTHIRUVITHANCODE  629 174', '9487422704', '', '1064.jpg', '', 'english', '', '', 0, 31888, 'Mr. Pathrose', 'Mrs. Retna Bai', '22.11.1972', 'Kandanvilai', 'St. Aloysius\' Seminary, Nagercoil Christ Hall Seminary, Karumathur St. Paul\'s Seminary, Trichy', '27.12.2000', ' St. Xavier\'s Cathedral, Kottar', ' Most Rev. Leon A.Tharmaraj', 'Parish Priest Church of St. Antony’s Vattam', NULL, 1),
(223, NULL, 'fr-christopher-', 'frchristo_rexputh@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Christopher S.', 'l', 49, 'Fr. Christopher S.\r\nBishop\'s House, P.B.No. 1\r\nUnnamalaikadai - 629179\r\nMarthandam\r\nKanyakumari District, Tamil Nadu.', '9443118067', '', '2a462ed85605a9f290d0981eba246a41.jpg', '', 'english', '', '2022-09-02 07:05', 0, 7122, 'Mr. Siluvai Rayan', 'Mrs. Jesu Mary', '08.04.1973', 'Karenkadu', 'St. Aloysius\' Minor Seminary, Nagercoil, Sacred Heart, Poonamallee', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Bishop\'s House', NULL, 1),
(224, NULL, 'fr-isaac-raj-r', 'frisaacraj@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Isaac Raj R.', 'l', 34, 'Fr. Isaac Raj\r\nParish Priest\r\nChurch of Assumption of Our Lady\r\nMelpalai\r\nEDAICODE  629 152', '8903253253', '', '1066.jpg', '', 'english', '', '', 0, 6220, 'Mr. Rayappan', 'Mrs. Rethna Bai', '05.05.1971', 'Kappiyarai', 'St. Aloysius\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathur,St. Paul\'s Seminary, Trichy', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest Church of Assumption of Our Lady Melpalai', NULL, 1),
(225, NULL, 'fr-maria-vincen', 'frmariavincent@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Vincent A.', 'm', 34, '          Parish Priest,Church of St. Eusthachius,<br>Packiapuram,Arumanai 629 151', '8903476560', '', '1067.jpg', '', 'english', '', '', 0, 8868, 'Mr. Alangaram (Late)', 'Mrs. Ronickam', '12.03.1957', 'Thuckalay', 'St. Aloysius\' Minor Seminary, Nagercoil  St.Pauls, Trichy', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest,Packiapuram', NULL, 1),
(226, NULL, 'fr-victor-v', 'victor_priest@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Victor V.', 'l', 34, 'Fr. Victor V.\r\nParish Priest\r\nChurch of St. Aloysius Gonzaga\r\nKARENCADU 629 809', '9443500408', '', '1068.jpg', '', 'english', '', '', 0, 30052, 'Mr. Varuvel', 'Mrs. Santhai', '17.04.1973', 'Pacode', ' St. Aloysius Seminary Nagercoil,Christ Hall Seminary Karumathur,Sacred Heart Poonamallee .', '22.04.2001', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of St. Aloysius Gonzaga, Karencadu', NULL, 1),
(227, NULL, 'fr-bright-simsa', ' ', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Bright Simsa Raj A. ', 'm', 34, '        Church of the Holy Guardian Angels, Melpuram, Pacode 629 168', '9443692480', '', '1069.jpg', '', 'english', '', '', 0, 7128, 'Mr. A. Antony Muthu', 'Mrs. A. Agnes', '31.07.1971', 'Kallukoottam', 'St. Aloysius\' Seminary, Nagercoil  Christ Hall Seminary, Karumathur St. Paul\'s Seminary, Trichy', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Melpuram', NULL, 1),
(228, NULL, 'fr-densingh-m', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Densingh M. ', 'm', 34, '              Church of St. Antony, Valvachakostam, Kunnamparai, kattathuirai- 629158', '9443500655', '', '1070.jpg', '', 'english', '', '', 0, 10156, 'Mr. Muthaiah N.S.', 'Mrs. Rosammal ', '23.05.1962', 'Mathicode Sahayanager', 'St. Aloysius\' Minor Seminary Nagercoil,St. Joseph\'s Mangalore', '07.04.2002', 'St.Francis Xavier Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Soosaipuram', NULL, 1),
(229, NULL, 'fr-dominic-savi', 'frvsavio@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Dominic Savio V.', 'l', 34, 'Fr. Dominic Savio V.\r\nParish Priest\r\nChurch of St. Roach\r\nArockiapuram\r\nNEYYOOR  629 802', '9443483466', '', '1071.jpg', '', 'english', '', '', 0, 21936, 'Mr. Varghese M.S', 'Mrs. Jesu Retnam A.', '12.05.1975', 'Madathattuvilai', 'St. Aloysius\' Seminary Nagercoil,St. Joseph\'s Seminary Mangalore, Paul Seminary Pune', '07.04.2002', 'St. Francis Xavier Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Parish Priest Church of St. Roach Arockiapuram', NULL, 1),
(230, NULL, 'fr-jerald-justi', 'frjervy02@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jerald Justin D.', 'l', 34, 'Fr. Jerald Justin D.\r\nManaging Director\r\nNanjil Milk Plant\r\nMULAGUMOODU  629 167', '9442079448', '', '1072.jpg', '', 'english', '', '', 0, 11762, 'Mr. R. Deva Sahayam R.', 'Mrs. R.Theresammal', '19.01.1970', 'Kallukoottam', 'Sacred Heart, Poonamalle', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Managing Director, Nanjil Milk Plant', NULL, 1),
(231, NULL, 'fr-sujan-kumar-', 'frsujankumar13@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Sujan Kumar D.M.', 'l', 34, 'Fr. Sujan Kumar D. M.\r\nLittle Flower Mission Centre\r\nBharathiyar University (P.O)\r\nCOIMBATORE 641 046', '9486473063', '', '1073.jpg', '', 'english', '', '', 0, 996, 'Mr. J. Devanesan', 'Mrs. A. Maria Rose (Late)', '13.06.1972', 'Kanjampuram', 'St. Aloysius\' Seminary, Nagercoil, St. Paul\'s, Trichy', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study', NULL, 1),
(232, NULL, 'fr-wiselin-xavi', 'frwiselinxavier2015@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Wiselin Xavier. E', 'l', 34, 'Fr. Wiselin Xavier E.\r\nParish Priest\r\nChurch of O.L of Mount Carmel\r\nKolvel \r\nTHIRUVARAMPU 629 161', '9443607097', '', '1074.jpg', '', 'english', '', '2020-04-03 09:10', 0, 5458, 'Mr. A. Elias (Late)', 'Mrs. Rajam', '28.10.1973', 'Vellicode', 'St. Aloysius Seminary, Nagercoil,St. Paul\'s Seminary, Trichy', '07.04.2002', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kolvel, Editor - \"Puthiya Thedal\" ', NULL, 1),
(233, NULL, 'fr-romeric-thad', 'frthadeus@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Romeric Thadeus K.M.', 'l', 34, 'Fr. Romeric Thatheyus\r\nParish Priest\r\nChurch of St. Michael\r\nMylacode, Alencode\r\nNEYYOOR  629 802\r\n Parish Priest,Church of St. Francis Xavier, Mankuzhy ,Neyyoor 629 802', '8903901169', '', '1075.jpg', '', 'english', '', '', 0, 9326, 'P. Kulandai Swamy', 'K. Crispina Mary', '08.12.1970', 'Ramanathichenputhur', 'For Philosopy, Trinity College, Jalandhar, Punjab for Theolory, Papal Seminary Pune', '27.04.2003', 'St. Xavier\'s Cathedral, Kottar', 'Bishop Leon A. Tharmaraj', 'Parish Priest Church of St. Michael Mylacode, Alencode', NULL, 1),
(234, NULL, 'fr-thatheu-leon', 'frthatheu@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Thatheu Leon Jose A.S.', 'm', 34, '          Parish Priest, Church of Our Lady of Perpetual Succor, Kootamavu, Mulagumoodu - 629167', '9442076599', '', '1076.jpg', '', 'english', '', '', 0, 1712, 'Mr. Selva Mony', 'Mrs. Amalorpavam', '11.07.1973', 'Kuzhivilai, Mulagumoodu', 'St. Aloysius\' Seminary Nageroil,Theology : St. Paul\'s Trichy,Philosophy : Christ Hall  Karumathoor.', '27.04.2003', ' St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Kootamavu ', NULL, 1),
(235, NULL, 'fr-george-eugin', 'george.eugeneraj@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. George Eugin Raj A', 'm', 34, '  ', '9442301467', '', '1077.jpg', '', 'english', '', '', 0, 10082, 'Mr. S. Antony', 'Mrs. D. Alphonsal', '20.06.1977', 'Elanthavilai', 'St. Aloysius\' Seminary , Nagercoil.St. Pius College, Mumbai.', '18.04.2004', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Study, Germany', NULL, 1),
(236, NULL, 'fr-robert-john-', 'revrojokennedy@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Robert John Kennedy G.', 'l', 34, 'Fr. Robert John Kennedy G.\r\nParish Priest\r\nChurch of St. Antony’s\r\nChemparuthivilai\r\nMEKKAMANDAPAM   629 166', '8903417068', '', '1078.jpg', '', 'english', '', '', 0, 4096, 'Mr. George', 'Mrs. Mary Ritammal', '31.08.1974', 'Kandanvilai', 'St. Aloysius\' Seminary , Nageroil, St. Joseph\'s Seminary, Mangalore', '18.04.2004', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of St. Antony’s Chemparuthivilai', NULL, 1),
(237, NULL, 'fr-suresh-kumar', 'sureshmlg1977@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Suresh Kumar P.', 'm', 34, 'Church of O.L.of Good Health Munchirai', '9443164272', '', '1079.jpg', '', 'english', '', '', 0, 6284, 'Mr. Pankiraj A.', 'Mrs. Annammal C.', '16.02.1977', 'Mulagumoodu', 'St. Aloysius\' Seminary Nageroil, Papal Seminary Pune', '18.04.2004', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Corporate Manager', NULL, 1),
(238, NULL, 'fr-xavier-sunda', 'sundarxavier@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Xavier Sundar. A', 'l', 34, 'Fr. Xavier Sundar\r\nParish Priest\r\nChurch of St. Francis Xavier\r\nYettacode\r\nVEEYANOOR 629 177', '9443681899', '', '1080.jpg', '', 'english', '', '', 0, 4748, 'Savaria Pitchai', 'Philominal', '05.06.1972', 'Aral Arockia Nagar', 'St.Paulin', '18.04.2004', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of St. Francis Xavier Yettacode', NULL, 1),
(239, NULL, 'fr-chandra-seka', 'chandracpsekar@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Chandra Sekar C.P. ', 'm', 34, '      USA', '9443559724', '', '1081.jpg', '', 'english', '', '', 0, 3528, 'Mr. Paul Raj C.', 'Mrs. Thanga Bai', '31.07.1977', 'Chentharai', 'St. Aloysius\' Seminary, Nagercoil  Arulanandar College, Karumathur  Christ Hall, Karumathur  St. Paul\'s Seminary, Trichy', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'USA', NULL, 1),
(240, NULL, 'fr-godwin-sound', 'godsrajm@yahoo.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Godwin Soundar Raj M.', 'l', 34, 'Fr. Godwin Sounder Raj M.\r\nParish Priest\r\nChurch of the Good Shepherd\r\nNallayanpuram\r\nPALUGAL 629 170', '9487064600', '', '1082.jpg', '', 'english', '', '', 0, 4862, 'Mr. Maria Antony', 'Mrs. Cecily', '21.01.1977', 'Mankuzhy', 'St. Aloysius\' Seminary , Nageroil,Papal Seminary , Pune ,', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Church of the Good Shepherd Nallayanpuram', NULL, 1),
(241, NULL, 'fr-jegan-bose-u', 'frjbose@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jegan Bose U.', 'm', 34, '        Rome&nbsp;', '9486533218', '', '1083.jpg', '', 'english', '', '', 0, 5166, 'Mr. Uttaria Muthu M.', 'Mrs. Mary Vincent S.', '21.04.1977', 'Nullivilai', 'St. Aloysius\' Seminary , Nageroil,Papal Seminry, Pune, St.Pauls, Trichy', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A.Tharmaraj', 'Study, Rome', NULL, 1),
(242, NULL, 'fr-john-francis', 'frjohnfranchis@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. John Francis M.', 'l', 34, 'Fr. John Francis M.\r\nSt. Michael’s  Shrine\r\nPuliyoorkurichy\r\nTHUCKALAY 629 175', '9842928612', '', '1084.jpg', '', 'english', '', '', 0, 3334, 'Mr. Mathias V.', 'Mrs. Maria Pushpam Y', '12.09.1977', 'Vencode', 'St. Aloysius\' Seminary , Nageroil,Christ Hall, Karumathur,St. Paul\'s Seminary, Trichy', '03.04.2005', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Rest', NULL, 1),
(243, NULL, 'fr-eckermens-mi', 'fr.eckermens@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Eckermens Michael M.', 'l', 34, 'Fr. Eckermans Michael\r\nParish Priest\r\nParaloga Matha Church\r\nParamanvilai\r\nPADANTHALUMOODU 629 163', '9360331148', '', '1085.jpg', '', 'english', '', '', 0, 2262, 'Mr. Michael', 'Mrs. Mary Margaret Michael ', '28.01.1976', 'Madathattuvilai', 'St. Aloysius\' Seminary Nageroil,St. Pius College Mumbai ', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest Paraloga Matha Church Paramanvilai', NULL, 1),
(244, NULL, 'fr-maria-thomas', 'maustindiaz@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Thomas Austin M.', 'm', 34, '  ', '9597779546', '', '1086.jpg', '', 'english', '', '', 0, 3108, 'Mr. Michael Pillai', 'Mrs. Pushpa Virgin', '21.04.1979', 'Mdavilagam - Marthandamthurai', 'St. Aloysius\' Seminary , Nageroil, Christ Hall, Karumathur,Sacred Heart Seminary, Poonamallee ', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Leave', NULL, 1);
INSERT INTO `users` (`userID`, `facebookUID`, `userName`, `email`, `password`, `RS`, `level`, `full_name`, `gender`, `age`, `address`, `mobile`, `bio`, `photo`, `cover`, `language`, `register_since`, `last_login`, `status`, `visits_count`, `pr_father_name`, `pr_mother_name`, `pr_birth_date`, `pr_birth_place`, `pr_seminary`, `pr_ordination_date`, `pr_place_ordination`, `pr_ordination_by`, `pr_parish`, `access_user`, `pr_type`) VALUES
(245, NULL, 'fr-primas-singh', 'frprimas@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Primas Singh M.', 'l', 34, 'Fr. Primas Singh M.\r\nCorrespondent\r\nMorning Star Polytechnic College\r\nChunkankadai\r\nNAGERCOIL  629 003', '9486178919', '', '1087.jpg', '', 'english', '', '', 0, 4568, 'Mr. Maria Rethna George', 'Mrs. Selvi Mary', '24.03.1979', 'Mukkalampadu', 'St. Aloysius\' Seminary Nageroil, Papal Seminary Pune', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Correspondent, Morning Star Polytechnic College, Chunkankadai', NULL, 1),
(246, NULL, 'fr-pushpa-raj-a', 'frpushpa197@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Pushpa Raj A.', 'l', 34, 'Fr. Pushpa Raj A.\r\nParish Priest\r\nChurch of St. Antony’s\r\nPalavilai\r\nKUZHITHURAI  629 163', '9486325298', '', '1088.jpg', '', 'english', '', '', 0, 14070, 'Mr. Asirvatham D.', 'Mrs. Rajammal A.', '01.10.1974', 'Thumbaly', 'St. Aloysius\' Seminary , Nageroil Krishu Jyothi College, Bangalore', '23.04.2006', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Leon A. Tharmaraj', 'Parish Priest, Church of St. Antony’s Palavilai', NULL, 1),
(247, NULL, 'fr-arockia-shel', 'frshelleyrose@hotmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Arockia Shelly Rose A.M. ', 'm', 34, '        Cathedral of the Most Holy Trinity,Thirithuvapuram,Kuzhithurai 629 163', '9487251004', '', '1089.jpg', '', 'english', '', '', 0, 9024, 'Mr. Ambrose P.', 'Mrs. Mary Elizabeth', '17.04.1978', 'Iruthayapuram', 'St. Aloysius\' Seminary , Nagercoil, St. Paul\'s Seminary, Trichy', '15.04.2007', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Tiruthuvapuram', NULL, 1),
(248, NULL, 'fr-benny-l', 'fr.bennyl@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Benny L.', 'l', 34, 'Fr. Benny L.\r\nParish Priest\r\nChurch of St. Theresa of Child Jesus\r\nManchakonam\r\nTHIRPARAPPU 629 161', '9578120866', '', '1090.jpg', '', 'english', '', '', 0, 77380, 'Mr. Lucas', 'Mrs. Jalarthacy', '02.10.1975', 'Puthenkadai', 'St. Aloysius\' Seminary , Nagercoil,Christ Hall Seminary, Karumathur,Sacred Heart Seminary, Poonamalle', '15.04.2007', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Parish Priest, Manjakonan, Vicar Forane (Puthenkadai)', NULL, 1),
(249, NULL, 'fr-godwin-selva', 'godwin411@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Godwin Selva Justus S.', 'l', 34, 'Fr. Godwin Selva Justus\r\nChurch of St. Joseph’s\r\nValanoor \r\nCHATHANCODE 629 153', '9486910526', '', '1091.jpg', '', 'english', '', '', 0, 7398, 'M. Selva Raj', 'Marianthony', '04.11.1979', 'Alenchy', 'St. Aloysius\' Seminary , Nagercoil. Christ Hall, Karumathoor. Papal Seminary Pune', '15.04.2007', 'St. Xavier\'s Cathedral, Kottar', 'Most Rev. Edward Francis', 'Church of St. Joseph’s Valanoor, Chathancode', NULL, 1),
(250, NULL, 'fr-arockia-jose', 'arockia1978jose@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Arockia Jose G. ', 'm', 34, '        Italy', '', '', '1092.jpg', '', 'english', '', '', 0, 7834, 'Mr. Gnanasigamoni', 'Mrs. Roselet Mary', '09.06.1978', 'Konnakuzhivilai', 'St. Aloysius\' Seminary, Nagercoil, St. Pius College, Mumbai', '19.04.2009', 'St. Francis Xavier\'s Cathedral, Kottar', '', 'Studies, Italy', NULL, 1),
(251, NULL, 'fr-geo-giltus-g', 'frgeogkuz@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Geo Giltus G.', 'm', 34, '          Church of St.  Antony, Vellayambalam, Puthukadai 629 171', '9486671566', '', '1093.jpg', '', 'english', '', '', 0, 4420, 'Mr. George Maria Arputham', 'Mrs. Barbara', '18.02.1974', 'Pandaravilai Kandanvilai', 'MSS.CC Bangalore, Dharmaram College Bangalore, St. Paul\'s Seminary Trichy', '19.04.2009', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest,Vellayambalam', NULL, 1),
(252, NULL, 'fr-gilbert-ling', 'fr.lingson@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Gilbert Lingson V.', 'l', 34, 'Fr. Gilbert Lingson V.\r\nParish Priest\r\nChurch of St. Antony’s\r\nMullanganavilai\r\nKARUNGAL  629 157', '7373354728', '', '1094.jpg', '', 'english', '', '', 0, 8518, 'Mr. Varuvel', 'Mrs. Mary Rethinam', '07.07.1976', 'Appattuvilai', 'St. Aloysius\' Seminary, Nagercoil.Christ Hall Seminary, Karumathur.St. Paul\'s Seminary, Trichy', '19.04.2009', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Church of St. Antony’s, Mullanganavilai', NULL, 1),
(253, NULL, 'fr-andrews-v', 'joyandrewson27@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Andrews V.', 'l', 34, 'Fr. Andrews V.\r\nParish Priest\r\nChurch of Our Lady of Sorrows\r\nVellicode\r\nMULAGUMOODU  629 167', '9443159308', '', '1095.jpg', '', 'english', '', '', 0, 1422, 'Mr. Varghese', 'Mrs. Maria Thangam A.', '15.09.1981', 'Appattuvilai', 'St. Aloysius\' Seminary, Nagercoil, Christ Hall Seminary, Karumathur, St. Paul\'s Seminary, Trichy', '18.04.2010', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Church of Our Lady of Sorrows Vellicode MULAGUMOO', NULL, 1),
(254, NULL, 'fr-jokens-a', 'jokinsantorony@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jokens A.', 'l', 40, 'Fr. Jokens A.\r\nParish Priest\r\nChurch of Our Lady of Fatima\r\nKALLUKKOOTTAM 629 802', '9442858706', '', '1096.jpg', '', 'english', '', '2020-01-06 20:32', 0, 14168, 'Mr. Antony R.', 'Mrs. Ronickam A.', '15.02.1979 ', 'Chemparuthivilai', 'St. Aloysius\' Seminary, Nagercoil,St. Joseph\'s Seminary, Mangalore', '18.04.2010', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Kallukoottam', NULL, 1),
(255, NULL, 'fr-titus-mohan-', 'titusmohan@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Titus Mohan M.', 'l', 35, 'Fr. Titus Mohan M.\r\nParish Priest\r\nChurch of Our Lady of Perpectual Help                                                                   \r\nSahayanagar\r\nPALAPALLAM  629 159', '9443447814', '', '1097.jpg', '', 'english', '', '2019-04-16 00:21', 0, 10166, 'Mr. Maria Alphonse S.', 'Mrs. Yesumarial D. ', '17/06/1983', 'Chemparuthivilai ', 'St. Aloysius\' Seminary Nagercoil, Christ Hall Seminary Karumathur,Papal Seminary Pune ', '11.12.2011', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Sahaya Nagar', NULL, 1),
(256, NULL, 'fr-shine-s', 'fr.shinekottar@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Shine S.', 'l', 34, 'Fr. Shine S.\r\nParish Priest\r\nSt. Fathima Church\r\nFathimapuram\r\nKOLLENCODE 629 160', '9952862474', '', '1098.jpg', '', 'english', '', '', 0, 34404, 'Mr. Simon S.P.', 'Mrs. Maria Pushpam', '02/10/1984', 'Kalaiakkavilai', 'St. Aloysius\' Seminary Nagercoil, Arulanandar College Madurai, St. Paul\'s Seminary Trichy', '15.12.2012', 'St. Francis Xavier\'s Cathedral, Kottar', ' Most Rev. Peter Remigius', 'Parish Priest, Fatimapuram', NULL, 1),
(257, NULL, 'fr-suresh-raj-r', 'sureshraj882@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Suresh Raj R.', 'l', 34, 'Fr. Suresh Raj R.\r\nParish Priest\r\nChurch of Infant Jesus\r\nKotoorkonam\r\nKULASEKHARAM 629 161', '9444132216', '', '1099.jpg', '', 'english', '', '', 0, 6400, 'Mr. Rajayan A.', 'Mrs. Rethina Bai', '09.08.1981', 'Vellicode', 'St. Aloysius\' Seminary Nagercoil,Sacred Heart Seminary Poonamallee', '09.12.2013', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Kottoorkonam', NULL, 1),
(258, NULL, 'fr-florence-a', 'florencevijay2411@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Florence A.', 'l', 34, 'Fr. Florence\r\nParish Priest\r\nChurch of St. Eusthachius\r\nPackiapuram\r\nARUMANAI  629 151', '9786472448', '', '1100.jpg', '', 'english', '', '', 0, 7392, 'Mr. Antony Kruz J. (Late)', 'Mrs. Alphonse Ammal K. ', '24.11.1980', 'Aaloor', 'St. Aloysius\' Seminary Nagercoil,St. Joseph\'s Seminary Mangalore ', '06.09.2014', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest Church of St. Eusthachius, Packiapuram ', NULL, 1),
(259, NULL, 'fr-john-benhar-', 'benhar14@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. John Benhar N.', 'l', 34, 'Fr. John Benhar\r\nChurch of St. Joseph’s\r\nKamplar\r\nMANKARAI 629 157', '9884831859', '', '1101.jpg', '', 'english', '', '', 0, 7874, 'Mr. Nasamony V', 'Mrs. Marial V', '14.03.1984', 'Vencode', 'St. Aloysius\' Seminary, Nagercoil,Sacred Heart Seminary, Poonamallee ', '06.09.2014', 'St. Francis Xavier\'s Cathedral, Kottar', 'Most Rev. Peter Remigius', 'Parish Priest, Church of St. Joseph’s Kamplar ', NULL, 1),
(260, NULL, 'fr-benitto-v', 'benialv@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Benitto V.', 'l', 34, 'Fr. Benitto V.  \r\nParish Priest\r\nChurch of Our Lady of Mount  Carmel\r\nMurasancode\r\nNEYYOOR  629 802', '9488504009', '', '1102.jpg', '', 'english', '', '', 0, 12780, 'Mr. L. Varghese', 'Mrs. S. Joice Chellammal', '24.01.1985', 'Alanvilai', 'St. Aloysius\' Minor Seminary, Nagercoil, Papal Seminary, Pune, St. Peter\'s Seminary, Viraganoor', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Murasancode', NULL, 1),
(261, NULL, 'fr-martin-m', 'mmmartinrose@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Martin M.', 'l', 34, 'Fr. Martin M.\r\nParish Priest\r\nChurch of St. Michael Archangel\r\nChoozhal\r\nFATIMA NAGAR  629 160', '9597989948', '', '1104.jpg', '', 'english', '', '', 0, 5636, 'Mr. Michael J.', 'Mrs. K. Rosammal', '13.01.1986', 'Vavarai', 'St. Aloysius\' Minor Seminary, Nagercoil,Christ Hall Seminary, Karumathoor,St. Pauls Seminary, Trichy', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Choozhal ', NULL, 1),
(262, NULL, 'fr-pencer-xavie', 'pencerxavier@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Pencer Xavier R.', 'l', 34, 'Fr. Pencer Xavier R.\r\nParish Priest\r\nChurch of Our Lady of Assumption\r\nMathiravilai\r\nTHICKANAMCODE  629 804', '8903935323', '', '1105.jpg', '', 'english', '', '', 0, 5578, 'Mr. Rajamony', 'Mrs. Thangammal', '07.06.1985', 'Yettacode', 'St. Aloysius\' Minor Seminary Nagercoil,Morning Star College Kolkata,St. Peter\'s Pontifical Seminary Bangalore ', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Mathiravilai', NULL, 1),
(263, NULL, 'fr-sujin-d', 'sujindennis@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Sujin D.', 'l', 34, 'Parish Priest, Church of Our Lady of Lourdes, Lourdugiri - Anducode - 629168 ', '9677936244', '', '1106.jpg', '', 'english', '', '', 0, 14432, 'Mr. S. Dennis', 'Mrs. Mary Lizzie', '27.02.1986', 'Amsi', 'St. Aloysius\' Minor Seminary Nagercoil,Christ Hall Seminary Karumathur Madurai, St. Paul Seminary Trichy', '10.05.2015', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Lourdugiri', NULL, 1),
(264, NULL, 'fr-xavier-raj', 'xavier.mum@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Xavier Raj', 'l', 34, 'Parish Priest, Church of Our Lady of Perpetual Succor, Eanchacode, Ponmanai - 629161', '9626660889', '', '1107.jpg', '', 'english', '', '', 0, 4418, 'G. Rajamony', 'Maria Puspam', '06.05.1984', 'Yettacode', 'Sacred Heart Seminary, Poonamallee', '10.05.2015 ', 'Holy Trinity Cathedral Thirithuvapuram', 'xavier.mum@gmail.com', 'Parish Priest, Eanchacode', NULL, 1),
(265, NULL, 'fr-francis-xavi', 'xfrancis35@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Francis Xavier M', 'l', 34, 'Fr. Francis Xavier M.\r\nParish Priest \r\nChurch of Our Lady of Sorrows\r\nKonnakuzhivilai\r\nVILLUKURI  629 180', '7598112014', '', '1108.jpg', '', 'english', '', '', 0, 1468, 'Madavadiyan', 'Ronikam', '10.06.1979', 'Kappiyarai', 'St.Peter Pontifical Seminary, Bangalore', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Konnakuzhivilai', NULL, 1),
(266, NULL, 'fr-maria-anto-h', 'halvin.j@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Maria Anto Halvin', 'l', 34, 'Parish Priest, Church of St. Pius X, Padarnilam, Manavalakurichy - 629252', '9629209055', '', '1109.jpg', '', 'english', '', '', 0, 8282, 'Joseph Alexander', 'Maria Sebastiaye', '17.11.1981', 'Madathattuvilai', 'St. Pius X Mumbai', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Padarnilam', NULL, 1),
(267, NULL, 'fr-michael-aloc', 'alomic29@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Michael Alocious M.A', 'l', 34, 'Fr. Michael Alocious M. A. \r\nParish Priest \r\nChurch of St. Joseph’s\r\nAppattuvilai\r\nTHUCKALAY 629 175', '8903148050', '', '1113.jpg', '', 'english', '', '', 0, 9518, 'S. Michael Antony', 'G. Mary Joice', '29.04.1987', 'Kuzhivilai', 'Sacred Heart Seminary, Poonamalle', '01.05.2016', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Appattuvilai', NULL, 1),
(268, NULL, 'fr-sargin-rubas', 'srubas@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Sargin Rubas B', 'l', 32, 'Parish Priest, Church of St George, Pilavilai, Azhaganparai post - 629252', '9597909745', '', 'f443aac00f78abd3411e009977bf1caa.jpeg', '', 'english', '', '2020-06-18 23:41', 0, 79611, 'V. Barnabas', 'R. Agnes', '30/05/1986', 'Chemparuthivilai', 'St. Aloysius Seminary, Nagercoil, St.Joseph\'s Seminary Mangalore', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Pilavilai', NULL, 1),
(269, NULL, 'fr-domi-lilil-r', 'domilililraja@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Domi Lilil Raja A', 'l', 34, 'Fr. Domi Lilil Raja A.\r\nParish Priest\r\nChurch of Sacred Heart of Jesus\r\nParakunnu, Vanniyoor\r\nKUZHITHURAI  629 163', '7402586774', '', '1112.jpg', '', 'english', '', '', 0, 13356, 'Antony M', 'George Mary V', '07.10.1986', 'Konnakuzhivilai', 'St.Aloysis Seminary, Sacred Heart Seminary Poonamallee', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Parakunnu ', NULL, 1),
(270, NULL, 'fr-charles-viju', 'charlesviju@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Charles Viju A.', 'l', 34, 'Fr. Charles Viju A. \r\nParish Priest\r\nChurch of St. Antony\r\nVizhunthayambalam\r\nTHENGAPATTANAM 629 173', '9487015472', '', '1103.jpg', '', 'english', '', '', 0, 7240, 'M. Arockiam', 'S. Annammal', '30.08.1984', 'Konamkadu', 'St. Aloysius\' Minor Seminary, Nagercoil, St.Josephs Interdiocesan Seminary, Mangalore', '10.05.2015', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Vizhunthayampalam', NULL, 1),
(271, NULL, 'fr-cyril-mesmin', 'cyrilmesmin@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Cyril Mesmin', 'l', 34, 'Parish Priest, Church of St. Antony, Kalaiakkavilai', '9787595552', '', '1d50c7c16231f6937642c2259a0f6eed.jpg', '', 'english', '', '2021-03-24 22:43', 0, 10368, 'Vincent', 'Pushpamary', '10.06.1986', 'Kolvel', 'St.Pauls Major Seminary Trichy', '01.05.2016', 'Holy Trinity Cathedral Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Kalaiakkavilai', NULL, 1),
(272, NULL, 'fr-edwin-raj-c', 'edwinchinna@yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Edwin Raj C.', 'l', 34, 'Fr. Edwin Raj C.\r\nParish Priest\r\nChurch of St. Antony’s\r\nVellayambalam\r\nPUTHUKADAI  629 171', '8149863115', '', '1117.jpg', '', 'english', '', '', 0, 5670, 'K. Chinnathurai', 'J.Omanal', '27-09-1987', 'Melpuram', 'Papal Seminary, Pune.', '07-05-2017', 'Cathedral of the Most Holy Trinity', 'Most. Rev. Jeromedhas V.', 'Fr. Edwin Raj Parish Priest Church of St. Antony’s Vellayambalam ', NULL, 1),
(273, NULL, 'fr-jees-raymond', 'jeesdenn@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jees Raymond', 'l', 34, 'Fr. Jees Raymond\r\nParish Priest\r\nChurch of Assumption of Our Lady\r\nPUTHUKKADAI  629 171\r\nChurch of Our Lady of Assumption, Mathiravilai. ', '9444643805', '', '1114.jpg', '', 'english', '', '', 0, 2372, 'Mr. S. Raymond (Late)', 'Mrs. A. Rethinammal (Late)', '09.07.1977', 'Thoothoor', 'Jyothir Bhavan, Kalamassery.', '07.05.2017', 'The Cathedral of Most Holy Trinity, Thirithuvapuram.', 'Most. Rev. Jeromedhas SDB', 'Fr. Jees Raym Parish Priest Church of Assumption of Our Lady PUTHUKKADAI  ', NULL, 1),
(274, NULL, 'fr-vinso-antony', 'vinso84@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Vinso Antony V. ', 'm', 34, '            ', '8939707671', '', '18b3bb39cfc0fd4e255e4bc39ed7ddfb.jpg', '', 'english', '', '2019-11-19 17:56', 0, 35428, 'Mr. A. Vensaslaus', 'Mrs. S. maria Sathai', '01.07.1984', 'Kallukootam', 'Christ Hall Seminary, Papal Seminary', '07.05.2017', 'The Cathedral of the Most Holy Trinity, Thirithuvapuram.', 'Most. Rev. Jeromedhas SDB', 'Parish Priest, Alancholai', NULL, 1),
(275, NULL, 'fr-albin-jose-e', 'ealbinjose@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Albin Jose E.', 'l', 34, 'Fr. Albin Jose E.\r\nParish Priest\r\nChurch of St. Michael\r\nKozhiporvilai\r\nKUZHICODE  629 167', '9486893800', '', '1116.jpg', '', 'english', '', '', 0, 4064, 'Mr. Eliyas', 'Mrs. sarasamma', '26.03.1985', 'Varuvilai, Kanjampuram', 'St. Paul\'s Seminary', '07.05.2017', 'The Cathedral of Most Holy Trinity, Thirithuvapuram.', 'Bishop Jeromedhas SDB', 'Fr. Albin Parish Priest Church of St. Michael Kozhiporvilai ', NULL, 1),
(276, NULL, 'fr-alwin-vijay-', 'malwinvijay1988@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Alwin Vijay M', 'l', 34, 'Fr. Alwin Vijay M.\r\nParish Priest\r\nChurch of Holy Guardian Angels\r\nMelpuram\r\nPACODE 629 168', '9488807775', '', '1118.jpg', '', 'english', '', '', 0, 6932, 'Mr. C. Mohan', 'Mrs. S. Glory', '01-01-1988', 'Nattalam', 'St.Paul\'s, Trichy', '07-05-2017', 'The Cathedral of the Most Holy Trinity, Thirithuvapuram', 'Most.Rev. Jeromedhas V. SDB', 'Parish Priest, Church of Holy Guardian Angels Melpuram ', NULL, 1),
(277, NULL, 'fr-arul', 'aruljoe1989@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Arul', 'l', 34, 'Fr. Arul\r\nParish Priest\r\nChurch of Our Lady of Rosary\r\nKANJIRACODE 629 155', '8270863652', '', '1119.jpg', '', 'english', '', '', 0, 7008, 'Mr. Rajaiyan', 'Mrs. Radha', '24/09/1988', 'Maruthancode', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, St.Paul\'s Semnary, Trichy', '15.04.2018', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most Rev. V. Jeromedhas', 'Parish Priest, Church of Our Lady of Rosary KANJIRACODE ', NULL, 1),
(278, NULL, 'fr-jeya-sunder-', 'dearsundersingh@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jeya Sunder Singh', 'l', 34, 'Fr. Jeya Sundar Singh\r\nParish Priest\r\nChurch of St. Francis Xavier\r\nKonamcadu\r\nNEYOOR WEST 629 803', '8300799612', '', '1120.jpg', '', 'english', '', '', 0, 121236, 'Mr. Chellakkan', 'Mrs. Maria Rackini', '01.10.1989', 'Muzhavilai', 'St. Aloysius Seminary Nagercoil, Christ Hall Seminary Karumathur, Papal Seminary Pune.', '15.04.2018', 'Holy Trinity Cathedral, Thirithuvapuram', 'Most. Rev. Jeromedhas SDB', 'Parochial Administrator, Church of St. Francis Xavier, Konamcadu ', NULL, 1),
(279, NULL, 'fr-arul-raj', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Arul Raj', 'm', 34, '  ', '', '', '1121.jpg', '', 'english', '', '', 0, 18676, '', '', '', '', '', '', '', '', '', NULL, 1),
(282, NULL, 'fr-antony-gomez', 'frgomezktr@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony Gomez P.', 'l', 34, 'Fr. Antony Gomez\r\nParish Priest\r\nChurch of St. Francis Xavier\r\nVENCODE 629 171', '9488278088', '', '2003.jpg', '', 'english', '', '', 0, 2762, '', '', '', '', '', '', '', '', ' Parish Priest, Church of St. Francis Xavier, VENCODE', NULL, 5),
(283, NULL, 'fr-antony-jayak', 'antonyjayakodi@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony Jayakodi', 'l', 34, 'Fr. Antony Jayakodi D.\r\nParish Priest\r\nChurch of St. Aloysius\r\nELAVUVILAI 629 171', '8760817448', '', '2004.jpg', '', 'english', '', '', 0, 5538, '', '', '', '', '', '', '', '', ' Parish Priest, Church of St. Aloysius, Elavuvilai', NULL, 5),
(284, NULL, 'fr-arulappan', 'frarulappa@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Arulappan', 'l', 34, 'Fr. Arulappan\r\nParish Priest\r\nChurch of Our Lady of Mount Carmel\r\nNullivilai\r\nKARENKADU 629 809', '9442365337', '', '2005.jpg', '', 'english', '', '', 0, 5854, '', '', '', '', '', '', '', '', 'Parish Priest, Church of Our Lady of Mount Carmel,Nullivilai ', NULL, 5),
(287, NULL, 'fr-selvaraj-j', 'selvaa.raj@rediffmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Selvaraj J.', 'l', 34, 'Fr. Selvaraj J.\r\nParish Priest\r\nChurch of St. Andrew\r\nATTOOR 629 177', '9489554444', '', '2017.jpg', '', 'english', '', '', 0, 5276, '', '', '', '', '', '', '', '', 'Parish Priest, Church of St. Andrew, ATTOOR', NULL, 5),
(288, NULL, 'fr-soosai-anton', 'samsantosoo@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Soosai Antony P.', 'l', 34, 'Fr. Soosai Antony P.\r\nParish Priest\r\nChurch of St. Peter & Paul\r\nAmbalakadai\r\nCHITHARAL 629 151', '9443130423', '', '2018.jpg', '', 'english', '', '', 0, 2858, '', '', '', '', '', '', '', '', 'Parish Priest, Church of St. Peter & Paul, Ambalakadai', NULL, 5),
(291, NULL, 'fr-antony-xavie', 'frtonyxavier@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Antony Xavier', 'l', 34, 'Fr. Antony Xavier\r\nParish Priest\r\nChurch of Our Lady of Mount Carmel\r\nVavarai\r\nS.T MANGAD 629 172', '9445949050', '', '2022.jpg', '', 'english', '', '', 0, 6606, 'S. innasi Muthu', 'V. Theresammal', '11.02.1960', 'Kanjiracode', 'ST Albert\'s College, Ranchi', '15.05.1990', 'Mullanganavilai', 'Most Rev Bp. Leon A Tharmaraj', 'Parish Priest, Church of Our Lady of Mount Carmel, Vavarai', NULL, 1),
(292, NULL, 'fr-christuraj', 'frchristuraj@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Christuraj', 'l', 34, 'Fr. Christuraj G.\r\nParish Priest\r\nChurch of St. Jude’s\r\nKuttaicadu \r\nKATTATHURAI  629 158', '9698560707', '', '2024.jpg', '', 'english', '', '', 0, 7910, '', '', '', '', '', '', '', '', 'Parish Priest Church of St. Jude Thadeus, Kuttaicadu', NULL, 2),
(294, NULL, 'fr-amaladhas-f-', 'faamaladhas@gmailcom', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Amaladhas F.A.', 'l', 34, 'Fr. Amaladhas CMF\r\nParish Priest\r\nChurch of Our Lady of Fathima\r\nKallaravilai\r\nCHENKODI 629 177', '9597265595', '', '2027.jpg', '', 'english', '', '', 0, 8748, '', '', '', '', '', '', '', '', 'Parish Priest, Church of Our Lady of Fathima, Kallaravilai', NULL, 3),
(296, NULL, 'fr-baskar', '------@gmailcom', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Baskar', 'l', 34, 'Fr. Baskar HF\r\nPriest-in-charge\r\nChurch of St. Antony’s\r\nPoottetty\r\n(Via) KARUNGAL 629 157', '9444128235', '', '2030.jpg', '', 'english', '', '', 0, 3654, '', '', '', '', '', '', '', '', 'Parish Preist Church of St. Antony, Poottetty,', NULL, 2),
(297, NULL, 'fr-justin-james', '-------@gmailcom', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Justin James', 'l', 34, 'Fr. Justin James\r\nParish Priest\r\nChurch of Our Lady of Sorrows\r\nMukkalampadu\r\nKURUNTHENCODE  629 805', '9486577971', '', '2031.jpg', '', 'english', '', '', 0, 6800, '', '', '', '', '', '', '', '', 'Parish PriestChurch church  of Sorrows, Mukkalampadu', NULL, 2),
(298, NULL, 'fr-marconi-ravi', 'gmarcoravi@gmailcom', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Marconi Ravi Chandran', 'l', 34, 'Fr. Marconi Ravichandran G.\r\nParish Priest\r\nChurch of St. Antony’s\r\nValvachakostam\r\nKATTATHURAI 629 158', '7598100767', '', 'edf7503fdb9f98aebae8fafe47f2221b.jpg', '', 'english', '', '', 0, 3864, '', '', '', '', '', '', '', '', 'Parish Priest Church of St. Antony’s Valvachakostam', NULL, 5),
(299, NULL, 'fr-jacksas-elan', 'jacksas03@rediffmailcom', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. Jacksas Elango', 'l', 34, 'Fr. Jacksas Elango S.\r\nParish Priest\r\nChurch of St. Little Flower\r\nChetticharvilai \r\nVEEYANOOR  629 177', '7502748677', '', '2021.jpg', '', 'english', '', '', 0, 1466, '', '', '', '', '', '', '', '', 'Parish Priest, Church of St. Little Flower, Chetticharvilai ', NULL, 5),
(300, NULL, 'fr-george-cleme', '', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. George Clement', 'm', 34, '  ', '', '', '2022.jpg', '', 'english', '', '', 0, 7652, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5),
(301, NULL, 'diocese', 'frsarginrubas@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 1, 'Diocese', 'l', 32, '20/103,panchivilai,chemparuthivilai post', '9597909745', '', 'f5b687e0d3e0f2adcb754d542a88d68e.jpeg', 'c8766f43f0d23fbd7925238222e9e12d.jpg', 'english', '2019-03-06 15:17', '2024-01-29 23:00', 0, 188182, '', '', '', '', '', '', '', '', '', NULL, 1),
(303, NULL, 'frjeyabalan', 'aacjeyabalan@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Antony Celestin Jeyabalan', 'l', 67, 'Fr. Antony Celastine Jeyabalan A.\r\nParish Priest\r\nChurch of Christ the King\r\nIruthayapuram\r\nFATHIMA NAGAR 629 160', '9944616150', '', '', '', 'english', '2019-04-16 16:13', '2019-04-16 16:13', 0, 10196, '', '', '', '', '', '', '', '', 'Parish Priest Church of Christ the King, Iruthayapuram ', NULL, 1),
(315, NULL, 'fr-ajith', 'ajithjer@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Ajith', 'l', 30, 'Fr. Ajith\r\nCo-Pastor\r\nChurch of St. Antony’s\r\nThundathuvilai\r\nKARUNGAL 629 157', '8508562599', '', 'aa771461557ce5bfae105ad9b50e1122.JPG', '', 'english', '2019-07-15 23:37', '2019-07-16 10:43', 0, 16426, '', '', '', '', '', '', '', '', ' Co-Pastor St. Antony’s Church, Thundathuvilai ', NULL, 1),
(317, NULL, 'frjaber_dynish', 'jaber.dynish70@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Jaber Dynish J', 'l', 29, 'Fr. Jaber Dynish\r\nParish Priest\r\nChurch of St. Michael\r\nR. C. Street\r\nKUZHITHURAI  629 163', '9095397282', '', '042adcacc5ccf16e8d0b25de2f71c88d.JPG', '', 'english', '2019-07-16 09:34', '2019-07-16 09:34', 0, 1966, '', '', '', '', '', '', '', '', 'Parish Priest Church of St. Michael R. C. Street KUZHITHURAI  ', NULL, 1),
(321, NULL, 'fr_sunil', 'sunilpacode@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Sunil K', 'l', 30, 'Fr. Sunil\r\nCo-Pastor\r\nChurch of Our Lady of Mount Carmel\r\nVavarai\r\nS.T MANGAD 629 172', '8300808646', '', '7174fc34177c64d05cbb3dc20f8c2034.JPG', '', 'english', '2019-07-16 09:42', '2019-07-16 11:43', 0, 11202, '', '', '', '', '', '', '', '', 'Co-Pastor Church of Our Lady of Mount Carmel Vavarai ', NULL, 1),
(324, NULL, 'fr_jegan_silves', 'jegansilvester82@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Jegan Silvester L', 'l', 39, 'Fr. Jegan Silvester\r\nParish Priest\r\nChurch of St. Joseph’s\r\nVanniyoor (Soosaipuram) Manchavilai, MEENACHAL  629 153', '8056432816', '', 'e9552e5053f6b650ac564bbf0a19bf22.JPG', '', 'english', '2019-07-16 09:48', '2019-07-16 09:48', 0, 2720, '', '', '', '', '', '', '', '', ' Parish Priest Church of St. Joseph’s, Vanniyoor (Soosaipuram) Manchavilai, ', NULL, 1),
(327, NULL, 'fr_joseph_stali', 'stalinjoser@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Joseph Stalin R', 'l', 29, 'Fr. Joseph Stalin\r\nParish Priest\r\nChurch of St. Antony’s\r\nManali\r\nTHUCKALAY 629 175\r\nKavuvilai Veedu, Kudaloor Konam, Palukal – 629 170', '8903101337', '', 'c601d874d7ffa98d0a9c4bd732eab6dd.JPG', '', 'english', '2019-07-16 10:20', '2019-07-16 10:20', 0, 3200, '', '', '', '', '', '', '', '', ' Parish Priest, Church of St. Antony,  Manali ', NULL, 1),
(328, NULL, 'fr_vanish_micha', 'vanishmik@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Vanish Michael Raj', 'l', 30, 'Fr. Vanish Michael Raj\r\nParish Priest\r\nChurch of the Sacred Heart of Jesus\r\nIrudhayapuram\r\nKUZHICODE 629 167', '9486549713', '', 'f5e3a07fcd625d536343c2d65124c2ed.JPG', '', 'english', '2019-07-16 10:25', '2019-07-26 21:25', 0, 3808, 'Vargheese', 'Baby', '17-11-1990', 'Thettiyodu', 'St Joseph Seminary Mangalore ', '05-05-2019', 'The Most Holy Trinity Cathedral, Thiruthuvapuram. . ', 'Most Rev. Jeromdhas Varuvel SDB', 'Church of the Sacred Heart of Jesus Irudhayapuram KUZHICODE', NULL, 1),
(329, NULL, 'fr_aloysius', 'l.laloysius@yahoo.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Aloysius L', 'l', 29, 'Fr. Aloysius\r\nParish Priest\r\nChurch of Sacred Heart of Jesus\r\nPacode\r\nTHICKURICHY 629 168\r\nVadivilai, Neyyoor (P.O) – 629 802', '7806872580', '', '1d5c12ae7519a3e30460bf72358f183a.JPG', '', 'english', '2019-07-16 10:27', '2019-07-16 10:27', 0, 10908, '', '', '', '', '', '', '', '', 'Parish Priest, Church of Sacred Heart of Jesus, Pacode', NULL, 1),
(330, NULL, 'fr_shyjin', 'johnshijin37277@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Shijin K..', 'l', 30, 'Fr. Shijin\r\nCo-Pastor\r\nChurch of St. Sebastian\r\nMadathattuvilai\r\nVILLUKURI 629 180', '9003013854', '', '893ef90d5ddffbf6dae088d80e8f8021.JPG', '', 'english', '2019-07-16 10:30', '2019-07-16 10:30', 0, 3344, '', '', '', '', '', '', '', '', ' Co-Pastor, St. Sebastian\'s Church, Madathattuvilai ', NULL, 1),
(353, NULL, 'fr_sahaya_justu', 'sahayajustus@Yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Sahaya Justus', 'l', 51, 'Church of St Theresa of Child Jesus', '9944084806', '', '', '', 'english', '2019-12-09 18:44', '2019-12-09 18:44', 0, 1516, 'Wenceslaus. M', 'Adaikala Mary. M', '17/09/1968', 'Vethanagar', 'St.Paul\'s Major Seminary, Thirichi & Christ Hall Seminary, karumathoor.', '14/04/1996', 'St Xavier\'s Cathedral, Kottar', 'Most. Rev. Leon. A. Dharmaraj', 'Kandanvilai', NULL, 0),
(354, NULL, 'fr_justin_chris', 'justinomd@Yahoo.co.in', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Justin Christi Raj OMD. S', 'l', 35, 'justinomd@Yahoo.co.in', '9488505798', '', '', '', 'english', '2019-12-09 18:56', '2019-12-09 19:07', 0, 958, 'P. Savarimuthu', 'A. Agnes', '17.02.1983', 'Manali', 'OMD', '14.01.2009', 'St. Antonys church manali', 'Most Rev . Peter Remigius', 'Patterivilai', NULL, 0),
(355, NULL, 'frjohnson', 'kamjony@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'M. Johnson OFM CAP', 'l', 32, 'Our Lady Of Mount Carmal,\r\nMurasancode', '7867051898', '', '2d9d220559821ed95627c1b195b5d268.jpg', '', 'english', '2019-12-09 19:11', '2019-12-09 19:14', 0, 716, 'S. Mariadass', 'S. Stellamary', '26-05-1988', 'M. Savariyar pattanam', 'Order of capuchin friars minor', '04-04-2018', 'Amala annai church, thirumangalam, madurai', 'Most.Rev. Antony Papusamy ', 'Murasancodu', NULL, 0),
(356, NULL, 'antonypapuswamy', '', 'ab38f50843430248594e784c062817a2808eb5d2', '', 0, 'Most Rev Antony Pappusamy', 'l', 71, 'Bishop, Arch Diocese of Bangalore', '', '', '9f0e8bada583bb79d84e448b26f2c1f0.jpg', '', 'english', '2020-07-04 22:25', '2024-01-28 20:12', 0, 3002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(363, NULL, 'fr-john-vibin', 'vibinjo1992@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr John Vibin J', 'l', 31, 'Our lady of Lourdes church, Alanvilai.', '8344473757', '', '0857406cde7af39e317bf76cb17faa4c.jpeg', '', 'english', '2023-11-06 12:41', '2023-11-06 12:41', 0, 186, ' Johnson Y', 'Pushpam C', '17-11-1992', 'Manalikarai ', 'St. Paul\'s Seminary, Trichirappali', '23/04/2023', 'Cathedral of the Most Holy Trinity, Tirithuvapuram ', 'Most. Rev. Antony Pappusamy', 'Our lady of Lourdes church, Alanvilai.', NULL, 0),
(364, NULL, 'fr-starvin-cyri', 'starvincyrilshajang@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr . Starvin Cyril Shajan.G', 'l', 30, 'Infant Jesus Church, Vasanthapuram.', '9361650971', '', '2a453789cc4a9e03a07f83bfa2a0c012.jpeg', '', 'english', '2023-11-06 12:46', '2023-11-06 12:46', 0, 162, 'M.George', 'G.Alphonsal', '18/03/1993', 'Kodithottam', 'Sacred Heart Seminary, Poonamalle', '23/4/2023', 'Cathedral of the Most Holy Trinity, Tirithuvapuram ', 'Most. Rev. Antony Pappusamy', 'St. Antony\'s Church, Varthanvilai.', NULL, 0),
(365, NULL, 'fr-libin-raj', 'rajlibin30@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr Libin Raj S', 'l', 29, 'Sacred heart of Jesus Church, Idhayapuram, Viricode', '9344819116', '', '126ad075294ca6f0524f1d8a403acaec.jpeg', '', 'english', '2023-11-06 13:44', '2023-11-06 13:44', 0, 228, 'Selvaraj P.', 'Lilly Bai A.', '30/04/1994', 'Varathattuvilai', 'St. Pius X , Goregaon, Mumbai.', '23/04/2023', 'Cathedral of the Most Holy Trinity, Tirithuvapuram ', 'Most. Rev. Antony Pappusamy', 'Sacred heart of Jesus Church, Idhayapuram, Viricode', NULL, 0),
(366, NULL, 'fr-shebin-a', 'shebininiyan055@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr A. Shebin', 'l', 30, 'Mulagumoodu', '8825751969', '', '01c415c335e2b035660c72d81cbd1bfe.jpeg', '', 'english', '2023-11-06 13:50', '2023-11-06 13:50', 0, 134, ' P. Antony Muthu', 'G. Arul Mary Leela', '04-03-1993', 'Mulagumoodu ', 'Papal Seminary, Pune', '23-04-2023', 'Cathedral of the Most Holy Trinity, Tirithuvapuram ', 'Most. Rev. Antony Pappusamy', 'Church of St. Antony, Nagacode, Cheruppaloor Post, 629161 ', NULL, 0),
(367, NULL, 'fr-johnbaptist-', 'baptistjohn1991@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr J John Baptist', 'l', 31, 'St. Xavier’s church Xavier Puram', '9597007975', '', '792db0f97a2567f07864cae3c4760bf4.jpeg', '', 'english', '2023-11-06 13:58', '2023-11-06 13:58', 0, 154, 'A John ', 'M Mariammal', '04 06 1991', 'Xavier puram', 'St. Paul\'s Seminary, Trichirappali', '23/04/2023', 'Cathedral of the Most Holy Trinity, Tirithuvapuram ', 'Most. Rev. Antony Pappusamy', 'Sts Peter and Paul Church, Ambalakkadai arumanai post', NULL, 0),
(368, NULL, 'fr-bright-singh', 'singhkbright@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. K. Bright Singh', 'l', 30, 'Church of Our lady of snows, Pattariviali, Thalakulam post', '9488459316', '', '851263e6c6ca131f6b9df61dcaf97501.JPG', '', 'english', '2023-11-09 16:17', '2023-11-09 16:17', 0, 174, ' S.Kanakayyan', 'A.Thangam', '10.05.1993', 'Nellikkavilai, Pacode', 'Papal Seminary, Pune', '01.05.2022', 'Holy Trinity Church, Thirithuvapuram', 'Most. Rev. Antony Pappusamy', 'Church of Our lady of snows, Pattariviali,  Thalakulam post ', NULL, 0),
(369, NULL, 'fr-jose-prasant', 'joseprasanth11@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. F. Jose Prasanth', 'l', 29, 'Church of st. Joseph\'s, Manchady. Eraviputhoorkadai post.', '9791613624', '', 'e9b25e4405951f41e9e9f3a526ddcc1f.jpg', '', 'english', '2023-11-10 23:32', '2023-11-10 23:32', 0, 498, 'A. Francis( late) ', 'T. Vasantha Mary', '12.11.1993', 'Chunkankadai', 'St. Joseph\'s seminary, Mangalore', '01.05.2022', 'Holy Trinity Church, Thirithuvapuram', 'Most. Rev. Antony Pappusamy', 'Church of st. Joseph\'s, Manchady. Eraviputhoorkadai post. ', NULL, 0),
(370, NULL, 'fr-berdin-anas', 'berdin.anas@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, 'Fr. A. Berdin Anas', 'l', 30, 'St. Antony\'s church, Pullani Nattalam post ..629165', '8056767707', '', 'b52154d7eeaae485fa74db134011014b.jpg', '', 'english', '2023-11-10 23:44', '2023-11-10 23:44', 0, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(371, NULL, 'fr-atlas-plinto', 'altasblintan@gmail.com', 'ce878e3e27588c8bce571abba1e0a71346207c41', '', 0, ' Fr. P. Altas Blintan Pajiv', 'l', 30, 'St. Aloysius Church,    Elavuvilai ', '9751511576', '', '78e73674105aa29236f1d63bee87ad2b.jpeg', '', 'english', '2023-11-10 23:52', '2023-11-10 23:58', 0, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_customfield`
--

CREATE TABLE `users_customfield` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `custom_name` varchar(256) NOT NULL,
  `custom_value` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_customfield`
--

INSERT INTO `users_customfield` (`id`, `user_id`, `custom_name`, `custom_value`) VALUES
(1, 1, 'Epis. Ord ', '24-02-2015');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `ip` varchar(60) NOT NULL,
  `user_agent` varchar(300) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` varchar(22) NOT NULL,
  `timestamp` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip`, `user_agent`, `amount`, `date`, `timestamp`) VALUES
(1, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 68, '1452816000', 1452879920),
(2, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 414, '1452902400', 1452903182),
(3, '0', 'Opera/9.80 (J2ME/MIDP; Opera Mini/9/37.7663; U; en) Presto/2.12.423 Version/12.16', 382, '1452988800', 1452989242),
(4, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 414, '1453075200', 1453075572),
(5, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Applebot/0.1; +http://www.apple.com/go/applebot)', 623, '1453161600', 1453161797),
(6, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F70 Safari/600.1.4 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 252, '1453248000', 1453248105),
(7, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', 271, '1453334400', 1453335134),
(8, '0', 'Twitterbot/1.0', 405, '1453420800', 1453420837),
(9, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', 818, '1453507200', 1453508143),
(10, '0', 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9220; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1.0.337 Mobile Safari/534.11+', 409, '1453593600', 1453593665),
(11, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 745, '1453680000', 1453680156),
(12, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 640, '1453766400', 1453766754),
(13, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 380, '1453852800', 1453852966),
(14, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 487, '1453939200', 1453939637),
(15, '0', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 322, '1454025600', 1454027891),
(16, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 193, '1454112000', 1454112596),
(17, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 6, '1454108400', 1454179545),
(18, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 11, '1454194800', 1454202571),
(19, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 5, '1454281200', 1454307969),
(20, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 1, '1454346000', 1454359145),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 1, '1454346000', 1454424215),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 1, '1454346000', 1454424215),
(23, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 2, '1454432400', 1454487602),
(24, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 4, '1454518800', 1454521218),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36', 1, '1454518800', 1454586129),
(26, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1454778000', 1454823738),
(27, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0', 1, '1457110800', 1457186023),
(28, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0', 1, '1457197200', 1457270034),
(29, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0', 2, '1458493200', 1458547502),
(30, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1458666000', 1458718265),
(31, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1458752400', 1458776047),
(32, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1458925200', 1458997753),
(33, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1459098000', 1459156499),
(34, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1459270800', 1459337144),
(35, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1459357200', 1459385326),
(36, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1460048400', 1460053471),
(37, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1460307600', 1460370913),
(38, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 5, '1460480400', 1460514361),
(39, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 2, '1460566800', 1460640794),
(40, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1460653200', 1460655400),
(41, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1460826000', 1460894635),
(42, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1460912400', 1460980710),
(43, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1461344400', 1461414642),
(44, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1461430800', 1461438240),
(45, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1461517200', 1461524438),
(46, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 8, '1461603600', 1461615396),
(47, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1461690000', 1461754425),
(48, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1461776400', 1461805892),
(49, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1462294800', 1462322279),
(50, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1462381200', 1462434674),
(51, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1462813200', 1462872971),
(52, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1463158800', 1463237170),
(53, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1463936400', 1463949779),
(54, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1466960400', 1467030017),
(55, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1467219600', 1467288954),
(56, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1467478800', 1467548987),
(57, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1467997200', 1468042402),
(58, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1468170000', 1468256114),
(59, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 5, '1468256400', 1468265604),
(60, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 5, '1468342800', 1468349800),
(61, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 3, '1468429200', 1468462123),
(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1468515600', 1468564042),
(63, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 12, '1468602000', 1468609328),
(64, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36', 1, '1468602000', 1468652808),
(65, '::1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36', 3, '1468688400', 1468689914),
(66, '::1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36', 1, '1468774800', 1468789507),
(67, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1469206800', 1469274840),
(68, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1469638800', 1469666196),
(69, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 3, '1535994000', 1536062456),
(70, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 1, '1536080400', 1536118310),
(71, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 1, '1536685200', 1536747626),
(1, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 68, '1452816000', 1452879920),
(2, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 414, '1452902400', 1452903182),
(3, '0', 'Opera/9.80 (J2ME/MIDP; Opera Mini/9/37.7663; U; en) Presto/2.12.423 Version/12.16', 382, '1452988800', 1452989242),
(4, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 414, '1453075200', 1453075572),
(5, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Applebot/0.1; +http://www.apple.com/go/applebot)', 623, '1453161600', 1453161797),
(6, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F70 Safari/600.1.4 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 252, '1453248000', 1453248105),
(7, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', 271, '1453334400', 1453335134),
(8, '0', 'Twitterbot/1.0', 405, '1453420800', 1453420837),
(9, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', 818, '1453507200', 1453508143),
(10, '0', 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9220; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1.0.337 Mobile Safari/534.11+', 409, '1453593600', 1453593665),
(11, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 745, '1453680000', 1453680156),
(12, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 640, '1453766400', 1453766754),
(13, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 380, '1453852800', 1453852966),
(14, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 487, '1453939200', 1453939637),
(15, '0', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 322, '1454025600', 1454027891),
(16, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 193, '1454112000', 1454112596),
(17, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 6, '1454108400', 1454179545),
(18, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 11, '1454194800', 1454202571),
(19, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 5, '1454281200', 1454307969),
(20, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 1, '1454346000', 1454359145),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 1, '1454346000', 1454424215),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 1, '1454346000', 1454424215),
(23, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 2, '1454432400', 1454487602),
(24, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36', 4, '1454518800', 1454521218),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36', 1, '1454518800', 1454586129),
(26, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1454778000', 1454823738),
(27, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0', 1, '1457110800', 1457186023),
(28, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0', 1, '1457197200', 1457270034),
(29, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0', 2, '1458493200', 1458547502),
(30, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1458666000', 1458718265),
(31, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1458752400', 1458776047),
(32, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1458925200', 1458997753),
(33, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1459098000', 1459156499),
(34, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1459270800', 1459337144),
(35, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1459357200', 1459385326),
(36, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1460048400', 1460053471),
(37, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1460307600', 1460370913),
(38, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 5, '1460480400', 1460514361),
(39, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 2, '1460566800', 1460640794),
(40, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1460653200', 1460655400),
(41, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1, '1460826000', 1460894635),
(42, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 3, '1460912400', 1460980710),
(43, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1461344400', 1461414642),
(44, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1461430800', 1461438240),
(45, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1461517200', 1461524438),
(46, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 8, '1461603600', 1461615396),
(47, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1461690000', 1461754425),
(48, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1461776400', 1461805892),
(49, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1462294800', 1462322279),
(50, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 2, '1462381200', 1462434674),
(51, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1462813200', 1462872971),
(52, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1463158800', 1463237170),
(53, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1463936400', 1463949779),
(54, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1466960400', 1467030017),
(55, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1467219600', 1467288954),
(56, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1467478800', 1467548987),
(57, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1467997200', 1468042402),
(58, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1468170000', 1468256114),
(59, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 5, '1468256400', 1468265604),
(60, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 5, '1468342800', 1468349800),
(61, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 3, '1468429200', 1468462123),
(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1468515600', 1468564042),
(63, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 12, '1468602000', 1468609328),
(64, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36', 1, '1468602000', 1468652808),
(65, '::1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36', 3, '1468688400', 1468689914),
(66, '::1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36', 1, '1468774800', 1468789507),
(67, '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0', 1, '1469206800', 1469274840),
(68, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, '1469638800', 1469666196),
(69, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 3, '1535994000', 1536062456),
(70, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 1, '1536080400', 1536118310),
(71, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 1, '1536685200', 1536747626),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 2, '1536771600', 1536836073),
(0, '0', 'python-requests/2.9.1', 2, '1536944400', 1536958288),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 1, '1537290000', 1537335700),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 6, '1537808400', 1537854272),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 3, '1538067600', 1538104613),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 5, '1538154000', 1538213407),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.80 Mobile Safari/537.36', 12, '1542733200', 1542772172),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.80 Mobile Safari/537.36', 39, '1542819600', 1542819655),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', 1, '1542906000', 1542908078),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 3, '1543251600', 1543293051),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 5, '1543338000', 1543377506),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', 8, '1543424400', 1543426292),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 5, '1543510800', 1543551408),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 4, '1543770000', 1543806938),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', 3, '1543942800', 1543946523),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 3, '1544029200', 1544113163),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1544288400', 1544335190),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 3, '1544374800', 1544411873),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 7, '1544461200', 1544494621),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 5, '1544547600', 1544609393),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1544634000', 1544692781),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010 Build/OPM1.171019.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1544720400', 1544770605),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 8, '1544979600', 1545017131),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-C701F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 10, '1545066000', 1545109585),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 5, '1545152400', 1545191040),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 22, '1545238800', 1545277842),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', 2, '1545325200', 1545398411),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-C701F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Mobile Safari/537.36', 1, '1545411600', 1545444650),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 5, '1545498000', 1545549121),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 8, '1545584400', 1545587447),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 1, '1545757200', 1545807547),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 2, '1545930000', 1545970414),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 4, '1546189200', 1546229006),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 45, '1546448400', 1546492447),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 5, '1546534800', 1546578507),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 1, '1546621200', 1546695304),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 3, '1546707600', 1546765721),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 5, '1546794000', 1546823300),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-C701F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Mobile Safari/537.36', 3, '1547571600', 1547605003),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1547830800', 1547904106),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1548003600', 1548040075),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1548262800', 1548318208),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', 2, '1548694800', 1548737327),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 4, '1548781200', 1548818232),
(0, '0', 'python-requests/2.9.1', 1, '1548954000', 1549010317),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 4, '1549299600', 1549337879),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 10, '1549386000', 1549452613),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.76 Mobile Safari/537.36', 1, '1549558800', 1549601431),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', 2, '1549645200', 1549652507),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.105 Mobile Safari/537.36', 4, '1551114000', 1551199881),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 4, '1551373200', 1551411530),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', 1, '1551546000', 1551624838),
(0, '0', 'python-requests/2.9.1', 3, '1551632400', 1551647330),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.76 Mobile Safari/537.36', 8, '1551805200', 1551848281),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36', 13, '1551891600', 1551893079),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.76 Mobile Safari/537.36', 4, '1551978000', 1552009208),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', 14, '1552064400', 1552067409),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', 2, '1552150800', 1552184119),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.76 Mobile Safari/537.36', 17, '1552237200', 1552274187),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', 12, '1552323600', 1552328676),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 3, '1552410000', 1552476806),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.76 Mobile Safari/537.36', 11, '1552496400', 1552542108),
(0, '0', 'Mozilla/5.0 (compatible; proximic; +https://www.comscore.com/Web-Crawler)', 16, '1552582800', 1552588765),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-C701F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Mobile Safari/537.36', 13, '1552669200', 1552706356),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', 60, '1552755600', 1552763752),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Redmi 3S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Mobile Safari/537.36', 2138, '1552842000', 1552842491),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 9615, '1552928400', 1552929873),
(0, '0', 'Mozilla/5.0 (compatible; AlphaBot/3.2; +http://alphaseobot.com/bot.html)', 9508, '1553014800', 1553014801),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 10682, '1553101200', 1553101214),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 12840, '1553187600', 1553187600),
(0, '0', 'Mozilla/5.0 (compatible; Qwantify/Bleriot/1.1; +https://help.qwant.com/bot)', 8702, '1553274000', 1553274081),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 11412, '1553360400', 1553360401),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 8986, '1553446800', 1553446955),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 8457, '1553533200', 1553534005),
(0, '0', 'Mozilla/5.0 (compatible; AlphaBot/3.2; +http://alphaseobot.com/bot.html)', 32372, '1553619600', 1553619600),
(0, '0', 'Mozilla/5.0 (compatible; VelenPublicWebCrawler/1.0; +https://velen.io)', 18848, '1553706000', 1553706000),
(0, '0', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 10256, '1553792400', 1553792400),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5, '1553878800', 1553903492),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 208, '1553965200', 1553976179),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 107, '1554051600', 1554052110),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 68, '1554138000', 1554138319),
(0, '0', 'Mozilla/5.0 (compatible; Qwantify/Bleriot/1.1; +https://help.qwant.com/bot)', 76, '1554224400', 1554224412),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 46, '1554310800', 1554313246),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 784, '1554397200', 1554402148),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 1605, '1554483600', 1554483604),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 16756, '1554570000', 1554570099),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 299, '1554656400', 1554656896),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-C701F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Mobile Safari/537.36', 104, '1554742800', 1554744997),
(0, '0', 'Mozilla/5.0 (compatible; BLEXBot/1.0; +http://webmeup-crawler.com/)', 113, '1554829200', 1554829978),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 3007, '1554915600', 1554915672),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 3187, '1555002000', 1555002076),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 3162, '1555088400', 1555088406),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 2320, '1555174800', 1555174812),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 454, '1555261200', 1555261263),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1102, '1555347600', 1555347608),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 438, '1555434000', 1555434125),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 431, '1555520400', 1555521136),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 501, '1555606800', 1555606879),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 399, '1555693200', 1555693214),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0.2; SAMSUNG SM-G530H Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.3 Chrome/38.0.2125.102 Mobile Safari/537.36', 344, '1555779600', 1555779635),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 310, '1555866000', 1555866151),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 432, '1555952400', 1555952535),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 784, '1556038800', 1556039006),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 661, '1556125200', 1556125229),
(0, '0', 'IABTechLab Ads.txt Crawler', 1425, '1556211600', 1556212088),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 747, '1556298000', 1556298062),
(0, '0', 'Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)', 480, '1556384400', 1556384617),
(0, '0', 'Mozilla/5.0 (compatible; SeznamBot/3.2; +http://napoveda.seznam.cz/en/seznambot-intro/)', 329, '1556470800', 1556470931),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 438, '1556557200', 1556557352),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 593, '1556643600', 1556644001),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 691, '1556730000', 1556730161),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 857, '1556816400', 1556816899),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 976, '1556902800', 1556902816),
(0, '0', 'Mozilla/5.0 (compatible; Qwantify/Bleriot/1.1; +https://help.qwant.com/bot)', 1283, '1556989200', 1556989200),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 524, '1557075600', 1557075618),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 547, '1557162000', 1557162112),
(0, '0', 'ltx71 - (http://ltx71.com/)', 759, '1557248400', 1557249200),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 2795, '1557334800', 1557334828),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 1731, '1557421200', 1557421216),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1179, '1557507600', 1557507629),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 1202, '1557594000', 1557594027),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 1201, '1557680400', 1557680493),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 1572, '1557766800', 1557767004),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 26030, '1557853200', 1557853373),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 917, '1557939600', 1557939604),
(0, '0', 'CCBot/2.0 (https://commoncrawl.org/faq/)', 2248, '1558026000', 1558026038),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 2043, '1558112400', 1558112428),
(0, '0', 'ltx71 - (http://ltx71.com/)', 1958, '1558198800', 1558198807),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1758, '1558285200', 1558285240),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 1890, '1558371600', 1558371640),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 1275, '1558458000', 1558458032),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 1572, '1558544400', 1558544431),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 1649, '1558630800', 1558630858),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 4609, '1558717200', 1558717201),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 5713, '1558803600', 1558803639),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 5591, '1558890000', 1558890009),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 4772, '1558976400', 1558976449),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B411 Safari/600.1.4 (compatible; YandexMobileBot/3.0; +http://yandex.com/bots)', 5034, '1559062800', 1559062806),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6175, '1559149200', 1559149202),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1', 14232, '1559235600', 1559235620),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8263, '1559322000', 1559322005),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7366, '1559408400', 1559408404),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6510, '1559494800', 1559494800),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6614, '1559581200', 1559581217),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 8807, '1559667600', 1559667600),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 10217, '1559754000', 1559754014),
(0, '0', 'serpstatbot/1.0 (advanced backlink tracking bot; http://serpstatbot.com/; abuse@serpstatbot.com)', 13785, '1559840400', 1559840401),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8652, '1559926800', 1559926823),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 5331, '1560013200', 1560013207),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7744, '1560099600', 1560099608),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7787, '1560186000', 1560186002),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7788, '1560272400', 1560272410),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6966, '1560358800', 1560358804),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 5179, '1560445200', 1560445209),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 10474, '1560531600', 1560531623),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7757, '1560618000', 1560618001),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 8169, '1560704400', 1560704407),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7951, '1560790800', 1560790846),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 5873, '1560877200', 1560877205),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7231, '1560963600', 1560963600),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7702, '1561050000', 1561050002),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7804, '1561136400', 1561136422),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7755, '1561222800', 1561222824),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6044, '1561309200', 1561309200),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6854, '1561395600', 1561395652),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7937, '1561482000', 1561482021),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8102, '1561568400', 1561568405),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 8383, '1561654800', 1561654801),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7099, '1561741200', 1561741211),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 6547, '1561827600', 1561827625),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7826, '1561914000', 1561914009),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7971, '1562000400', 1562000402),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7978, '1562086800', 1562086817),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7852, '1562173200', 1562173212),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6384, '1562259600', 1562259610),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7952, '1562346000', 1562346010),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7933, '1562432400', 1562432404),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8452, '1562518800', 1562518829),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 10115, '1562605200', 1562605200),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 12807, '1562691600', 1562691616),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 16955, '1562778000', 1562778016),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 31651, '1562864400', 1562864405),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 35914, '1562950800', 1562950800),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 16114, '1563037200', 1563037204),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 14074, '1563123600', 1563123601),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6611, '1563210000', 1563210094),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 6487, '1563296400', 1563296418),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6319, '1563382800', 1563382801),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6499, '1563469200', 1563469209),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6934, '1563555600', 1563555620),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 7437, '1563642000', 1563642000),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7904, '1563728400', 1563728408),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7786, '1563814800', 1563814801),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7528, '1563901200', 1563901231),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7417, '1563987600', 1563987600),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 7260, '1564074000', 1564074006),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8503, '1564160400', 1564160401),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 217, '1564246800', 1564246806),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 77, '1564506000', 1564591561),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 7967, '1564592400', 1564592409),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 8203, '1564678800', 1564678800),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 8021, '1564765200', 1564765206),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 10917, '1564851600', 1564851629),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 9871, '1564938000', 1564938005),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8198, '1565024400', 1565024445),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 8198, '1565024400', 1565024449),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 8050, '1565110800', 1565110853),
(0, '0', 'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)', 8336, '1565197200', 1565197202),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 6661, '1565283600', 1565283638),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 5519, '1565370000', 1565370014),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36', 310, '1565542800', 1565583249),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 868, '1565629200', 1565629217),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 508, '1565715600', 1565715641),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 527, '1565802000', 1565802164),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/3~bl; +http://www.semrush.com/bot.html)', 563, '1565888400', 1565888423),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 517, '1565974800', 1565974870),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36(KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', 157, '1566061200', 1566061590),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36', 723, '1566925200', 1566962499),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3457, '1567011600', 1567011792),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4525, '1567098000', 1567098006),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6183, '1567184400', 1567184408),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 2387, '1567270800', 1567270806),
(0, '0', 'serpstatbot/1.0 (advanced backlink tracking bot; curl/7.58.0; http://serpstatbot.com/; abuse@serpstatbot.com)', 2916, '1567443600', 1567488236),
(0, '0', 'serpstatbot/1.0 (advanced backlink tracking bot; curl/7.58.0; http://serpstatbot.com/; abuse@serpstatbot.com)', 2782, '1567530000', 1567530016),
(0, '0', 'serpstatbot/1.0 (advanced backlink tracking bot; curl/7.58.0; http://serpstatbot.com/; abuse@serpstatbot.com)', 5937, '1567616400', 1567616400),
(0, '0', 'serpstatbot/1.0 (advanced backlink tracking bot; curl/7.58.0; http://serpstatbot.com/; abuse@serpstatbot.com)', 6288, '1567702800', 1567702812),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5463, '1567789200', 1567789214),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3995, '1567875600', 1567875922),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4124, '1567962000', 1567962009),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4734, '1568048400', 1568048414),
(0, '0', 'Mozilla/5.0 (compatible; DuckDuckGo-Favicons-Bot/1.0; +http://duckduckgo.com)', 6416, '1568134800', 1568134819),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 10526, '1568221200', 1568221240),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5796, '1568307600', 1568307617),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5836, '1568394000', 1568394002),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6428, '1568480400', 1568480405),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4784, '1568566800', 1568566805),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4828, '1568653200', 1568653205),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4703, '1568739600', 1568739604),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5130, '1568826000', 1568826027),
(0, '0', 'Mozilla/5.0 (compatible; Qwantify/Bleriot/1.1; +https://help.qwant.com/bot)', 8568, '1568912400', 1568912401),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 7320, '1568998800', 1568998802),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 8135, '1569085200', 1569085228),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 7015, '1569171600', 1569171615);
INSERT INTO `visitors` (`id`, `ip`, `user_agent`, `amount`, `date`, `timestamp`) VALUES
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5048, '1569258000', 1569258038),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5344, '1569344400', 1569344404),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4848, '1569430800', 1569430813),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5501, '1569517200', 1569517200),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6767, '1569603600', 1569603610),
(0, '0', 'Mozilla/5.0 (compatible; Qwantify/Bleriot/1.1; +https://help.qwant.com/bot)', 5441, '1569690000', 1569690008),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5329, '1569776400', 1569776419),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5507, '1569862800', 1569862802),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5069, '1569949200', 1569949238),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4842, '1570035600', 1570035640),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5066, '1570122000', 1570122013),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4714, '1570208400', 1570208433),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5905, '1570294800', 1570294803),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4833, '1570381200', 1570381243),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4439, '1570467600', 1570467698),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4520, '1570554000', 1570554048),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4830, '1570640400', 1570640405),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5058, '1570726800', 1570726818),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5340, '1570813200', 1570813207),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 7236, '1570899600', 1570899602),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6829, '1570986000', 1570986014),
(0, '0', 'Mozilla/5.0 (compatible; Qwantify/Bleriot/1.1; +https://help.qwant.com/bot)', 5001, '1571072400', 1571072416),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4842, '1571158800', 1571158816),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4883, '1571245200', 1571245201),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6438, '1571331600', 1571331626),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4663, '1571418000', 1571418005),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4613, '1571504400', 1571504415),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4700, '1571590800', 1571590812),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4972, '1571677200', 1571677227),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5101, '1571763600', 1571763634),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4775, '1571850000', 1571850009),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4109, '1571936400', 1571936492),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4171, '1572022800', 1572022821),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4261, '1572109200', 1572109207),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4846, '1572195600', 1572195630),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4796, '1572282000', 1572282025),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4892, '1572368400', 1572368402),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4693, '1572454800', 1572454800),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4613, '1572541200', 1572541221),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4090, '1572627600', 1572627609),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3982, '1572714000', 1572714020),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4202, '1572800400', 1572800406),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4302, '1572886800', 1572886805),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4683, '1572973200', 1572973256),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5273, '1573059600', 1573059617),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4876, '1573146000', 1573146011),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6317, '1573232400', 1573232424),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5615, '1573318800', 1573318813),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6262, '1573405200', 1573405221),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5508, '1573491600', 1573491638),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 8221, '1573578000', 1573578015),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 7749, '1573664400', 1573664402),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 10969, '1573750800', 1573750814),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 8420, '1573837200', 1573837304),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5684, '1573923600', 1573923657),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5724, '1574010000', 1574010003),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6191, '1574096400', 1574096411),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5740, '1574182800', 1574182802),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6863, '1574269200', 1574269212),
(0, '0', 'Mozilla/5.0(Linux;Android 5.1.1;OPPO A33 Build/LMY47V;wv) AppleWebKit/537.36(KHTML,link Gecko) Version/4.0 Chrome/43.0.2357.121 Mobile Safari/537.36 LieBaoFast/4.51.3', 6754, '1574355600', 1574355610),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5807, '1574442000', 1574442016),
(0, '0', 'Mozilla/5.0 (compatible; Seekport Crawler; http://seekport.com/)', 5270, '1574528400', 1574528400),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4142, '1574614800', 1574614830),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4843, '1574701200', 1574701215),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4469, '1574787600', 1574787681),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6886, '1574874000', 1574874000),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5382, '1574960400', 1574960418),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5609, '1575046800', 1575046812),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4565, '1575133200', 1575133209),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4286, '1575219600', 1575219617),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4300, '1575306000', 1575306043),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5215, '1575392400', 1575392402),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4384, '1575478800', 1575478813),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4230, '1575565200', 1575565208),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 7117, '1575651600', 1575651605),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 18789, '1575738000', 1575738031),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 22918, '1575824400', 1575824405),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 17632, '1575910800', 1575910802),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9718, '1575997200', 1575997211),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5652, '1576083600', 1576083622),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5563, '1576170000', 1576170005),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 3819, '1576256400', 1576256760),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4130, '1576342800', 1576342803),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3990, '1576429200', 1576429221),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3927, '1576515600', 1576515611),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3823, '1576602000', 1576602005),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3739, '1576688400', 1576688425),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4012, '1576774800', 1576774805),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4076, '1576861200', 1576861200),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4069, '1576947600', 1576947658),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3857, '1577034000', 1577034018),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 4605, '1577120400', 1577120404),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4261, '1577206800', 1577206804),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4658, '1577293200', 1577293230),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9305, '1577379600', 1577379604),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4328, '1577466000', 1577466050),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4505, '1577552400', 1577552409),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4367, '1577638800', 1577638824),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5468, '1577725200', 1577725256),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4989, '1577811600', 1577811797),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 5006, '1577898000', 1577898007),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5023, '1577984400', 1577984421),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4310, '1578070800', 1578070804),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4377, '1578157200', 1578157220),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4220, '1578243600', 1578243611),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 5165, '1578330000', 1578330002),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4456, '1578416400', 1578416424),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4355, '1578502800', 1578502802),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4733, '1578589200', 1578589201),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4765, '1578675600', 1578675601),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5783, '1578762000', 1578762019),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5796, '1578848400', 1578848406),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 14774, '1578934800', 1578934801),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 10330, '1579021200', 1579021207),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4628, '1579107600', 1579107657),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4626, '1579194000', 1579194003),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4536, '1579280400', 1579280449),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4874, '1579366800', 1579366802),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5065, '1579453200', 1579453214),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5438, '1579539600', 1579539616),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9294, '1579626000', 1579626044),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 10237, '1579712400', 1579712439),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6420, '1579798800', 1579798812),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4564, '1579885200', 1579885206),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4458, '1579971600', 1579971612),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4447, '1580058000', 1580058021),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4453, '1580144400', 1580144415),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4450, '1580230800', 1580230810),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4176, '1580317200', 1580317201),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3997, '1580403600', 1580403603),
(0, '0', 'Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)', 4090, '1580490000', 1580490028),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5525, '1580576400', 1580576417),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4518, '1580662800', 1580662822),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4503, '1580749200', 1580749200),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4836, '1580835600', 1580835601),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4755, '1580922000', 1580922001),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6103, '1581008400', 1581008401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; FRD-AL00 Build/HUAWEIFRD-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.49 Mobile MQQBrowser/6.2 TBS/043602 Safari/537.36 MicroMessenger/6.5.16.1120 NetType/WIFI Language/zh_CN', 7555, '1581094800', 1581094808),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 8308, '1581181200', 1581181226),
(0, '0', 'Mozilla/5.0(Linux;U;Android 5.1.1;zh-CN;OPPO A33 Build/LMY47V) AppleWebKit/537.36(KHTML,like Gecko) Version/4.0 Chrome/40.0.2214.89 UCBrowser/11.7.0.953 Mobile Safari/537.36', 8525, '1581267600', 1581267602),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9630, '1581354000', 1581354007),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9372, '1581440400', 1581440459),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6936, '1581526800', 1581526808),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 8239, '1581613200', 1581613200),
(0, '0', 'Mozilla/5.0(Linux;U;Android 5.1.1;zh-CN;OPPO A33 Build/LMY47V) AppleWebKit/537.36(KHTML,like Gecko) Version/4.0 Chrome/40.0.2214.89 Mobile Safari/537.36', 9519, '1581699600', 1581699605),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 11064, '1581786000', 1581786001),
(0, '0', 'Mozilla/5.0(Linux;U;Android 5.1.1;zh-CN;OPPO A33 Build/LMY47V) AppleWebKit/537.36(KHTML,like Gecko) Version/4.0 Chrome/40.0.2214.89 UCBrowser/11.7.0.953 Mobile Safari/537.36', 10100, '1581872400', 1581872403),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9967, '1581958800', 1581958813),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 12353, '1582045200', 1582045206),
(0, '0', 'Mozilla/5.0(Linux;Android 5.1.1;OPPO A33 Build/LMY47V;wv) AppleWebKit/537.36(KHTML,link Gecko) Version/4.0 Chrome/42.0.2311.138 Mobile Safari/537.36', 16947, '1582131600', 1582131600),
(0, '0', 'Mozilla/5.0(Linux;U;Android 5.1.1;zh-CN;OPPO A33 Build/LMY47V) AppleWebKit/537.36(KHTML,like Gecko) Version/4.0 Chrome/40.0.2214.89 Mobile Safari/537.36', 20071, '1582218000', 1582218005),
(0, '0', 'Mozilla/5.0(Linux;U;Android 5.1.1;zh-CN;OPPO A33 Build/LMY47V) AppleWebKit/537.36(KHTML,like Gecko) Version/4.0 Chrome/40.0.2214.89 Mobile Safari/537.36', 16345, '1582304400', 1582304403),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 3936, '1582390800', 1582390803),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4469, '1582477200', 1582477246),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4527, '1582563600', 1582563613),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5292, '1582650000', 1582650008),
(0, '0', 'Mozilla/5.0(Linux;Android 5.1.1;OPPO A33 Build/LMY47V;wv) AppleWebKit/537.36(KHTML,link Gecko) Version/4.0 Chrome/43.0.2357.121 Mobile Safari/537.36', 11004, '1582736400', 1582736400),
(0, '0', 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', 9412, '1582822800', 1582822815),
(0, '0', 'Mozilla/5.0(Linux;Android 5.1.1;OPPO A33 Build/LMY47V;wv) AppleWebKit/537.36(KHTML,link Gecko) Version/4.0 Chrome/43.0.2357.121 Mobile Safari/537.36', 10716, '1582909200', 1582909207),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4702, '1582995600', 1582995607),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 6036, '1583082000', 1583082039),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5820, '1583168400', 1583168413),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 9180, '1583254800', 1583254820),
(0, '0', 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', 6535, '1583341200', 1583341210),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 5204, '1583427600', 1583427618),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 11232, '1583514000', 1583514020),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 20961, '1583600400', 1583600411),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 28144, '1583686800', 1583686802),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 21778, '1583773200', 1583773202),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 21727, '1583859600', 1583860574),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 11346, '1583946000', 1583946011),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 18047, '1584032400', 1584032408),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 11376, '1584118800', 1584118803),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 8611, '1584205200', 1584205214),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 8354, '1584291600', 1584291612),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 10275, '1584378000', 1584378014),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 9368, '1584464400', 1584464410),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 12405, '1584550800', 1584550802),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 12267, '1584637200', 1584637201),
(0, '0', 'serpstatbot/1.0 (advanced backlink tracking bot; curl/7.58.0; http://serpstatbot.com/; abuse@serpstatbot.com)', 10068, '1584723600', 1584723600),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 9324, '1584810000', 1584810007),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 7141, '1584896400', 1584896412),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 11494, '1584982800', 1584982811),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 12530, '1585069200', 1585069204),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 4533, '1585155600', 1585155674),
(0, '0', 'Mozilla/5.0 (compatible; SemrushBot/6~bl; +http://www.semrush.com/bot.html)', 3555, '1585242000', 1585242026),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36', 79, '1585328400', 1585329142),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 5, '1585501200', 1585524748),
(0, '0', 'Mozilla/5.0 (compatible; Nimbostratus-Bot/v1.3.2; http://cloudsystemnetworks.com)', 2, '1585587600', 1585658265),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 54, '1585674000', 1585680245),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1527, '1585760400', 1585760694),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1718, '1585846800', 1585846832),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1762, '1585933200', 1585933202),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1699, '1586019600', 1586019602),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1358, '1586106000', 1586106034),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', 1850, '1586192400', 1586192532),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1759, '1586278800', 1586278827),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4572, '1586365200', 1586365233),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 3988, '1586451600', 1586451607),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 4212, '1586538000', 1586538002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 3643, '1586624400', 1586624401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 4090, '1586710800', 1586710803),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 3869, '1586797200', 1586797297),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 8532, '1586883600', 1586883630),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 4719, '1586970000', 1586970041),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 4799, '1587056400', 1587056409),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 4528, '1587142800', 1587142821),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4826, '1587229200', 1587229222),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5417, '1587315600', 1587315681),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5587, '1587402000', 1587402027),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5310, '1587488400', 1587488438),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5113, '1587574800', 1587574810),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5963, '1587661200', 1587661203),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 6823, '1587747600', 1587747676),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6917, '1587834000', 1587834055),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 6669, '1587920400', 1587920402),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5490, '1588006800', 1588006803),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 5876, '1588093200', 1588093213),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 6159, '1588179600', 1588179617),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6391, '1588266000', 1588266006),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 7303, '1588352400', 1588352422),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 6434, '1588438800', 1588438800),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 15429, '1588525200', 1588525203),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 18356, '1588611600', 1588611629),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 19375, '1588698000', 1588698002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 19843, '1588784400', 1588784404),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 18236, '1588870800', 1588870884),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 16953, '1588957200', 1588957336),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 12102, '1589043600', 1589043764),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 14801, '1589130000', 1589130003),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 14625, '1589216400', 1589216464),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 15020, '1589302800', 1589302802),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 14524, '1589389200', 1589389201),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 14737, '1589475600', 1589475622),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 15180, '1589562000', 1589562037),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 14065, '1589648400', 1589648401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 12778, '1589734800', 1589734801),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 17379, '1589821200', 1589821319),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; AspiegelBot)', 16379, '1589907600', 1589907600),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 23025, '1589994000', 1589994000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 14067, '1590080400', 1590080404),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 12838, '1590166800', 1590166800),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 14212, '1590253200', 1590253202),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 13610, '1590339600', 1590339601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 12301, '1590426000', 1590426003),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 10951, '1590512400', 1590512401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9533, '1590598800', 1590598802),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 10768, '1590685200', 1590685203),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 14784, '1590771600', 1590771600),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9566, '1590858000', 1590858002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8741, '1590944400', 1590944455),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8984, '1591030800', 1591030801),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7098, '1591117200', 1591117216),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5285, '1591203600', 1591203601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4394, '1591290000', 1591290021),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4625, '1591376400', 1591376415),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4592, '1591462800', 1591462812),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6217, '1591549200', 1591549209),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 5469, '1591635600', 1591635604),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4473, '1591722000', 1591722009),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4655, '1591808400', 1591808419),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4699, '1591894800', 1591894805),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4548, '1591981200', 1591981202),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4514, '1592067600', 1592067620),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4631, '1592154000', 1592154014),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4968, '1592240400', 1592240413),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4465, '1592326800', 1592326808),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 3281, '1592413200', 1592413219),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 562, '1592499600', 1592499986),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1275, '1592586000', 1592586034),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 862, '1592672400', 1592672434),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 712, '1592758800', 1592759572),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 761, '1592845200', 1592845325),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 697, '1592931600', 1592931647),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 715, '1593018000', 1593018059),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 773, '1593104400', 1593104540),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 838, '1593190800', 1593190802),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Mobile/15E148 Safari/604.1', 846, '1593277200', 1593277208),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 973, '1593363600', 1593363619),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 937, '1593450000', 1593450076),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 832, '1593536400', 1593536469),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 933, '1593622800', 1593622843),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 877, '1593709200', 1593709269),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 813, '1593795600', 1593795823),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 680, '1593882000', 1593882005),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; vivo 1606) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.62 Mobile Safari/537.36', 825, '1593968400', 1593968608),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 2228, '1594054800', 1594055102),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4916, '1594141200', 1594141226),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4906, '1594227600', 1594227617),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4946, '1594314000', 1594314000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5013, '1594400400', 1594400408),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5149, '1594486800', 1594486815),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5005, '1594573200', 1594573218),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4807, '1594659600', 1594659604),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 4906, '1594746000', 1594746002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4679, '1594832400', 1594832405),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4841, '1594918800', 1594918812),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4906, '1595005200', 1595005212),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4879, '1595091600', 1595091605),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4955, '1595178000', 1595178002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4878, '1595264400', 1595264404),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5039, '1595350800', 1595350810),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4851, '1595437200', 1595437219),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4892, '1595523600', 1595523605),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4778, '1595610000', 1595610011),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 3274, '1595696400', 1595696407),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 3158, '1595782800', 1595782806),
(0, '0', 'WhatsApp/2.20.47 A', 4874, '1595869200', 1595869217),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5239, '1595955600', 1595955603),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4965, '1596042000', 1596042002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4647, '1596128400', 1596128412),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5171, '1596214800', 1596214817),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5581, '1596301200', 1596301210),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5651, '1596387600', 1596387603),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5650, '1596474000', 1596474009),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4966, '1596560400', 1596560402),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6036, '1596646800', 1596646819),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5745, '1596733200', 1596733204),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6559, '1596819600', 1596819601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5484, '1596906000', 1596906008),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5396, '1596992400', 1596992420),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4814, '1597078800', 1597078800),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5617, '1597165200', 1597165200),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5441, '1597251600', 1597251601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5420, '1597338000', 1597338007);
INSERT INTO `visitors` (`id`, `ip`, `user_agent`, `amount`, `date`, `timestamp`) VALUES
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5968, '1597424400', 1597424400),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5522, '1597510800', 1597510807),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5257, '1597597200', 1597597217),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4287, '1597683600', 1597683604),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4326, '1597770000', 1597770009),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5675, '1597856400', 1597856409),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5180, '1597942800', 1597942808),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4854, '1598029200', 1598029209),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5123, '1598115600', 1598115663),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4696, '1598202000', 1598202052),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4238, '1598288400', 1598288414),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2430, '1598374800', 1598374809),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 4828, '1598461200', 1598461214),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 3938, '1598547600', 1598547630),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4495, '1598634000', 1598634025),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 5277, '1598720400', 1598720407),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 4328, '1598806800', 1598806817),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 4604, '1598893200', 1598893201),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 6676, '1598979600', 1598979610),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 5855, '1599066000', 1599066024),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 1980, '1599152400', 1599152402),
(0, '0', 'axios/0.19.2', 1466, '1599238800', 1599238876),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 4844, '1599325200', 1599325218),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 5275, '1599411600', 1599411619),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 4778, '1599498000', 1599498009),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 3176, '1599584400', 1599584697),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 5134, '1599670800', 1599670817),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 6546, '1599757200', 1599757218),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 13589, '1599843600', 1599843613),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 12726, '1599930000', 1599930001),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 3729, '1600016400', 1600016406),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 3419, '1600102800', 1600102812),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 5423, '1600189200', 1600189212),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 8460, '1600275600', 1600275601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+http://aspiegel.com/petalbot)', 5092, '1600362000', 1600362014),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4982, '1600448400', 1600448414),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 4896, '1600534800', 1600534816),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4974, '1600621200', 1600621206),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5988, '1600707600', 1600707619),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5252, '1600794000', 1600794002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5757, '1600880400', 1600880406),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5579, '1600966800', 1600966810),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5316, '1601053200', 1601053207),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5613, '1601139600', 1601139601),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 6694, '1601226000', 1601226002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 11585, '1601312400', 1601312400),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9693, '1601398800', 1601398816),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 13997, '1601485200', 1601485219),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 18480, '1601571600', 1601571602),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 18505, '1601658000', 1601658002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 18655, '1601744400', 1601744402),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 17096, '1601830800', 1601830800),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 19394, '1601917200', 1601917201),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 16226, '1602003600', 1602003600),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6034, '1602090000', 1602090016),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7797, '1602176400', 1602176409),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 11455, '1602262800', 1602262806),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7381, '1602349200', 1602349200),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5773, '1602435600', 1602435698),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5934, '1602522000', 1602522000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5791, '1602608400', 1602608403),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5378, '1602694800', 1602694800),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6343, '1602781200', 1602781211),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7361, '1602867600', 1602867601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8984, '1602954000', 1602954001),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 15204, '1603040400', 1603040411),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 11822, '1603126800', 1603126807),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 10186, '1603213200', 1603213213),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 11761, '1603299600', 1603299616),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 10041, '1603386000', 1603386015),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 11063, '1603472400', 1603472402),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 12429, '1603558800', 1603558804),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9423, '1603645200', 1603645203),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 11151, '1603731600', 1603731611),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 12384, '1603818000', 1603818003),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 12248, '1603904400', 1603904401),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 13532, '1603990800', 1603990802),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 15277, '1604077200', 1604077200),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 14531, '1604163600', 1604163603),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 14353, '1604250000', 1604250003),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 36716, '1604336400', 1604336407),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 105477, '1604422800', 1604422833),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 123997, '1604509200', 1604509200),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 105183, '1604595600', 1604595600),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 83213, '1604682000', 1604682000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 106410, '1604768400', 1604768418),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 124842, '1604854800', 1604854800),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 31310, '1604941200', 1604941200),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 50086, '1605027600', 1605027604),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 61330, '1605114000', 1605114001),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 61267, '1605200400', 1605200400),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 41962, '1605286800', 1605286800),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 70817, '1605373200', 1605373200),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 61183, '1605459600', 1605459601),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 60987, '1605546000', 1605546000),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 56478, '1605632400', 1605632400),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 56829, '1605718800', 1605718800),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 52362, '1605805200', 1605805202),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 38294, '1605891600', 1605891603),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 36641, '1605978000', 1605978000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 39341, '1606064400', 1606064415),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 42176, '1606150800', 1606150802),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 41454, '1606237200', 1606237211),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 35622, '1606323600', 1606323609),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 8034, '1606410000', 1606410003),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 5960, '1606496400', 1606496430),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 7066, '1606582800', 1606582811),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6045, '1606669200', 1606669203),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5650, '1606755600', 1606755612),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6351, '1606842000', 1606842004),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6258, '1606928400', 1606928409),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7653, '1607014800', 1607014801),
(0, '0', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 8622, '1607101200', 1607101222),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7533, '1607187600', 1607187608),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 8263, '1607274000', 1607274002),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8241, '1607360400', 1607360402),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 8431, '1607446800', 1607446812),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7908, '1607533200', 1607533208),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7555, '1607619600', 1607619606),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8962, '1607706000', 1607706016),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 13627, '1607792400', 1607792406),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8883, '1607878800', 1607878815),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9347, '1607965200', 1607965201),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9354, '1608051600', 1608051601),
(0, '0', 'Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)', 8287, '1608138000', 1608138001),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 9082, '1608224400', 1608224403),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8080, '1608310800', 1608310812),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8100, '1608397200', 1608397203),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 8048, '1608483600', 1608483610),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7840, '1608570000', 1608570016),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6610, '1608656400', 1608656411),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 13140, '1608742800', 1608742811),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 15476, '1608829200', 1608829213),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 8352, '1608915600', 1608915601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7321, '1609002000', 1609002000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5990, '1609088400', 1609088418),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 14636, '1609174800', 1609174809),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7219, '1609261200', 1609261205),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6939, '1609347600', 1609347606),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7404, '1609434000', 1609434008),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9942, '1609520400', 1609520409),
(0, '0', 'serpstatbot/2.0 beta (advanced backlink tracking bot; http://serpstatbot.com/; abuse@serpstatbot.com)', 13730, '1609606800', 1609606800),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 6944, '1609693200', 1609693201),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6703, '1609779600', 1609779614),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6223, '1609866000', 1609866000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6804, '1609952400', 1609952417),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6843, '1610038800', 1610038807),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6878, '1610125200', 1610125212),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7073, '1610211600', 1610211605),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 8374, '1610298000', 1610298012),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6975, '1610384400', 1610384419),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8044, '1610470800', 1610470815),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9480, '1610557200', 1610557204),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8925, '1610643600', 1610643605),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7514, '1610730000', 1610730010),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 11012, '1610816400', 1610816418),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 13352, '1610902800', 1610902803),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 12757, '1610989200', 1610989213),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 10657, '1611075600', 1611075605),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6045, '1611162000', 1611162009),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7436, '1611248400', 1611248401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7553, '1611334800', 1611334808),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.109 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6287, '1611421200', 1611421204),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.109 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 8711, '1611507600', 1611507601),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6065, '1611594000', 1611594015),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5566, '1611680400', 1611680405),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6403, '1611766800', 1611766818),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5748, '1611853200', 1611853217),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6627, '1611939600', 1611939617),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5675, '1612026000', 1612026013),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6193, '1612112400', 1612112401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5857, '1612198800', 1612198808),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1)', 7171, '1612285200', 1612285206),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7020, '1612371600', 1612371615),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7355, '1612458000', 1612458001),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6042, '1612544400', 1612544412),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 9311, '1612630800', 1612630800),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6054, '1612717200', 1612717201),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6005, '1612803600', 1612803605),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7446, '1612890000', 1612890005),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6695, '1612976400', 1612976415),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5948, '1613062800', 1613062803),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7566, '1613149200', 1613149205),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6309, '1613235600', 1613235614),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5628, '1613322000', 1613322019),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6119, '1613408400', 1613408402),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 8733, '1613494800', 1613494821),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7344, '1613581200', 1613581200),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 6230, '1613667600', 1613667608),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7014, '1613754000', 1613754000),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5647, '1613840400', 1613840403),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5369, '1613926800', 1613926803),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5421, '1614013200', 1614013200),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 7914, '1614099600', 1614099619),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5976, '1614186000', 1614186003),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5623, '1614272400', 1614272401),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 5506, '1614358800', 1614358812),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 3670, '1614445200', 1614445210),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)', 1860, '1614531600', 1614531614),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 6, '1614618000', 1614629430),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 9, '1614704400', 1614712868),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 8, '1614790800', 1614795137),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 10, '1614877200', 1614888465),
(0, '0', 'Mozilla/5.0 (compatible; TestBot/0.1; +In_the_test_phase,_if_the_spider_brings_you_trouble,_please_add_our_IP_to_the_blacklist._Thank_you.)', 21, '1614963600', 1614967586),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 24, '1615050000', 1615055339),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 6, '1615136400', 1615136859),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 19, '1615222800', 1615241300),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 10, '1615309200', 1615317180),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 2, '1615395600', 1615427438),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 4, '1615482000', 1615545881),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0', 40, '1615568400', 1615569930),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 1, '1615741200', 1615799085),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 8, '1615827600', 1615853482),
(0, '0', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 2, '1615914000', 1615916862),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:57.0) Gecko/20100101 Firefox/57.0', 1, '1616000400', 1616078883),
(0, '0', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 3, '1616086800', 1616145002),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 3, '1616173200', 1616194032),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:57.0) Gecko/20100101 Firefox/57.0', 1, '1616259600', 1616296018),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 30, '1616346000', 1616419191),
(0, '0', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 1, '1616432400', 1616491811),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', 50, '1616518800', 1616557841),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; SAMSUNG SM-G610F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/13.0 Chrome/83.0.4103.106 Mobile Safari/537.36', 10, '1616605200', 1616606278),
(0, '0', 'CheckMarkNetwork/1.0 (+http://www.checkmarknetwork.com/spider.html)', 16, '1616691600', 1616692660),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', 7, '1616778000', 1616835450),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-M515F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/13.2 Chrome/83.0.4103.106 Mobile Safari/537.36', 3, '1616864400', 1616867399),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', 11, '1616950800', 1616951608),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', 9, '1617037200', 1617042204),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 7, '1617123600', 1617124433),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 6, '1617210000', 1617212054),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 6, '1617296400', 1617304644),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 7, '1617382800', 1617418869),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 8, '1617469200', 1617469646),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', 44, '1617555600', 1617565773),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 22, '1617642000', 1617650544),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 10, '1617728400', 1617746963),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 24, '1617814800', 1617834084),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', 33, '1617901200', 1617905651),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/81.0.4044.138 Chrome/81.0.4044.138 Safari/537.36', 33, '1617901200', 1617905651),
(0, '0', 'Mozilla/5.0 (X11; Linux i686; rv:47.0) Gecko/20100101 Firefox/47.0', 22, '1617987600', 1617989310),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; CPH2285) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Mobile Safari/537.36', 15, '1618074000', 1618075092),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', 12, '1618160400', 1618163493),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.71 Safari/537.36', 12, '1618246800', 1618251372),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 22, '1618333200', 1618352307),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 12, '1618419600', 1618437937),
(0, '0', 'Mozilla/5.0 (compatible; TkBot/0.1; +In_the_test_phase,_if_the_spider_brings_you_trouble,_please_add_our_IP_to_the_blacklist._Thank_you.)', 9, '1618506000', 1618518023),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 13, '1618592400', 1618609655),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', 8, '1618678800', 1618688284),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 5, '1618765200', 1618782423),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 13, '1618851600', 1618863977),
(0, '0', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', 26, '1618938000', 1618954362),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1619024400', 1619026882),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 26, '1619110800', 1619114177),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 30, '1619197200', 1619200072),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 31, '1619283600', 1619283688),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 88, '1619370000', 1619371036),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 35, '1619456400', 1619457896),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 29, '1619542800', 1619543485),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1619629200', 1619629822),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1619715600', 1619718083),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 26, '1619802000', 1619805482),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1619888400', 1619890423),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 32, '1619974800', 1619974822),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 30, '1620061200', 1620064106),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 32, '1620147600', 1620147663),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1620234000', 1620234054),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 36, '1620320400', 1620321463),
(0, '0', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 17, '1620406800', 1620408603),
(0, '0', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 17, '1620406800', 1620408603),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 7, '1620493200', 1620494482),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 15, '1620579600', 1620593413),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 29, '1620666000', 1620677551),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 17, '1620752400', 1620754412),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 7, '1620838800', 1620855454),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 15, '1620925200', 1620926009),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 21, '1621011600', 1621026232),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 14, '1621098000', 1621099886),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1621184400', 1621185866),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 31, '1621270800', 1621274437),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 33, '1621357200', 1621361498),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 32, '1621443600', 1621445307),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 26, '1621530000', 1621531697),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1621616400', 1621617304),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1621702800', 1621702885),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1621789200', 1621789238),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 30, '1621875600', 1621876506),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1621962000', 1621962303),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 29, '1622048400', 1622049955),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1622134800', 1622135467),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 29, '1622221200', 1622225514),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 25, '1622307600', 1622312127),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 52, '1622394000', 1622397232),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 53, '1622480400', 1622482000),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 63, '1622566800', 1622570138),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 34, '1622653200', 1622654313),
(0, '0', 'Mozilla/5.0 (compatible; archive.org_bot +http://archive.org/details/archive.org_bot)', 77, '1622739600', 1622742048),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 23, '1622826000', 1622834146),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 25, '1622912400', 1622920570),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 32, '1622998800', 1623005413),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 20, '1623085200', 1623091794),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 20, '1623085200', 1623091794),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 29, '1623171600', 1623178932),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 19, '1623258000', 1623265700),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 27, '1623344400', 1623353233),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; Lenovo K33a42) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.101 Mobile Safari/537.36', 24, '1623430800', 1623435180),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 31, '1623517200', 1623518996),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 20, '1623603600', 1623617946),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 20, '1623603600', 1623617946),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 46, '1623690000', 1623702952),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 24, '1623776400', 1623778821),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 20, '1623862800', 1623880912),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 29, '1623949200', 1623961497),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:59.0) Gecko/20100101 Firefox/59.0', 22, '1624035600', 1624037390),
(0, '0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1500.55 Safari/537.36', 14, '1624122000', 1624126382),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; SM-F415F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Mobile Safari/537.36', 29, '1624208400', 1624209557),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 51, '1624294800', 1624297517);
INSERT INTO `visitors` (`id`, `ip`, `user_agent`, `amount`, `date`, `timestamp`) VALUES
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 20, '1624381200', 1624394269),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:57.0) Gecko/20100101 Firefox/57.0', 42, '1624467600', 1624479227),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1624554000', 1624574410),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 17, '1624640400', 1624649299),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 11, '1624726800', 1624729354),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 15, '1624813200', 1624816442),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 13, '1624899600', 1624916377),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 99, '1624986000', 1624995318),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36', 15, '1625072400', 1625077672),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', 16, '1625158800', 1625170529),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 29, '1625245200', 1625248505),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6, '1625331600', 1625348495),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 6, '1625331600', 1625348495),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 19, '1625418000', 1625433346),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 40, '1625504400', 1625520388),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; RMX3081) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36', 43, '1625590800', 1625592191),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 19, '1625677200', 1625684280),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.64', 72, '1625763600', 1625764189),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 18, '1625850000', 1625865494),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 18, '1625850000', 1625865494),
(0, '0', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;  Trident/5.0)', 16, '1625936400', 1625939086),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 14, '1626022800', 1626031962),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 19, '1626109200', 1626121416),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 20, '1626195600', 1626207803),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:57.0) Gecko/20100101 Firefox/57.0', 84, '1626282000', 1626282395),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 22, '1626368400', 1626375666),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 12, '1626454800', 1626467041),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 11, '1626541200', 1626553467),
(0, '0', 'Mozilla/5.0 (compatible; Linespider/1.1; +https://lin.ee/4dwXkTH)', 35, '1626627600', 1626629486),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 28, '1626714000', 1626715173),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 30, '1626800400', 1626808066),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; CPH1923) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36', 22, '1626886800', 1626887120),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 61, '1626973200', 1626976573),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; Lenovo K320t) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.93 Mobile Safari/537.36', 94, '1627059600', 1627061737),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 74, '1627146000', 1627147707),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 43, '1627232400', 1627233029),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; CPH2127) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36', 23, '1627318800', 1627319351),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 237, '1627405200', 1627406221),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 83, '1627491600', 1627492667),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1627578000', 1627579521),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 50, '1627664400', 1627664587),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 28, '1627750800', 1627750859),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 112, '1627837200', 1627837274),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 92, '1627923600', 1627925842),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; AC2001) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.115 Mobile Safari/537.36', 38, '1628010000', 1628010249),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36', 56, '1628096400', 1628096482),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 51, '1628182800', 1628184635),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', 138, '1628269200', 1628272834),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 82, '1628355600', 1628359512),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 67, '1628442000', 1628445069),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 63, '1628528400', 1628531275),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; RMX2193) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 50, '1628614800', 1628617510),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; vivo 1814) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 40, '1628701200', 1628703062),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; DUA-L22) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36', 80, '1628787600', 1628787754),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 47, '1628874000', 1628878114),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 72, '1628960400', 1628962000),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 5 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 63, '1629046800', 1629046816),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; vivo 1803) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 72, '1629133200', 1629133999),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; CPH1969) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Mobile Safari/537.36', 133, '1629219600', 1629221005),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; SM-A105F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 27, '1629306000', 1629306326),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 120, '1629392400', 1629396008),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 35, '1629478800', 1629482437),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 99, '1629565200', 1629567158),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 49, '1629651600', 1629653516),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0; HUAWEI P20 Build/23112) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4472.114 Mobile Safari/537.36 Edg/86', 68, '1629738000', 1629738269),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 89, '1629824400', 1629825163),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 34, '1629910800', 1629910837),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 70, '1629997200', 1629997854),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 20, '1630083600', 1630085236),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; SM-G610F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 112, '1630170000', 1630171424),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 50, '1630256400', 1630259413),
(0, '0', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 19, '1630342800', 1630351224),
(0, '0', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.0', 41, '1630429200', 1630430780),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 153, '1630515600', 1630515703),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 61, '1630602000', 1630608238),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; moto e5 plus) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36', 66, '1630688400', 1630688599),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 41, '1630774800', 1630783921),
(0, '0', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)', 36, '1630861200', 1630862945),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; rv:11.0) like Gecko', 52, '1630947600', 1630949079),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 84, '1631034000', 1631038202),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; LDN-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 77, '1631120400', 1631120402),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 68, '1631206800', 1631206892),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 74, '1631293200', 1631293363),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 135, '1631379600', 1631382094),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 118, '1631466000', 1631471168),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 91, '1631552400', 1631556974),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 80, '1631638800', 1631640777),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; ONEPLUS A3003 Build/OPR6.170623.013) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36', 100, '1631725200', 1631725583),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 94, '1631811600', 1631815514),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 139, '1631898000', 1631898940),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 119, '1631984400', 1631984704),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 117, '1632070800', 1632072793),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 101, '1632157200', 1632157788),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; vivo 1933) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', 177, '1632243600', 1632248061),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.1.1; vivo V3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', 351, '1632330000', 1632330185),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1048, '1632416400', 1632416539),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1198, '1632502800', 1632502914),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 935, '1632589200', 1632589719),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3322, '1632675600', 1632675657),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-J701F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.127 Mobile Safari/537.36', 13204, '1632762000', 1632762043),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 11343, '1632848400', 1632848405),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5277, '1632934800', 1632934835),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 14873, '1633021200', 1633021204),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 19409, '1633107600', 1633107600),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 18524, '1633194000', 1633194000),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 31842, '1633280400', 1633280401),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 34942, '1633366800', 1633366800),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 25977, '1633453200', 1633453208),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 19345, '1633539600', 1633539601),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 17811, '1633626000', 1633626010),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 15427, '1633712400', 1633712403),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 15725, '1633798800', 1633798809),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 18457, '1633885200', 1633885211),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 30622, '1633971600', 1633971609),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 23238, '1634058000', 1634058007),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 20608, '1634144400', 1634144403),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 18655, '1634230800', 1634230802),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 19004, '1634317200', 1634317204),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 22158, '1634403600', 1634403600),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 11079, '1634490000', 1634490026),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 11308, '1634576400', 1634576439),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 13532, '1634662800', 1634662802),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5243, '1634749200', 1634749212),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1741, '1634835600', 1634835609),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2051, '1634922000', 1634922041),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1876, '1635008400', 1635008422),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1588, '1635094800', 1635094939),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 961, '1635181200', 1635181202),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 329, '1635267600', 1635267612),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 403, '1635354000', 1635354601),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 361, '1635440400', 1635441239),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 454, '1635526800', 1635526901),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1157, '1635613200', 1635613219),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2129, '1635699600', 1635699612),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3418, '1635786000', 1635786071),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1830, '1635872400', 1635872471),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2536, '1635958800', 1635958806),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3192, '1636045200', 1636045226),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3196, '1636131600', 1636131605),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3527, '1636218000', 1636218088),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3461, '1636304400', 1636304417),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2389, '1636390800', 1636390804),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3338, '1636477200', 1636477249),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2463, '1636563600', 1636563641),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1239, '1636650000', 1636650037),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1401, '1636736400', 1636736431),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1587, '1636822800', 1636822805),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1598, '1636909200', 1636909295),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1417, '1636995600', 1636995623),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 72, '1637082000', 1637084749),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 517, '1637168400', 1637173194),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 861, '1637254800', 1637254877),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 658, '1637341200', 1637341208),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; BAH2-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.74 Safari/537.36', 123, '1637427600', 1637428477),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 218, '1637514000', 1637514304),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3614, '1637600400', 1637604142),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3596, '1637686800', 1637686830),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3501, '1637773200', 1637773200),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1803, '1637859600', 1637859601),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1773, '1637946000', 1637946082),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 544, '1638032400', 1638032507),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1514, '1638118800', 1638119145),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2323, '1638205200', 1638205258),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2921, '1638291600', 1638291626),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3244, '1638378000', 1638378037),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 14190, '1638464400', 1638464433),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 12350, '1638550800', 1638550807),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 11980, '1638637200', 1638637223),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 908, '1638723600', 1638723930),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 815, '1638810000', 1638810360),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1919, '1638896400', 1638896587),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 9102, '1638982800', 1638982817),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7465, '1639069200', 1639069206),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 9405, '1639155600', 1639155621),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4852, '1639242000', 1639242037),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1305, '1639328400', 1639328437),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1062, '1639414800', 1639414884),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; M2101K7BG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Mobile Safari/537.36', 1040, '1639501200', 1639501206),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 651, '1639587600', 1639587700),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 955, '1639674000', 1639674053),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 8362, '1639760400', 1639760459),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 12481, '1639846800', 1639847101),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6805, '1639933200', 1639933202),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1177, '1640019600', 1640019607),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1232, '1640106000', 1640106146),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1356, '1640192400', 1640192411),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1004, '1640278800', 1640278910),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 326, '1640365200', 1640367817),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.0.0; LDN-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', 422, '1640451600', 1640451611),
(0, '0', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 465, '1640538000', 1640538572),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 298, '1640624400', 1640625812),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-J700F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/15.0 Chrome/90.0.4430.210 Mobile Safari/537.36', 479, '1640710800', 1640710907),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 595, '1640797200', 1640797392),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 722, '1640883600', 1640883698),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 334, '1640970000', 1640970205),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 758, '1641056400', 1641056592),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 880, '1641142800', 1641144718),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1059, '1641229200', 1641229256),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2857, '1641315600', 1641315605),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3734, '1641402000', 1641402015),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3212, '1641488400', 1641488414),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3547, '1641574800', 1641574804),
(0, '0', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;  Trident/5.0)', 2451, '1641661200', 1641661205),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6237, '1641747600', 1641747605),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5355, '1641834000', 1641834210),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5344, '1641920400', 1641920429),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6184, '1642006800', 1642006826),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3663, '1642093200', 1642093243),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1745, '1642179600', 1642179691),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.87 Mobile Safari/537.36', 1453, '1642266000', 1642267372),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', 1873, '1642352400', 1642352932),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; M2101K7AI) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.87 Mobile Safari/537.36', 973, '1642438800', 1642440629),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4095, '1642525200', 1642525326),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4370, '1642611600', 1642611628),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5291, '1642698000', 1642698006),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4041, '1642784400', 1642784408),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2488, '1642870800', 1642871516),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4350, '1642957200', 1642957532),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1543, '1643043600', 1643044095),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1451, '1643130000', 1643130038),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2530, '1643216400', 1643216900),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1214, '1643302800', 1643303304),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1810, '1643389200', 1643389502),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2153, '1643475600', 1643476061),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1847, '1643562000', 1643562432),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2316, '1643648400', 1643648435),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2009, '1643734800', 1643734873),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2044, '1643821200', 1643821496),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2188, '1643907600', 1643907613),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1983, '1643994000', 1643994285),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2099, '1644080400', 1644080412),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1824, '1644166800', 1644167223),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1615, '1644253200', 1644253428),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 702, '1644339600', 1644339871),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 905, '1644426000', 1644426317),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1124, '1644512400', 1644512793),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1134, '1644598800', 1644598828),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1231, '1644685200', 1644685719),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1178, '1644771600', 1644771944),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1161, '1644858000', 1644858450),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 769, '1644944400', 1644944641),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.87 Mobile Safari/537.36', 668, '1645030800', 1645030813),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 532, '1645117200', 1645117458),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 724, '1645203600', 1645203798),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 814, '1645290000', 1645290583),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1018, '1645376400', 1645376401),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1113, '1645462800', 1645462954),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1090, '1645549200', 1645549210),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1239, '1645635600', 1645635658),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; RMX1825) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.101 Mobile Safari/537.36', 1372, '1645722000', 1645722048),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2116, '1645808400', 1645808471),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2066, '1645894800', 1645894817),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1725, '1645981200', 1645981303),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1627, '1646067600', 1646067609),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1842, '1646154000', 1646154016),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1929, '1646240400', 1646240425),
(0, '0', 'Mozilla/5.0 (compatible; Adsbot/3.1; +https://seostar.co/robot/)', 1066, '1646326800', 1646326803),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1061, '1646413200', 1646413219),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1806, '1646499600', 1646499606),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2296, '1646586000', 1646586130),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1100, '1646672400', 1646672660),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5499, '1646758800', 1646759375),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7271, '1646845200', 1646845210),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 7947, '1646931600', 1646931605),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 11309, '1647018000', 1647018000),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 12227, '1647104400', 1647104402),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 9527, '1647190800', 1647190807),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 5241, '1647277200', 1647277208),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4003, '1647363600', 1647363622),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1476, '1647450000', 1647450008),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1727, '1647536400', 1647536403),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 499, '1647622800', 1647623145),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 729, '1647709200', 1647709371),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 767, '1647795600', 1647795683),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 453, '1647882000', 1647882083),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 194, '1647968400', 1647969182),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 269, '1648054800', 1648054816),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 285, '1648141200', 1648141325),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; vivo 1803 Build/O11019) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.91 Mobile Safari/537.36', 247, '1648227600', 1648227683),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 219, '1648314000', 1648314366),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 306, '1648400400', 1648400576),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', 222, '1648486800', 1648486964),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 191, '1648573200', 1648574113),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 205, '1648659600', 1648659796),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1045, '1648746000', 1648746210),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 480, '1648832400', 1648832953),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 177, '1648918800', 1648918801),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1007, '1649005200', 1649005232),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 193, '1649091600', 1649091962),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 223, '1649178000', 1649178201),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 276, '1649264400', 1649264501),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 199, '1649350800', 1649351075),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 72, '1649437200', 1649437420),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 180, '1649523600', 1649524522),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 178, '1649610000', 1649612162),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.71 Safari/537.36', 75, '1649696400', 1649696866),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 145, '1649782800', 1649783004),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 100, '1649869200', 1649869594),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 67, '1649955600', 1649959265),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 67, '1650042000', 1650043278),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; SM-A525F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.61 Mobile Safari/537.36', 113, '1650128400', 1650128947),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 328, '1650214800', 1650214932),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 101, '1650301200', 1650301251),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 154, '1650387600', 1650390678),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 85, '1650474000', 1650479371),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:79.0) Gecko/20100101 Firefox/79.0', 156, '1650560400', 1650560768),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 149, '1650646800', 1650649349),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 197, '1650733200', 1650734379),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; CPH2363) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36', 146, '1650819600', 1650819608),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 246, '1650906000', 1650906642),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0; Nokia 105 Build/LRX21M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.99 Mobile Safari/537.36', 176, '1650992400', 1650992718),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 205, '1651078800', 1651078896),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1477, '1651165200', 1651165327),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1298, '1651251600', 1651251855),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1', 1243, '1651338000', 1651338049),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 964, '1651424400', 1651424809),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1170, '1651510800', 1651511269),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1270, '1651597200', 1651597291),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1287, '1651683600', 1651683648),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1447, '1651770000', 1651770030),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1298, '1651856400', 1651856414),
(0, '0', 'Mozilla/5.0 (Linux; Android 8.1.0; CPH1909) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Mobile Safari/537.36', 1742, '1651942800', 1651943595),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1159, '1652029200', 1652029255),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1200, '1652115600', 1652115892),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1826, '1652202000', 1652202071),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1026, '1652288400', 1652288439),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 988, '1652374800', 1652377195),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1422, '1652461200', 1652461275),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 869, '1652547600', 1652547810),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1245, '1652634000', 1652634002),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 988, '1652720400', 1652720481),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1198, '1652806800', 1652806828),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1247, '1652893200', 1652893366),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1447, '1652979600', 1652979739),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2021, '1653066000', 1653066040),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1720, '1653152400', 1653152505),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3379, '1653238800', 1653238841),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 4721, '1653325200', 1653325288),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 6838, '1653411600', 1653411607),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 10659, '1653498000', 1653498011),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 978, '1653584400', 1653584446),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 910, '1653670800', 1653670839),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 880, '1653757200', 1653757311),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; CPH2239) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.61 Mobile Safari/537.36', 909, '1653843600', 1653843601),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 599, '1653930000', 1653930108),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 939, '1654016400', 1654016691),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 709, '1654102800', 1654102941),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 222, '1654189200', 1654190091),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; SM-M315F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36', 301, '1654275600', 1654275618),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 216, '1654362000', 1654362457),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; M2004J19PI) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36', 318, '1654448400', 1654450585),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; Moto C Plus) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Mobile Safari/537.36', 236, '1654534800', 1654534851),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; SM-A307FN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.61 Mobile Safari/537.36', 231, '1654621200', 1654621629),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 187, '1654707600', 1654709477),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 282, '1654794000', 1654794042),
(0, '0', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 275, '1654880400', 1654880479),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; SM-M127G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 218, '1654966800', 1654967663),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; CPH1823) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Mobile Safari/537.36', 306, '1655053200', 1655053231),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; V2029) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 204, '1655139600', 1655139720),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; RMX1825) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.61 Mobile Safari/537.36', 242, '1655226000', 1655226104),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; SM-F415F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Mobile Safari/537.36', 155, '1655312400', 1655312765),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 234, '1655398800', 1655398883),
(0, '0', 'Mozilla/5.0 (compatible; DataForSeoBot/1.0; +https://dataforseo.com/dataforseo-bot)', 184, '1655485200', 1655485315),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Mobile Safari/537.36', 188, '1655571600', 1655573440),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 188, '1655658000', 1655658311),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 161, '1655744400', 1655744815),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 168, '1655830800', 1655831187),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/100.0.4896.127 Safari/537.36', 182, '1655917200', 1655917430),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 114, '1656003600', 1656005713),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 142, '1656090000', 1656090794),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 142, '1656090000', 1656090794),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 148, '1656176400', 1656176768),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 148, '1656176400', 1656176768),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 104, '1656262800', 1656264332),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 133, '1656349200', 1656349603),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; RMX2050) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Mobile Safari/537.36', 134, '1656435600', 1656436222),
(0, '0', 'Mozilla/5.0 (compatible; DataForSeoBot/1.0; +https://dataforseo.com/dataforseo-bot)', 7595, '1656522000', 1656522606),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 13329, '1656608400', 1656608401),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12824, '1656694800', 1656694804),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 7850, '1656781200', 1656781203),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 179, '1656867600', 1656867765),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 219, '1656954000', 1656955004),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 219, '1657040400', 1657040998),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 266, '1657126800', 1657127282),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 10859, '1657213200', 1657213745),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 13104, '1657299600', 1657299603),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 2663, '1657386000', 1657386007),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 176, '1657472400', 1657473425),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 132, '1657558800', 1657558939),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 698, '1657645200', 1657645508),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1016, '1657731600', 1657731630),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2974, '1657818000', 1657818016),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3236, '1657904400', 1657904408),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3306, '1657990800', 1657990802),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3120, '1658077200', 1658077216);
INSERT INTO `visitors` (`id`, `ip`, `user_agent`, `amount`, `date`, `timestamp`) VALUES
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1970, '1658163600', 1658163699),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2021, '1658250000', 1658250351),
(0, '0', 'Mozilla/5.0 (compatible; DataForSeoBot/1.0; +https://dataforseo.com/dataforseo-bot)', 1029, '1658336400', 1658336400),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 8032, '1658422800', 1658423067),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1110, '1658509200', 1658509281),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 563, '1658595600', 1658595636),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 920, '1658682000', 1658682822),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3283, '1658768400', 1658768429),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11429, '1658854800', 1658854800),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 10331, '1658941200', 1658941218),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 17027, '1659027600', 1659027602),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 14773, '1659114000', 1659114001),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 15025, '1659200400', 1659200406),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10502, '1659286800', 1659286804),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; V2058) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Mobile Safari/537.36', 2464, '1659373200', 1659373270),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1934, '1659459600', 1659460057),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2184, '1659546000', 1659546041),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2219, '1659632400', 1659632440),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2087, '1659718800', 1659718802),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2185, '1659805200', 1659805233),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1931, '1659891600', 1659891657),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2293, '1659978000', 1659978160),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1682, '1660064400', 1660064457),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1543, '1660150800', 1660150802),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1293, '1660237200', 1660237398),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1134, '1660323600', 1660323677),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1890, '1660410000', 1660410017),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2040, '1660496400', 1660496426),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2407, '1660582800', 1660582808),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2577, '1660669200', 1660669244),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2997, '1660755600', 1660755600),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2352, '1660842000', 1660842046),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2215, '1660928400', 1660928410),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2305, '1661014800', 1661014819),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2625, '1661101200', 1661101249),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2103, '1661187600', 1661187760),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2372, '1661274000', 1661274027),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2785, '1661360400', 1661360433),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2410, '1661446800', 1661446805),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3322, '1661533200', 1661533221),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3211, '1661619600', 1661619621),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2854, '1661706000', 1661706027),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2847, '1661792400', 1661792437),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2983, '1661878800', 1661878815),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3034, '1661965200', 1661965207),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3123, '1662051600', 1662051604),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3452, '1662138000', 1662138105),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3467, '1662224400', 1662224403),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3606, '1662310800', 1662310828),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3700, '1662397200', 1662397203),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3433, '1662483600', 1662483639),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3149, '1662570000', 1662570011),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2321, '1662656400', 1662656445),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3019, '1662742800', 1662742840),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3612, '1662829200', 1662829241),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3906, '1662915600', 1662915613),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2824, '1663002000', 1663002031),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 3058, '1663088400', 1663088408),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2954, '1663174800', 1663174830),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2981, '1663261200', 1663261203),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2372, '1663347600', 1663347602),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1821, '1663434000', 1663434044),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1691, '1663520400', 1663520400),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1655, '1663606800', 1663606937),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1629, '1663693200', 1663693215),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1707, '1663779600', 1663779696),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1568, '1663866000', 1663866114),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1391, '1663952400', 1663952571),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1380, '1664038800', 1664038815),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1304, '1664125200', 1664125265),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1427, '1664211600', 1664211801),
(0, '0', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 1475, '1664298000', 1664298738),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1395, '1664384400', 1664384502),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1068, '1664470800', 1664470831),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1032, '1664557200', 1664557356),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 889, '1664643600', 1664644020),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 861, '1664730000', 1664730082),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; V2040 Build/SP1A.210812.003; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/91.0.4472.114 Mobile Safari/537.36', 906, '1664816400', 1664816421),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 787, '1664902800', 1664902833),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 733, '1664989200', 1664989295),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 587, '1665075600', 1665076556),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 702, '1665162000', 1665162176),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 527, '1665248400', 1665248416),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 489, '1665334800', 1665334802),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4089.0 Safari/537.36', 573, '1665421200', 1665421445),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 612, '1665507600', 1665507607),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 555, '1665594000', 1665594041),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 461, '1665680400', 1665680432),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 486, '1665766800', 1665766886),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; M2006C3LII) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Mobile Safari/537.36', 430, '1665853200', 1665853828),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.44 Safari/537.36 OPR/69.0.3686.7 (Edition beta)', 420, '1665939600', 1665939831),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 186, '1666026000', 1666026082),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 378, '1666112400', 1666112426),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 381, '1666198800', 1666198825),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 743, '1666285200', 1666285253),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1219, '1666371600', 1666372436),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 982, '1666458000', 1666458214),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 858, '1666544400', 1666544496),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96', 855, '1666630800', 1666630930),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 900, '1666717200', 1666717214),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 863, '1666803600', 1666803609),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 866, '1666890000', 1666890048),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 617, '1666976400', 1666976423),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1194, '1667062800', 1667062874),
(0, '0', 'serpstatbot/2.1 (advanced backlink tracking bot; https://serpstatbot.com/; abuse@serpstatbot.com)', 1197, '1667149200', 1667149220),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 732, '1667235600', 1667235650),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; M2101K7BI) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', 724, '1667322000', 1667322005),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 657, '1667408400', 1667408489),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 751, '1667494800', 1667495413),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 903, '1667581200', 1667581323),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 567, '1667667600', 1667667745),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 509, '1667754000', 1667754088),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; Infinix X689) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 547, '1667840400', 1667840617),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 521, '1667926800', 1667927668),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 588, '1668013200', 1668013269),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 516, '1668099600', 1668100134),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 578, '1668186000', 1668186176),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 421, '1668272400', 1668272677),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 497, '1668358800', 1668358965),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 363, '1668445200', 1668446519),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 371, '1668531600', 1668531687),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 2015, '1668618000', 1668618715),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 407, '1668704400', 1668704567),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 355, '1668790800', 1668790886),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 279, '1668877200', 1668877451),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 413, '1668963600', 1668964577),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; M2101K7AI) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Mobile Safari/537.36', 591, '1669050000', 1669050499),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 764, '1669136400', 1669136766),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; CPH2219) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 661, '1669222800', 1669223044),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 526, '1669309200', 1669309207),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 710, '1669395600', 1669395661),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; SM-M215G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 609, '1669482000', 1669482362),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; SM-M215G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 609, '1669482000', 1669482362),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 YaBrowser/22.7.0 Yowser/2.5 Safari/537.36', 686, '1669568400', 1669568890),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 686, '1669654800', 1669655063),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 446, '1669741200', 1669741278),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 282, '1669827600', 1669828122),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 263, '1669914000', 1669914221),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 234, '1670000400', 1670000703),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 10310, '1670086800', 1670087747),
(0, '0', 'Mozilla/5.0 (compatible; Yeti/1.1; +https://naver.me/spd)', 10554, '1670173200', 1670173200),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9672, '1670259600', 1670259602),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 7806, '1670346000', 1670346008),
(0, '0', 'Mozilla/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 305, '1670432400', 1670432858),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 453, '1670518800', 1670518864),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 11027, '1670605200', 1670606190),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11753, '1670691600', 1670691607),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 550, '1670778000', 1670778173),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 550, '1670864400', 1670864411),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 612, '1670950800', 1670951002),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 2630, '1671037200', 1671037324),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11319, '1671123600', 1671123605),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11445, '1671210000', 1671210008),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12132, '1671296400', 1671296402),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12565, '1671382800', 1671382803),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 13059, '1671469200', 1671469202),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12278, '1671555600', 1671555600),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 13532, '1671642000', 1671642003),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 14656, '1671728400', 1671728407),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 15966, '1671814800', 1671814801),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11463, '1671901200', 1671901207),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11482, '1671987600', 1671987603),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11006, '1672074000', 1672074006),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10628, '1672160400', 1672160406),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10497, '1672246800', 1672246804),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10203, '1672333200', 1672333207),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9922, '1672419600', 1672419607),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9731, '1672506000', 1672506005),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9438, '1672592400', 1672592407),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9155, '1672678800', 1672678801),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9660, '1672765200', 1672765209),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9329, '1672851600', 1672851600),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9186, '1672938000', 1672938006),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8946, '1673024400', 1673024411),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9320, '1673110800', 1673110806),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9713, '1673197200', 1673197206),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9811, '1673283600', 1673283607),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9133, '1673370000', 1673370005),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8639, '1673456400', 1673456410),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8509, '1673542800', 1673542803),
(0, '0', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 273, '1673629200', 1673629452),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.5414.74 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 114, '1673715600', 1673715837),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.44 Safari/537.36 OPR/69.0.3686.7 (Edition beta)', 2008, '1673802000', 1673803388),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8560, '1673888400', 1673888401),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8504, '1673974800', 1673974807),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12699, '1674061200', 1674061210),
(0, '0', 'serpstatbot/2.1 (advanced backlink tracking bot; https://serpstatbot.com/; abuse@serpstatbot.com)', 10237, '1674147600', 1674147605),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9665, '1674234000', 1674234005),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9828, '1674320400', 1674320409),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 7326, '1674406800', 1674406802),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 118, '1674493200', 1674494287),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 94, '1674579600', 1674584147),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 137, '1674666000', 1674666808),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 147, '1674752400', 1674752989),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A505F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/19.0 Chrome/102.0.5005.125 Mobile Safari/537.36', 101, '1674838800', 1674839622),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 138, '1674925200', 1674925587),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 99, '1675011600', 1675012273),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 149, '1675098000', 1675099003),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; M2006C3LI) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 175, '1675184400', 1675184411),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; vivo 1901; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/87.0.4280.141 Mobile Safari/537.36 VivoBrowser/9.6.0.0', 137, '1675270800', 1675271075),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; CPH2349) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 175, '1675357200', 1675358024),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; Redmi 8A Dual) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36', 709, '1675443600', 1675443681),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 7043, '1675530000', 1675530002),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 6917, '1675616400', 1675616410),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 6586, '1675702800', 1675702807),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 4387, '1675789200', 1675789212),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 147, '1675875600', 1675878403),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.5414.101 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 182, '1675962000', 1675962156),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Mobile/15E148 Safari/604.1', 354, '1676048400', 1676049089),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 347, '1676134800', 1676135882),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 322, '1676221200', 1676221890),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 294, '1676307600', 1676308196),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 360, '1676394000', 1676394067),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 6485, '1676480400', 1676480535),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9090, '1676566800', 1676566802),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9768, '1676653200', 1676653206),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11029, '1676739600', 1676739603),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12821, '1676826000', 1676826003),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 7487, '1676912400', 1676912409),
(0, '0', 'Mozilla/5.0 (compatible; DataForSeoBot/1.0; +https://dataforseo.com/dataforseo-bot)', 327, '1676998800', 1676999165),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 274, '1677085200', 1677085370),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 297, '1677171600', 1677173331),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 311, '1677258000', 1677258156),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 311, '1677344400', 1677345610),
(0, '0', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:28.0) Gecko/20100101 Firefox/72.0', 345, '1677430800', 1677431100),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 392, '1677517200', 1677518337),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 346, '1677603600', 1677603808),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; CPH1823 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.117 Mobile Safari/537.36', 376, '1677690000', 1677690102),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 7360, '1677776400', 1677776406),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8044, '1677862800', 1677862806),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 6950, '1677949200', 1677949202),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 309, '1678035600', 1678036351),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 240, '1678122000', 1678122027),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 124, '1678208400', 1678208810),
(0, '0', 'Mozilla/5.0 (Linux; Android 11; vivo 1906) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36', 115, '1678294800', 1678295467),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 152, '1678381200', 1678381231),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 8670, '1678467600', 1678468001),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8488, '1678554000', 1678554000),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8206, '1678640400', 1678640401),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8331, '1678726800', 1678726808),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8014, '1678813200', 1678813207),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8201, '1678899600', 1678899608),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8313, '1678986000', 1678986011),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8436, '1679072400', 1679072411),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8083, '1679158800', 1679158803),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8743, '1679245200', 1679245209),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 8140, '1679331600', 1679331600),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 151, '1679418000', 1679418176),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 245, '1679504400', 1679505207),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 187, '1679590800', 1679590880),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 148, '1679677200', 1679678003),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 138, '1679763600', 1679764889),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 142, '1679850000', 1679850658),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 260, '1679936400', 1679938280),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 433, '1680022800', 1680022990),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1246, '1680109200', 1680109408),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1357, '1680195600', 1680195770),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1269, '1680282000', 1680282003),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1343, '1680368400', 1680368429),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 8713, '1680454800', 1680454863),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9399, '1680541200', 1680541207),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 9562, '1680627600', 1680627609),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10408, '1680714000', 1680714006),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10079, '1680800400', 1680800403),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11024, '1680886800', 1680886800),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 11017, '1680973200', 1680973203),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12475, '1681059600', 1681059602),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 426, '1681146000', 1681146171),
(0, '0', 'Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +https://help.mail.ru/webmaster/indexing/robots)', 362, '1681232400', 1681232420),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 481, '1681318800', 1681319129),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 389, '1681405200', 1681405947),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 788, '1681491600', 1681491729),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 360, '1681578000', 1681578010),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 368, '1681664400', 1681664585),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 380, '1681750800', 1681750829),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 579, '1681837200', 1681837332),
(0, '0', 'Mozilla/5.0 (Linux; Android 9; vivo 1901) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.36', 561, '1681923600', 1681923628),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 550, '1682010000', 1682010007),
(0, '0', 'Mozilla/5.0 (Linux; Android 13; CPH2343) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', 591, '1682096400', 1682097043),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 526, '1682182800', 1682183556),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 601, '1682269200', 1682269326),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 493, '1682355600', 1682355733),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 644, '1682442000', 1682442122),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 4599, '1682528400', 1682528840),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 12603, '1682614800', 1682614802),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 3680, '1682701200', 1682701207),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 315, '1682787600', 1682787648),
(0, '0', 'Mozilla/5.0 (Linux; Android 13; IN2011) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36', 641, '1682874000', 1682874260),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31', 696, '1682960400', 1682961094),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; vivo 1920) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 508, '1683046800', 1683046858),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 601, '1683133200', 1683133238),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 565, '1683219600', 1683219632),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 691, '1683306000', 1683306228),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 534, '1683392400', 1683392981),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 595, '1683478800', 1683479547),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36', 398, '1683565200', 1683566465),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 621, '1683651600', 1683651742),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 751, '1683738000', 1683738076),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 713, '1683824400', 1683824560),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 698, '1683910800', 1683911538),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 461, '1683997200', 1683997611),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 761, '1684083600', 1684083636),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 608, '1684170000', 1684170520),
(0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', 4593, '1684256400', 1684256523),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 10734, '1684342800', 1684342800),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 444, '1684429200', 1684429269),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 728, '1684515600', 1684516915),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 694, '1684602000', 1684602057),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5672.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 462, '1684688400', 1684688409),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 847, '1684774800', 1684775074),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5672.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1287, '1684861200', 1684861612),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1218, '1684947600', 1684947624),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1072, '1685034000', 1685034075),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1292, '1685120400', 1685120585),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1399, '1685206800', 1685207041),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1150, '1685293200', 1685293216),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1068, '1685379600', 1685379680),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1237, '1685466000', 1685466084),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1155, '1685552400', 1685552401),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36', 1045, '1685638800', 1685639826),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1165, '1685725200', 1685725362),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1009, '1685811600', 1685811787),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1066, '1685898000', 1685898129),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 932, '1685984400', 1685984443),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1074, '1686070800', 1686070808),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 895, '1686157200', 1686157231),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 900, '1686243600', 1686243795);
INSERT INTO `visitors` (`id`, `ip`, `user_agent`, `amount`, `date`, `timestamp`) VALUES
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 972, '1686330000', 1686330107),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 997, '1686416400', 1686416581),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1076, '1686502800', 1686502819),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 942, '1686589200', 1686589367),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 874, '1686675600', 1686675841),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1510, '1686762000', 1686762027),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1035, '1686848400', 1686848458),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 834, '1686934800', 1686934811),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1019, '1687021200', 1687021248),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 925, '1687107600', 1687107979),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 812, '1687194000', 1687194022),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 917, '1687280400', 1687280453),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1119, '1687366800', 1687366803),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1137, '1687453200', 1687453245),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 909, '1687539600', 1687539629),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1660, '1687626000', 1687626010),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1801, '1687712400', 1687712432),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2134, '1687798800', 1687798812),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2102, '1687885200', 1687885216),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1504, '1687971600', 1687971807),
(0, '0', 'serpstatbot/2.1 (advanced backlink tracking bot; https://serpstatbot.com/; abuse@serpstatbot.com)', 5259, '1688058000', 1688058006),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2335, '1688144400', 1688144412),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1362, '1688230800', 1688230960),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1346, '1688317200', 1688317263),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1914, '1688403600', 1688403600),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2187, '1688490000', 1688490006),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2106, '1688576400', 1688576415),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1788, '1688662800', 1688662806),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1794, '1688749200', 1688749250),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1809, '1688835600', 1688835612),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2083, '1688922000', 1688922030),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1937, '1689008400', 1689008424),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1857, '1689094800', 1689094938),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1909, '1689181200', 1689181227),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1918, '1689267600', 1689267666),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2290, '1689354000', 1689354021),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2020, '1689440400', 1689440442),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2128, '1689526800', 1689526803),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2291, '1689613200', 1689613225),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2311, '1689699600', 1689699628),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2235, '1689786000', 1689786030),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 3648, '1689872400', 1689872436),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 5572, '1689958800', 1689958808),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 3431, '1690045200', 1690045203),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 3495, '1690131600', 1690131716),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 374, '1690218000', 1690218401),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1311, '1690304400', 1690304925),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 917, '1690390800', 1690390830),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1542, '1690477200', 1690477238),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1656, '1690563600', 1690563628),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1945, '1690650000', 1690650070),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1508, '1690736400', 1690736434),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1160, '1690822800', 1690822806),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 637, '1690909200', 1690909528),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 4171, '1690995600', 1690995739),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 3779, '1691082000', 1691082007),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2510, '1691168400', 1691168427),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2506, '1691254800', 1691254827),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1909, '1691341200', 1691341233),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2432, '1691427600', 1691427651),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 14957, '1691514000', 1691514038),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 8636, '1691600400', 1691600468),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 31921, '1691686800', 1691686810),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 19783, '1691773200', 1691773200),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 3903, '1691859600', 1691859612),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 18006, '1691946000', 1691946013),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1437, '1692032400', 1692032418),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2707, '1692118800', 1692118808),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1877, '1692205200', 1692205204),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1601, '1692291600', 1692291601),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 1470, '1692378000', 1692378079),
(0, '0', 'Mozilla/5.0 (Linux; arm_64; Android 12; CPH2205) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 YaBrowser/23.3.3.86.00 SA/3 Mobile Safari/537.36', 1037, '1692464400', 1692464547),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2110, '1692550800', 1692550815),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 2899, '1692637200', 1692637201),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 4739, '1692723600', 1692723611),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 4299, '1692810000', 1692810009),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 810, '1692896400', 1692896546),
(0, '0', 'Mozilla/5.0 (Linux; Android 12; V2031 Build/SP1A.210812.003; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/115.0.5790.138 Mobile Safari/537.36', 85334, '1692982800', 1692983543),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 98163, '1693069200', 1693069597),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 60130, '1693155600', 1693155600),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 74660, '1693242000', 1693242004),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 74116, '1693328400', 1693328419),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 158632, '1693414800', 1693414807),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 64358, '1693501200', 1693501210),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 101337, '1693587600', 1693587647),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1758, '1693674000', 1693674017),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1525, '1693760400', 1693760449),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1533, '1693846800', 1693846892),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1509, '1693933200', 1693933607),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1048, '1694019600', 1694019639),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 877, '1694106000', 1694106047),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1246, '1694192400', 1694192899),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 101761, '1694278800', 1694278890),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 136477, '1694365200', 1694365258),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 194736, '1694451600', 1694451600),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 173827, '1694538000', 1694538000),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1503, '1694624400', 1694624440),
(0, '0', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1073, '1694710800', 1694710888),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1224, '1694797200', 1694797218),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1127, '1694883600', 1694883620),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 3899, '1694970000', 1694970000),
(0, '0', 'serpstatbot/2.1 (advanced backlink tracking bot; https://serpstatbot.com/; abuse@serpstatbot.com)', 17895, '1695056400', 1695056402),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1098, '1695142800', 1695142816),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 55156, '1695229200', 1695229349),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 177396, '1695315600', 1695315600),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 8146, '1695402000', 1695402121),
(0, '0', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 688, '1695488400', 1695488547),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 810, '1695574800', 1695574914),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 5488, '1695661200', 1695662005),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2342, '1695747600', 1695747704),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 975, '1695834000', 1695834052),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 97369, '1695920400', 1695920506),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 117863, '1696006800', 1696006900),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 178802, '1696093200', 1696093374),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 210659, '1696179600', 1696179600),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 140636, '1696266000', 1696266000),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 238162, '1696352400', 1696352544),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 14111, '1696438800', 1696438800),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 181346, '1696525200', 1696525251),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 119922, '1696611600', 1696611600),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 937, '1696698000', 1696698029),
(0, '0', 'Mozilla/5.0 (compatible; DataForSeoBot/1.0; +https://dataforseo.com/dataforseo-bot)', 713, '1696784400', 1696784846),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 696, '1696870800', 1696871106),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 749, '1696957200', 1696957272),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 663, '1697043600', 1697043606),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 100731, '1697130000', 1697130001),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 760, '1697216400', 1697216485),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 758, '1697302800', 1697303213),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 731, '1697389200', 1697389215),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 661, '1697475600', 1697475657),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1029, '1697562000', 1697562213),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 4186, '1697648400', 1697648425),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1441, '1697734800', 1697734880),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 766, '1697821200', 1697821226),
(0, '0', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 21370, '1697907600', 1697907920),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 182088, '1697994000', 1697994000),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 66436, '1698080400', 1698080400),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 222684, '1698166800', 1698166800),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 178748, '1698253200', 1698253200),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 85945, '1698339600', 1698339600),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 136762, '1698426000', 1698426001),
(0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 29428, '1698512400', 1698512400),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 108732, '1698598800', 1698598907),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 135444, '1698685200', 1698685246),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 3193, '1698771600', 1698771626),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 3978, '1698858000', 1698858027),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 3503, '1698944400', 1698944425),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1518, '1699030800', 1699030831),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 1466, '1699117200', 1699117214),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 3530, '1699203600', 1699203699),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 12597, '1699290000', 1699290022),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 13082, '1699376400', 1699376817),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 2044, '1699462800', 1699462826),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 2227, '1699549200', 1699549302),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 5128, '1699635600', 1699635605),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 5301, '1699722000', 1699722000),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 7754, '1699808400', 1699808401),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 7869, '1699894800', 1699894800),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 6223, '1699981200', 1699981209),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 10674, '1700067600', 1700067620),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 31639, '1700154000', 1700154002),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 38785, '1700240400', 1700240401),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 38194, '1700326800', 1700326800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 42445, '1700413200', 1700413201),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 33247, '1700499600', 1700499600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 38777, '1700586000', 1700586001),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 39442, '1700672400', 1700672400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 45150, '1700758800', 1700758800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 40967, '1700845200', 1700845201),
(0, '0', 'Mozilla/5.0 (compatible; Bytespider; spider-feedback@bytedance.com) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.0.0 Safari/537.36', 42903, '1700931600', 1700931603),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 39822, '1701018000', 1701018001),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 39918, '1701104400', 1701104402),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 40026, '1701190800', 1701190802),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 40499, '1701277200', 1701277200),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 41122, '1701363600', 1701363600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 39641, '1701450000', 1701450002),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 42023, '1701536400', 1701536401),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 41753, '1701622800', 1701622800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 42142, '1701709200', 1701709200),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 44456, '1701795600', 1701795600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 45630, '1701882000', 1701882000),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 47444, '1701968400', 1701968401),
(0, '0', 'serpstatbot/2.1 (advanced backlink tracking bot; https://serpstatbot.com/; abuse@serpstatbot.com)', 49295, '1702054800', 1702054800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 49766, '1702141200', 1702141201),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 48996, '1702227600', 1702227600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 52904, '1702314000', 1702314000),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 62692, '1702400400', 1702400400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 66778, '1702486800', 1702486800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 74043, '1702573200', 1702573200),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 74284, '1702659600', 1702659600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 74315, '1702746000', 1702746000),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 59918, '1702832400', 1702832400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 39241, '1702918800', 1702918804),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 34871, '1703005200', 1703005200),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 34875, '1703091600', 1703091619),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 59837, '1703178000', 1703178001),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 59372, '1703264400', 1703264400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 61781, '1703350800', 1703350802),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 62766, '1703437200', 1703437200),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 62537, '1703523600', 1703523601),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 62011, '1703610000', 1703610001),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 64123, '1703696400', 1703696402),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 65526, '1703782800', 1703782800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 64678, '1703869200', 1703869200),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 64867, '1703955600', 1703955600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 67316, '1704042000', 1704042002),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 67523, '1704128400', 1704128400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 65858, '1704214800', 1704214800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 70700, '1704301200', 1704301201),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 73013, '1704387600', 1704387600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 81373, '1704474000', 1704474000),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 82697, '1704560400', 1704560400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 79025, '1704646800', 1704646800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 67292, '1704733200', 1704733200),
(0, '0', 'Mozilla/5.0 (Linux; Android 10; V2027) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', 45772, '1704819600', 1704819608),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 79184, '1704906000', 1704906000),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 80541, '1704992400', 1704992400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 43209, '1705078800', 1705078800),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 50512, '1705165200', 1705165268),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 86441, '1705251600', 1705251600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 86831, '1705338000', 1705338000),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 85175, '1705424400', 1705424400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 85941, '1705510800', 1705510800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 53425, '1705597200', 1705597200),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 80097, '1705683600', 1705683600),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 81835, '1705770000', 1705770001),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 81682, '1705856400', 1705856400),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 62996, '1705942800', 1705942800),
(0, '0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)', 39233, '1706029200', 1706029201),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 5933, '1706115600', 1706115618),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 6595, '1706202000', 1706202017),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 8153, '1706288400', 1706288401),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 10906, '1706374800', 1706374800),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 8479, '1706461200', 1706461201),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 17183, '1706547600', 1706547635),
(0, '0', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 82770, '1706634000', 1706634000),
(0, '0', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.2237.113 Safari/537.36', 78855, '1706720400', 1706720405),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3269.133 Safari/537.36', 18204, '1706806800', 1706806801),
(0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.2879.157 Safari/537.36', 15105, '1706893200', 1706893220),
(0, '0', 'Mozilla/5.0 (Windows NT 6.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.2213.66 Safari/537.36', 15105, '1706893200', 1706893220),
(0, '0', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3186.20 Safari/537.36', 15105, '1706893200', 1706893220),
(0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3075.7 Safari/537.36', 15105, '1706893200', 1706893220),
(0, '0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 8083, '1706979600', 1706979609);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_levels`
--
ALTER TABLE `account_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `circular`
--
ALTER TABLE `circular`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_customfield`
--
ALTER TABLE `commission_customfield`
  ADD PRIMARY KEY (`cc_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diocesepriest`
--
ALTER TABLE `diocesepriest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`rowID`);

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`rowID`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsandevents`
--
ALTER TABLE `newsandevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `odiocesepriest`
--
ALTER TABLE `odiocesepriest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `openletters`
--
ALTER TABLE `openletters`
  ADD PRIMARY KEY (`letterID`);

--
-- Indexes for table `parish`
--
ALTER TABLE `parish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parish_pages`
--
ALTER TABLE `parish_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `posts_category`
--
ALTER TABLE `posts_category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `priest`
--
ALTER TABLE `priest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religiouspriest`
--
ALTER TABLE `religiouspriest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`siteID`);

--
-- Indexes for table `snapshots`
--
ALTER TABLE `snapshots`
  ADD PRIMARY KEY (`snapshotID`),
  ADD KEY `parish_id` (`parish_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thedal`
--
ALTER TABLE `thedal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tv`
--
ALTER TABLE `tv`
  ADD PRIMARY KEY (`tvID`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`updateID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `users_customfield`
--
ALTER TABLE `users_customfield`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_levels`
--
ALTER TABLE `account_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `administration`
--
ALTER TABLE `administration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `circular`
--
ALTER TABLE `circular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `commission_customfield`
--
ALTER TABLE `commission_customfield`
  MODIFY `cc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diocesepriest`
--
ALTER TABLE `diocesepriest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=491;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsandevents`
--
ALTER TABLE `newsandevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `odiocesepriest`
--
ALTER TABLE `odiocesepriest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `openletters`
--
ALTER TABLE `openletters`
  MODIFY `letterID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parish`
--
ALTER TABLE `parish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `parish_pages`
--
ALTER TABLE `parish_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(122) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts_category`
--
ALTER TABLE `posts_category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `priest`
--
ALTER TABLE `priest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `religiouspriest`
--
ALTER TABLE `religiouspriest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(122) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `siteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `snapshots`
--
ALTER TABLE `snapshots`
  MODIFY `snapshotID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(121) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thedal`
--
ALTER TABLE `thedal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tv`
--
ALTER TABLE `tv`
  MODIFY `tvID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `updateID` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `users_customfield`
--
ALTER TABLE `users_customfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `snapshots`
--
ALTER TABLE `snapshots`
  ADD CONSTRAINT `snapshots_ibfk_1` FOREIGN KEY (`parish_id`) REFERENCES `parish` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
