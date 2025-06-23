-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2025 at 07:23 PM
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
-- Database: `advertdb`
--
CREATE DATABASE IF NOT EXISTS `advertdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `advertdb`;

-- --------------------------------------------------------

--
-- Table structure for table `advertinfo`
--

CREATE TABLE `advertinfo` (
  `advertId` int(11) NOT NULL COMMENT 'ID Anúncio',
  `tituloAnuncio` varchar(255) NOT NULL COMMENT 'Título do anúncio',
  `descricaoAnuncio` varchar(255) NOT NULL COMMENT 'Descrição do anúncio',
  `dataPublicacao` char(8) NOT NULL COMMENT 'Data de publicação do anúncio',
  `marcaVeiculo` varchar(255) NOT NULL COMMENT 'Marca do veículo',
  `modeloVeiculo` varchar(255) NOT NULL COMMENT 'Modelo do veículo',
  `anoVeiculo` char(4) NOT NULL COMMENT 'Ano de lançamento do veículo',
  `corVeiculo` varchar(255) NOT NULL COMMENT 'Cor do veículo',
  `placaVeiculo` char(7) NOT NULL COMMENT 'Placa do veículo',
  `nomeProprietario` varchar(255) NOT NULL COMMENT 'Nome do proprietário',
  `telefoneProprietario` char(11) NOT NULL COMMENT 'Telefone do proprietário'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Informações do anúncio';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertinfo`
--
ALTER TABLE `advertinfo`
  ADD PRIMARY KEY (`advertId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertinfo`
--
ALTER TABLE `advertinfo`
  MODIFY `advertId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Anúncio';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
