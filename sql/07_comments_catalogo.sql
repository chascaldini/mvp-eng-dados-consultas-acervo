-- 07_comments_catalogo.sql
-- Comentários técnicos aplicados à tabela consultas_fbn_tratada.
-- Este arquivo documenta o significado das colunas e métricas derivadas, apoiando governança, entendimento do schema e reprodutibilidade.


-- 6.1.7 Identificação da obra
ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN titulo COMMENT "Título da obra consultada no atendimento ao usuário.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN tipo COMMENT "Categoria geral do item consultado (ex.: obra, periódico).";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN material COMMENT "Natureza física ou suporte do item consultado.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN tombo COMMENT "Identificador institucional do item no acervo.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN volume COMMENT "Indicação de volume da obra, quando aplicável.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN edicao_numero COMMENT "Número de edição, fascículo ou numeração da obra.";

-- Ano de publicação
ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN ano_publicacao_raw COMMENT "Ano conforme registrado na fonte original, incluindo inconsistências e ruídos.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN ano_publicacao COMMENT "Ano obtido após limpeza e conversão do campo original.";

-- Organização institucional e circulação
ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN unidade_acervo COMMENT "Unidade do acervo responsável pelo atendimento.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN estado_fisico COMMENT "Condição física informada do item no momento da consulta.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN tipo_circulacao COMMENT "Modalidade de circulação do item (ex.: local).";

-- Datas e horários da consulta
ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN data_inicio_consulta COMMENT "Data de início da consulta ao item.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN hora_inicio_consulta COMMENT "Horário de início da consulta.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN data_devolucao COMMENT "Data de encerramento da consulta ou devolução do item.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN hora_devolucao COMMENT "Horário de encerramento da consulta.";

-- Variáveis temporais derivadas
ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN ano_consulta COMMENT "Ano extraído a partir da data de início da consulta.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN mes_consulta COMMENT "Mês extraído da data de início da consulta (1–12).";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN dia_semana_num COMMENT "Número do dia da semana da consulta (1=segunda a 7=domingo).";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN dia_semana_texto COMMENT "Nome do dia da semana da consulta.";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN hora_inicio_num COMMENT "Hora do início da consulta em formato numérico (0–23).";

ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN periodo_dia COMMENT "Classificação do horário da consulta em manhã, tarde ou noite.";

-- Métrica operacional
ALTER TABLE consultas_fbn_tratada 
ALTER COLUMN duracao_minutos COMMENT "Duração total da consulta calculada em minutos a partir dos timestamps de início e devolução.";
