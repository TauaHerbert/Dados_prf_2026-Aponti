# 🚗 Projeto: Data Analytics com Dados Abertos da PRF (2025)

## 📝 Descrição do Projeto
Este projeto tem como objetivo realizar uma análise exploratória de dados (Data Analytics) utilizando a base de dados abertos da Polícia Rodoviária Federal (PRF). O foco principal é extrair inteligência, estatísticas e compreender os fatores de risco (como letalidade, localização, condições climáticas e tipos de veículos) associados aos acidentes registrados nas rodovias federais do Brasil agrupados por ocorrência no ano de 2025.

O projeto foi construído utilizando SQL via SQLite e inclui criação de *views*, agrupamentos complexos e indicadores (como o efeito *Lift*).

## ⚙️ O que foi feito
O projeto de dados foi dividido em diversas etapas de exploração, cálculos estatísticos e consolidação para painéis (Dashboards). As etapas principais incluem:

*   **Verificação de Estrutura e Volume:** Consultas para checar os tipos das colunas (`PRAGMA table_info`) e contar o número total de registros processados na base de dados bruta (`acidentes_prf_2025`).
*   **Criação de View Base (Classificação de Fatalidade):** Criação da `vw_acidentes_base` utilizando a cláusula condicional `CASE WHEN` para criar uma *flag* matemática (`acidente_fatal = 1` para acidentes com 1 ou mais mortos, senão `0`). Isso serve de base para o cálculo da letalidade nas demais consultas.
*   **Métricas Globais e Geográficas:** Cálculo do percentual de letalidade global e agrupamentos por Estado (UF) e Rodovia (BR), identificando, por exemplo, as 30 BRs com maior número absoluto de mortos.
*   **Evolução Temporal:** Extração do mês e ano da data do acidente (`strftime`) para analisar a sazonalidade e o comportamento mensal dos acidentes.
*   **Análise Bivariada de Risco:** Cruzamento de variáveis para entender quais fatores aumentam a taxa de letalidade, explorando:
    *   Tipo de Acidente.
    *   Principais Causas do Acidente.
    *   Fase do Dia (Dia/Noite).
    *   Condição Meteorológica.
    *   Tipo de Pista (Simples, Dupla) e sua combinação com a Fase do Dia.
*   **Análise Estatística Avançada (Efeito Lift):** Utilização de blocos `WITH` (CTE) para calcular a taxa de letalidade média global e comparar com a taxa específica de cada categoria de acidente, resultando no indicador *Lift* (quantas vezes um tipo de acidente é mais letal que a média geral).
*   **Consolidação de Dashboards (Views Finais):** Para preparar a base para ferramentas de Business Intelligence (BI), foram criadas *views* consolidadas:
    *   `vw_indicadores_mensais`
    *   `vw_indicadores_uf_br`
    *   `vw_bivariada_tipo_acidente`
*   **Validação Cruzada (Quality Assurance):** Criação de uma consulta utilizando `UNION ALL` para garantir que a soma das métricas fragmentadas e a soma da base global totalizam os mesmos valores.

## 📂 Dados Utilizados e Resultados Gerados
Este script processou os seguintes fluxos de dados:

*   **Dados Brutos (`dados_brutos/`):** A base de origem utilizada pelas consultas deste projeto deve ser importada como uma tabela chamada `acidentes_prf_2025` no banco SQLite, originada a partir dos arquivos "Dados Abertos - Acidentes - Agrupados por ocorrência" do portal oficial da PRF.
*   **Resultados Gerados (`resultados/`):** A execução do script estrutura e disponibiliza as seguintes tabelas e exibições lógicas (Views) no banco de dados, que podem ser extraídas via CSV ou conectadas diretamente ao Power BI / Tableau:
    *   `vw_acidentes_base` (Base enriquecida com flag de letalidade)
    *   `vw_indicadores_mensais` (Dados temporais)
    *   `vw_indicadores_uf_br` (Dados geográficos e ranking de rodovias)
    *   `vw_bivariada_tipo_acidente` (KPIs descritivos e *Lift* estatístico)

## 🛠️ Tecnologias Utilizadas
*   **Linguagem:** SQL.
*   **Banco de Dados / Motor de Análise:** SQLite.
*   **Conceitos Aplicados:** CTEs (`WITH`), Funções de Janela (`OVER()`), Views, Análise Bivariada, Data Cleaning.