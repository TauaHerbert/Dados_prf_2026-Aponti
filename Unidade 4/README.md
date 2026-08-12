# 📂 Repositório de Projetos em Python (Análise de Dados)

Este diretório contém projetos práticos desenvolvidos em Python, focados em inteligência de dados, processamento estruturado e regras de negócio. Cada projeto está isolado em sua respectiva pasta. 

Abaixo você encontra um resumo do que cada diretório contém. Para informações mais aprofundadas, metodologias e guias de execução, acesse o arquivo `README.md` dentro de cada pasta.

---

### 🌾 1. AgricoFami
**Diretório:** `/AgricoFami`

* **Sobre o Projeto:** Um Motor de Inteligência Econômica voltado para a Agricultura Familiar, alinhado ao ODS 8 (Trabalho Decente e Crescimento Econômico). O sistema atua cruzando dados produtivos e financeiros para identificar assimetrias de faturamento e aplicar regras automatizadas que qualificam pequenos produtores para o recebimento de crédito subsidiado.
* **O que você vai encontrar aqui:** Códigos em Python (utilizando `pandas` e estruturas nativas) que processam a base de agricultores, geram relatórios de elegibilidade em `.json` e o material de apresentação do projeto (slides).

---

### 🚗 2. Preparação de Dados - PRF 2025
**Diretório:** `/python_analise_de_dados`

* **Sobre o Projeto:** Um pipeline focado na limpeza e preparação técnica de dados abertos de acidentes de trânsito da Polícia Rodoviária Federal (PRF). O foco central é estruturar a variável-alvo de letalidade (`acidente_fatal`) para viabilizar duas frentes: análise exploratória (via Power BI) e algoritmos preditivos (Árvore de Decisão Explicável).
* **O que você vai encontrar aqui:** Scripts de tratamento e engenharia de variáveis que resultam em bases prontas para uso: uma base analítica completa e uma base modelável isolada metodologicamente para evitar o vazamento de dados (*data leakage*).