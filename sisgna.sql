-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/02/2025 às 03:56
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sisgna`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `matricula`, `turma_id`, `foto`) VALUES
(11, 'Bruna Martins', 'bruna.martins@email.com', '23987654321', 2, 'aluno23987654321.png'),
(12, 'Felipe Almeida', 'felipe.almeida@email.com', '33987654321', 2, 'aluno33987654321.png'),
(13, 'Marcos Rocha', 'marcos.rocha@email.com', '43987654321', 2, 'aluno43987654321.png'),
(14, 'Patrícia Lima', 'patricia.lima@email.com', '53987654321', 2, 'aluno53987654321.png'),
(15, 'Eduardo Oliveira', 'eduardo.oliveira@email.com', '63987654321', 2, 'aluno63987654321.png'),
(16, 'Isabela Santos', 'isabela.santos@email.com', '73987654321', 2, 'aluno73987654321.png'),
(17, 'Gustavo Martins', 'gustavo.martins@email.com', '83987654321', 2, 'aluno83987654321.png'),
(18, 'Larissa Costa', 'larissa.costa@email.com', '93987654321', 2, 'aluno93987654321.png'),
(19, 'Ricardo Ferreira', 'ricardo.ferreira@email.com', '04987654321', 2, 'aluno04987654321.png'),
(20, 'Carlos Henrique', 'carlos.henrique@email.com', '14987654321', 2, 'aluno14987654321.png'),
(21, 'Daniela Ribeiro', 'daniela.ribeiro@email.com', '24987654321', 3, 'aluno24987654321.png'),
(22, 'Thiago Lima', 'thiago.lima@email.com', '34987654321', 3, 'aluno34987654321.png'),
(23, 'Juliana Souza', 'juliana.souza@email.com', '44987654321', 3, 'aluno44987654321.png'),
(24, 'Felipe Costa', 'felipe.costa@email.com', '54987654321', 3, 'aluno54987654321.png'),
(25, 'Patrícia Rocha', 'patricia.rocha@email.com', '64987654321', 3, 'aluno64987654321.png'),
(26, 'Ricardo Almeida', 'ricardo.almeida@email.com', '74987654321', 3, 'aluno74987654321.png'),
(27, 'Amanda Ferreira', 'amanda.ferreira@email.com', '84987654321', 3, 'aluno84987654321.png'),
(28, 'Gustavo Costa', 'gustavo.costa@email.com', '94987654321', 3, 'aluno94987654321.png'),
(29, 'Marcos Almeida', 'marcos.almeida@email.com', '05987654321', 3, 'aluno05987654321.png'),
(30, 'Jessica Lima', 'jessica.lima@email.com', '15987654321', 3, 'aluno15987654321.png'),
(31, 'Miguel Soares', 'soares@gmail.com', '11111111', 1, 'aluno11111111.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivos`
--

CREATE TABLE `arquivos` (
  `id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `plano_trabalho` varchar(255) DEFAULT NULL,
  `relatorioatv` varchar(255) DEFAULT NULL,
  `data_upload` timestamp NOT NULL DEFAULT current_timestamp(),
  `semestre` int(11) NOT NULL,
  `ano` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `descricao`) VALUES
(4, 'Informática', 'George'),
(5, 'Agropecuária', '.'),
(6, 'Administração', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `turma_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `nome`, `turma_id`) VALUES
(4, 'Matemática', 2),
(5, 'Português', 3),
(6, 'Geografia', 2),
(7, 'Artes', 2),
(8, 'Geografia', 1),
(9, 'Química', 2),
(10, 'Física', 2),
(11, 'Biologia', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacoes_adicionais`
--

CREATE TABLE `informacoes_adicionais` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `alergia` varchar(255) DEFAULT NULL,
  `ja_reprovou` varchar(255) DEFAULT 'Não',
  `interno` varchar(255) DEFAULT 'Não',
  `orientador_amostra_ciencias` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `disciplina` varchar(100) DEFAULT NULL,
  `nota_parcial_1` decimal(5,2) DEFAULT NULL,
  `semestre_1` decimal(5,2) DEFAULT NULL,
  `nota_parcial_2` decimal(5,2) DEFAULT NULL,
  `semestre_2` decimal(5,2) DEFAULT NULL,
  `numero_faltas` int(11) DEFAULT NULL,
  `obs_parcial_1` text DEFAULT NULL,
  `obs_1_semestre` text DEFAULT NULL,
  `obs_parcial_2` text DEFAULT NULL,
  `obs_2_semestre` text DEFAULT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  `ais` decimal(5,2) DEFAULT NULL,
  `aia` decimal(5,2) DEFAULT NULL,
  `amostra` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notas`
--

INSERT INTO `notas` (`id`, `aluno_id`, `disciplina`, `nota_parcial_1`, `semestre_1`, `nota_parcial_2`, `semestre_2`, `numero_faltas`, `obs_parcial_1`, `obs_1_semestre`, `obs_parcial_2`, `obs_2_semestre`, `disciplina_id`, `ais`, `aia`, `amostra`) VALUES
(12, 11, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(13, 12, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(14, 13, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(15, 14, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(16, 15, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(17, 16, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(18, 17, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(19, 18, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(20, 19, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(21, 20, 'Artes', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(22, 11, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(23, 12, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(24, 13, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(25, 14, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(26, 15, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(27, 16, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(28, 17, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(29, 18, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(30, 19, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(31, 20, 'Matemática', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(32, 31, 'Geografia', 6.00, 6.00, 6.00, 6.00, 0, '', '', '', '', 8, 0.00, 0.00, 0.00),
(33, 11, 'Física', 2.00, 7.00, 7.00, 0.00, 0, '', '', '', '', 10, 7.00, 7.00, 7.00),
(34, 12, 'Física', 8.00, 8.00, 8.00, 8.00, 0, '', '', '', '', 10, 8.00, 8.00, 6.00),
(35, 13, 'Física', 0.00, 4.00, 4.00, 3.00, 0, '', '', '', '', 10, 3.00, 2.00, 8.00),
(36, 14, 'Física', 3.00, 2.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(37, 15, 'Física', 6.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(38, 16, 'Física', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(39, 17, 'Física', 8.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(40, 18, 'Física', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(41, 19, 'Física', 4.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(42, 20, 'Física', 4.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 10, 0.00, 0.00, 0.00),
(43, 11, 'Geografia', 4.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(44, 12, 'Geografia', 3.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(45, 13, 'Geografia', 6.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(46, 14, 'Geografia', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(47, 15, 'Geografia', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(48, 16, 'Geografia', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(49, 17, 'Geografia', 8.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(50, 18, 'Geografia', 9.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(51, 19, 'Geografia', 9.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(52, 20, 'Geografia', 6.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 6, 0.00, 0.00, 0.00),
(53, 11, 'Química', 6.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(54, 12, 'Química', 6.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(55, 13, 'Química', 5.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(56, 14, 'Química', 8.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(57, 15, 'Química', 8.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(58, 16, 'Química', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(59, 17, 'Química', 9.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(60, 18, 'Química', 10.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(61, 19, 'Química', 2.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00),
(62, 20, 'Química', 1.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 9, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `tipo_destinatario` enum('admin','setor','professor') NOT NULL,
  `setor_id` int(11) DEFAULT NULL,
  `status` enum('não lida','lida') DEFAULT 'não lida',
  `data_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_leitura` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `usuario_id`, `mensagem`, `tipo_destinatario`, `setor_id`, `status`, `data_envio`, `data_criacao`, `data_leitura`) VALUES
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:32:48', '2024-11-21 02:32:48', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:34:59', '2024-11-21 02:34:59', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:35:02', '2024-11-21 02:35:02', '2024-11-21 21:42:35'),
(0, 15, 'Enviar notas', 'admin', NULL, 'lida', '2024-11-21 02:35:09', '2024-11-21 02:35:09', '2024-11-21 21:42:35'),
(0, 15, 'e', 'admin', NULL, 'lida', '2024-11-21 02:35:35', '2024-11-21 02:35:35', '2024-11-21 21:42:35'),
(0, 15, 'oo', 'admin', NULL, 'lida', '2024-11-21 02:36:54', '2024-11-21 02:36:54', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:38:03', '2024-11-21 02:38:03', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:39:05', '2024-11-21 02:39:05', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:40:20', '2024-11-21 02:40:20', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-21 02:51:26', '2024-11-21 02:51:26', '2024-11-21 21:42:35'),
(0, 15, 'po', 'admin', NULL, 'lida', '2024-11-21 02:51:31', '2024-11-21 02:51:31', '2024-11-21 21:42:35'),
(0, 15, 'o', 'admin', NULL, 'lida', '2024-11-21 02:53:10', '2024-11-21 02:53:10', '2024-11-21 21:42:35'),
(0, 15, 'oi', 'admin', NULL, 'lida', '2024-11-22 00:42:30', '2024-11-22 00:42:30', '2024-11-21 21:42:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professores`
--

INSERT INTO `professores` (`id`, `nome`, `email`, `cpf`, `senha`, `foto`) VALUES
(15, 'Miguel', 'mig@hotmail.com', '21346', '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_disciplinas`
--

CREATE TABLE `professor_disciplinas` (
  `id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professor_disciplinas`
--

INSERT INTO `professor_disciplinas` (`id`, `professor_id`, `disciplina_id`) VALUES
(11, 15, 4),
(12, 15, 6),
(13, 15, 7),
(14, 15, 8),
(15, 15, 9),
(16, 15, 10),
(17, 15, 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recparalela`
--

CREATE TABLE `recparalela` (
  `id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `descricao` text DEFAULT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  `disciplina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recparalela`
--

INSERT INTO `recparalela` (`id`, `professor_id`, `turma_id`, `data_inicio`, `data_fim`, `descricao`, `arquivo`, `disciplina_id`) VALUES
(12, 15, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'uploads/recparalela/b. Quadro Resumo - Documentação para Conf. Vaga - PS Graduação (1) (1).pdf', 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('SETOR 1','SETOR 2','SETOR 3') NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `setores`
--

INSERT INTO `setores` (`id`, `email`, `senha`, `tipo`, `foto`, `nome`) VALUES
(2, 'setor@hotmail.com', '$2y$10$4vVdEQjADm5HIbj9toH3sOiN4i7oK2mfUrDY5rr7Iho/mhpBKdNYi', 'SETOR 2', 'foto/ataca.jpg', 'Setor'),
(3, 'a2@hotmail.com', '$2y$10$O/w8.rC.9t2sSEvaBG0dq.MThkSNoKmOmzVRM8zW4A9/nhs27JVh.', 'SETOR 3', '', 'AMN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `lider` varchar(100) DEFAULT NULL,
  `regente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `nome`, `curso_id`, `lider`, `regente`) VALUES
(1, 'Turma 14', 4, 'Líder A', 'Regente A'),
(2, 'Turma 24', 4, 'Líder B', 'Regente B'),
(3, 'Turma 34', 6, 'Líder C', 'Regente C');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `tipo` enum('admin','professor','setor') NOT NULL DEFAULT 'professor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `email`, `password_hash`, `reset_token`, `reset_expires`, `tipo`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$MuXHxR.PNKiOhnN1F/3Vc.ZxqVBu90FMD.gvDpjciEQitzsGxoRRS', NULL, NULL, 'admin'),
(2, 'setor', 'setor@setor.com', '$2y$10$UjJo5krr9P8RH5bM0MSDGO41wR.G7Y.xHMohPZgl.s5ri7pTTHFl6', NULL, NULL, 'setor'),
(15, 'Miguel', 'mig@hotmail.com', '$2y$10$I6HaJjH4nTiMeNuafDokMu8LwCGXpDdqjdhWTKIc5LKzJNM2GaGO6', NULL, NULL, 'professor'),
(16, 'AMN', 'a2@hotmail.com', '$2y$10$O/w8.rC.9t2sSEvaBG0dq.MThkSNoKmOmzVRM8zW4A9/nhs27JVh.', NULL, NULL, 'setor');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `arquivos`
--
ALTER TABLE `arquivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `professor_id` (`professor_id`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `informacoes_adicionais`
--
ALTER TABLE `informacoes_adicionais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aluno_id` (`aluno_id`);

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `professor_disciplinas`
--
ALTER TABLE `professor_disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `professor_id` (`professor_id`),
  ADD KEY `disciplina_id` (`disciplina_id`);

--
-- Índices de tabela `recparalela`
--
ALTER TABLE `recparalela`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `turma_id` (`turma_id`,`disciplina_id`),
  ADD UNIQUE KEY `turma_id_2` (`turma_id`,`disciplina_id`),
  ADD KEY `recparalela_professor_fk` (`professor_id`);

--
-- Índices de tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `arquivos`
--
ALTER TABLE `arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `informacoes_adicionais`
--
ALTER TABLE `informacoes_adicionais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `professor_disciplinas`
--
ALTER TABLE `professor_disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `recparalela`
--
ALTER TABLE `recparalela`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `arquivos`
--
ALTER TABLE `arquivos`
  ADD CONSTRAINT `arquivos_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `informacoes_adicionais`
--
ALTER TABLE `informacoes_adicionais`
  ADD CONSTRAINT `informacoes_adicionais_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `fk_professor_usuario` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `professor_disciplinas`
--
ALTER TABLE `professor_disciplinas`
  ADD CONSTRAINT `professor_disciplinas_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `professor_disciplinas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `recparalela`
--
ALTER TABLE `recparalela`
  ADD CONSTRAINT `recparalela_professor_fk` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recparalela_turma_fk` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
