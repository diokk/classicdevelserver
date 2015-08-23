-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 23, 2015 at 12:15 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `classic`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `idCourse` char(10) NOT NULL,
  `courseName` char(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`idCourse`, `courseName`, `is_active`) VALUES
('0432e44', 'Advanced Computational Mathematics', 1),
('1194545', 'Operating System', 1),
('1584d83', 'Advanced Programming', 1),
('1ce3aba', 'Data Structures and Algorithms', 1),
('221e57a', 'Software Engineering', 1),
('22e56g', 'Jaringan', 0),
('5ab1f5a', 'Computer Networks', 1),
('608da04', 'Computer Architecture and Organization', 1),
('6729058', 'Digital Systems', 1),
('8444b52', 'Object-oriented Modeling', 1),
('9dcaf0a', 'Computational Mathematics', 1),
('c7f3d99', 'Database Systems', 1),
('da7be34', 'Basic Programming', 1),
('e555e9f', 'System Analysis and Design', 1),
('ebbc7b3', 'Probability and Statistics', 1),
('mk1010', 'Web Programming', 1);

-- --------------------------------------------------------

--
-- Table structure for table `folder`
--

CREATE TABLE IF NOT EXISTS `folder` (
  `idFolder` int(11) NOT NULL AUTO_INCREMENT,
  `folderName` varchar(45) NOT NULL,
  `idCourse` varchar(6) NOT NULL,
  `idParent` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`idFolder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `folder`
--

INSERT INTO `folder` (`idFolder`, `folderName`, `idCourse`, `idParent`, `last_update`) VALUES
(1, 'coba', '965631', 0, '2015-07-26 10:29:57'),
(2, 'coba 1 edit', '965631', 1, '2015-07-26 11:50:44'),
(3, 'coba 2 edit', '965631', 2, '2015-07-26 11:50:56'),
(4, 'coba 3', '965631', 3, '2015-06-28 08:23:12'),
(8, 'Chapter 1', '965631', 0, '2015-07-26 15:46:22'),
(9, 'Chapter 1 Perencanaan Sumberdaya', '88c5e8', 0, '2015-07-26 15:47:09'),
(10, 'Materi Pertama', '0cf427', 0, '2015-07-27 08:48:49'),
(11, 'Materi 1 Pemrograman Lanjut', '84d839', 0, '2015-07-27 09:57:09'),
(12, 'Chapter 1 perangkat lunak', '1e57a1', 0, '2015-07-30 08:15:05'),
(13, 'kumpulan contoh chapter 1', '1e57a1', 12, '2015-07-30 08:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
  `idLecturer` varchar(10) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `fullName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLecturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`idLecturer`, `username`, `pass`, `fullName`) VALUES
('0e15454', 'gembongedhisetyawan', 'gembongedhisetyawan', 'Gembong Edhi Setyawan'),
('107c525', 'rekyanregasarimardiputri', 'rekyanregasarimardiputri', 'Rekyan Regasari Mardi Putri'),
('13a233b', 'satrioagungw', 'satrioagungw', 'Satrio Agung W.'),
('141cfb6', 'dennysagitar', 'dennysagitar', 'Denny Sagita R.'),
('14a04c9', 'edysantoso', 'edysantoso', 'Edy Santoso'),
('2ccfa45', 'hurriyatulfitriyah', 'hurriyatulfitriyah', 'Hurriyatul Fitriyah'),
('2e48b4f', 'suprapto', 'suprapto', 'Suprapto'),
('3857135', 'indriati', 'indriati', 'Indriati'),
('3aec246', 'kasyfulamron', 'kasyfulamron', 'Kasyful Amron'),
('4030bee', 'mahardekatriananta', 'mahardekatriananta', 'Mahardeka Tri Ananta'),
('4e0fcd9', 'wibisonosukmowardhono', 'wibisonosukmowardhono', 'Wibisono Sukmo Wardhono'),
('5bba80e', 'budidarmasetiawan', 'budidarmasetiawan', 'Budi Darma Setiawan'),
('6081132', 'triastotokurniawan', 'triastotokurniawan', 'Tri Astoto Kurniawan'),
('6915a0d', 'dosenpengampu', 'dosenpengampu', 'Dosen Pengampu'),
('6b81d38', 'ekosetiawan', 'ekosetiawan', 'Eko Setiawan'),
('6ccd07c', 'fitriutaminingrum', 'fitriutaminingrum', 'Fitri Utaminingrum'),
('6f541e8', 'marji', 'marji', 'Marji'),
('7b42cf7', 'sabriansyahrizqikaakbar', 'sabriansyahrizqikaakbar', 'Sabriansyah Rizqika Akbar'),
('81c6611', 'eriqmuhadamsjonemaro', 'eriqmuhadamsjonemaro', 'Eriq Muh. Adams Jonemaro'),
('8349ea5', 'fajarpradana', 'fajarpradana', 'Fajar Pradana'),
('8a27676', 'arikusyanti', 'arikusyanti', 'Ari Kusyanti'),
('93b8a88', 'sutrisno', 'sutrisno', 'Sutrisno'),
('96a04c0', 'ekosaktip', 'ekosaktip', 'Eko Sakti P.'),
('9d8ef97', 'barlianhenryranuprasetio', 'barlianhenryranuprasetio', 'Barlian Henryranu Prasetio'),
('b307458', 'komangcandrabrata', 'komangcandrabrata', 'Komang Candra Brata'),
('ba2e457', 'candradewi', 'candradewi', 'Candra Dewi'),
('bea5507', 'dianekaratnawati', 'dianekaratnawati', 'Dian Eka Ratnawati'),
('d530bdd', 'issaarwani', 'issaarwani', 'Issa Arwani'),
('dd5ec27', 'wijayakurniawan', 'wijayakurniawan', 'Wijaya Kurniawan'),
('e015163', 'herunurwarsito', 'herunurwarsito', 'Heru Nurwarsito'),
('ed4ffd8', 'lutfifanani', 'lutfifanani', 'Lutfi Fanani'),
('f9de172', 'adharulmuttaqin', 'adharulmuttaqin', 'Adharul Muttaqin'),
('fd3d591', 'hermantolle', 'hermantolle', 'Herman Tolle'),
('feb02dd', 'mochammadhannatshanafil', 'mochammadhannatshanafil', 'Mochammad Hannats Hanafi l.');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `materialTitle` varchar(60) DEFAULT NULL,
  `fileName` varchar(45) NOT NULL,
  `description` text,
  `format` varchar(25) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `location` varchar(200) NOT NULL,
  `idCourse` varchar(6) NOT NULL,
  `idFolder` int(11) DEFAULT NULL,
  `idLecturer` varchar(6) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`idMaterial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`idMaterial`, `materialTitle`, `fileName`, `description`, `format`, `size`, `location`, `idCourse`, `idFolder`, `idLecturer`, `last_update`) VALUES
(2, 'Pendahuluan Pemrograman Web', 'MJZ2TE-DPS-SUB.pdf', 'Materi ini membahas mengenai dasar-dasar HTML,CSS, dan Javascript', 'pdf', 57991, 'assets/uploads/1a99f5/965631/MJZ2TE-DPS-SUB.pdf', '965631', 0, '1a99f5', '2015-07-26 15:23:28'),
(4, 'Perencanaan Sumberdaya', 'pdfexample.pdf', 'asa', 'pdf', 108405, 'assets/uploads/242708/88c5e8/pdfexample.pdf', '88c5e8', 9, '242708', '2015-07-26 15:58:28'),
(5, 'Pendahuluan Pengenalan Pola', 'Algoevo.pdf', 'Pembelajaran mengenai', 'pdf', 1455573, 'assets/uploads/81d384/0cf427/Algoevo.pdf', '0cf427', 10, '81d384', '2015-07-27 08:50:23'),
(6, 'Contoh Penggunaan', 'dizzy.mp4', '', 'mp4', 1595696, 'assets/uploads/81d384/0cf427/dizzy.mp4', '0cf427', 10, '81d384', '2015-07-27 08:51:50'),
(7, 'Pendahuluan Pemrograman', 'Algoevo.pdf', 'tes ', 'pdf', 1455573, 'assets/uploads/a04c99/84d839/Algoevo.pdf', '84d839', 11, 'a04c99', '2015-07-27 09:57:52'),
(8, 'Contoh Video', 'dizzy.mp4', 'Ini adalah contoh video', 'mp4', 1595696, 'assets/uploads/a04c99/84d839/dizzy.mp4', '84d839', 11, 'a04c99', '2015-07-27 10:02:17'),
(9, 'Tugas UTS', 'Prakt3 Aplikasi web.pdf', 'Ini adalah tugas UTS', 'pdf', 68166, 'assets/uploads/3d591d/84d839/Prakt3 Aplikasi web.pdf', '84d839', 0, '3d591d', '2015-07-29 08:51:39'),
(10, 'Basis data', 'Making an Android Tablet Work as a Set-Top Bo', 'Materi basis data', 'pdf', 108405, 'assets/uploads/3d591d/f3d996/Making an Android Tablet Work as a Set-Top Box.pdf', 'f3d996', 0, '3d591d', '2015-07-29 08:53:48'),
(11, 'Materi pertama', 'effectofpresentationgraphicsonlearning.pdf', '', 'pdf', 183213, 'assets/uploads/49ea5c/1e57a1/effectofpresentationgraphicsonlearning.pdf', '1e57a1', 0, '49ea5c', '2015-07-29 08:56:28'),
(12, 'Contoh tugas RPL', 'Google’s Android as an application environmen', 'Ini adalah salah satu contoh  chapter 1', 'pdf', 116301, 'assets/uploads/49ea5c/1e57a1/Google’s Android as an application environment for DTV decoder system.pdf', '1e57a1', 13, '49ea5c', '2015-07-30 08:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

CREATE TABLE IF NOT EXISTS `teaching` (
  `idTeaching` int(20) NOT NULL AUTO_INCREMENT,
  `idCourse` char(10) NOT NULL,
  `idLecturer` char(10) NOT NULL,
  PRIMARY KEY (`idTeaching`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`idTeaching`, `idCourse`, `idLecturer`) VALUES
(2, '1ce3aba', 'd530bdd'),
(3, 'e555e9f', '2e48b4f'),
(4, 'e555e9f', '14a04c9'),
(5, '608da04', '0e15454'),
(6, '5ab1f5a', '6b81d38'),
(7, '608da04', 'e015163'),
(8, '9dcaf0a', '4e0fcd9'),
(9, '5ab1f5a', '7b42cf7'),
(10, '0432e44', '2ccfa45'),
(11, '9dcaf0a', '107c525'),
(12, '0432e44', '6ccd07c'),
(13, '0432e44', '8a27676'),
(14, '8444b52', '81c6611'),
(15, '0432e44', '3857135'),
(16, 'da7be34', 'fd3d591'),
(17, '8444b52', 'feb02dd'),
(18, 'da7be34', '93b8a88'),
(19, '1584d83', '5bba80e'),
(20, 'da7be34', '6f541e8'),
(21, 'ebbc7b3', 'b307458'),
(22, '1584d83', 'ba2e457'),
(23, 'ebbc7b3', '4030bee'),
(24, 'ebbc7b3', 'ed4ffd8'),
(25, '221e57a', '8349ea5'),
(26, '221e57a', '6081132'),
(27, '221e57a', '141cfb6'),
(28, 'c7f3d99', 'bea5507'),
(29, 'c7f3d99', '13a233b'),
(30, '6729058', 'dd5ec27'),
(31, '6729058', '9d8ef97'),
(32, '1194545', '96a04c0'),
(33, '1194545', '3aec246'),
(34, '1ce3aba', '6915a0d'),
(35, '6729058', '6915a0d'),
(36, '1194545', '6915a0d'),
(37, '1ce3aba', 'f9de172'),
(38, '22e56g', 'f9de172'),
(39, 'mk1010', '8349ea5');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
