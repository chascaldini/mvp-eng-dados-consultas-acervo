-- 04_data_quality.sql
-- Data Quality: checks de completude, coerência temporal, consistência categórica, integridade de derivados e aderência estrutural na tabela consultas_fbn_tratada.

-- 5.2.1 Completude: contagem de valores nulos em colunas essenciais
SELECT
  'titulo' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN titulo IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'tipo' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN tipo IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'material' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN material IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'tombo' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN tombo IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'unidade_acervo' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN unidade_acervo IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'data_inicio_consulta' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN data_inicio_consulta IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'data_devolucao' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN data_devolucao IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada

UNION ALL
SELECT
  'tipo_circulacao' AS coluna,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN tipo_circulacao IS NULL THEN 1 ELSE 0 END) AS nulos
FROM consultas_fbn_tratada;

-- 5.2.2 Coerência temporal: duração nula ou negativa, ou cálculo ausente
SELECT
  titulo,
  unidade_acervo,
  data_inicio_consulta,
  hora_inicio_consulta,
  data_devolucao,
  hora_devolucao,
  duracao_minutos
FROM consultas_fbn_tratada
WHERE duracao_minutos IS NULL
   OR duracao_minutos <= 0;

-- 5.2.3.1 Consistência categórica: distribuição de "tipo"
SELECT
  tipo,
  COUNT(*) AS qtde,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM consultas_fbn_tratada
GROUP BY tipo
ORDER BY qtde DESC;

-- 5.2.3.2 Consistência categórica: distribuição de "unidade_acervo"
SELECT
  unidade_acervo,
  COUNT(*) AS qtde,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM consultas_fbn_tratada
GROUP BY unidade_acervo
ORDER BY qtde DESC;

-- 5.2.3.3 Consistência categórica: distribuição de "tipo_circulacao"
SELECT
  tipo_circulacao,
  COUNT(*) AS qtde,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM consultas_fbn_tratada
GROUP BY tipo_circulacao
ORDER BY qtde DESC;

-- 5.2.4 Integridade dos campos derivados: verificação de nulos nas colunas derivadas e métricas calculadas
SELECT
  SUM(CASE WHEN ano_publicacao   IS NULL THEN 1 ELSE 0 END) AS nulos_ano_publicacao,
  SUM(CASE WHEN ano_consulta     IS NULL THEN 1 ELSE 0 END) AS nulos_ano_consulta,
  SUM(CASE WHEN mes_consulta     IS NULL THEN 1 ELSE 0 END) AS nulos_mes_consulta,
  SUM(CASE WHEN dia_semana_num   IS NULL THEN 1 ELSE 0 END) AS nulos_dia_semana_num,
  SUM(CASE WHEN dia_semana_texto IS NULL THEN 1 ELSE 0 END) AS nulos_dia_semana_texto,
  SUM(CASE WHEN hora_inicio_num  IS NULL THEN 1 ELSE 0 END) AS nulos_hora_inicio_num,
  SUM(CASE WHEN periodo_dia      IS NULL THEN 1 ELSE 0 END) AS nulos_periodo_dia,
  SUM(CASE WHEN duracao_minutos  IS NULL THEN 1 ELSE 0 END) AS nulos_duracao_minutos
FROM consultas_fbn_tratada;

-- 5.2.5.1 Aderência estrutural: comparação de volume entre tabela bruta e tabela tratada
SELECT
  'consultas_fbn_bruta' AS tabela,
  COUNT(*) AS total_registros
FROM consultas_fbn_bruta

UNION ALL
SELECT
  'consultas_fbn_tratada' AS tabela,
  COUNT(*) AS total_registros
FROM consultas_fbn_tratada;
