-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/11/2024 às 03:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

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
  `cpf` varchar(14) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `cpf`, `matricula`, `turma_id`, `foto`) VALUES
(1, 'teste', 'a@hotmail.com', '452', '4545', 1, ''),
(2, 'Ana Silva', 'ana.silva@hotmail.com', '12345678901', '2019001', 2, ''),
(4, 'Carlos Pereira', 'carlos.pereira@hotmail.com', '12345678903', '2019003', 2, ''),
(5, 'Daniela Rocha', 'daniela.rocha@hotmail.com', '12345678904', '2019004', 2, ''),
(12, 'Moura', '222a@hotmail.com', '123523', '23542354', 2, 'aluno123523.png');

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
(5, 'Alimento', '.'),
(6, 'Admin', '');

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
(7, 'Artes', 2);

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
  `orientador_amostra_ciencias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `informacoes_adicionais`
--

INSERT INTO `informacoes_adicionais` (`id`, `aluno_id`, `alergia`, `ja_reprovou`, `interno`, `orientador_amostra_ciencias`) VALUES
(1, 1, '', '', '', ''),
(2, 2, '', '', '', ''),
(3, 4, 's', '', 'sim', ''),
(4, 5, '', '', '', ''),
(5, 12, '', '', '', '');

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
  `disciplina_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notas`
--

INSERT INTO `notas` (`id`, `aluno_id`, `disciplina`, `nota_parcial_1`, `semestre_1`, `nota_parcial_2`, `semestre_2`, `numero_faltas`, `obs_parcial_1`, `obs_1_semestre`, `obs_parcial_2`, `obs_2_semestre`, `disciplina_id`) VALUES
(1, 1, NULL, 8.00, 8.00, 5.00, 1.00, 0, '', '', '', '', 4),
(2, 2, NULL, 8.00, 8.00, 5.00, 7.00, 22, '', '', '', '', 4),
(3, 4, NULL, 8.00, 8.00, 5.00, 8.00, 0, '', '', '', '', 4),
(4, 5, NULL, 8.00, 9.00, 8.00, 8.00, 0, '', '', '', '', 4),
(5, 1, NULL, 7.00, 6.00, 7.00, 7.00, 0, '', '', '', '', 7),
(6, 2, NULL, 7.00, 7.00, 7.00, 7.00, 23, '', '', '', '', 7),
(7, 4, NULL, 7.00, 7.00, 7.00, 7.00, 0, '', '', '', '', 7),
(8, 5, NULL, 7.00, 7.00, 7.00, 7.00, 0, '', '', '', '', 7),
(9, 12, NULL, 7.00, 7.00, 7.00, 7.00, 0, '', '', '', '', 7),
(11, 12, 'Matemática', 7.00, 0.00, 0.00, 0.00, 0, '', '', '', '', 4);

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
(6, 15, 4),
(7, 15, 7);

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
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `turma_id` (`turma_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `informacoes_adicionais`
--
ALTER TABLE `informacoes_adicionais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
