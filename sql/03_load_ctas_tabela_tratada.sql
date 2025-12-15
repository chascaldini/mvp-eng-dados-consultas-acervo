-- 4.3.1 CTAS (Create Table As Select) da coluna bruta para a tabela tratada
CREATE OR REPLACE TABLE consultas_fbn_tratada AS
SELECT
  -- Identificação e dados bibliográficos
  Titulo AS titulo,
  TRIM(Tipo) AS tipo,
  TRIM(Material) AS material,
  Tombo AS tombo,

  -- Ano de publicação (original e versão limpa)
  Ano AS ano_publicacao_raw,
  CASE
    WHEN Ano RLIKE '^[0-9]{4}$' THEN CAST(Ano AS INT)
    ELSE NULL
  END AS ano_publicacao,

  Volume AS volume,
  `Edicao/numero` AS edicao_numero,

  -- Unidade e estado físico (ajuste leve com TRIM)
  TRIM(`Unidade de acervo`) AS unidade_acervo,
  TRIM(`Estado fisico`) AS estado_fisico,

  -- Datas e horários da consulta
  `Data de inicio da consulta` AS data_inicio_consulta,
  `Hora de inicio de consulta` AS hora_inicio_consulta,
  `Data de devolucao no balcÆo de atendimento` AS data_devolucao,
  `Hora de devolucao do item` AS hora_devolucao,

  -- Tipo de circulação (com TRIM)
  TRIM(`Tipo de circulacao`) AS tipo_circulacao,

  -- Derivados temporais da consulta
  YEAR(`Data de inicio da consulta`)  AS ano_consulta,
  MONTH(`Data de inicio da consulta`) AS mes_consulta,
  dayofweek(`Data de inicio da consulta`) AS dia_semana_num,          -- 1=domingo ... 7=sábado (padrão Spark)
  date_format(`Data de inicio da consulta`, 'EEEE') AS dia_semana_texto, -- Monday, Tuesday...

  -- Hora numérica e período do dia
  CASE
    WHEN `Hora de inicio de consulta` IS NOT NULL
    THEN HOUR(`Hora de inicio de consulta`)
    ELSE NULL
  END AS hora_inicio_num,

  CASE
    WHEN `Hora de inicio de consulta` IS NULL THEN NULL
    WHEN HOUR(`Hora de inicio de consulta`) BETWEEN 6 AND 11 THEN 'manha'
    WHEN HOUR(`Hora de inicio de consulta`) BETWEEN 12 AND 17 THEN 'tarde'
    ELSE 'noite'
  END AS periodo_dia,

  -- Duração da consulta em minutos (apenas quando coerente)
  CASE
    WHEN `Hora de inicio de consulta` IS NOT NULL
     AND `Hora de devolucao do item` IS NOT NULL
     AND unix_timestamp(`Hora de devolucao do item`)
         >= unix_timestamp(`Hora de inicio de consulta`)
    THEN (unix_timestamp(`Hora de devolucao do item`)
          - unix_timestamp(`Hora de inicio de consulta`)) / 60
    ELSE NULL
  END AS duracao_minutos

FROM consultas_fbn_bruta;

-- 4.3.9 Criação da tabela analítica resumida
CREATE OR REPLACE TABLE consultas_fbn_resumo AS
SELECT
    unidade_acervo,
    tipo,
    material,
    COUNT(*) AS total_consultas,
    AVG(duracao_minutos) AS duracao_media_minutos
FROM consultas_fbn_tratada
GROUP BY unidade_acervo, tipo, material
ORDER BY total_consultas DESC;

