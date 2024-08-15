<?php
session_start(); // Inicia a sessão

// Verifica se o usuário está autenticado
if (!isset($_SESSION['username'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header('Location: login.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Sisgna</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Caminho para o CSS -->
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <button id="toggleButton">Cadastrar</button>
            <div id="dropdownMenu" class="dropdown-content">
                <button onclick="showForm('aluno')">Cadastrar Aluno</button>
                <button onclick="showForm('turma')">Cadastrar Turma</button>
                <button onclick="showForm('disciplina')">Cadastrar Disciplina</button>
                <button onclick="showForm('professor')">Cadastrar Professor</button>
                <button onclick="showForm('setor')">Cadastrar Setor</button>
                <button onclick="showForm('curso')">Cadastrar Curso</button>
            </div>
        </div>
        <div class="main-content">
            <h1>Bem-vindo ao Painel de Administração</h1>
            <div id="formContainer">
                <!-- Formulários serão carregados aqui via JavaScript -->
            </div>
        </div>
    </div>

    <script>
        document.getElementById('toggleButton').addEventListener('click', function() {
            const dropdownMenu = document.getElementById('dropdownMenu');
            dropdownMenu.style.display = dropdownMenu.style.display === 'none' || dropdownMenu.style.display === '' ? 'block' : 'none';
        });

        function showForm(formType) {
            const formContainer = document.getElementById('formContainer');
            let formHtml = '';
            let actionUrl = '';

            switch (formType) {
                case 'aluno':
                    actionUrl = 'processa_cadastro_aluno.php';
                    formHtml = `
                        <div class="form-container active">
                            <h2>Cadastrar Aluno</h2>
                            <form method="POST" action="${actionUrl}" enctype="multipart/form-data">
                                <input type="hidden" name="form_type" value="aluno">
                                
                                <label>Nome:</label>
                                <input type="text" name="nome" required><br>
                                
                                <label>Email:</label>
                                <input type="email" name="email" required><br>
                                
                                <label>CPF:</label>
                                <input type="text" name="cpf" required><br>
                                
                                <label>Matrícula:</label>
                                <input type="text" name="matricula" required><br>
                                
                                <label>Turma:</label>
                                <select name="turma_id" id="turmaDropdown" required>
                                    <!-- Turmas serão carregadas aqui -->
                                </select><br>
                                
                                <label>Foto:</label>
                                <input type="file" name="foto" accept="image/*" required><br>
                                
                                <button type="submit">Cadastrar Aluno</button>
                            </form>
                        </div>
                    `;
                    formContainer.innerHTML = formHtml; // Atualiza o formulário no container
                    loadTurmas(); // Carregar turmas
                    break;

                case 'turma':
                    actionUrl = 'processa_cadastro_turma.php';
                    formHtml = `
                        <div class="form-container active">
                            <h2>Cadastrar Turma</h2>
                            <form method="POST" action="${actionUrl}">
                                <input type="hidden" name="form_type" value="turma">
                                
                                <label>Nome:</label>
                                <input type="text" name="nome" required><br>
                                
                                <label>Curso:</label>
                                <select name="curso_id" id="cursoDropdown" required>
                                    <!-- Cursos serão carregados aqui -->
                                </select><br>
                                
                                <button type="submit">Cadastrar Turma</button>
                            </form>
                        </div>
                    `;
                    formContainer.innerHTML = formHtml; // Atualiza o formulário no container
                    loadCursos(); // Carregar cursos
                    break;

                case 'disciplina':
                    actionUrl = 'processa_cadastro_disciplina.php';
                    formHtml = `
                        <div class="form-container active">
                            <h2>Cadastrar Disciplina</h2>
                            <form method="POST" action="${actionUrl}">
                                <input type="hidden" name="form_type" value="disciplina">
                                
                                <label>Nome:</label>
                                <input type="text" name="nome" required><br>
                                
                                <label>Turma:</label>
                                <select name="turma_id" id="turmaDropdownDisciplina" required>
                                    <!-- Turmas serão carregadas aqui -->
                                </select><br>
                                
                                <button type="submit">Cadastrar Disciplina</button>
                            </form>
                        </div>
                    `;
                    formContainer.innerHTML = formHtml; // Atualiza o formulário no container
                    loadTurmasForDisciplina(); // Carregar turmas para disciplinas
                    break;

                case 'professor':
                    actionUrl = 'processa_cadastro_professor.php';
                    formHtml = `
                        <div class="form-container active">
                            <h2>Cadastrar Professor</h2>
                            <form method="POST" action="${actionUrl}" enctype="multipart/form-data">
                                <input type="hidden" name="form_type" value="professor">
                                
                                <label>Nome:</label>
                                <input type="text" name="nome" required><br>
                                
                                <label>E-mail:</label>
                                <input type="email" name="email" required><br>
                                
                                <label>CPF:</label>
                                <input type="text" name="cpf" required><br>
                                
                                <label>Senha:</label>
                                <input type="password" name="senha" required><br>
                                
                                <label>Foto:</label>
                                <input type="file" name="foto"><br>
                                
                                <label>Selecionar turmas e disciplinas:</label><br>
                                <div id="turmasContainer">
                                    <!-- Turmas e disciplinas serão carregadas aqui via JavaScript -->
                                </div><br>
                                
                                <button type="submit">Cadastrar Professor</button>
                            </form>
                        </div>
                    `;
                    formContainer.innerHTML = formHtml; // Atualiza o formulário no container
                    loadTurmasAndDisciplinas(); // Carregar turmas e disciplinas
                    break;

                case 'setor':
                    actionUrl = 'processa_cadastro_setor.php';
                    formHtml = `
                        <div class="form-container active">
                            <h2>Cadastrar Setor</h2>
                            <form method="POST" action="${actionUrl}" enctype="multipart/form-data">
                                <input type="hidden" name="form_type" value="setor">
                                
                                <label>Nome:</label>
                                <input type="text" name="nome" required><br>
                                
                                <label>Tipo do Setor:</label>
                                <select name="tipo_setor" required>
                                    <option value="CAE">CAE</option>
                                    <option value="CAI">CAI</option>
                                    <!-- Adicione mais opções conforme necessário -->
                                </select><br>
                                
                                <label>Senha:</label>
                                <input type="password" name="senha" required><br>
                                
                                <button type="submit">Cadastrar Setor</button>
                            </form>
                        </div>
                    `;
                    formContainer.innerHTML = formHtml; // Atualiza o formulário no container
                    break;

                case 'curso':
                    actionUrl = 'processa_cadastro_curso.php';
                    formHtml = `
                        <div class="form-container active">
                            <h2>Cadastrar Curso</h2>
                            <form method="POST" action="${actionUrl}">
                                <input type="hidden" name="form_type" value="curso">
                                
                                <label>Nome:</label>
                                <input type="text" name="nome" required><br>
                                
                                <label>Descrição:</label>
                                <input type="text" name="descricao" required><br>
                                
                                <button type="submit">Cadastrar Curso</button>
                            </form>
                        </div>
                    `;
                    formContainer.innerHTML = formHtml; // Atualiza o formulário no container
                    break;

                default:
                    formContainer.innerHTML = '<p>Selecione um formulário para exibir.</p>';
            }
        }

        function loadTurmas() {
            fetch('get_turmas.php')
                .then(response => response.json())
                .then(data => {
                    const turmaDropdown = document.getElementById('turmaDropdown');
                    data.forEach(turma => {
                        const option = document.createElement('option');
                        option.value = turma.id;
                        option.textContent = turma.nome;
                        turmaDropdown.appendChild(option);
                    });
                })
                .catch(error => console.error('Erro ao carregar turmas:', error));
        }

        function loadCursos() {
            fetch('get_cursos.php')
                .then(response => response.json())
                .then(data => {
                    const cursoDropdown = document.getElementById('cursoDropdown');
                    data.forEach(curso => {
                        const option = document.createElement('option');
                        option.value = curso.id;
                        option.textContent = curso.nome;
                        cursoDropdown.appendChild(option);
                    });
                })
                .catch(error => console.error('Erro ao carregar cursos:', error));
        }

        function loadTurmasForDisciplina() {
            fetch('get_turmas.php')
                .then(response => response.json())
                .then(data => {
                    const turmaDropdown = document.getElementById('turmaDropdownDisciplina');
                    data.forEach(turma => {
                        const option = document.createElement('option');
                        option.value = turma.id;
                        option.textContent = turma.nome;
                        turmaDropdown.appendChild(option);
                    });
                })
                .catch(error => console.error('Erro ao carregar turmas:', error));
        }

        function loadTurmasAndDisciplinas() {
            fetch('get_turmas.php')
                .then(response => response.json())
                .then(turmas => {
                    const turmasContainer = document.getElementById('turmasContainer');
                    turmas.forEach(turma => {
                        const collapsible = document.createElement('button');
                        collapsible.classList.add('collapsible');
                        collapsible.textContent = turma.nome;
                        collapsible.addEventListener('click', function() {
                            this.classList.toggle('active');
                            const content = this.nextElementSibling;
                            content.style.display = content.style.display === 'block' ? 'none' : 'block';
                        });
                        
                        const content = document.createElement('div');
                        content.classList.add('content');

                        fetch(`get_disciplinas.php?turma_id=${turma.id}`)
                            .then(response => response.json())
                            .then(disciplinas => {
                                disciplinas.forEach(disciplina => {
                                    const label = document.createElement('label');
                                    const checkbox = document.createElement('input');
                                    checkbox.type = 'checkbox';
                                    checkbox.name = 'disciplinas[]';
                                    checkbox.value = disciplina.id;
                                    label.appendChild(checkbox);
                                    label.appendChild(document.createTextNode(disciplina.nome));
                                    content.appendChild(label);
                                });
                            })
                            .catch(error => console.error('Erro ao carregar disciplinas:', error));

                        turmasContainer.appendChild(collapsible);
                        turmasContainer.appendChild(content);
                    });
                })
                .catch(error => console.error('Erro ao carregar turmas:', error));
        }
    </script>
</body>
</html>
