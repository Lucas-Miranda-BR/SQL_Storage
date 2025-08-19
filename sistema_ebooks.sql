-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2025 at 09:26 PM
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
-- Database: `sistema_ebooks`
--
CREATE DATABASE IF NOT EXISTS `sistema_ebooks` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema_ebooks`;

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `biografia` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `nome`, `biografia`, `foto`, `data_criacao`, `data_atualizacao`) VALUES
(1, 'Machado de Assis', 'Escritor brasileiro, considerado o maior nome da literatura nacional.', 'machado.jpg', '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(2, 'Clarice Lispector', 'Escritora e jornalista brasileira nascida na Ucrânia.', 'clarice.jpg', '2025-08-19 18:33:54', '2025-08-19 18:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `nota` int(11) DEFAULT NULL CHECK (`nota` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL,
  `ebook_id` int(11) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `avaliacao`
--

INSERT INTO `avaliacao` (`id`, `nota`, `comentario`, `data`, `usuario_id`, `ebook_id`, `data_criacao`, `data_atualizacao`) VALUES
(1, 5, 'Obra prima da literatura brasileira!', '2025-08-19 18:33:54', 2, 1, '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(2, 4, 'Livro incrível, leitura obrigatória', '2025-08-19 18:33:54', 2, 2, '2025-08-19 18:33:54', '2025-08-19 18:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `data_criacao`, `data_atualizacao`) VALUES
(1, 'Romance', '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(2, 'Ficção', '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(3, 'Contos', '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(4, 'Literatura Brasileira', '2025-08-19 18:33:54', '2025-08-19 18:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `isbn` varchar(20) NOT NULL,
  `data_publicacao` date DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `idioma` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `editora_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`id`, `titulo`, `descricao`, `isbn`, `data_publicacao`, `preco`, `idioma`, `foto`, `editora_id`, `autor_id`, `data_criacao`, `data_atualizacao`) VALUES
(1, 'Dom Casmurro', 'Romance clássico da literatura brasileira', '978853590', '1899-01-01', '29.90', 'Português', 'dom_casmurro.jpg', 1, 1, '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(2, 'A Hora da Estrela', 'Último romance publicado por Clarice Lispector', '978853250', '1977-01-01', '34.90', 'Português', 'hora_estrela.jpg', 2, 2, '2025-08-19 18:33:54', '2025-08-19 18:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `ebook_categoria`
--

CREATE TABLE `ebook_categoria` (
  `ebook_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `data_associacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebook_categoria`
--

INSERT INTO `ebook_categoria` (`ebook_id`, `categoria_id`, `data_associacao`) VALUES
(1, 1, '2025-08-19 18:33:54'),
(1, 4, '2025-08-19 18:33:54'),
(2, 1, '2025-08-19 18:33:54'),
(2, 4, '2025-08-19 18:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `editora`
--

CREATE TABLE `editora` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `site` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `editora`
--

INSERT INTO `editora` (`id`, `nome`, `site`, `email`, `data_criacao`, `data_atualizacao`) VALUES
(1, 'Companhia das Letras', 'www.companhiadasletras.com.br', 'contato@companhiadasletras.com.br', '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(2, 'Editora Rocco', 'www.rocco.com.br', 'contato@rocco.com.br', '2025-08-19 18:33:54', '2025-08-19 18:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('admin','comum') DEFAULT 'comum',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `tipo`, `data_criacao`, `data_atualizacao`) VALUES
(1, 'Admin', 'admin@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '2025-08-19 18:33:54', '2025-08-19 18:33:54'),
(2, 'João Silva', 'joao@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'comum', '2025-08-19 18:33:54', '2025-08-19 18:33:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_avaliacao` (`usuario_id`,`ebook_id`),
  ADD KEY `ebook_id` (`ebook_id`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `editora_id` (`editora_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indexes for table `ebook_categoria`
--
ALTER TABLE `ebook_categoria`
  ADD PRIMARY KEY (`ebook_id`,`categoria_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indexes for table `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `editora`
--
ALTER TABLE `editora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ebook`
--
ALTER TABLE `ebook`
  ADD CONSTRAINT `ebook_ibfk_1` FOREIGN KEY (`editora_id`) REFERENCES `editora` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ebook_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ebook_categoria`
--
ALTER TABLE `ebook_categoria`
  ADD CONSTRAINT `ebook_categoria_ibfk_1` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ebook_categoria_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
