-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 20/10/2024 às 00:55
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `RPG`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Conta`
--

CREATE TABLE `Conta` (
  `Idconta` int NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Conta`
--

INSERT INTO `Conta` (`Idconta`, `Nome`, `Email`, `Senha`) VALUES
(1, 'Conta Principal', 'principal@example.com', 'senha123'),
(2, 'Conta Secundária', 'secundaria@example.com', 'senha456'),
(3, 'Conta teste', 'teste@example.com', 'senha789');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Equipamento`
--

CREATE TABLE `Equipamento` (
  `IdEquipamento` int NOT NULL,
  `NomeEquipamento` varchar(50) NOT NULL,
  `Forca` int NOT NULL,
  `Defesa` int NOT NULL,
  `Peso` int NOT NULL,
  `Descricao` text NOT NULL,
  `IdTipoEquipamento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Equipamento`
--

INSERT INTO `Equipamento` (`IdEquipamento`, `NomeEquipamento`, `Forca`, `Defesa`, `Peso`, `Descricao`, `IdTipoEquipamento`) VALUES
(4, 'Espada', 10, 0, 5, 'Espada de ferro', 1),
(5, 'Armadura de Couro', 0, 5, 10, 'Armadura de couro', 2),
(6, 'Anel de Vida', 0, 0, 1, 'Anel que aumenta a vida do personagem', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `InventarioPersonagem`
--

CREATE TABLE `InventarioPersonagem` (
  `IdPersonagem` int NOT NULL,
  `IdEquipamento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `InventarioPersonagem`
--

INSERT INTO `InventarioPersonagem` (`IdPersonagem`, `IdEquipamento`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ItensDropaveis`
--

CREATE TABLE `ItensDropaveis` (
  `IdMonstro` int NOT NULL,
  `IdEquipamento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ItensDropaveis`
--

INSERT INTO `ItensDropaveis` (`IdMonstro`, `IdEquipamento`) VALUES
(1, 4),
(2, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Monstro`
--

CREATE TABLE `Monstro` (
  `IdMonstro` int NOT NULL,
  `NomeMonstro` varchar(50) NOT NULL,
  `Nivel` int NOT NULL,
  `Forca` int NOT NULL,
  `Defesa` int NOT NULL,
  `Vida` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Monstro`
--

INSERT INTO `Monstro` (`IdMonstro`, `NomeMonstro`, `Nivel`, `Forca`, `Defesa`, `Vida`) VALUES
(1, 'Goblin', 1, 5, 2, 10),
(2, 'Orc', 3, 10, 5, 30),
(3, 'Dragão', 10, 50, 30, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Personagem`
--

CREATE TABLE `Personagem` (
  `Idpersonagem` int NOT NULL,
  `NomePersonagem` varchar(50) NOT NULL,
  `Nivel` int NOT NULL,
  `Idconta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Personagem`
--

INSERT INTO `Personagem` (`Idpersonagem`, `NomePersonagem`, `Nivel`, `Idconta`) VALUES
(1, 'Mago', 8, 1),
(2, 'Guerreiro', 76, 2),
(3, 'Clérigo', 54, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Skills`
--

CREATE TABLE `Skills` (
  `IdSkill` int NOT NULL,
  `NomeSkill` varchar(50) NOT NULL,
  `Descricao` text NOT NULL,
  `Dano` int NOT NULL,
  `IdPersonagem` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Skills`
--

INSERT INTO `Skills` (`IdSkill`, `NomeSkill`, `Descricao`, `Dano`, `IdPersonagem`) VALUES
(4, 'Bola de Fogo', 'Lança uma bola de fogo que causa dano ao inimigo', 20, 1),
(5, 'Corte Duplo', 'Ataque com duas espadas causando dano duplo', 15, 2),
(6, 'Cura', 'Recupera uma quantidade de vida do personagem', 10, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `SkillsdoPersonagem`
--

CREATE TABLE `SkillsdoPersonagem` (
  `IdPersonagem` int NOT NULL,
  `IdSkill` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TipoEquipamento`
--

CREATE TABLE `TipoEquipamento` (
  `IdTipoEquipamento` int NOT NULL,
  `NomeTipoEquipamento` varchar(50) NOT NULL,
  `Descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TipoEquipamento`
--

INSERT INTO `TipoEquipamento` (`IdTipoEquipamento`, `NomeTipoEquipamento`, `Descricao`) VALUES
(1, 'Arma', 'Equipamento que aumenta o dano do personagem'),
(2, 'Armadura', 'Equipamento que aumenta a defesa do personagem'),
(3, 'Acessorio', 'Equipamento que aumenta a vida do personagem');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Conta`
--
ALTER TABLE `Conta`
  ADD PRIMARY KEY (`Idconta`);

--
-- Índices de tabela `Equipamento`
--
ALTER TABLE `Equipamento`
  ADD PRIMARY KEY (`IdEquipamento`),
  ADD KEY `IdTipoEquipamento` (`IdTipoEquipamento`);

--
-- Índices de tabela `InventarioPersonagem`
--
ALTER TABLE `InventarioPersonagem`
  ADD KEY `IdPersonagem` (`IdPersonagem`),
  ADD KEY `IdEquipamento` (`IdEquipamento`);

--
-- Índices de tabela `ItensDropaveis`
--
ALTER TABLE `ItensDropaveis`
  ADD KEY `IdMonstro` (`IdMonstro`),
  ADD KEY `IdEquipamento` (`IdEquipamento`);

--
-- Índices de tabela `Monstro`
--
ALTER TABLE `Monstro`
  ADD PRIMARY KEY (`IdMonstro`);

--
-- Índices de tabela `Personagem`
--
ALTER TABLE `Personagem`
  ADD PRIMARY KEY (`Idpersonagem`),
  ADD KEY `Idconta` (`Idconta`);

--
-- Índices de tabela `Skills`
--
ALTER TABLE `Skills`
  ADD PRIMARY KEY (`IdSkill`),
  ADD KEY `IdPersonagem` (`IdPersonagem`);

--
-- Índices de tabela `SkillsdoPersonagem`
--
ALTER TABLE `SkillsdoPersonagem`
  ADD KEY `IdPersonagem` (`IdPersonagem`),
  ADD KEY `IdSkill` (`IdSkill`);

--
-- Índices de tabela `TipoEquipamento`
--
ALTER TABLE `TipoEquipamento`
  ADD PRIMARY KEY (`IdTipoEquipamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Conta`
--
ALTER TABLE `Conta`
  MODIFY `Idconta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Equipamento`
--
ALTER TABLE `Equipamento`
  MODIFY `IdEquipamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `Monstro`
--
ALTER TABLE `Monstro`
  MODIFY `IdMonstro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Personagem`
--
ALTER TABLE `Personagem`
  MODIFY `Idpersonagem` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Skills`
--
ALTER TABLE `Skills`
  MODIFY `IdSkill` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `TipoEquipamento`
--
ALTER TABLE `TipoEquipamento`
  MODIFY `IdTipoEquipamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Equipamento`
--
ALTER TABLE `Equipamento`
  ADD CONSTRAINT `Equipamento_ibfk_1` FOREIGN KEY (`IdTipoEquipamento`) REFERENCES `TipoEquipamento` (`IdTipoEquipamento`);

--
-- Restrições para tabelas `InventarioPersonagem`
--
ALTER TABLE `InventarioPersonagem`
  ADD CONSTRAINT `InventarioPersonagem_ibfk_1` FOREIGN KEY (`IdPersonagem`) REFERENCES `Personagem` (`Idpersonagem`),
  ADD CONSTRAINT `InventarioPersonagem_ibfk_2` FOREIGN KEY (`IdEquipamento`) REFERENCES `TipoEquipamento` (`IdTipoEquipamento`);

--
-- Restrições para tabelas `ItensDropaveis`
--
ALTER TABLE `ItensDropaveis`
  ADD CONSTRAINT `ItensDropaveis_ibfk_1` FOREIGN KEY (`IdMonstro`) REFERENCES `Monstro` (`IdMonstro`),
  ADD CONSTRAINT `ItensDropaveis_ibfk_2` FOREIGN KEY (`IdEquipamento`) REFERENCES `Equipamento` (`IdEquipamento`);

--
-- Restrições para tabelas `Personagem`
--
ALTER TABLE `Personagem`
  ADD CONSTRAINT `Personagem_ibfk_1` FOREIGN KEY (`Idconta`) REFERENCES `Conta` (`Idconta`);

--
-- Restrições para tabelas `Skills`
--
ALTER TABLE `Skills`
  ADD CONSTRAINT `Skills_ibfk_1` FOREIGN KEY (`IdPersonagem`) REFERENCES `Personagem` (`Idpersonagem`);

--
-- Restrições para tabelas `SkillsdoPersonagem`
--
ALTER TABLE `SkillsdoPersonagem`
  ADD CONSTRAINT `SkillsdoPersonagem_ibfk_1` FOREIGN KEY (`IdPersonagem`) REFERENCES `Personagem` (`Idpersonagem`),
  ADD CONSTRAINT `SkillsdoPersonagem_ibfk_2` FOREIGN KEY (`IdSkill`) REFERENCES `Skills` (`IdSkill`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
