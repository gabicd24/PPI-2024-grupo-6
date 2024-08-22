-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/08/2024 às 16:11
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
  `cpf` varchar(14) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `cpf`, `matricula`, `turma_id`, `foto`) VALUES
(1, 'teste', 'a@hotmail.com', '452', '4545', 2, '1723162263_sapato.jfif');

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
(5, 'Alimento', '.');

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
(6, 'Geografia', 2);

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

--
-- Despejando dados para a tabela `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires`, `created_at`) VALUES
(1, 'a@hotmail.com', '76656a274228381b9f72a9693c4795b9bcea02cc789ec8226028aae6d8e447b4c4a24f7fbd7aad984d252f669e3c53abfd66', '2024-08-18 03:28:56', '2024-08-18 00:28:56'),
(2, 'a@hotmail.com', '34c98022e48cc4101b3ab699306a5112343b817b6ed63ba528218f24ea45a725d17c8ec1769a85d5a2bfcc44271a9af5dad9', '2024-08-18 03:29:00', '2024-08-18 00:29:00'),
(3, 'a@hotmail.com', '2d9834ee268bed5cba3d18d1f9816b4f973d019342f6db56895f0223479c8fd82c086416da1cf7b2e1db944cfbab22ea712f', '2024-08-18 03:30:21', '2024-08-18 00:30:21'),
(5, 'a@hotmail.com', '4afa90509247f08ae4108f392d3b3c66376e071cfda63ff0bc6fdc5d2085d68af4435c2a9f18efcbdbc4b9a355baeb3c9ddc', '2024-08-18 03:41:16', '2024-08-18 00:41:16'),
(8, 'lorenzorpiovesan@hotmail.com', '34a273a89ebc779269c9f4a7b46cdb2106a8d7cb8f70c74b226de59077c0d07209241b4df6d13e36a10b754d615154c3dac4', '2024-08-18 03:46:19', '2024-08-18 00:46:19'),
(10, 'lorenzorpiovesan@hotmail.com', '6f2d7a0eeed8f257b81ddbd5bfaa421cb6aaed087fb25d059b0ab2f2d53534f274026bea1bba3af94c9ca7cf5a496c5ea441', '2024-08-18 03:47:47', '2024-08-18 00:47:47'),
(11, 'lorenzorpiovesan@hotmail.com', '3d3fb05e26dc2188dcee300acfa58298751ea3d7f87fca5aa03665c5d26e32ed536e6e76f36385be55b1916dcbf0b66ceb14', '2024-08-18 03:51:44', '2024-08-18 00:51:44'),
(12, 'lorenzorpiovesan@hotmail.com', 'ee1925f5546ade8e09f650948577b8f3d896ab7350a7ff99c07787a569a905c697e73b722338c9ccd97f3cacc31f208da3b8', '2024-08-18 04:00:06', '2024-08-18 01:00:06'),
(13, 'lorenzorpiovesan@hotmail.com', '2a9fc768ae091e8731e5b5d4d13f04a81fee6b2ba942a84f30f6705ad1410cd510a2aa63b619c0c2015712839c2072b47c0a', '2024-08-18 04:00:12', '2024-08-18 01:00:12'),
(14, 'lorenzorpiovesan@hotmail.com', 'd5800a1075084489c639ebdd57f8f45ea6cac6c1d80049011282f5671cb64ac3005d2b1563f51b3c822fccf02c7808a69e85', '2024-08-18 04:00:42', '2024-08-18 01:00:42'),
(15, 'lorenzorpiovesan@hotmail.com', '7ebafc4e8d0efe91b52fcf9c5ee9bd048e2ee85b96ffd715c058ce57242d0f140bc58791eace1af37a444923ee06bd84f0c5', '2024-08-18 04:01:04', '2024-08-18 01:01:04'),
(16, 'lorenzorpiovesan@hotmail.com', '5013af0fa300d2111f6bd26c9066dff1ffaa7298cabac136853371c3919475d4e6d5ff32e8b90c650a8e5939a171add0c881', '2024-08-18 04:01:09', '2024-08-18 01:01:09');

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
(1, 'a', 'a@hotmail.com', '452', '2504', 'sapato.jfif'),
(3, 'afef', 'fea@hotmail.com', '324fe', '$2y$10$ECBtrBF/jW.5yZbsrKvLcej3F18lyiy8yXMQpUXwngyH1V4Div5qK', 'sapato.jfif'),
(8, 'a', 'yua@hotmail.com', '456', '$2y$10$MOBOkquUeJI0OYoPP4dMSe6cECuE38ESD96GdV3XsConR7xe7u8Cu', NULL),
(9, 'uioui', 'a345@hotmail.com', '435', '$2y$10$R9X4rr64.ZakLzZVmHf/U.O2FOt4oYVAyET0mf2i0GOKCkM9lgGQi', NULL),
(10, 'agora', 'agora@hotmail.com', 'agora', '$2y$10$P9ULJxEwCWrPQyADExcyp.lJWZsLi4oNq6TKC8WOhbYnYmIYx21Vi', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores_disciplinas`
--

CREATE TABLE `professores_disciplinas` (
  `professor_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 9, 4),
(2, 10, 4),
(3, 10, 6),
(4, 10, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('CAE','CAI') NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, 'Turma 14', 4, NULL, NULL),
(3, 'Turma 24', 4, NULL, NULL),
(4, 'Turma 34', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas_disciplinas`
--

CREATE TABLE `turmas_disciplinas` (
  `turma_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `reset_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `email`, `password_hash`, `reset_token`, `reset_expires`) VALUES
(1, 'teste', 'lorenzorpiovesan@hotmail.com', '$2y$10$i8a0.YmYf12YD9WN/gBbveuLXeCgzI9w2kUd2q6/P2eD3h/vFLAfu', '6a89f4ea4ac0f33e4ce43be99285ed2e8fdd53c4bca8e8e186d5976a1c2d21c805b32f19fc5ed8450d109182352cc443b092', '2024-08-08 16:59:20'),
(2, 'teste2', 'a@hotmail.com', '$2y$10$VKB6YXkAgzyY3ckmHgpiAOucJKaumGPb4QbZsKRhvgQRwsA22q83.', 'cc0ae63ba28c3e8c6a32ac409158d77c8f0ef3d291717bc5b3b8f6a44b747e592c08e588fa9f1cb9e49ce555b3f8ca242c8b', '2024-08-18 01:55:39');

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
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `professores_disciplinas`
--
ALTER TABLE `professores_disciplinas`
  ADD PRIMARY KEY (`professor_id`,`disciplina_id`),
  ADD KEY `disciplina_id` (`disciplina_id`);

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
-- Índices de tabela `turmas_disciplinas`
--
ALTER TABLE `turmas_disciplinas`
  ADD PRIMARY KEY (`turma_id`,`disciplina_id`),
  ADD KEY `disciplina_id` (`disciplina_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `professor_disciplinas`
--
ALTER TABLE `professor_disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `professores_disciplinas`
--
ALTER TABLE `professores_disciplinas`
  ADD CONSTRAINT `professores_disciplinas_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`),
  ADD CONSTRAINT `professores_disciplinas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `professor_disciplinas`
--
ALTER TABLE `professor_disciplinas`
  ADD CONSTRAINT `professor_disciplinas_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`),
  ADD CONSTRAINT `professor_disciplinas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Restrições para tabelas `turmas_disciplinas`
--
ALTER TABLE `turmas_disciplinas`
  ADD CONSTRAINT `turmas_disciplinas_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`),
  ADD CONSTRAINT `turmas_disciplinas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;