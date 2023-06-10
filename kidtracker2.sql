-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Jun-2023 às 00:06
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kidtracker2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `apoia`
--

CREATE TABLE `apoia` (
  `fk_funcionario_id` varchar(30) DEFAULT NULL,
  `fk_administrador_cpf` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atende`
--

CREATE TABLE `atende` (
  `fk_administrador_cpf` int(11) DEFAULT NULL,
  `fk_responsavel_login` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastra`
--

CREATE TABLE `cadastra` (
  `fk_crianca_cpf` int(11) DEFAULT NULL,
  `fk_responsavel_login` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `fk_funcionario_id` varchar(30) DEFAULT NULL,
  `fk_crianca_cpf` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conversa`
--

CREATE TABLE `conversa` (
  `fk_funcionario_id` varchar(30) DEFAULT NULL,
  `fk_responsavel_login` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `crianca`
--

CREATE TABLE `crianca` (
  `nome` varchar(50) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `sanguineo` char(2) NOT NULL,
  `telefone` int(11) NOT NULL,
  `cpf` int(11) NOT NULL,
  `caracteristica` varchar(100) DEFAULT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `praia` varchar(20) NOT NULL,
  `etnia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` varchar(10) NOT NULL,
  `cpf` int(11) NOT NULL,
  `posto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE `responsavel` (
  `email` varchar(30) NOT NULL,
  `telefone` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `cpf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `apoia`
--
ALTER TABLE `apoia`
  ADD KEY `FK_apoia_1` (`fk_funcionario_id`),
  ADD KEY `FK_apoia_2` (`fk_administrador_cpf`);

--
-- Índices para tabela `atende`
--
ALTER TABLE `atende`
  ADD KEY `FK_Atende_1` (`fk_administrador_cpf`),
  ADD KEY `FK_Atende_2` (`fk_responsavel_login`);

--
-- Índices para tabela `cadastra`
--
ALTER TABLE `cadastra`
  ADD KEY `FK_cadastra_1` (`fk_crianca_cpf`),
  ADD KEY `FK_cadastra_2` (`fk_responsavel_login`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD KEY `FK_consulta_1` (`fk_funcionario_id`),
  ADD KEY `FK_consulta_2` (`fk_crianca_cpf`);

--
-- Índices para tabela `conversa`
--
ALTER TABLE `conversa`
  ADD KEY `FK_conversa_1` (`fk_funcionario_id`),
  ADD KEY `FK_conversa_2` (`fk_responsavel_login`);

--
-- Índices para tabela `crianca`
--
ALTER TABLE `crianca`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`login`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `apoia`
--
ALTER TABLE `apoia`
  ADD CONSTRAINT `FK_apoia_1` FOREIGN KEY (`fk_funcionario_id`) REFERENCES `funcionario` (`id`),
  ADD CONSTRAINT `FK_apoia_2` FOREIGN KEY (`fk_administrador_cpf`) REFERENCES `administrador` (`cpf`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `atende`
--
ALTER TABLE `atende`
  ADD CONSTRAINT `FK_Atende_1` FOREIGN KEY (`fk_administrador_cpf`) REFERENCES `administrador` (`cpf`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_Atende_2` FOREIGN KEY (`fk_responsavel_login`) REFERENCES `responsavel` (`login`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `cadastra`
--
ALTER TABLE `cadastra`
  ADD CONSTRAINT `FK_cadastra_1` FOREIGN KEY (`fk_crianca_cpf`) REFERENCES `crianca` (`cpf`),
  ADD CONSTRAINT `FK_cadastra_2` FOREIGN KEY (`fk_responsavel_login`) REFERENCES `responsavel` (`login`);

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `FK_consulta_1` FOREIGN KEY (`fk_funcionario_id`) REFERENCES `funcionario` (`id`),
  ADD CONSTRAINT `FK_consulta_2` FOREIGN KEY (`fk_crianca_cpf`) REFERENCES `crianca` (`cpf`);

--
-- Limitadores para a tabela `conversa`
--
ALTER TABLE `conversa`
  ADD CONSTRAINT `FK_conversa_1` FOREIGN KEY (`fk_funcionario_id`) REFERENCES `funcionario` (`id`),
  ADD CONSTRAINT `FK_conversa_2` FOREIGN KEY (`fk_responsavel_login`) REFERENCES `responsavel` (`login`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
