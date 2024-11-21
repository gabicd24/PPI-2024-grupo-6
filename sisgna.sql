-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS `sisgna` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sisgna`;

-- Criação da tabela `usuarios`
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `tipo` enum('admin','professor','setor') NOT NULL DEFAULT 'professor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `professores` (Agora referenciando usuarios)
CREATE TABLE `professores` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `cpf` VARCHAR(14) NOT NULL,
    `senha` VARCHAR(255) NOT NULL,
    `foto` VARCHAR(255) DEFAULT NULL,
    `usuario_id` INT NOT NULL,
    FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `setores`
CREATE TABLE `setores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('SETOR 1','SETOR 2', 'SETOR 3') NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `cursos`
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `turmas`
CREATE TABLE `turmas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `lider` varchar(100) DEFAULT NULL,
  `regente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `disciplinas`
CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_id` (`turma_id`),
  CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `professor_disciplinas`
CREATE TABLE `professor_disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_id` (`professor_id`),
  KEY `disciplina_id` (`disciplina_id`),
  CONSTRAINT `professor_disciplinas_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`usuario_id`) ON DELETE CASCADE,
  CONSTRAINT `professor_disciplinas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `alunos`
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `turma_id` (`turma_id`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `notas`
CREATE TABLE `notas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `aluno_id` INT NOT NULL,
    `disciplina` VARCHAR(100) NOT NULL,
    `nota_parcial_1` DECIMAL(5,2) NOT NULL,
    `semestre_1` DECIMAL(5,2) NOT NULL,
    `nota_parcial_2` DECIMAL(5,2) NOT NULL,
    `semestre_2` DECIMAL(5,2) NOT NULL,
    `numero_faltas` INT NOT NULL,
    `obs_parcial_1` TEXT,
    `obs_1_semestre` TEXT,
    `obs_parcial_2` TEXT,
    `obs_2_semestre` TEXT,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `password_resets`
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criação da tabela `notificacoes`
CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `tipo_destinatario` enum('admin','setor','professor') NOT NULL,
  `setor_id` int(11) DEFAULT NULL,
  `status` enum('não lida','lida') DEFAULT 'não lida',
  `data_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserção de dados na tabela `usuarios`
INSERT INTO `usuarios` (`id`, `username`, `email`, `password_hash`, `reset_token`, `reset_expires`, `tipo`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$ZK0WbI80ePzA9bC4aSZJdOZwjsB5E3bJpbzllwOTMmxfp6OOH5EoS', NULL, NULL, 'admin'),
(2, 'setor', 'setor@setor.com', '$2y$10$UjJo5krr9P8RH5bM0MSDGO41wR.G7Y.xHMohPZgl.s5ri7pTTHFl6', NULL, NULL, 'setor'),
(3, 'professor', 'professor@professor.com', '$2y$10$VJ5Oa9OeWUNeql1loXMOtO88H7jU.VeyU3e9yVsK0EF.X9qRI56Ui', NULL, NULL, 'professor');

-- Inserção de dados na tabela `professores` (usando o id dos usuarios)
INSERT INTO `professores` (`id`, `nome`, `email`, `cpf`, `senha`, `foto`, `usuario_id`) VALUES
(3, 'Professor', 'professor@hotmail.com', '435436', '$2y$10$p0bJFWW.k8WoydgkDpu/1uBiNErnSCHyH3Zy4Xazk6BtRmlSbwCCm', 'ataca.jpg', 3);

-- Inserção de dados na tabela `setores` (usando o id dos usuarios)
INSERT INTO `setores` (`id`, `email`, `senha`, `tipo`, `foto`, `nome`) VALUES
(2, 'setor@hotmail.com', '$2y$10$4vVdEQjADm5HIbj9toH3sOiN4i7oK2mfUrDY5rr7Iho/mhpBKdNYi', '', 'foto/ataca.jpg', 'Setor');

-- Inserção de dados nas demais tabelas

-- Inserção de dados na tabela `cursos`
INSERT INTO `cursos` (`id`, `nome`, `descricao`) VALUES
(4, 'Informática', 'George'),
(5, 'Alimento', '.'),
(6, 'Admin', '');

-- Inserção de dados na tabela `turmas`
INSERT INTO `turmas` (`id`, `nome`, `curso_id`, `lider`, `regente`) VALUES
(1, 'Turma A', 4, 'Líder A', 'Regente A'),
(2, 'Turma B', 4, 'Líder B', 'Regente B'),
(3, 'Turma C', 6, 'Líder C', 'Regente C');

-- Inserção de dados na tabela `disciplinas`
INSERT INTO `disciplinas` (`id`, `nome`, `turma_id`) VALUES
(4, 'Matemática', 2),
(5, 'Português', 3),
(6, 'Geografia', 2),
(7, 'rtretretret', 2);

-- Inserção de dados na tabela `alunos`
INSERT INTO `alunos` (`id`, `nome`, `email`, `cpf`, `matricula`, `turma_id`, `foto`) VALUES
(1, 'teste', 'a@hotmail.com', '452', '4545', 2, '');

-- Inserção de dados na tabela `professor_disciplinas`
INSERT INTO `professor_disciplinas` (`id`, `professor_id`, `disciplina_id`) VALUES
(5, 3, 6);
