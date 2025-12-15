# Análise de consultas a acervo cultural a partir de dados operacionais
MVP de Engenharia de Dados | PUC-Rio

## Visão geral do projeto
Projeto de Engenharia de Dados com foco na construção de um pipeline analítico a partir de dados operacionais de consultas a acervo cultural, utilizando ambiente Databricks e SQL como base do processamento.

## Dataset
Conjunto de dados públicos referente às consultas realizadas a obras do acervo da Fundação Biblioteca Nacional em 2024, disponibilizado no Portal Brasileiro de Dados Abertos (dados.gov.br), em formato CSV.

## Objetivo
Construir um pipeline de dados reprodutível para análise de padrões de uso, tendências temporais e aspectos operacionais relacionados às consultas ao acervo cultural.

## Metodologia e pipeline
Pipeline implementado no modelo ETL (Extract, Transform, Load), com separação lógica de camadas e materialização dos dados em tabela analítica no modelo flat table.

**Fluxo sintético:**  
CSV → tabela bruta → transformações em SQL → tabela tratada → análises e métricas → visualizações e documentação

## Governança e documentação
- Data Dictionary da tabela tratada
- Linhagem de dados (data lineage)
- Considerações de governança, ética e LGPD

## Principais insights
- Predominância de consultas a materiais bibliográficos e documentais, com destaque para livros e documentos fotográficos, indicando concentração de uso em suportes tradicionais do acervo.
- Assimetria na distribuição das consultas entre unidades de acervo, com maior demanda concentrada em Obras Gerais, Iconografia e Manuscritos.
- Padrões temporais bem definidos, com sazonalidade mensal e picos de consulta associados a períodos específicos do ano, possivelmente relacionados ao calendário acadêmico e a demandas institucionais.
- Limitações na análise do estado físico das obras, devido à alta proporção de registros ausentes, embora os dados disponíveis sugiram maior tempo de consulta para itens classificados como deteriorados.

## Dashboard
Visualização interativa com os principais indicadores analíticos:
👉 Link para o Tableau Public

## Notebook do projeto

- ### Notebook executável:
Notebook principal do projeto, contendo a implementação completa do pipeline, análises e documentação técnica:  
👉 [Abrir notebook executável](https://github.com/chascaldini/mvp-eng-dados-consultas-acervo/blob/main/MVP-teste-oficial.ipynb)
[teste notebook sem dashboard](https://github.com/chascaldini/mvp-eng-dados-consultas-acervo/blob/main/mvp_eng_dados_consultas_acervo-teste.ipynb)

- ### Notebook HTML renderizado:  
👉 [Abrir notebook HTML detro de html renderizado](https://chascaldini.github.io/mvp-eng-dados-consultas-acervo/html/MVP-teste-renderizado.html)
[teste notebook leitura crítica](https://github.com/chascaldini/mvp-eng-dados-consultas-acervo/blob/main/html/mvp_eng_dados_consultas_acervo-teste.html)
## Tecnologias utilizadas:
Databricks (Free Edition), SQL, Python (Pandas e Matplotlib), Tableau Public, GitHub.

## Como executar:
1. Acessar o notebook no Databricks.
2. Realizar upload do arquivo CSV na pasta `data/`.
3. Executar as células do pipeline na ordem apresentada.
4. Consultar as análises, visualizações e resultados finais.

## Autoavaliação
O projeto atende aos requisitos propostos, com pipeline funcional, documentação completa e foco em clareza, organização e reprodutibilidade, dentro das limitações do ambiente utilizado.

## Autora
Charlyne Scaldini  
LinkedIn: link  
Email: chascaldini@gmail.com

