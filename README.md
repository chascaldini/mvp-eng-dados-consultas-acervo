# Análise de consultas a acervo cultural a partir de dados operacionais
MVP de Engenharia de Dados | PUC-Rio

## Visão geral do projeto
Projeto de Engenharia de Dados com foco na construção de um pipeline analítico a partir de dados operacionais de consultas a acervo cultural, utilizando ambiente Databricks e SQL como base do processamento.

## Dataset
Conjunto de dados públicos referente às consultas realizadas a obras do acervo da Fundação Biblioteca Nacional em 2024, disponibilizado no Portal Brasileiro de Dados Abertos (dados.gov.br), em formato CSV.

## Objetivo
Construir um pipeline de dados reprodutível para análise de padrões de uso, tendências temporais e aspectos operacionais relacionados às consultas ao acervo cultural.

## Metodologia e pipeline
Pipeline implementado no modelo ETL (Extract, Transform, Load), com separação lógica de camadas e materialização em tabela analítica no modelo flat table.

**Fluxo sintético:**
CSV → tabela bruta → transformações em SQL → tabela tratada → análises e métricas → visualizações e documentação

## Arquitetura e fluxo do projeto
Diagrama simplificado da arquitetura e do fluxo de dados, conforme apresentado no notebook.

## Governança e documentação
- Data Dictionary da tabela tratada
- Linhagem de dados (data lineage)
- Considerações de governança, ética e LGPD

## Principais resultados e insights
- Identificação de padrões de uso por tipo de material e unidade de acervo
- Análise de variações temporais e sazonalidade das consultas
- Relação entre condição física das obras e frequência de uso
- Evidências operacionais extraídas a partir de métricas descritivas

## Dashboard
Visualização interativa com os principais indicadores analíticos:
👉 Link para o Tableau Public

## Notebook do projeto

- Notebook executável (.ipynb):  
  https://github.com/chascaldini/mvp-eng-dados-consultas-acervo/blob/main/mvp_eng_dados_consultas_acervo.ipynb

- Notebook HTML renderizado:  
https://chascaldini.github.io/mvp-eng-dados-consultas-acervo/html/MVP-teste-renderizado.html
https://htmlpreview.github.io/?https://raw.githubusercontent.com/chascaldini/mvp-eng-dados-consultas-acervo/main/html/MVP-teste-renderizado.html

[Abrir notebook HTML renderizado](https://htmlpreview.github.io/?https://raw.githubusercontent.com/chascaldini/mvp-eng-dados-consultas-acervo/main/MVP-teste-renderizado.html)

[Notebook HTML detro de html/ renderizado](https://htmlpreview.github.io/?https://raw.githubusercontent.com/chascaldini/mvp-eng-dados-consultas-acervo/main/html/MVP-teste-renderizado.html](https://chascaldini.github.io/mvp-eng-dados-consultas-acervo/html/MVP-teste-renderizado.html)

## Tecnologias utilizadas
Databricks (Free Edition), SQL, Python (Pandas e Matplotlib), Tableau Public, GitHub.

## Como executar
1. Acessar o notebook no Databricks.
2. Realizar upload do arquivo CSV na pasta `data/`.
3. Executar as células do pipeline na ordem apresentada.
4. Consultar as análises, visualizações e resultados finais.

## Autoavaliação
O projeto atende aos requisitos propostos, com pipeline funcional, documentação completa e foco em clareza, organização e reprodutibilidade, dentro das limitações do ambiente utilizado.

## Autora
Charlyne Scaldini  
LinkedIn: link  
Email: contato

