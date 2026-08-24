# 📊 Análise de Acidentes PRF - Dashboard Interativo

**Arquivo do Projeto:** `modulo_02_excel_prf_Taua_Herbert_01.xlsx`

## 📝 Descrição do Projeto

Este projeto tem como objetivo realizar o tratamento, a análise exploratória e a visualização de indicadores estratégicos sobre acidentes de trânsito em rodovias federais. Utilizando dados abertos da Polícia Rodoviária Federal (PRF), o arquivo consolida os registros brutos e estrutura a análise seguindo boas práticas de Business Intelligence, separando a base original, o processamento de métricas e culminando em um painel interativo (Dashboard) para facilitar a interpretação dos cenários.

## ⚙️ O que foi feito (Estrutura da Planilha)

A arquitetura do projeto foi pensada para garantir organização, fluidez na leitura e melhor desempenho de processamento, dividindo o fluxo de dados em 5 abas (sheets) principais:

* **`dados`**: A base de dados principal contendo todos os registros extraídos das ocorrências (data, UF, município, causa, tipo de acidente, contagem de feridos/mortos, etc.). Nesta etapa, também houve enriquecimento de dados, como a criação da coluna personalizada `acidente_fatal` (sinalizando a ocorrência de óbitos).
* **`dicionario_resumido`**: Uma aba de governança contendo o dicionário dos dados (Campos, Tipos e Descrições), que serve como um guia técnico para quem for consumir ou dar manutenção à base.
* **`tabelas_dinamicas`**: O "motor" analítico do projeto. Esta seção processa, consolida e agrupa a base bruta, gerando os recortes e totalizadores que alimentam os componentes visuais de forma otimizada.
* **`dashboard`**: O painel final projetado para a visualização das informações. Apresenta graficamente e de maneira interativa os KPIs gerados no processamento.
* **`observacoes`**: Uma aba dedicada à documentação dos insights e direcionamentos das métricas de negócio, focando no mapeamento das seguintes visões:
  * Total de Acidentes por Estado (UF)
  * Total de Acidentes por Mês (Análise de Sazonalidade)
  * Principais Rodovias com Vítimas Fatais (BR)
  * Principais Causas de Acidentes
  * Proporção de Acidentes Fatais vs Não Fatais

## 🧮 Funcionalidades e Fórmulas Excel Utilizadas

Para consolidar essa estrutura e extrair a inteligência necessária dos dados originais, foram aplicados os seguintes recursos lógicos e estatísticos:

* **Lógicas e Condicionais:**
  * Uso da função **SE (IF)** diretamente na aba `dados` para criar indicadores categorizados, como a flag de identificação de acidentes com vítimas fatais a partir da contagem de mortos.
* **Agrupamento e Processamento (Tabelas Dinâmicas):**
  * Em vez de sobrecarregar a planilha com milhares de funções `CONT.SES` e `SOMASES`, o cálculo de volumetria (por estado, rodovia, causas e status de letalidade) foi otimizado utilizando o processamento em **Tabelas Dinâmicas**, garantindo agilidade e precisão nas contagens e somatórios.
* **Visualização Dinâmica:**
  * Construção de **Gráficos Dinâmicos** no `dashboard`, diretamente conectados à aba de cruzamento de dados, permitindo (através de possíveis Segmentações de Dados) uma filtragem rápida e interativa.

## 🛠️ Recursos Utilizados

* **Arquitetura em Camadas (ETL no Excel):** Separação rigorosa das etapas do projeto: Fonte de Dados (`dados` / `dicionario`), Processamento Analítico (`tabelas_dinamicas`) e Apresentação (`dashboard`). Essa prática evita lentidão sistêmica, mantém o arquivo limpo e segue a arquitetura ideal de relatórios profissionais.
* **Geração de Novos Indicadores de Letalidade:** A criação de campos que não constam originalmente na base crua (como a sinalização simplificada de fatalidade) agrega valor e agiliza a análise da proporção de letalidade.
* **Visão Orientada ao Negócio:** O levantamento documentado na aba `observacoes` mostra que a análise foi desenhada para responder perguntas do "mundo real", como identificar os gargalos logísticos (rodovias mais perigosas) e os motivos mais recorrentes dos acidentes.
