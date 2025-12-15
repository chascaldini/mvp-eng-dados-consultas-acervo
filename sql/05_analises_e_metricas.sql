-- 05_analises_e_metricas.sql
-- Análises exploratórias e métricas finais a partir da tabela consultas_fbn_tratada.
-- Este arquivo reúne as consultas SQL que fundamentam os resultados analíticos, rankings, distribuições e séries temporais apresentadas na etapa 5.4 e no dashboard.

-- 5.4.1.1 Contagem por tipo de material
SELECT 
    material,
    COUNT(*) AS qtde_consultas
FROM consultas_fbn_tratada
GROUP BY material
ORDER BY qtde_consultas DESC;

-- 5.4.1.2 Duração média por tipo de material
SELECT
    material,
    COUNT(*) AS qtde_consultas,
    ROUND(AVG(duracao_minutos), 2) AS duracao_media_minutos
FROM consultas_fbn_tratada
GROUP BY material
ORDER BY duracao_media_minutos DESC;

-- 5.4.2.1 Volume de consultas por mês
SELECT 
    mes_consulta,
    COUNT(*) AS qtde_consultas
FROM consultas_fbn_tratada
GROUP BY mes_consulta
ORDER BY mes_consulta;

-- 5.4.2.2 Volume por dia da semana
SELECT 
    dia_semana_texto,
    COUNT(*) AS qtde_consultas
FROM consultas_fbn_tratada
GROUP BY dia_semana_texto
ORDER BY qtde_consultas DESC;

-- 5.4.3 Quais as unidades de acervo mais buscadas
SELECT
  unidade_acervo,
  COUNT(*) AS total_consultas
FROM consultas_fbn_tratada
GROUP BY unidade_acervo
ORDER BY total_consultas DESC;

-- 5.4.4.1 Volume de consultas por estado físico
SELECT 
    estado_fisico,
    COUNT(*) AS qtde_consultas
FROM consultas_fbn_tratada
GROUP BY estado_fisico
ORDER BY qtde_consultas DESC;

-- 5.4.4.2 Duração média por estado_fisico
SELECT
    estado_fisico,
    COUNT(*) AS qtde_consultas,
    ROUND(AVG(duracao_minutos), 2) AS duracao_media_minutos
FROM consultas_fbn_tratada
GROUP BY estado_fisico
ORDER BY duracao_media_minutos DESC;

-- 5.4.5.1 Duração média por unidade de acervo
SELECT 
    unidade_acervo,
    ROUND(AVG(duracao_minutos), 1) AS duracao_media
FROM consultas_fbn_tratada
GROUP BY unidade_acervo
ORDER BY duracao_media DESC;

-- 5.4.5.2 Ranking das obras com maior duracao_minutos média ou total 
SELECT 
    titulo,
    duracao_minutos,
    material
FROM consultas_fbn_tratada
ORDER BY duracao_minutos DESC
LIMIT 15;

-- 5.4.6.1 Consultas por dia (view auxiliar)
CREATE OR REPLACE TEMP VIEW consultas_por_dia AS
SELECT
    data_inicio_consulta,
    COUNT(*) AS total_consultas
FROM consultas_fbn_tratada
GROUP BY data_inicio_consulta;

-- 5.4.6.2 Estatísticas globais das consultas diárias
CREATE OR REPLACE TEMP VIEW estatisticas_consultas AS
SELECT
    AVG(total_consultas)        AS media_consultas,
    STDDEV_POP(total_consultas) AS desvio_consultas
FROM consultas_por_dia;

-- 5.4.6.3 Identificação de possíveis picos atípicos (z-score ≥ 3)
SELECT
    c.data_inicio_consulta,
    c.total_consultas,
    ROUND(
        (c.total_consultas - e.media_consultas) / e.desvio_consultas,
        2
    ) AS z_score
FROM consultas_por_dia c
CROSS JOIN estatisticas_consultas e
WHERE e.desvio_consultas IS NOT NULL
  AND (c.total_consultas - e.media_consultas) / e.desvio_consultas >= 3
ORDER BY z_score DESC;

-- 5.4.7 Ranking das obras mais consultadas
SELECT
  titulo,
  material,
  COUNT(*) AS total_consultas
FROM consultas_fbn_tratada
GROUP BY titulo, material
ORDER BY total_consultas DESC
LIMIT 20;







