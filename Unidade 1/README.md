# 📊 Análise de Dados Abertos PRF - Datatran 2025 (Prévia)

## 📝 Descrição do Projeto
Este projeto realiza a organização, estruturação e análise preliminar dos dados abertos da Polícia Rodoviária Federal (PRF) referentes aos acidentes de trânsito (Datatran) com previsão para o ano de 2025. O objetivo principal da planilha é fracionar uma base de dados extensa e consolidá-la em um painel gerencial (Dashboard) para facilitar a visualização de indicadores.

## 📂 Estrutura da Planilha
A base de dados original em formato `.csv` era extensa, portanto, o projeto foi estruturado nas seguintes abas:
*   **Dados_Abertos_PRF_Datatran2025-PREVIA.csv:** Aba contendo a base de dados original ou o histórico de importação.
*   **Parte 1 a Parte 10:** O conjunto de dados principal foi dividido em 10 partes. Cada aba contém colunas padronizadas de registro de acidentes, incluindo:
    *   `ID` (Identificador único)
    *   `data_inversa` e `dia_semana` (Data e dia do acidente)
    *   `horario` (Hora da ocorrência)
    *   `UF`, `br`, `km`, `municipio` (Dados de localização geográfica e rodovia)
*   **Dahsboard:** Um painel consolidado (com um pequeno erro de digitação no nome original da aba) criado para resumir e visualizar as informações das 10 partes fracionadas.

## ⚙️ O que foi feito
1.  **Importação de Dados:** O arquivo CSV bruto foi importado para o Google Planilhas.
2.  **Fracionamento/Limpeza:** Devido ao grande volume de dados (típico de bases da PRF) ou para melhorar a performance de processamento, os dados foram divididos em 10 abas distintas (Partes 1 a 10).
3.  **Padronização de Colunas:** Formatação de datas (`data_inversa`), horas e identificação geográfica padronizada nas colunas para posterior consolidação.
4.  **Consolidação:** Criação de uma aba de *Dashboard* para centralizar os principais indicadores e cruzamentos de dados (ex: acidentes por UF, acidentes por dia da semana).

## 🧮 Fórmulas e Recursos Utilizados (Estimados)
Para que uma estrutura de abas divididas alimente um Dashboard único, os seguintes recursos e funções do Google Planilhas/Excel geralmente são aplicados:

*   **Fórmulas de Agregação e Condição:**
    *   `CONT.SE` / `COUNTIF` ou `CONT.SES` / `COUNTIFS`: Para contar o número de acidentes por Estado (UF) ou por dia da semana.
    *   `SOMASES` / `SUMIFS`: Para somar valores com base em múltiplos critérios (se houvesse colunas de vítimas/feridos).
*   **Fórmulas de Busca e Referência:**
    *   `PROCV` / `VLOOKUP` ou `PROCX` / `XLOOKUP`: Para cruzar identificadores ou buscar o nome completo de municípios.
    *   `INDIRETO` / `INDIRECT`: Muito utilizado em planilhas fracionadas (Parte 1, Parte 2...) para que uma fórmula no Dashboard puxe dados de múltiplas abas dinamicamente.
*   **Recursos Nativos:**
    *   **Tabelas Dinâmicas (Pivot Tables):** Essenciais para agrupar as grandes massas de dados das 10 partes sem a necessidade de fórmulas complexas.
    *   **Gráficos:** Gráficos de barras (para comparar UFs), gráficos de linha (para a linha do tempo `data_inversa`) e gráficos de pizza integrados na aba *Dahsboard*.
    *   **Filtros e Classificação:** Utilizados nas abas de dados para organizar a visualização (cabeçalhos com botões de filtro).