-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2023 at 03:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

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
(25, 'Can add book', 7, 'add_book'),
(26, 'Can change book', 7, 'change_book'),
(27, 'Can delete book', 7, 'delete_book'),
(28, 'Can view book', 7, 'view_book'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add take', 9, 'add_take'),
(34, 'Can change take', 9, 'change_take'),
(35, 'Can delete take', 9, 'delete_take'),
(36, 'Can view take', 9, 'view_take');

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
(1, 'pbkdf2_sha256$390000$ACezltRgDABIGJoBoDxHh6$RFgCQM3mAmGeFa4sBGzxSOG66xQBbVnvL1J0rjxNgf0=', '2023-02-10 21:44:25.284500', 1, 'neo', '', '', '', 1, 1, '2023-02-10 21:44:16.215089');

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
(1, '2023-02-11 02:17:48.101817', '10', 'Guide, The (O Xenagos)', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1),
(2, '2023-02-11 02:17:54.901398', '9', 'Saint of Fort Washington, The', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1),
(3, '2023-02-11 02:18:00.361394', '8', 'Just Go with It', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1),
(4, '2023-02-11 02:18:06.725851', '7', 'Thor: Tales of Asgard', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1),
(5, '2023-02-11 02:18:10.976870', '6', 'In the Name of the Law', 2, '[]', 7, 1),
(6, '2023-02-11 02:18:16.135772', '4', 'Robinson Crusoe (Adventures of Robinson Crusoe, The)', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1),
(7, '2023-02-11 02:18:23.197961', '4', 'Robinson Crusoe (Adventures of Robinson Crusoe, The)', 2, '[]', 7, 1),
(8, '2023-02-11 02:18:25.699671', '4', 'Robinson Crusoe (Adventures of Robinson Crusoe, The)', 2, '[]', 7, 1),
(9, '2023-02-11 02:18:29.436383', '4', 'Robinson Crusoe (Adventures of Robinson Crusoe, The)', 2, '[]', 7, 1),
(10, '2023-02-11 02:18:32.519656', '4', 'Robinson Crusoe (Adventures of Robinson Crusoe, The)', 2, '[]', 7, 1),
(11, '2023-02-11 02:18:36.932852', '3', 'Battle: Los Angeles', 2, '[]', 7, 1),
(12, '2023-02-11 02:18:42.961968', '2', 'Art of Flight, The', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1),
(13, '2023-02-11 02:18:47.090902', '1', 'Mark, The', 2, '[]', 7, 1),
(14, '2023-02-11 02:19:40.660656', '5', 'Iron Horse, The', 2, '[{\"changed\": {\"fields\": [\"Check status\"]}}]', 7, 1);

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
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'library', 'book'),
(9, 'library', 'take'),
(8, 'library', 'user'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2023-02-10 21:35:02.686437'),
(2, 'auth', '0001_initial', '2023-02-10 21:35:03.820384'),
(3, 'admin', '0001_initial', '2023-02-10 21:35:04.199655'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-10 21:35:04.217028'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-10 21:35:04.243177'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-10 21:35:04.359258'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-10 21:35:04.543298'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-10 21:35:04.574638'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-10 21:35:04.590312'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-10 21:35:04.690070'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-10 21:35:04.690070'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-10 21:35:04.705843'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-10 21:35:04.743200'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-10 21:35:04.774459'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-10 21:35:04.821339'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-10 21:35:04.843064'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-10 21:35:04.874332'),
(18, 'library', '0001_initial', '2023-02-10 21:35:05.174715'),
(19, 'library', '0002_alter_take_book', '2023-02-10 21:35:05.459641'),
(20, 'library', '0003_remove_take_check_status_book_check_status_and_more', '2023-02-10 21:35:06.477686'),
(21, 'library', '0004_alter_take_user', '2023-02-10 21:35:06.762313'),
(22, 'sessions', '0001_initial', '2023-02-10 21:35:06.824813');

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
('in480sulxjbbpol0lxverdnotrft9u44', '.eJxVjDsOwjAQBe_iGlle_xZT0ucM1tpr4wCKpXwqxN0hUgpo38y8l4i0rS1uS5njyOIiQJx-t0T5UaYd8J2mW5e5T-s8Jrkr8qCLHDqX5_Vw_w4aLe1bI591QvTeOo01qYqZclUYKpAF8ogBIAAbm5NxRXMowVWy1ihNoFm8P9TCN3Q:1pQbBx:_FUMc5YgNiOREaDbHvUm3bzNqC-g8eN1_VeLNkNoUo4', '2023-02-24 21:44:25.293508');

-- --------------------------------------------------------

--
-- Table structure for table `library_book`
--

CREATE TABLE `library_book` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `published_year` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `check_status` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_book`
--

INSERT INTO `library_book` (`id`, `author`, `category`, `title`, `published_year`, `description`, `check_status`) VALUES
(1, 'Dagny Fozard', 'Drama', 'Mark, The', '2003', 'Adhes due to fb acc left in body fol oth procedure, sequela', 'R'),
(2, 'Zeb Roalfe', 'Adventure|Documentary', 'Art of Flight, The', '1984', 'Unsp inj unsp musc/fasc/tend at shldr/up arm, unsp arm, sqla', 'R'),
(3, 'Klarrisa Billion', 'Action|Sci-Fi|War', 'Battle: Los Angeles', '1986', 'Strain of extn/abdr musc/fasc/tend of thumb at forearm level', 'R'),
(4, 'Tiebout Liebermann', 'Adventure|Drama', 'Robinson Crusoe (Adventures of Robinson Crusoe, The)', '1985', 'Unspecified keratoconjunctivitis, bilateral', 'R'),
(5, 'Kelvin Turfs', 'Western', 'Iron Horse, The', '2009', 'Other benign neoplasms of uterus', 'R'),
(6, 'Antone Toal', 'Drama', 'In the Name of the Law', '2009', 'Zoster meningitis', 'R'),
(7, 'Kalli d\'Arcy', 'Animation', 'Thor: Tales of Asgard', '1990', 'Unsp abdominal hernia with obstruction, without gangrene', 'R'),
(8, 'Aurie O\'dell', 'Comedy|Romance', 'Just Go with It', '2001', 'Nondisp fx of med malleolus of l tibia, 7thR', 'R'),
(9, 'Kaine Jeans', 'Drama', 'Saint of Fort Washington, The', '2003', 'Crushing injury of head, part unspecified, initial encounter', 'R'),
(10, 'Pembroke Deaconson', 'Drama', 'Guide, The (O Xenagos)', '2009', 'Medial dislocation of unspecified ulnohumeral joint, sequela', 'R');

-- --------------------------------------------------------

--
-- Table structure for table `library_take`
--

CREATE TABLE `library_take` (
  `book_id` bigint(20) NOT NULL,
  `issued_at` date NOT NULL,
  `return_at` date NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_user`
--

CREATE TABLE `library_user` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `major` varchar(2) DEFAULT NULL,
  `role` varchar(1) NOT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_user`
--

INSERT INTO `library_user` (`id`, `first_name`, `last_name`, `password`, `id_number`, `major`, `role`, `group_id`, `status`) VALUES
(1, 'Flinn', 'Woodcock', 'req8855WANQ', '2116185', 'CE', 'U', 'FCM01', 'A'),
(2, 'Jaquith', 'Brims', 'ZOxFqSK1', '2110514', 'CE', 'U', 'SCE01', 'A'),
(3, 'Dyanne', 'Wallsworth', 'MiqI8w4cla', '2110038', 'ME', 'S', 'SSE01', 'A'),
(4, 'Martyn', 'Reicharz', 'lrjcHj', '2114754', 'CE', 'U', 'SCE07', 'A'),
(5, 'Dredi', 'Lehrian', 'z8eTIDX1mL', '2112463', 'ME', 'U', 'SCE07', 'B'),
(6, 'Abby', 'Morat', 'DJLyPB6', '2118771', 'ME', 'U', 'FCM01', 'B'),
(7, 'Sayres', 'Cassel', 'SVpqOIHcN', '2115187', 'CE', 'S', 'FCM07', 'A'),
(8, 'Hortense', 'Edmund', 'djP252qfm', '2119312', 'ME', 'A', 'FIS03', 'A'),
(9, 'Blair', 'Wyburn', '7l0nWLnOocO', '2114022', 'ME', 'S', 'FCM00', 'A'),
(10, 'Simeon', 'Stapleford', 'TGNj7UbMK', '2119100', 'CE', 'A', 'FCM02', 'A');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `library_book`
--
ALTER TABLE `library_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_take`
--
ALTER TABLE `library_take`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `library_take_book_id_54973658` (`book_id`);

--
-- Indexes for table `library_user`
--
ALTER TABLE `library_user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `library_book`
--
ALTER TABLE `library_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `library_user`
--
ALTER TABLE `library_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `library_take`
--
ALTER TABLE `library_take`
  ADD CONSTRAINT `library_take_book_id_54973658_fk_library_book_id` FOREIGN KEY (`book_id`) REFERENCES `library_book` (`id`),
  ADD CONSTRAINT `library_take_user_id_513f48ba_fk_library_user_id` FOREIGN KEY (`user_id`) REFERENCES `library_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
