-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Maio-2023 às 23:04
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
-- Banco de dados: `kidtracker`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `CPF` int(11) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `apoia`
--

CREATE TABLE `apoia` (
  `fk_funcionario_publico_ID` varchar(50) DEFAULT NULL,
  `fk_responsavel_cpf` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastra`
--

CREATE TABLE `cadastra` (
  `fk_responsavel_cpf` int(11) DEFAULT NULL,
  `fk_dispositivo_IP` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `fk_administrador_cpf` int(11) DEFAULT NULL,
  `fk_responsavel_cpf` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `crianca`
--

CREATE TABLE `crianca` (
  `Nome` varchar(11) DEFAULT NULL,
  `Responsavel` varchar(50) DEFAULT NULL,
  `TSanguineo` char(2) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `CPF` int(11) NOT NULL,
  `Caracteristica` varchar(200) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL,
  `Cidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dispositivo`
--

CREATE TABLE `dispositivo` (
  `IP` int(11) NOT NULL,
  `fk_crianca_cpf` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario_publico`
--

CREATE TABLE `funcionario_publico` (
  `IDMilitar` int(11) NOT NULL,
  `CPF` int(11) DEFAULT NULL,
  `Guarnicao` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE `responsavel` (
  `CPF` int(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD KEY `FK_Consulta_1` (`fk_administrador_cpf`),
  ADD KEY `FK_Consulta_2` (`fk_responsavel_cpf`);

--
-- Índices para tabela `crianca`
--
ALTER TABLE `crianca`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `dispositivo`
--
ALTER TABLE `dispositivo`
  ADD PRIMARY KEY (`IP`),
  ADD KEY `FK_Dispositivo_2` (`fk_crianca_cpf`);

--
-- Índices para tabela `funcionario_publico`
--
ALTER TABLE `funcionario_publico`
  ADD PRIMARY KEY (`IDMilitar`);

--
-- Índices para tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`CPF`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `FK_Consulta_1` FOREIGN KEY (`fk_administrador_cpf`) REFERENCES `administrador` (`CPF`),
  ADD CONSTRAINT `FK_Consulta_2` FOREIGN KEY (`fk_responsavel_cpf`) REFERENCES `responsavel` (`CPF`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `dispositivo`
--
ALTER TABLE `dispositivo`
  ADD CONSTRAINT `FK_Dispositivo_2` FOREIGN KEY (`fk_crianca_cpf`) REFERENCES `crianca` (`CPF`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
