# Análise de consultas a acervo cultural a partir de dados operacionais
MVP de Engenharia de Dados | Pós-Graduação em Data Science & Analytics | PUC-Rio 

## Visão geral do projeto
Projeto de Engenharia de Dados com foco na construção de um pipeline analítico a partir de dados operacionais de consultas a acervo cultural, utilizando ambiente Databricks e SQL como base do processamento.

## Dataset
Conjunto de dados públicos referente às consultas realizadas a obras do acervo da Fundação Biblioteca Nacional em 2024, disponibilizado no Portal Brasileiro de Dados Abertos (dados.gov.br), em formato CSV.

## Objetivo
Construir um pipeline de dados reprodutível para análise de padrões de uso, tendências temporais e aspectos operacionais relacionados às consultas ao acervo cultural.

## Metodologia e pipeline
Pipeline implementado no modelo ETL (Extract, Transform, Load), com separação lógica de camadas e materialização dos dados em tabela analítica no modelo flat table.

**Fluxo sintético:**  
`CSV → tabela bruta → transformações em SQL → tabela tratada → análises e métricas → visualizações e documentação`

## Catálogo de dados

O projeto inclui um catálogo de dados documentado, estruturado no formato de um data dictionary, com descrição das colunas, tipos, significado analítico e origem das variáveis. O catálogo foi elaborado como parte da etapa de governança e está disponível no notebook principal, na seção **6.1 Catálogo de Dados (Data Dictionary)**.

## Governança e documentação

Além do catálogo de dados, o projeto documenta o fluxo ETL, data lineage e considerações de governança, ética e LGPD, garantindo clareza, rastreabilidade e transparência no tratamento dos dados.  

## Principais insights
- Predominância de consultas a materiais bibliográficos e documentais, com destaque para livros e documentos fotográficos, indicando concentração de uso em suportes tradicionais do acervo.
- Assimetria na distribuição das consultas entre unidades de acervo, com maior demanda concentrada em Obras Gerais, Iconografia e Manuscritos.
- Padrões temporais bem definidos, com sazonalidade mensal e picos de consulta associados a períodos específicos do ano, possivelmente relacionados ao calendário acadêmico e a demandas institucionais.
- Limitações na análise do estado físico das obras, devido à alta proporção de registros ausentes, embora os dados disponíveis sugiram maior tempo de consulta para itens classificados como deteriorados.

## Dashboard
Visualização interativa dos principais indicadores analíticos disponível no Tableau Public:  
[Acessar dashboard - Uso do acervo FBN (2024)](https://public.tableau.com/views/MVP_uso_acervo_FBN_2024/UsodoacervoFBN2024?:language=pt-BR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Notebook do projeto
- **Notebook executável (.ipynb)**  
Arquivo principal do MVP, contendo todo o pipeline ETL, análises, métricas e documentação técnica.  
[Acessar notebook no GitHub](https://github.com/chascaldini/mvp-eng-dados-consultas-acervo/blob/main/MVP_analise_consultas_acervo_FBN_2024.ipynb)

- **Notebook renderizado (HTML)**  
Versão estática para leitura completa no navegador, sem necessidade de execução ou acesso ao Databricks.  
[Visualizar notebook renderizado](https://chascaldini.github.io/mvp-eng-dados-consultas-acervo/html/MVP_analise_consultas_acervo_FBN_2024.html)

## Tecnologias utilizadas:
Databricks (Free Edition), SQL, Python (Pandas e Matplotlib), Tableau Public, GitHub.

## Como executar:
1. Acessar o notebook no Databricks.
2. Realizar upload do arquivo CSV na pasta `data/`.
3. Executar as células do pipeline na ordem apresentada.
4. Consultar as análises, visualizações e resultados finais.

## Autoavaliação
O projeto permitiu consolidar, na prática, os principais conceitos da disciplina de Engenharia de Dados, por meio da construção de um pipeline completo em ambiente Databricks. As decisões técnicas adotadas priorizaram clareza, rastreabilidade e organização do fluxo ETL, respeitando o escopo do MVP e as limitações da Free Edition.

A documentação do notebook e do repositório reflete o processo de aprendizado ao longo do desenvolvimento, com foco na compreensão das etapas de ingestão, transformação, análise e visualização dos dados.

## Autora
Charlyne Scaldini  
[LinkedIn](https://www.linkedin.com/in/charlyne-scaldini-92959a2b2)  
chascaldini@gmail.com

