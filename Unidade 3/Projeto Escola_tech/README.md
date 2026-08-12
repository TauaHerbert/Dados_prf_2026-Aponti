# 🏫 Projeto: Analista de Banco de Dados da Escola Tec

## 📝 Descrição do Projeto
Este repositório contém um script SQL desenvolvido para o módulo de SQL com SQLite, simulando as atividades de um Analista de Banco de Dados na instituição "Escola Tec". O projeto resolve um problema de transição de sistema, onde o software antigo da secretaria foi substituído por um banco SQLite, gerando diversas solicitações de adequação e análise de dados. As manipulações ocorrem em duas bases principais: `alunos` e `disciplinas`.

## ⚙️ O que foi feito
O script abrange o ciclo completo de manipulação de dados (CRUD) e análise exploratória, dividido nas seguintes etapas funcionais:

*   **Auditoria e Verificação:** Consultas básicas (`SELECT`, `COUNT`) para conferir o volume de alunos importados e analisar fatias específicas, como alunos com notas abaixo de 7 ou de turmas específicas.
*   **Correção de Cadastros:** Comandos de `UPDATE` para retificar dados de alunos (como ajustes de turma, idade e notas) e atualizar os professores responsáveis por determinadas disciplinas.
*   **Inserção e Exclusão:** Uso de `INSERT` para matricular novos alunos e registrar novas disciplinas. Aplicação de `DELETE` para remover alunos específicos, alunos com notas muito baixas (abaixo de 4) e disciplinas canceladas.
*   **Evolução da Estrutura (DDL):** Uso de `ALTER TABLE` para expandir a estrutura do banco, adicionando a coluna `cidade` na tabela de alunos e a coluna `laboratorio` na tabela de disciplinas, seguidas da atualização (`UPDATE`) desses novos campos.
*   **Análise e Estatísticas:** Cálculos avançados utilizando funções de agregação, incluindo média de notas (`AVG`), nota máxima (`MAX`) e nota mínima (`MIN`). Utilização de `GROUP BY` para calcular a média de notas por turma e contar a quantidade de alunos em cada sala.
*   **Regras de Negócio e Classificação:** Implementação da estrutura condicional `CASE WHEN` para gerar o status escolar automaticamente:
    *   Notas maiores ou iguais a 7: **Aprovado**.
    *   Notas entre 5 e 6.9: **Recuperação**.
    *   Notas menores que 5: **Reprovado**.
*   **Exportação e Migração de Dados:** Demonstração do uso de tabelas temporárias (`Alunos_Importacao`) para importar, filtrar e transferir dados válidos para a tabela principal com segurança. O código também detalha os comandos do terminal do SQLite (`.mode csv`, `.output`) necessários para exportar os relatórios gerados para arquivos CSV (ex: `relatorio_alunos.csv`, `aprovados.csv`).
*   **Limpeza do Ambiente:** Uso de comandos `DROP TABLE` ao final do processo para remover as tabelas criadas após as validações.

## 🛠️ Tecnologias Utilizadas
*   **Linguagem:** SQL (Structured Query Language).
*   **Sistema de Gerenciamento:** SQLite.