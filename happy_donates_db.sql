-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2023 at 09:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happy_donates_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_data_table`
--

CREATE TABLE `admin_data_table` (
  `admin_id` varchar(100) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_phone_number` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_data_table`
--

INSERT INTO `admin_data_table` (`admin_id`, `admin_username`, `admin_password`, `admin_phone_number`, `admin_email`) VALUES
('Admin123', 'Admin444', 'Admin@123', '0000000000', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add admin data model', 7, 'add_admindatamodel'),
(26, 'Can change admin data model', 7, 'change_admindatamodel'),
(27, 'Can delete admin data model', 7, 'delete_admindatamodel'),
(28, 'Can view admin data model', 7, 'view_admindatamodel'),
(29, 'Can add main category model', 8, 'add_maincategorymodel'),
(30, 'Can change main category model', 8, 'change_maincategorymodel'),
(31, 'Can delete main category model', 8, 'delete_maincategorymodel'),
(32, 'Can view main category model', 8, 'view_maincategorymodel'),
(33, 'Can add state model', 9, 'add_statemodel'),
(34, 'Can change state model', 9, 'change_statemodel'),
(35, 'Can delete state model', 9, 'delete_statemodel'),
(36, 'Can view state model', 9, 'view_statemodel'),
(37, 'Can add sub category model', 10, 'add_subcategorymodel'),
(38, 'Can change sub category model', 10, 'change_subcategorymodel'),
(39, 'Can delete sub category model', 10, 'delete_subcategorymodel'),
(40, 'Can view sub category model', 10, 'view_subcategorymodel'),
(41, 'Can add districts model', 11, 'add_districtsmodel'),
(42, 'Can change districts model', 11, 'change_districtsmodel'),
(43, 'Can delete districts model', 11, 'delete_districtsmodel'),
(44, 'Can view districts model', 11, 'view_districtsmodel'),
(45, 'Can add user data model', 12, 'add_userdatamodel'),
(46, 'Can change user data model', 12, 'change_userdatamodel'),
(47, 'Can delete user data model', 12, 'delete_userdatamodel'),
(48, 'Can view user data model', 12, 'view_userdatamodel'),
(49, 'Can add user post model', 13, 'add_userpostmodel'),
(50, 'Can change user post model', 13, 'change_userpostmodel'),
(51, 'Can delete user post model', 13, 'delete_userpostmodel'),
(52, 'Can view user post model', 13, 'view_userpostmodel'),
(53, 'Can add user image model', 14, 'add_userimagemodel'),
(54, 'Can change user image model', 14, 'change_userimagemodel'),
(55, 'Can delete user image model', 14, 'delete_userimagemodel'),
(56, 'Can view user image model', 14, 'view_userimagemodel'),
(57, 'Can add user donation model', 15, 'add_userdonationmodel'),
(58, 'Can change user donation model', 15, 'change_userdonationmodel'),
(59, 'Can delete user donation model', 15, 'delete_userdonationmodel'),
(60, 'Can view user donation model', 15, 'view_userdonationmodel'),
(61, 'Can add donation category model', 16, 'add_donationcategorymodel'),
(62, 'Can change donation category model', 16, 'change_donationcategorymodel'),
(63, 'Can delete donation category model', 16, 'delete_donationcategorymodel'),
(64, 'Can view donation category model', 16, 'view_donationcategorymodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$WZCUnkKGMbSU3ZqsL0YSxO$3qiZpu/SNpUBtoZwZM2BIiFYcqyApy28IENX1uMjg4w=', '2023-12-12 18:12:23.194089', 1, 'admin123', '', '', 'admin@gmail.com', 1, 1, '2023-12-12 18:11:56.455757');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts_data_table`
--

CREATE TABLE `districts_data_table` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `state_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts_data_table`
--

INSERT INTO `districts_data_table` (`district_id`, `district_name`, `state_id_id`) VALUES
(1, 'Ernakulam', 1),
(2, 'Kottayam', 1),
(3, 'Alappuzha', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-12-12 18:13:31.519559', 'HDPLK1222', 'UserDataModel object (HDPLK1222)', 1, '[{\"added\": {}}]', 12, 1),
(2, '2023-12-12 18:19:18.876776', '1', 'MainCategoryModel object (1)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-12-12 18:19:30.210051', '2', 'MainCategoryModel object (2)', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-12-12 18:19:59.806873', '1', 'StateModel object (1)', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-12-12 18:20:36.230341', '1', 'DistrictsModel object (1)', 1, '[{\"added\": {}}]', 11, 1),
(6, '2023-12-12 18:20:52.794340', '2', 'DistrictsModel object (2)', 1, '[{\"added\": {}}]', 11, 1),
(7, '2023-12-12 18:21:28.060482', '3', 'DistrictsModel object (3)', 1, '[{\"added\": {}}]', 11, 1),
(8, '2023-12-12 18:23:24.407204', '1', 'UserDonationModel object (1)', 1, '[{\"added\": {}}]', 15, 1),
(9, '2023-12-12 18:54:53.839131', '2', 'UserDonationModel object (2)', 1, '[{\"added\": {}}]', 15, 1),
(10, '2023-12-12 18:56:48.770030', '3', 'UserDonationModel object (3)', 1, '[{\"added\": {}}]', 15, 1),
(11, '2023-12-12 21:11:30.634188', 'HDPLK125', 'UserDataModel object (HDPLK125)', 1, '[{\"added\": {}}]', 12, 1),
(12, '2023-12-12 21:12:42.887483', 'HDPLK1255', 'UserDataModel object (HDPLK1255)', 1, '[{\"added\": {}}]', 12, 1),
(13, '2023-12-12 22:16:16.449475', '1', 'SubCategoryModel object (1)', 1, '[{\"added\": {}}]', 10, 1),
(14, '2023-12-12 22:16:49.856782', '2', 'SubCategoryModel object (2)', 1, '[{\"added\": {}}]', 10, 1),
(15, '2023-12-12 22:17:35.430375', '3', 'SubCategoryModel object (3)', 1, '[{\"added\": {}}]', 10, 1),
(16, '2023-12-12 22:17:58.925677', '4', 'SubCategoryModel object (4)', 1, '[{\"added\": {}}]', 10, 1),
(17, '2023-12-12 22:18:49.809157', '5', 'SubCategoryModel object (5)', 1, '[{\"added\": {}}]', 10, 1),
(18, '2023-12-12 22:19:01.834123', '6', 'SubCategoryModel object (6)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2023-12-12 22:19:40.490516', '7', 'SubCategoryModel object (7)', 1, '[{\"added\": {}}]', 10, 1),
(20, '2023-12-12 22:20:03.458030', '8', 'SubCategoryModel object (8)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2023-12-12 22:31:09.148487', '1', 'UserPostModel object (1)', 1, '[{\"added\": {}}]', 13, 1),
(22, '2023-12-12 22:33:47.277462', '8', 'SubCategoryModel object (8)', 2, '[{\"changed\": {\"fields\": [\"Sub category name\"]}}]', 10, 1),
(23, '2023-12-12 22:36:14.611508', '2', 'UserPostModel object (2)', 1, '[{\"added\": {}}]', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'AdminApp', 'admindatamodel'),
(11, 'AdminApp', 'districtsmodel'),
(16, 'AdminApp', 'donationcategorymodel'),
(8, 'AdminApp', 'maincategorymodel'),
(9, 'AdminApp', 'statemodel'),
(10, 'AdminApp', 'subcategorymodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(12, 'UserApp', 'userdatamodel'),
(15, 'UserApp', 'userdonationmodel'),
(14, 'UserApp', 'userimagemodel'),
(13, 'UserApp', 'userpostmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'AdminApp', '0001_initial', '2023-12-12 16:32:06.032936'),
(2, 'contenttypes', '0001_initial', '2023-12-12 16:32:06.116724'),
(3, 'auth', '0001_initial', '2023-12-12 16:32:07.070471'),
(4, 'admin', '0001_initial', '2023-12-12 16:32:07.291973'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-12-12 16:32:07.309771'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-12 16:32:07.325663'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-12-12 16:32:07.440274'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-12-12 16:32:07.517652'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-12-12 16:32:07.576175'),
(10, 'auth', '0004_alter_user_username_opts', '2023-12-12 16:32:07.587504'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-12-12 16:32:07.672982'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-12-12 16:32:07.678077'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-12-12 16:32:07.690076'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-12-12 16:32:07.713164'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-12-12 16:32:07.735943'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-12-12 16:32:07.756060'),
(17, 'auth', '0011_update_proxy_permissions', '2023-12-12 16:32:07.786334'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-12-12 16:32:07.806700'),
(19, 'sessions', '0001_initial', '2023-12-12 16:32:07.858149'),
(20, 'UserApp', '0001_initial', '2023-12-12 16:34:07.833282'),
(21, 'AdminApp', '0002_donationcategorymodel', '2023-12-12 17:42:14.043649'),
(22, 'UserApp', '0002_alter_userdonationmodel_donation_category', '2023-12-12 17:42:14.863928'),
(23, 'UserApp', '0003_alter_userdatamodel_create_at', '2023-12-12 21:49:08.216395'),
(24, 'AdminApp', '0003_alter_subcategorymodel_sub_category_id', '2023-12-13 04:15:13.029684');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6g2lcxwl64el42xlaepc33xmzab4an6j', 'eyJhZG1pbiI6IkFkbWluNDQ0In0:1rDf5c:3_Yu4whiP3JPL2CFj_6VO1JXcMvQ4J4Pt-ucBTzmxk4', '2023-12-28 06:20:56.169941'),
('qfk8gmi2tzrjplep8utc04icvkddqrzw', 'eyJhZG1pbiI6IkFkbWluNDQ0In0:1rEMHm:8R0BGUejdvSeMclupFxSob8ezOWCAhLAsphp2PVEwcY', '2023-12-30 04:28:22.580339'),
('w4oga8d8rnvl8iv2hap8n417je39yarl', '.eJxVjEsOgzAMRO-SdRUlwQ12d-2-Z0COHQr9BInPqurdCxIbViPNezNfw_rpi7mY65YAYE6m4WXummXKY9PrivyxSyyvXDagTy6PwcpQ5rFPdlPsTid7HzS_b7t7OOh46tY1IwgKBarBO2nJeQ3SZpWzsKvrEBzHGAEpUhUcCmCoUlJCJAdesvn9AbqOPJw:1rD7F1:nvU9DUTWR1y38QFeBiFiPdH6Nh14yCZyy8Q2MuHBUhk', '2023-12-26 18:12:23.199847');

-- --------------------------------------------------------

--
-- Table structure for table `donation_category_table`
--

CREATE TABLE `donation_category_table` (
  `donation_category_id` int(11) NOT NULL,
  `donation_category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation_category_table`
--

INSERT INTO `donation_category_table` (`donation_category_id`, `donation_category_name`) VALUES
(1, 'Hospital'),
(2, 'Non_Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `main_category_table`
--

CREATE TABLE `main_category_table` (
  `main_category_id` int(11) NOT NULL,
  `main_category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_category_table`
--

INSERT INTO `main_category_table` (`main_category_id`, `main_category_name`) VALUES
(1, 'Food'),
(2, 'Non-Food');

-- --------------------------------------------------------

--
-- Table structure for table `state_data_table`
--

CREATE TABLE `state_data_table` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state_data_table`
--

INSERT INTO `state_data_table` (`state_id`, `state_name`) VALUES
(1, 'Kerala');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_table`
--

CREATE TABLE `sub_category_table` (
  `sub_category_id` int(11) NOT NULL,
  `sub_category_name` varchar(100) NOT NULL,
  `main_category_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_category_table`
--

INSERT INTO `sub_category_table` (`sub_category_id`, `sub_category_name`, `main_category_id_id`) VALUES
(2, 'Fruits', 1),
(4, 'Others', 1),
(7, 'Vehicle', 2),
(8, 'Others', 2),
(9, 'Book', 2),
(10, 'Pet', 2),
(11, 'Vegetables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_data_table`
--

CREATE TABLE `user_data_table` (
  `create_at` date NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_phone_number` varchar(100) NOT NULL,
  `user_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data_table`
--

INSERT INTO `user_data_table` (`create_at`, `user_id`, `username`, `user_password`, `user_phone_number`, `user_status`) VALUES
('2023-12-06', 'HDERM123', 'Jikkumon James', 'jikku@123', '8078473643', 'Active'),
('2023-11-08', 'HDKTM0011', 'Amal Raj', 'Amal@123', '8989898998', 'Active'),
('2023-08-10', 'HDPLK1222', 'Ann maria', 'Ann@123', '8888787987', 'Active'),
('2023-09-07', 'HDPLK125', 'Viday G', 'vidya111', '2123432343', 'Active'),
('2023-12-12', 'HDPLK1255', 'Sujil Sundar', 'sujil@111', '8888787982', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user_donation_table`
--

CREATE TABLE `user_donation_table` (
  `donation_create_at` datetime(6) NOT NULL,
  `donation_id` int(11) NOT NULL,
  `donation_title` varchar(400) NOT NULL,
  `donation_description` longtext NOT NULL,
  `donation_end_date` datetime(6) NOT NULL,
  `donation_address` varchar(500) NOT NULL,
  `donation_images` varchar(100) DEFAULT NULL,
  `user_contact_number` varchar(100) NOT NULL,
  `donation_comments` varchar(500) NOT NULL,
  `donation_status` varchar(100) NOT NULL,
  `donation_category_id` int(11) NOT NULL,
  `donation_location_id` int(11) NOT NULL,
  `user_id_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_donation_table`
--

INSERT INTO `user_donation_table` (`donation_create_at`, `donation_id`, `donation_title`, `donation_description`, `donation_end_date`, `donation_address`, `donation_images`, `user_contact_number`, `donation_comments`, `donation_status`, `donation_category_id`, `donation_location_id`, `user_id_id`) VALUES
('2023-12-12 18:22:25.000000', 1, 'Eyes Change', 'As Shakespeare rightly said, the eyes are, indeed, our windows to the world, and the windows to our soul. Of all the sense organs, the gift of sight is the most precious, and the impairment of vision is considered the most profound disability. It is heartening to note that not all blindness is irreversible, and today, medical science has advanced enough to restore vision for a lot of these patients, who struggle with day to day living because of the vision impairment. According to WHO (World Health Organization), corneal blindness is the fourth leading cause of global blindness after cataract, glaucoma and age-related macular degeneration, but it can be tackled with corneal transplantation. Corneal transplantation or Keratoplasty is dependent on the voluntary donation of the eyes in the event of a person’s death.', '2024-01-10 18:22:34.000000', 'Smec Kaloor', 'images/120119288_180923550158808_6242088434421693207_n.jpg', '2122345643', 'None', 'Pending', 1, 1, 'HDKTM0011'),
('2023-12-12 18:52:27.000000', 2, 'Education help', '[Organization/Foundation Name] is thrilled to announce a transformative donation dedicated to advancing education and fostering a brighter future. This generous contribution, made possible by [Donor Name or Organization], exemplifies a commitment to empowering individuals through the power of learning.', '2024-01-05 18:54:28.000000', 'Smec Kaloor', 'images/20181019_093852.jpg', '2122345643', 'None', 'Active', 2, 1, 'HDKTM0011'),
('2023-12-04 18:55:59.000000', 3, 'Heart Removal', '[Organization/Foundation Name] is thrilled to announce a transformative donation dedicated to advancing education and fostering a brighter future. This generous contribution, made possible by [Donor Name or Organization], exemplifies a commitment to empowering individuals through the power of learning.', '2023-12-25 18:56:31.000000', 'Smec Kaloor', 'images/20181020_140831.jpg', '2122345641', 'None', 'Pending', 1, 2, 'HDERM123');

-- --------------------------------------------------------

--
-- Table structure for table `user_image_table`
--

CREATE TABLE `user_image_table` (
  `user_image_id` int(11) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `user_id_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_post_table`
--

CREATE TABLE `user_post_table` (
  `post_create_at` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) NOT NULL,
  `post_description` longtext NOT NULL,
  `post_quantity` int(11) NOT NULL,
  `post_pick_up_time` date NOT NULL,
  `post_end_on` datetime(6) DEFAULT NULL,
  `post_address` longtext NOT NULL,
  `post_images` varchar(100) DEFAULT NULL,
  `user_contact_number` varchar(100) NOT NULL,
  `post_comments` varchar(300) DEFAULT NULL,
  `post_status` varchar(100) NOT NULL,
  `post_location_id` int(11) NOT NULL,
  `post_sub_category_id` int(11) NOT NULL,
  `user_id_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_post_table`
--

INSERT INTO `user_post_table` (`post_create_at`, `post_id`, `post_title`, `post_description`, `post_quantity`, `post_pick_up_time`, `post_end_on`, `post_address`, `post_images`, `user_contact_number`, `post_comments`, `post_status`, `post_location_id`, `post_sub_category_id`, `user_id_id`) VALUES
('2023-10-04 22:20:31.000000', 1, 'Chiken Biriyani', 'Chiken Biriyani for 100 Person', 100, '2023-12-12', '2023-12-14 22:22:29.000000', 'Smec Kaloor', 'images/biriyani.jpg', '2122345643', 'None', 'Active', 1, 4, 'HDKTM0011'),
('2023-11-24 22:34:05.000000', 2, 'Btech EC Books', '4th year book', 5, '2024-07-13', '2024-05-17 22:35:38.000000', 'Kottyam SMec', 'images/270821-BIRDS-DESK-8K.png', '2122345641', 'None', 'Active', 2, 8, 'HDPLK125');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_data_table`
--
ALTER TABLE `admin_data_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `districts_data_table`
--
ALTER TABLE `districts_data_table`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `districts_data_table_state_id_id_cf56db7c_fk_state_dat` (`state_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `donation_category_table`
--
ALTER TABLE `donation_category_table`
  ADD PRIMARY KEY (`donation_category_id`);

--
-- Indexes for table `main_category_table`
--
ALTER TABLE `main_category_table`
  ADD PRIMARY KEY (`main_category_id`);

--
-- Indexes for table `state_data_table`
--
ALTER TABLE `state_data_table`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD PRIMARY KEY (`sub_category_id`),
  ADD KEY `sub_category_table_main_category_id_id_1e4719fd_fk_main_cate` (`main_category_id_id`);

--
-- Indexes for table `user_data_table`
--
ALTER TABLE `user_data_table`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_donation_table`
--
ALTER TABLE `user_donation_table`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `user_donation_table_donation_location_id_f66ab304_fk_districts` (`donation_location_id`),
  ADD KEY `user_donation_table_user_id_id_ad0b5e60_fk_user_data` (`user_id_id`),
  ADD KEY `user_donation_table_donation_category_id_340cac65_fk_donation_` (`donation_category_id`);

--
-- Indexes for table `user_image_table`
--
ALTER TABLE `user_image_table`
  ADD PRIMARY KEY (`user_image_id`),
  ADD KEY `user_image_table_user_id_id_65d953bd_fk_user_data_table_user_id` (`user_id_id`);

--
-- Indexes for table `user_post_table`
--
ALTER TABLE `user_post_table`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_post_table_post_location_id_0d5aea7a_fk_districts` (`post_location_id`),
  ADD KEY `user_post_table_user_id_id_a5fc0575_fk_user_data_table_user_id` (`user_id_id`),
  ADD KEY `user_post_table_post_sub_category_id_6f86bd7d_fk` (`post_sub_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `districts_data_table`
--
ALTER TABLE `districts_data_table`
  ADD CONSTRAINT `districts_data_table_state_id_id_cf56db7c_fk_state_dat` FOREIGN KEY (`state_id_id`) REFERENCES `state_data_table` (`state_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD CONSTRAINT `sub_category_table_main_category_id_id_1e4719fd_fk_main_cate` FOREIGN KEY (`main_category_id_id`) REFERENCES `main_category_table` (`main_category_id`);

--
-- Constraints for table `user_donation_table`
--
ALTER TABLE `user_donation_table`
  ADD CONSTRAINT `user_donation_table_donation_category_id_340cac65_fk_donation_` FOREIGN KEY (`donation_category_id`) REFERENCES `donation_category_table` (`donation_category_id`),
  ADD CONSTRAINT `user_donation_table_donation_location_id_f66ab304_fk_districts` FOREIGN KEY (`donation_location_id`) REFERENCES `districts_data_table` (`district_id`),
  ADD CONSTRAINT `user_donation_table_user_id_id_ad0b5e60_fk_user_data` FOREIGN KEY (`user_id_id`) REFERENCES `user_data_table` (`user_id`);

--
-- Constraints for table `user_image_table`
--
ALTER TABLE `user_image_table`
  ADD CONSTRAINT `user_image_table_user_id_id_65d953bd_fk_user_data_table_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user_data_table` (`user_id`);

--
-- Constraints for table `user_post_table`
--
ALTER TABLE `user_post_table`
  ADD CONSTRAINT `user_post_table_post_location_id_0d5aea7a_fk_districts` FOREIGN KEY (`post_location_id`) REFERENCES `districts_data_table` (`district_id`),
  ADD CONSTRAINT `user_post_table_post_sub_category_id_6f86bd7d_fk` FOREIGN KEY (`post_sub_category_id`) REFERENCES `sub_category_table` (`sub_category_id`),
  ADD CONSTRAINT `user_post_table_user_id_id_a5fc0575_fk_user_data_table_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user_data_table` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
