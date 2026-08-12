# 📊 Análise de Acidentes PRF - Datatran 2025

**Arquivo do Projeto:** `Atividade - Dados_Abertos_PRF_Datatran2025-PREVIA - Tauã Herbert.xlsx`

## 📝 Descrição do Projeto
Este projeto tem como objetivo realizar a organização, análise e extração de indicadores sobre os acidentes de trânsito em rodovias federais. Utilizando a base de dados abertos da PRF (Datatran), o arquivo consolida mais de 72.000 registros e fraciona a análise em diferentes etapas (abas) lógicas, culminando em indicadores estatísticos e um painel de consulta.

## ⚙️ O que foi feito (Estrutura da Planilha)
A base de dados original foi mantida na primeira aba e as análises foram divididas em seções (Partes 1 a 10) para facilitar o cálculo dos KPIs:

*   **Base de Dados Bruta:** Aba com todos os registros de acidentes, servindo como fonte de dados para as demais planilhas.
*   **Parte 1 (Métricas de Fatalidade):** Foco na contagem de pessoas envolvidas, ilesos, ignorados e mortos. Foi criada uma coluna classificatória de "Status de Fatalidade" (ex: "Sem Vítimas Fatais", "Crítico").
*   **Parte 2 (Métricas de Risco):** Cálculo da "Taxa de Feridos Graves" e criação de uma "Pontuação de Risco" atribuída com base na quantidade de veículos envolvidos nos acidentes.
*   **Parte 3 (Estatísticas Descritivas):** Análise exploratória dos dados contendo a média de veículos por acidente, além da mediana e do quartil do número de pessoas envolvidas.
*   **Parte 4 (Mecanismo de Busca):** Um sistema de consulta rápida onde é possível digitar o ID do acidente e retornar automaticamente os dados locais (como o Município do ocorrido).
*   **Partes 5 a 10 (Agrupamentos e Contagens):** Abas dedicadas ao levantamento volumétrico. Realizam a contagem total de acidentes geral e a volumetria fracionada por unidade da federação (ex: total de acidentes em SP, PE, etc.).
*   **Dahsboard:** Aba final projetada para a consolidação visual dos indicadores gerados nas etapas anteriores.

## 🧮 Fórmulas Excel Utilizadas
Durante as diferentes etapas do projeto, as seguintes funções foram aplicadas para extrair inteligência dos dados:

*   **Lógicas e Condicionais:** 
    *   `SE` (IF): Para gerar o texto do "Status de Fatalidade" com base na quantidade de vítimas.
*   **Busca e Referência:** 
    *   `PROCV` (VLOOKUP): Para buscar informações cruzadas a partir de um ID específico na Parte 4.
*   **Estatísticas e Contagem:** 
    *   `CONT.SE` e `CONT.SES` (COUNTIF/COUNTIFS): Para contar o número de acidentes específicos por Estado (UF).
    *   `CONT.VALORES` (COUNTA): Para totalização geral de registros válidos.
    *   `MÉDIA` (AVERAGE), `MED` (MEDIAN) e `QUARTIL.INC` (QUARTILE.INC): Para as análises de estatística descritiva na Parte 3.
*   **Matemáticas:** 
    *   `SOMA` (SUM), e operações aritméticas de multiplicação, divisão e subtração (como o cálculo de totais de pessoas ilesas/mortas e taxa de risco).

## 🛠️ Recursos Utilizados
*   **Desmembramento de Base de Dados:** Arquitetura de análise segmentada por abas ("Partes") para não sobrecarregar processamentos em uma única planilha, mantendo a organização por objetivo de negócio.
*   **Criação de KPIs Personalizados:** Geração de novas colunas e indicadores (Status de Fatalidade e Pontuação de Risco) que não existiam na base original da PRF, agregando valor gerencial à planilha.