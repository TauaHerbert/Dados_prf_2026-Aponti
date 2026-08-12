# 🌾 Sistema de Inteligência - Agricultura Familiar (ODS 8)

## 📝 Descrição do Projeto
Este projeto é um "Motor de Inteligência Econômica" desenvolvido para enfrentar os desafios da agricultura familiar. Ele visa solucionar a "cegueira de dados" dos municípios, ajudando as prefeituras a cumprirem a lei do PNAE/PAA, que exige a compra de no mínimo 30% da merenda escolar de produtores locais. 

Diferente de softwares de mercado focados apenas na cadeia de suprimentos, este sistema foca na **Saúde Financeira** e no Desenvolvimento Socioeconômico (alinhado ao ODS 8 - Trabalho Decente e Crescimento Econômico).

## ⚙️ O que foi feito
O sistema atua em três frentes principais de diagnóstico e inclusão:
* **Mapeamento (Regularização Ativa):** Identifica produtores ativos e seu status de formalização (CAF/CNPJ).
* **Diagnóstico (Inteligência de Renda):** Cruza dados financeiros para identificar assimetrias de faturamento entre diferentes culturas agrícolas (ex: Hortaliças vs. Fruticultura).
* **Inclusão (Motor de Crédito):** Um algoritmo automatizado que qualifica pequenos produtores de baixa renda para linhas de crédito subsidiadas.

## 💻 Sobre o Código em Python
O código foi estruturado para simular o motor de elegibilidade usando dados fictícios. A arquitetura técnica foi dividida nas seguintes etapas:
* **Base de Dados:** Utiliza uma lista de dicionários contendo informações das microempresas, como nome, responsável, categoria de cultivo, status de formalização e faturamento anual.
* **Mapeamento de Produção:** Utiliza a estrutura de dados nativa do Python `set()` para remover duplicatas e listar instantaneamente o catálogo de culturas ativas na região.
* **Termômetro Financeiro:** Utiliza a biblioteca `pandas` para agrupar os dados (`groupby`) e calcular a média de faturamento por categoria e a média geral da região.
* **Motor de Elegibilidade:** Aplica regras de negócio através de filtros do Pandas para aprovar automaticamente os agricultores que atendem a dois critérios: ser formalizado (`True`) e possuir faturamento abaixo da média regional.
* **Exportação:** Os dados dos agricultores aprovados são exportados automaticamente para um arquivo `.json` (`aprovados_credito.json`), garantindo fácil integração com outros sistemas.

## 🛠️ Recursos e Tecnologias Utilizadas
* **Linguagem:** Python 3.
* **Bibliotecas:** `pandas` (para manipulação de DataFrames, agrupamentos e cálculos estatísticos).
* **Estruturas de Dados:** Listas, Dicionários e Conjuntos (`set`).
* **Formatos de Arquivo:** JSON (para persistência e exportação dos relatórios gerados).