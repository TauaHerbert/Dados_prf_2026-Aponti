-- Modulo 2 - SQL com SQLiter
-- Projeto: Analista de Banco de Dados da Escola Tec
-- Base: alunos, disciplinas
-- Problema: A secretaria informa que o sistema antigo foi substituído por um banco SQLite e várias solicitações chegaram para você resolver.
-- Alvo: Consultas (alunos, disciplina)
-- Instrução: Ajustar as informações recebidas em csv antes de executar.

-- Quantidade de alunos importados
SELECT count (*) as total_alunos from alunos;

-- Consultas para verificação dos dados
SELECT * FROM alunos;
SELECT nome FROM alunos;
SELECT nome,turma,nota from alunos;
SELECT * from disciplinas;
SELECT disciplina, professor from disciplinas;
SELECT disciplina, carga_horaria FROM disciplinas;

-- Consultas de Auditoria dos dados
SELECT * from alunos where nota < 7;
SELECT * from alunos where turma = 'Info A';
SELECT * from alunos where idade > 20;
SELECT * FROM disciplinas where carga_horaria = 80;
SELECT professor, disciplina from disciplinas WHERE disciplina = 'Banco de Dados';

-- Correção de cadastros de alunos
SELECT * FROM alunos WHERE nome = 'Diego Alves'; 
UPDATE alunos SET turma = 'Info B' WHERE nome = 'Diego Alves';

SELECT nome, nota FROM Alunos WHERE nome = 'Felipe Melo'; 
UPDATE alunos SET nota = 7.2 WHERE nome = 'Felipe Melo';

UPDATE alunos SET idade = 20 WHERE nome = 'Ana Souza';
UPDATE alunos SET nota = 9.0 WHERE nome = 'Ana Souza';
SELECT idade, nota FROM alunos WHERE nome = 'Ana Souza';

-- Correção dos cadastros das disciplinas
SELECT * FROM disciplinas WHERE disciplina = 'Programação Web'; 
UPDATE disciplinas SET professor = 'Fernanda Oliveira' WHERE disciplina = 'Programação Web';
SELECT disciplina, professor FROM Disciplinas WHERE disciplina = 'Programação Web'; 

-- Cadastro de novos alunos
INSERT INTO alunos (id,nome, idade, turma, nota) VALUES (41,'Igor Martins', 18, 'Info B', 8.1); 
INSERT INTO alunos (id,nome, idade, turma, nota) VALUES (42,'Joana Ferreira', 19, 'Redes A', 7.8); 
INSERT INTO alunos (id,nome, idade, turma, nota) VALUES (43,'Lucas Pereira', 21, 'Administração A', 6.5); 
INSERT INTO alunos (id,nome, idade, turma, nota) VALUES (44,'Mariana Lopes', 20, 'Info A', 9.4); 
INSERT INTO alunos (id,nome, idade, turma, nota) VALUES (45,'Nicolas Gomes', 22, 'Redes A', 4.8);
INSERT INTO alunos (id,nome, idade, turma, nota) 
VALUES 
(46,'Olívia Ramos', 18, 'Info A', 8.3), 
(47,'Paulo Mendes', 20, 'Redes A', 7.1), 
(48,'Renata Lima', 19, 'Administração A', 9.0); 

-- Conferindo os resgistros 
SELECT * FROM alunos ORDER BY id DESC; 

-- Inserindo uma nova diciplina
INSERT INTO disciplinas (id,disciplina,professor,carga_horaria) VALUES (11,'Segurança da Informação','André Barros',60);

SELECT * FROM disciplinas;

-- Excluindo um aluno especifico (Verificando qual aluno e depois apagando ele)
SELECT * FROM alunos WHERE nome = 'Henrique Silva';
DELETE FROM alunos WHERE nome = 'Henrique Silva';

-- Excluindo alunos com notas baixa
SELECT * FROM alunos WHERE nota < 4;

DELETE FROM alunos WHERE nota < 4;

SELECT * FROM alunos ORDER BY nota ASC;

-- Excluindo uma disdisciplina cancelada
SELECT * FROM disciplinas WHERE disciplina = 'Engenharia de Software';

DELETE FROM disciplinas WHERE disciplina = 'Engenharia de Software';

SELECT * FROM disciplinas;

-- Alterando a estrutura da tabela alunos
ALTER TABLE alunos ADD COLUMN cidade TEXT;
PRAGMA table_info(alunos);

-- Alterando a estrutura da tabela disciplina
ALTER TABLE disciplinas ADD COLUMN laboratorio TEXT;
PRAGMA table_info(disciplinas);

-- Atualizando e inserindo as cidades dos alunos 
UPDATE alunos SET cidade = 'Recife' WHERE nome = 'Ana Souza';
UPDATE alunos SET cidade = 'Olinda' WHERE nome = 'Bruno Lima';
UPDATE alunos SET cidade = 'Jaboatão dos Guararapes' WHERE nome = 'Carla Santos';
UPDATE alunos SET cidade = 'Paulista' WHERE nome = 'Diego Alves';
UPDATE alunos SET cidade = 'Recife' WHERE nome = 'Elisa Rocha';

SELECT nome, cidade FROM alunos WHERE cidade IS NOT NULL;

-- Atualizando e inserindo os laboratorios das disdisciplinas
UPDATE disciplinas SET laboratorio = 'Laboratório 1' WHERE disciplina = 'Banco de Dados';
UPDATE disciplinas SET laboratorio = 'Laboratório 2' WHERE disciplina = 'Programação Web';
UPDATE disciplinas SET laboratorio = 'Laboratório de Redes' WHERE disciplina = 'Redes de Computadores';
UPDATE disciplinas SET laboratorio = 'Laboratório 1' WHERE disciplina = 'Lógica de Programação';

SELECT disciplina, laboratorio FROM disciplinas where laboratorio IS NOT NULL;

-- Verificando quantos alunos existem
SELECT COUNT(*) AS total_alunos FROM alunos;

-- Calculando as medias dos alunos
SELECT AVG(nota) AS media_geral FROM alunos;

-- Arredondando os valores para duas casas decimais
SELECT ROUND(AVG(nota), 2) AS media_geral FROM alunos;

-- Encontrando a maior nota entre os alunos
SELECT MAX(nota) AS maior_nota FROM alunos;
-- Selecionando o aluno com maior nota
SELECT nome, nota FROM alunos WHERE nota = ( SELECT MAX(nota) FROM alunos);

-- Encontrando a menor nota entre os alunos
SELECT MIN(nota) AS menor_nota FROM alunos;
-- Selecionando o aluno com menor nota
SELECT nome, nota FROM alunos WHERE nota = ( SELECT MIN(nota) FROM alunos );

-- Ordenando os alunows em ordem alfabética
SELECT * FROM alunos ORDER BY nome ASC;
-- Ordenando os alunos do maior para a menor nota
SELECT nome, turma, nota FROM alunos ORDER BY nota DESC;
-- Ordenando os alunos da menor para a maior nota
SELECT nome, turma, nota FROM alunos ORDER BY nota ASC;
-- Ordenando os alunos por turma e depois por nome
SELECT nome, turma, nota FROM alunos ORDER BY turma ASC, nome ASC;
-- Contando alunos por turma
SELECT turma, COUNT(*) AS quantidade_alunos FROM alunos GROUP BY turma;
-- Listando os alunos da turma com mais alunos para a turma com menos alunos
SELECT turma, COUNT(*) AS quantidade_alunos FROM alunos GROUP BY turma ORDER BY quantidade_alunos DESC;

-- Calculando a média por turma
SELECT turma, ROUND(AVG(nota), 2) AS media_turma FROM alunos GROUP BY turma ORDER BY media_turma DESC;

-- Classificando os alunos com CASE WHEN
-- 1 notas iguais ou maiores que 7: Aprovado;
-- 2 notas entre 5 e 6,9: Recuperação;
-- 3 notas menores que 5: Reprovado.
SELECT nome, turma, nota, CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END AS situacao FROM alunos;

-- Ordenando o relatório de situação dos alunos
SELECT nome, turma, nota, CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END AS situacao FROM alunos ORDER BY nota DESC;

-- Contando os alunos por suas situações escolares
SELECT CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END AS situacao, COUNT(*) AS quantidade FROM alunos GROUP BY CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END;

-- Criando um relatório completo dos alunos
SELECT id, nome, idade, turma, nota, cidade, CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END AS situacao FROM alunos ORDER BY turma, nome;

-- Criando o relatório dos aprovados
SELECT id, nome, idade, turma, nota, cidade FROM alunos WHERE nota >= 7 ORDER BY nota DESC;
-- Criando o relatório de recuperação
SELECT id, nome, turma, nota FROM alunos WHERE nota >= 5 AND nota < 7 ORDER BY nota DESC;
-- Criando o relatório dos reprovados
SELECT id, nome, turma, nota FROM alunos WHERE nota < 5 ORDER BY nota ASC;
-- Criando o relatório das disciplinas
SELECT id, disciplina, professor, carga_horaria, laboratorio FROM disciplinas ORDER BY disciplina ASC;
-- Exportando o relatório completo dos alunos para CSV
-- Executando a consulta:
SELECT id, nome, idade, turma, nota, cidade, CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END AS situacao FROM alunos ORDER BY turma, nome;
-- Gerar arquivo: relatorio_alunos.csv

-- Exportando os alunos aprovados
-- Executando a consulta: 
SELECT id, nome, idade, turma, nota, cidade FROM alunos WHERE nota >= 7 ORDER BY nota DESC;
-- Gerar arquivo: aprovados.csv

-- Exportando as disciplinas
-- Executando a consulta:
SELECT id, disciplina, professor, carga_horaria, laboratorio FROM disciplinas ORDER BY disciplina;
-- Gerar arquivo: disciplinas_atualizadas.csv


-- Exportando pelo terminal SQLite
-- Para exportar o relatório dos alunos:
-- .headers on
-- .mode csv
-- .output relatorio_alunos.csv
-- SELECT id, nome, idade, turma, nota, cidade, CASE WHEN nota >= 7 THEN 'Aprovado' WHEN nota >= 5 THEN 'Recuperação' ELSE 'Reprovado' END AS situacao FROM alunos ORDER BY turma, nome;
-- .output stdout

-- Para exportar os aprovados:
-- .headers on
-- .mode csv
-- .output aprovados.csv
-- SELECT id, nome, idade, turma, nota, cidade FROM alunos WHERE nota >= 7 ORDER BY nota DESC;
-- .output stdout

-- Criando uma tabela temporária de importação
CREATE TABLE Alunos_Importacao (
	id INTEGER,
	nome TEXT,
	idade INTEGER,
	turma TEXT,
	nota REAL
);

SELECT * FROM Alunos_Importacao;

-- Copiando os dados válidos para a tabela principal
INSERT INTO alunos (id, nome, idade, turma, nota) SELECT id, nome, idade, turma, nota FROM Alunos_Importacao WHERE nome IS NOT NULL AND nota BETWEEN 0 AND 10;

-- Removendo a tabela temporária
-- Após os dados conferidos e transferidos, execute:
DROP TABLE Alunos_Importacao;
-- Verificando as tabelas
SELECT name FROM sqlite_master WHERE type = 'table';

-- Removendo a tabela Disciplinas
-- Conferindo os dados:
SELECT * FROM disciplinas;
-- Excluindo a tabela
DROP TABLE disciplinas;
-- Consultando e verificando
SELECT * FROM disciplinas;

-- Apagando um aluno
DELETE FROM Alunos WHERE nome = 'Ana Souza';
-- Removendo a tabela Aluno
DROP TABLE Alunos;