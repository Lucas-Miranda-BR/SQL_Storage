CREATE DATABASE IF NOT EXISTS escola;

USE escola;

CREATE TABLE IF NOT EXISTS cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    cidade VARCHAR(100) NOT NULL
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS professores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS disciplinas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_professor INT,
    id_curso INT
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    nota DECIMAL(4,2) NOT NULL
)ENGINE=innodb;

ALTER TABLE disciplinas ADD CONSTRAINT fk_disciplinas_professores FOREIGN KEY disciplinas(id_professor) REFERENCES professores(id);
ALTER TABLE disciplinas ADD CONSTRAINT fk_disciplinas_cursos FOREIGN KEY disciplinas(id_curso) REFERENCES cursos(id);

ALTER TABLE matriculas ADD CONSTRAINT fk_matriculas_alunos FOREIGN KEY matriculas(id_aluno) REFERENCES alunos(id);
ALTER TABLE matriculas ADD CONSTRAINT fk_matriculas_disciplinas FOREIGN KEY matriculas(id_disciplina) REFERENCES disciplinas(id);

INSERT INTO cursos (nome) VALUES
('Informática'),
('Administração'),
('Engenharia');

INSERT INTO professores (nome, especialidade) VALUES
('João Mendes', 'Programação'),
('Maria Oliveira', 'Gestão'),
('Carlos Souza', 'Banco de Dados');

INSERT INTO alunos (nome, idade, cidade) VALUES
('Ana Silva', 20, 'São Paulo'),
('Bruno Souza', 22, 'Rio de Janeiro'),
('Carlos Lima', 19, 'Belo Horizonte'),
('Daniela Alves', 21, 'São Paulo'),
('Eduardo Pereira', 23, 'Curitiba'),
('Fernanda Costa', 20, 'Porto Alegre'),
('Gabriel Rocha', 22, 'Salvador'),
('Helena Martins', 19, 'São Paulo'),
('Maria Roberta', 11, 'Manaus');

INSERT INTO disciplinas (nome, id_professor, id_curso) VALUES
('Banco de Dados', 3, 1),
('Programação', 1, 1),
('Algoritmos', 1, 1),
('Marketing', 2, 2),
('Gestão Empresarial', 2, 2),
('Cálculo', 3, 3);

INSERT INTO matriculas (id_aluno, id_disciplina, nota) VALUES
(1, 1, 8.5),
(1, 2, 7.0),
(2, 4, 6.5),
(3, 1, 9.0),
(4, 2, 8.0),
(5, 5, 5.5),
(6, 3, 7.8),
(7, 4, 4.9),
(8, 1, 8.8),
(2, 6, 6.9);

SELECT * FROM alunos WHERE idade > 20;

SELECT * FROM disciplinas WHERE id_curso LIKE 1;

SELECT * FROM alunos WHERE idade > 20 AND cidade LIKE "sao paulo";

SELECT * FROM matriculas WHERE nota > 7 AND id_disciplina LIKE 1;

SELECT * FROM alunos WHERE cidade LIKE "rio de janeiro" OR cidade LIKE "sao paulo";

SELECT * FROM disciplinas WHERE id_curso LIKE 1 OR id_curso LIKE 2;

SELECT * FROM alunos WHERE NOT cidade LIKE "sao paulo";

SELECT * FROM matriculas WHERE NOT nota > 7;

SELECT * FROM alunos WHERE nome LIKE "a%";

SELECT * FROM professores WHERE nome LIKE "%maria%";

SELECT * FROM disciplinas WHERE nome LIKE "%cao";

SELECT * FROM alunos WHERE idade BETWEEN 20 AND 22;

SELECT * FROM matriculas WHERE nota BETWEEN 6 AND 9;

SELECT * FROM alunos ORDER BY nome;

SELECT * FROM matriculas ORDER BY nota DESC;