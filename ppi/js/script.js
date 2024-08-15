// scripts.js
document.getElementById('toggleButton').addEventListener('click', function() {
    var dropdown = document.getElementById('dropdownMenu');
    if (dropdown.style.display === 'block') {
        dropdown.style.display = 'none';
    } else {
        dropdown.style.display = 'block';
    }
});

function showForm(formType) {
    var formContainer = document.getElementById('formContainer');
    formContainer.innerHTML = '';

    var formHtml = '';

    switch(formType) {
        case 'aluno':
            formHtml = '<h2>Cadastrar Aluno</h2><form>Nome:<br><input type="text" name="nome"><br><br>Curso:<br><input type="text" name="curso"><br><br><button type="submit">Salvar</button></form>';
            break;
        case 'turma':
            formHtml = '<h2>Cadastrar Turma</h2><form>Nome da Turma:<br><input type="text" name="nome_turma"><br><br><button type="submit">Salvar</button></form>';
            break;
        case 'disciplina':
            formHtml = '<h2>Cadastrar Disciplina</h2><form>Nome da Disciplina:<br><input type="text" name="nome_disciplina"><br><br><button type="submit">Salvar</button></form>';
            break;
        case 'professor':
            formHtml = '<h2>Cadastrar Professor</h2><form>Nome:<br><input type="text" name="nome_professor"><br><br>Departamento:<br><input type="text" name="departamento"><br><br><button type="submit">Salvar</button></form>';
            break;
        case 'setor':
            formHtml = '<h2>Cadastrar Setor</h2><form>Nome do Setor:<br><input type="text" name="nome_setor"><br><br><button type="submit">Salvar</button></form>';
            break;
        case 'curso':
            formHtml = '<h2>Cadastrar Curso</h2><form>Nome do Curso:<br><input type="text" name="nome_curso"><br><br><button type="submit">Salvar</button></form>';
            break;
    }

    formContainer.innerHTML = formHtml;
}