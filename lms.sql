-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2023 at 11:41 PM
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
(102, 'John Smith', 'Programming', 'Python Programming', '2000', 'This is Pyhton. This is Pyhton. This is Pyhton. This is Pyhton. This is Pyhton. This is Pyhton.\nThis is Pyhton. This is Pyhton. This is Pyhton.This is Pyhton. This is Pyhton. This is Pyhton.\nThis is Pyhton. This is Pyhton. This is Pyhton.\nThis is Pyhton. This is Pyhton. This is Pyhton.\nThis is Pyhton. This is Pyhton. This is Pyhton. ', 'NR'),
(103, 'dasdsdas', 'adsdasd', 'sss', '2000', 'dsadsdadsas', 'NR');

-- --------------------------------------------------------

--
-- Table structure for table `library_take`
--

CREATE TABLE `library_take` (
  `id` bigint(20) NOT NULL,
  `issued_at` date NOT NULL,
  `return_at` date NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_take`
--

INSERT INTO `library_take` (`id`, `issued_at`, `return_at`, `book_id`, `user_id`) VALUES
(8, '2023-02-14', '2023-02-09', 102, 1),
(9, '2023-02-14', '2023-02-25', 103, 1);

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
(1, 'John', 'Smith', '123', '2110120', 'SE', 'U', 'SSE03', 'A'),
(2, 'Tom', 'Hanks', '123', '2110121', 'SE', 'A', 'SSE03', 'A'),
(3, 'Umidjon', 'Juraboev', '123', '2110122', 'SE', 'S', 'SSE03', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `library_book`
--
ALTER TABLE `library_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_take`
--
ALTER TABLE `library_take`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_take_book_id_54973658_fk_library_book_id` (`book_id`),
  ADD KEY `library_take_user_id_513f48ba_fk_library_user_id` (`user_id`);

--
-- Indexes for table `library_user`
--
ALTER TABLE `library_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `library_book`
--
ALTER TABLE `library_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `library_take`
--
ALTER TABLE `library_take`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `library_user`
--
ALTER TABLE `library_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

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
