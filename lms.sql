-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 13 2023 г., 12:42
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lms`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `auth_permission`
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
-- Структура таблицы `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$WlFuJGkFMFlb3G1lVEMQjd$bfubjWE+NlzHh39hPGq6pN+7H+D3b81cmJ5tIOq3wic=', '2023-02-13 11:01:17.502585', 1, 'neo', '', '', '', 1, 1, '2023-02-13 11:00:50.743665');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-13 11:02:04.244786', '1', 'John Smith ID2110120', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-02-13 11:02:30.641039', '2', 'Tom Hanks ID2110121', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-02-13 11:02:56.589246', '3', 'Umidjon Juraboev ID2110122', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-02-13 11:24:00.689760', '101', 'Python', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_content_type`
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
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-13 10:56:24.754275'),
(2, 'auth', '0001_initial', '2023-02-13 10:56:25.129186'),
(3, 'admin', '0001_initial', '2023-02-13 10:56:25.222918'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-13 10:56:25.238536'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-13 10:56:25.238536'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-13 10:56:25.285428'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-13 10:56:25.332264'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-13 10:56:25.347913'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-13 10:56:25.347913'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-13 10:56:25.379127'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-13 10:56:25.379127'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-13 10:56:25.394749'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-13 10:56:25.410371'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-13 10:56:25.425992'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-13 10:56:25.425992'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-13 10:56:25.441613'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-13 10:56:25.457293'),
(18, 'library', '0001_initial', '2023-02-13 10:56:25.552100'),
(19, 'sessions', '0001_initial', '2023-02-13 10:56:25.583346'),
(20, 'library', '0002_alter_book_options', '2023-02-13 11:29:37.717712');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5j88nakxsaqva3zqsfshvzjh2hm3bwkr', '.eJxVjDsOwjAQBe_iGll24i8lPWew1rtrHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSJyFFqffLQM-uO2A7tBus8S5rcuU5a7Ig3Z5nYmfl8P9O6jQ67c2Tg1RG2XJaWYs5DnyGCEiEORiQrYUnGIYiKHgGLzTpaBF74wGj-L9AfztOPw:1pRWaD:F04t2Nsogu6CFKdpuWSuUex6DtevFg3pKT4fCg1u5pg', '2023-02-27 11:01:17.504957');

-- --------------------------------------------------------

--
-- Структура таблицы `library_book`
--

CREATE TABLE `library_book` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `published_year` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `check_status` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `library_book`
--

INSERT INTO `library_book` (`id`, `author`, `category`, `title`, `published_year`, `description`, `check_status`) VALUES
(1, 'Elspeth Blackshaw', 'Drama', 'Klimt', '2009', 'Corrosion of unspecified degree of unspecified thumb (nail)', 'R'),
(2, 'Sarita Benedit', 'Action|Adventure|Drama|Thriller|War', 'Triple Cross', '2012', 'Corrosion of second degree of thigh', 'NR'),
(3, 'Lena Sherbourne', 'Comedy', 'Pilgrim, The', '2004', 'Displaced unsp fracture of right great toe, init for clos fx', 'R'),
(4, 'Liz de Nore', 'Horror|Sci-Fi', 'Tarantula', '1992', 'Swimming-pool of children\'s home and orphanage as place', 'NR'),
(5, 'Laverna Pritchitt', 'Comedy', 'Conman (Du Xia 1999)', '2009', 'Burn unsp deg mult sites of shldr/up lmb, ex wrs/hnd, init', 'NR'),
(6, 'Iain Tenney', 'Comedy|Drama', 'Bachelor Weekend, The', '1991', 'Early congenital syphilis, symptomatic', 'NR'),
(7, 'Reese Streater', 'Drama|Romance', 'Hanging Garden, The', '2001', 'Laceration with foreign body, unspecified hip', 'NR'),
(8, 'Guglielmo Poore', 'Comedy|Drama', 'Big Bad Swim, The', '2004', 'Displaced fracture of anterior wall of right acetabulum', 'R'),
(9, 'Erminie Jeschner', 'Comedy|Drama|Romance', 'The Skinny', '2005', 'Lateral disloc of proximal end of tibia, left knee, init', 'R'),
(10, 'Aurelia Kurton', 'Action|Comedy|Crime|Romance', 'Naked Gun: From the Files of Police Squad!, The', '2004', 'Sltr-haris Type IV physl fx low end l femr, 7thD', 'R'),
(11, 'Lacey Ratazzi', 'Documentary', 'Edison Kinetoscopic Record of a Sneeze', '1996', 'Other specified arthritis, unspecified hip', 'R'),
(12, 'Gilbertine Romanetti', 'Documentary', '21-87', '2002', 'Displaced comminuted fracture of shaft of humerus, unsp arm', 'R'),
(13, 'Camel Basant', 'Animation|Children|Musical|IMAX', 'Fantasia 2000', '1993', 'Oth fx shaft of l ulna, 7thR', 'NR'),
(14, 'Malvin Rimbault', 'Romance|Sci-Fi', 'Four Sided Triangle', '2001', 'Occup of hv veh injured in clsn w rail trn/veh nontraf, init', 'R'),
(15, 'Constance Clemencon', 'Drama', 'Storm in Summer, A', '1996', 'Disp fx of prox phalanx of l mid fngr, 7thG', 'NR'),
(16, 'Randi Tesh', 'Drama|Mystery|Romance|War', 'Very Long Engagement, A (Un long dimanche de fiançailles)', '2012', 'Corrosion of third degree of left thigh, subs encntr', 'NR'),
(17, 'Vonni Kyttor', 'Action|Thriller|War', 'Peacemaker, The', '1993', 'Bullous keratopathy, bilateral', 'R'),
(18, 'Vikki Haversum', 'Drama|Mystery|Thriller', 'Missing', '2011', 'Pedal cycle driver injured in collision w ped/anml nontraf', 'R'),
(19, 'Renae Flade', '(no genres listed)', 'Kocken', '2006', 'Blister (nonthermal), right thigh', 'NR'),
(20, 'Gasparo Monro', 'Drama', 'Rolling', '2009', 'Brown-Sequard syndrome at T2-T6', 'R'),
(21, 'Tandy Oger', 'Comedy|Sci-Fi', 'Freaked', '2007', 'Mature T/NK-cell lymph, unsp, nodes of axilla and upper limb', 'R'),
(22, 'Kristine Rubinsky', 'Drama|Film-Noir|Mystery|Thriller', 'Secret Beyond the Door', '1999', 'Other acute osteomyelitis, unspecified radius and ulna', 'R'),
(23, 'Josee Cortes', 'Comedy', 'Spies Like Us', '2010', 'Other articular cartilage disorders, left elbow', 'NR'),
(24, 'Perri Bending', 'Comedy', 'Summer Rental', '1995', 'Ulnar collateral ligament sprain of left elbow, subs encntr', 'R'),
(25, 'Marlo O\'Brollachain', 'Drama', 'Bigamist, The', '2011', 'Rheu arthritis of unsp hip w involv of organs and systems', 'R'),
(26, 'Annabelle Minigo', 'Horror|Thriller', 'Fear', '2011', 'Other specified disorders of synovium, left hip', 'R'),
(27, 'Isabelle Cleghorn', 'Action|Comedy|Romance', 'Chinese Odyssey 2002 (Tian xia wu shuang)', '1996', 'Superficial frostbite of other sites', 'NR'),
(28, 'Johannah Fitzgerald', 'Drama|War', 'In the Midst of Life (Au coeur de la vie)', '1993', 'Drown due to oth accident to unsp watercraft, subs', 'NR'),
(29, 'Thomasa Nassie', 'Drama|Horror|Thriller', 'Living Death', '1994', 'Other fractures of lower end of unspecified radius, sequela', 'R'),
(30, 'Jobina Schule', 'Comedy', 'Bandwagon', '2010', 'Malignant neoplasm of parametrium', 'NR'),
(31, 'Shep Upstone', 'Drama|Romance', 'Education, An', '1994', 'Maternal care for prolapse of gravid uterus, first trimester', 'NR'),
(32, 'Bary Clausewitz', 'Comedy|Crime|Drama', 'Death to Smoochy', '1990', 'Partial traumatic trnsphal amp of r little finger, subs', 'R'),
(33, 'Thayne Le Fleming', 'Comedy|Drama', 'Tyler Perry\'s Why Did I Get Married?', '1998', 'Avalanche, landslide and other earth movements', 'R'),
(34, 'Haley Rathe', 'Drama', 'Blood and Sand', '2006', 'Unsp symptoms and signs involving the genitourinary system', 'NR'),
(35, 'Raffaello Fenck', 'Drama|Romance|War', 'Lloyds of London', '1959', 'Sporotrichosis arthritis', 'NR'),
(36, 'Karlis Boyall', 'Comedy|Romance', 'Cake', '2012', 'Congenital malformation syndromes predom involving limbs', 'NR'),
(37, 'Rockwell Valens-Smith', 'Drama|Fantasy|Horror', 'Faust', '1995', 'Unspecified subluxation of left radial head', 'NR'),
(38, 'Hazel Smittoune', 'Crime|Drama', 'Godfather: Part II, The', '2009', 'Fibrosis due to nervous system prosth dev/grft, sequela', 'NR'),
(39, 'Laurens Stocks', 'Children|Drama', 'National Velvet', '1993', 'Hemarthrosis, unspecified wrist', 'R'),
(40, 'Javier Hanburry', 'Comedy|Romance', 'Leap Year', '2005', 'Fracture of base of skull, unspecified side, sequela', 'R'),
(41, 'Fanya McGarrity', 'Drama', 'Callas Forever', '2004', 'Stupor', 'R'),
(42, 'Sunny Mewe', 'Comedy|Drama|Romance', 'Surviving Desire', '2004', 'Personal history of inhaled steroid therapy', 'R'),
(43, 'Dean Woodwin', 'Drama', 'Two-Lane Blacktop', '2010', 'Obstructed labor due to maternal pelvic abnormality, unsp', 'R'),
(44, 'Winfield Tanton', 'Action|Adventure|Animation', 'Dragon Ball Z: Wrath of the Dragon (Doragon bôru Z 13: Ryûken bakuhatsu!! Gokû ga yaraneba dare ga yaru)', '1993', 'Chondromalacia, knee', 'NR'),
(45, 'Archaimbaud Goodship', 'Horror|Thriller', 'I Spit on Your Grave (Day of the Woman)', '2004', 'Crushing injury of unspecified right toe(s), init encntr', 'NR'),
(46, 'Gaby Wheatcroft', 'Drama', 'Life, Above All', '1988', 'Bitten by duck, initial encounter', 'NR'),
(47, 'Jannel Lukacs', 'Comedy', 'Bringing Down the House', '2005', 'Fall while being carried or supported by oth persons, subs', 'NR'),
(48, 'Fritz Cabble', 'Horror', 'Taste the Blood of Dracula', '1994', 'Nondisp fx of body of hamate bone, left wrist, init', 'R'),
(49, 'Gar Daly', 'Adventure|Animation|Children', '101 Dalmatians (One Hundred and One Dalmatians)', '1996', 'Tonic pupil', 'R'),
(50, 'Samaria Hesse', 'Drama|Romance', 'Dust in the Wind (Lian lian feng chen)', '2012', 'Oth fx shaft of l fibula, 7thR', 'NR'),
(51, 'Francklin Caldwall', 'Drama', 'Cargo 200 (Gruz 200)', '1998', 'Abscess of tendon sheath, unspecified site', 'R'),
(52, 'Brnaba Dudderidge', 'Drama|Sci-Fi', 'Falls, The', '2002', 'Cutaneous abscess of foot', 'NR'),
(53, 'Bethany Gullivent', 'Comedy|Crime|Thriller', 'Pretty Maids All in a Row', '2011', 'Legal intervnt w injury by explosv shell, bystand inj, sqla', 'NR'),
(54, 'Goldi McKiernan', 'Drama', 'Goodnight, Mister Tom', '2012', 'Disp fx of epiphy (separation) (upper) of r femr, 7thH', 'NR'),
(55, 'Morgen Kerslake', 'Comedy|Fantasy|Horror', 'Leprechaun 3', '2008', 'Other injury of inferior vena cava', 'R'),
(56, 'Stoddard Tennick', 'Action|Comedy|Sci-Fi', 'World\'s End, The', '1998', 'Chronic enlargement of lacrimal gland', 'NR'),
(57, 'Pearla Kaplin', 'Comedy', 'Sordid Lives', '2010', 'Epidur hemor w LOC w death d/t brain injury bf consc, sqla', 'NR'),
(58, 'Valentina Craven', 'Crime|Horror|Mystery|Thriller', 'Book of Shadows: Blair Witch 2', '2004', 'Malignant carcinoid tumor of the rectum', 'NR'),
(59, 'Alvinia Pearsey', 'Action|Drama|War', 'Air Force', '2012', 'Unsp injury of unsp musc/fasc/tend at thi lev, left thigh', 'NR'),
(60, 'Deidre Licquorish', 'Comedy|Drama', 'Little Miss Marker', '2003', 'Pulmonary infundibular stenosis', 'R'),
(61, 'Zola Bruty', 'Animation|Children', 'Pokémon the Movie 2000', '2000', 'Driver of 3-whl mv inj in clsn w rail trn/veh in traf, init', 'R'),
(62, 'Humphrey Selley', 'Horror|Thriller', 'Hunger', '1987', 'Age-related osteopor w current path fracture, right femur', 'NR'),
(63, 'Harrison Lavall', 'Comedy', 'The French Kissers', '1992', 'Oth physl fx upper end of unsp tibia, subs for fx w malunion', 'R'),
(64, 'Jemima Itzak', 'Comedy|Romance', 'Divorce of Lady X, The', '2001', 'Unsp superficial injury of scrotum and testes, init encntr', 'R'),
(65, 'Otis Naden', 'Action', 'Mercenary for Justice', '2005', 'Aortic ectasia', 'R'),
(66, 'Maddy Shory', 'Action|Adventure', 'Good Man in Africa, A', '2012', 'Other cestode infections', 'NR'),
(67, 'Belita Gibbens', 'Drama', 'End of Summer, The (Early Autumn) (Kohayagawa-ke no aki)', '2012', 'Corrosion of first degree of abdominal wall, subs encntr', 'R'),
(68, 'Faith Clayworth', 'Drama|Mystery|Thriller', 'Missing', '1993', 'Unsp injury of anterior tibial artery, unsp leg, init encntr', 'R'),
(69, 'Ario Huish', 'Drama', 'Under the Same Moon (Misma luna, La)', '1997', 'Activity, cheerleading', 'R'),
(70, 'Adolph Barnaclough', 'Action|Drama|Thriller', 'How I Live Now', '1998', 'Disp fx of shaft of first metacarpal bone, left hand', 'R'),
(71, 'Matthew Godding', 'Thriller', 'Police Python 357', '2009', 'Contracture of muscle, left forearm', 'NR'),
(72, 'Winnifred Rohmer', 'Comedy|Drama|Musical', 'Microphone', '2009', 'Poisoning by local anesthetics, assault, subs encntr', 'R'),
(73, 'Lowell Stickford', 'Comedy', 'Baby On Board', '2012', 'Insect bite (nonvenomous) of lower back and pelvis', 'R'),
(74, 'Sadye Madeley', 'Drama', 'Anastasia', '1991', 'Superficial foreign body of unsp back wall of thorax, subs', 'NR'),
(75, 'Liliane I\'anson', 'Comedy', 'Taming of the Shrew, The', '1999', 'Unsp fx lower end of right ulna, init for opn fx type 3A/B/C', 'NR'),
(76, 'Paolo Causton', 'Comedy|Drama|Romance', 'Shake It (En kort en lang)', '1996', 'Unsp fx upr end r ulna, 7thH', 'NR'),
(77, 'Fraser Lozano', 'Horror', 'Texas Chainsaw Massacre, The', '2004', 'Pannus (corneal)', 'R'),
(78, 'Jemimah Dracey', 'Comedy|Drama', 'Affairs of Anatol, The', '2007', 'Nondisp fx of post pro of r talus, subs for fx w nonunion', 'NR'),
(79, 'Allison Greeno', 'Drama', 'Serena', '2000', 'Nondisp commnt fx shaft of ulna, unsp arm, 7thQ', 'NR'),
(80, 'Alexis Sadgrove', 'Drama', 'Melvin and Howard', '1998', 'Unsp physeal fracture of upper end of left tibia, sequela', 'NR'),
(81, 'Darsey Keer', 'Fantasy', 'Dreams That Money Can Buy', '2003', 'Inappropriate (excessive) parental pressure', 'R'),
(82, 'Lexy Adami', 'Drama|Romance', 'Centre Stage: Turn It Up', '2003', 'Type 1 diabetes mellitus with ketoacidosis with coma', 'NR'),
(83, 'Nelie Dobney', 'Drama', 'Fall of the Roman Empire, The', '2010', 'Unspecified injury of superior mesenteric vein, subs encntr', 'R'),
(84, 'Olympie Hungerford', 'Adventure|Comedy|Sci-Fi', 'Barbarella', '1993', 'Crushing injury of right middle finger', 'R'),
(85, 'Dollie Lockyear', 'Adventure|Animation|Children', 'Brother Bear', '1997', 'Other specified congenital deformities of hip', 'NR'),
(86, 'Eartha Digle', 'Horror|Mystery|Thriller', 'Omen, The', '2004', 'Other skateboard accident, initial encounter', 'NR'),
(87, 'Aurlie Balham', 'Documentary', 'Capitalism: A Love Story', '1987', 'Strain of flexor musc/fasc/tend l little finger at forarm lv', 'R'),
(88, 'Alessandra Sandiland', 'Documentary', 'Daughters of Dolma', '2012', 'Unspecified superficial injury of thigh', 'NR'),
(89, 'Bartram O\'Brian', 'Comedy|Crime|Romance', 'Gigli', '1998', 'Gastric contents in pharynx causing other injury, sequela', 'NR'),
(90, 'Claus Bewly', 'Comedy|Drama|Romance', 'Under the Roofs of Paris (Sous les toits de Paris)', '2003', 'Toxic effect of corrosive organic compnd, self-harm, sequela', 'R'),
(91, 'Mal Lace', 'Drama', 'Restaurant', '2011', 'Displacement of implanted testicular prosthesis, sequela', 'R'),
(92, 'Nada Tranter', 'Action|Comedy|Crime|Romance', 'You May Not Kiss the Bride', '2001', 'Malignant neoplasm of overlapping sites of colon', 'R'),
(93, 'Wanda Pimlock', 'Comedy|Drama', 'Inkwell, The', '1998', 'Driver of bus injured in collision w ped/anml nontraf, subs', 'R'),
(94, 'Norrie Crambie', 'Drama|Sci-Fi|War', 'Goliath Awaits', '1971', 'Person outsd hv veh inj in clsn w nonmtr veh nontraf, sqla', 'NR'),
(95, 'Burlie Withrington', 'Action|Comedy', 'I Love Trouble', '2010', 'Maternal care for oth rhesus isoimmun, second tri, fetus 2', 'R'),
(96, 'Bing Habbijam', 'Horror', 'Fangs of the Living Dead (Malenka)', '1986', 'Laceration w/o fb of unsp great toe w damage to nail', 'NR'),
(97, 'Anny Cherrie', 'Drama', 'Charm\'s Incidents (Charms Zwischenfälle)', '2006', 'Posterior dislocation of lens, unspecified eye', 'NR'),
(98, 'Colman Waddie', 'Comedy|Drama', 'Torremolinos 73', '1996', 'Subluxation of other parts of unsp shoulder girdle, sequela', 'R'),
(99, 'Jolynn McBrearty', 'Adventure|Documentary', 'Endless Summer 2, The', '1998', 'Disp fx of lateral condyle of right femur, init for clos fx', 'NR'),
(100, 'Jandy Croxton', 'Comedy|Drama|Romance', 'Julie & Julia', '1997', 'Poisoning by calcium-channel blockers, intentional self-harm', 'R'),
(101, 'John Smith', 'Programming', 'Python', '2000', 'This is Python', 'R');

-- --------------------------------------------------------

--
-- Структура таблицы `library_take`
--

CREATE TABLE `library_take` (
  `id` bigint(20) NOT NULL,
  `issued_at` date NOT NULL,
  `return_at` date NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `library_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `library_user`
--

INSERT INTO `library_user` (`id`, `first_name`, `last_name`, `password`, `id_number`, `major`, `role`, `group_id`, `status`) VALUES
(1, 'John', 'Smith', '123', '2110120', 'SE', 'U', 'SSE03', 'A'),
(2, 'Tom', 'Hanks', '123', '2110121', 'SE', 'A', 'SSE03', 'A'),
(3, 'Umidjon', 'Juraboev', '123', '2110122', 'SE', 'S', 'SSE03', 'A');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `library_book`
--
ALTER TABLE `library_book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `library_take`
--
ALTER TABLE `library_take`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_take_book_id_54973658_fk_library_book_id` (`book_id`),
  ADD KEY `library_take_user_id_513f48ba_fk_library_user_id` (`user_id`);

--
-- Индексы таблицы `library_user`
--
ALTER TABLE `library_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `library_book`
--
ALTER TABLE `library_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблицы `library_take`
--
ALTER TABLE `library_take`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `library_user`
--
ALTER TABLE `library_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `library_take`
--
ALTER TABLE `library_take`
  ADD CONSTRAINT `library_take_book_id_54973658_fk_library_book_id` FOREIGN KEY (`book_id`) REFERENCES `library_book` (`id`),
  ADD CONSTRAINT `library_take_user_id_513f48ba_fk_library_user_id` FOREIGN KEY (`user_id`) REFERENCES `library_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
