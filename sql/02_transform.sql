-- 4.2.2 Contagem de valores nulos nas colunas principais
SELECT
  COUNT(*) AS total_registros,

  SUM(CASE WHEN Titulo IS NULL OR TRIM(Titulo) = '' THEN 1 END) AS nulos_titulo,
  SUM(CASE WHEN Tipo IS NULL OR TRIM(Tipo) = '' THEN 1 END) AS nulos_tipo,
  SUM(CASE WHEN Material IS NULL OR TRIM(Material) = '' THEN 1 END) AS nulos_material,
  SUM(CASE WHEN Tombo IS NULL OR TRIM(Tombo) = '' THEN 1 END) AS nulos_tombo,
  SUM(CASE WHEN Ano IS NULL OR TRIM(Ano) = '' THEN 1 END) AS nulos_ano,
  SUM(CASE WHEN Volume IS NULL OR TRIM(Volume) = '' THEN 1 END) AS nulos_volume,
  SUM(CASE WHEN `Edicao/numero` IS NULL OR TRIM(`Edicao/numero`) = '' THEN 1 END) AS nulos_edicao_numero,
  SUM(CASE WHEN `Unidade de acervo` IS NULL OR TRIM(`Unidade de acervo`) = '' THEN 1 END) AS nulos_unidade_acervo,
  SUM(CASE WHEN `Estado fisico` IS NULL OR TRIM(`Estado fisico`) = '' THEN 1 END) AS nulos_estado_fisico,
  SUM(CASE WHEN `Data de inicio da consulta` IS NULL THEN 1 END) AS nulos_data_inicio,
  SUM(CASE WHEN `Data de devolucao no balcÆo de atendimento` IS NULL THEN 1 END) AS nulos_data_devolucao,
  SUM(CASE WHEN `Tipo de circulacao` IS NULL OR TRIM(`Tipo de circulacao`) = '' THEN 1 END) AS nulos_tipo_circulacao,
  SUM(CASE WHEN `Hora de inicio de consulta` IS NULL THEN 1 END) AS nulos_hora_inicio,
  SUM(CASE WHEN `Hora de devolucao do item` IS NULL THEN 1 END) AS nulos_hora_devolucao

FROM consultas_fbn_bruta;

-- 4.2.3.1 Distribuição das categorias de 'Tipo'
SELECT
  Tipo,
  COUNT(*) AS total_consultas
FROM consultas_fbn_bruta
GROUP BY Tipo
ORDER BY total_consultas DESC;

-- 4.2.3.2 Distribuição das categorias de 'Unidade de acervo'
SELECT
  `Unidade de acervo`,
  COUNT(*) AS total_consultas
FROM consultas_fbn_bruta
GROUP BY `Unidade de acervo`
ORDER BY total_consultas DESC;

-- 4.2.3.3 Distribuição das categorias de 'Estado fisico'
SELECT
  `Estado fisico`,
  COUNT(*) AS total_consultas
FROM consultas_fbn_bruta
GROUP BY `Estado fisico`
ORDER BY total_consultas DESC;

-- 4.2.3.4 Distribuição das categorias de 'Tipo de circulacao'
SELECT
  `Tipo de circulacao`,
  COUNT(*) AS total_consultas
FROM consultas_fbn_bruta
GROUP BY `Tipo de circulacao`
ORDER BY total_consultas DESC;

-- 4.2.3.5 Distribuição das categorias de 'Material'
SELECT
  `Material`,
  COUNT(*) AS total_consultas
FROM consultas_fbn_bruta
GROUP BY `Material`
ORDER BY total_consultas DESC;

-- 4.2.3.6 Distribuição das categorias de 'Ano'
SELECT
  `Ano`,
  COUNT(*) AS total_consultas
FROM consultas_fbn_bruta
GROUP BY `Ano`
ORDER BY total_consultas DESC
Limit 20;

-- 4.2.4 "Ensaio" do SELECT que será usado no CTAS com aliases já padronizados
SELECT
  Titulo                               AS titulo,
  Tipo                                 AS tipo,
  Material                             AS material,
  Tombo                                AS tombo,
  Ano                                  AS ano,
  Volume                               AS volume,
  `Edicao/numero`                      AS edicao_numero,
  `Unidade de acervo`                  AS unidade_acervo,
  `Estado fisico`                      AS estado_fisico,
  `Data de inicio da consulta`         AS data_inicio_consulta,
  `Data de devolucao no balcÆo de atendimento` AS data_devolucao,
  `Tipo de circulacao`                 AS tipo_circulacao,
  `Hora de inicio de consulta`         AS hora_inicio_consulta,
  `Hora de devolucao do item`         AS hora_devolucao
FROM consultas_fbn_bruta
LIMIT 10;

-- 4.2.5.1 Diagnóstico de padronização textual: Tipo
SELECT DISTINCT(TRIM(Tipo)) AS tipo_normalizado
FROM consultas_fbn_bruta
ORDER BY tipo_normalizado;

-- 4.2.5.2 Diagnóstico de padronização textual: Unidade de acervo
SELECT DISTINCT(TRIM(`Unidade de acervo`)) AS unidade_acervo_normalizado
FROM consultas_fbn_bruta
ORDER BY unidade_acervo_normalizado;

-- 4.2.5.3 Diagnóstico de padronização textual: Estado físico
SELECT DISTINCT(TRIM(`Estado fisico`)) AS estado_fisico_normalizado
FROM consultas_fbn_bruta
ORDER BY estado_fisico_normalizado;

-- 4.2.5.4 Diagnóstico de padronização textual: Tipo de circulação
SELECT DISTINCT(TRIM(`Tipo de circulacao`)) AS tipo_circulacao_normalizado
FROM consultas_fbn_bruta
ORDER BY tipo_circulacao_normalizado;

-- 4.2.5.5 Diagnóstico de padronização textual: Material
SELECT DISTINCT(TRIM(`Material`)) AS material_normalizado
FROM consultas_fbn_bruta
ORDER BY material_normalizado;

-- 4.2.6 Verificação de coerência temporal
SELECT
  COUNT(*) AS incoerencias
FROM consultas_fbn_bruta
WHERE `Hora de inicio de consulta` IS NOT NULL
  AND `Hora de devolucao do item` IS NOT NULL
  AND `Hora de devolucao do item` < `Hora de inicio de consulta`;

-- 4.2.7 Teste de derivadas temporais
SELECT
  `Data de inicio da consulta`,
  YEAR(`Data de inicio da consulta`) AS ano_consulta,
  MONTH(`Data de inicio da consulta`) AS mes_consulta,
  date_format(`Data de inicio da consulta`, 'E') AS dia_semana
FROM consultas_fbn_bruta
LIMIT 20;

-- 4.2.8 Prévia do cálculo da duração em minutos
SELECT
  `Hora de inicio de consulta`,
  `Hora de devolucao do item`,
  (unix_timestamp(`Hora de devolucao do item`) -
   unix_timestamp(`Hora de inicio de consulta`)) / 60 AS duracao_minutos
FROM consultas_fbn_bruta
WHERE `Hora de inicio de consulta` IS NOT NULL
  AND `Hora de devolucao do item` IS NOT NULL
LIMIT 20;

-- 4.2.9 Sanity check final antes do CTAS
SELECT
  COUNT(*) AS total_registros,
  SUM(CASE WHEN `Data de inicio da consulta` IS NULL THEN 1 END) AS nulos_inicio,
  SUM(CASE WHEN `Data de devolucao no balcÆo de atendimento` IS NULL THEN 1 END) AS nulos_devolucao,
  SUM(CASE WHEN YEAR(`Data de inicio da consulta`) <> 2024 THEN 1 END) AS fora_2024
FROM consultas_fbn_bruta;



