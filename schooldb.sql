-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 09:18 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb`
--
CREATE DATABASE IF NOT EXISTS `schooldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `schooldb`;

-- --------------------------------------------------------

--
-- Table structure for table `infouser`
--

CREATE TABLE `infouser` (
  `idUser` int(11) NOT NULL COMMENT 'ID do usuário',
  `usernameUser` varchar(255) NOT NULL COMMENT 'Nome do usuário',
  `passwordUser` varchar(255) NOT NULL COMMENT 'Senha do usuário'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Informações de usuário';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `infouser`
--
ALTER TABLE `infouser`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `infouser`
--
ALTER TABLE `infouser`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID do usuário';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
