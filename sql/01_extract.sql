-- 01_extract.sql
-- Etapa Extract: ingestão do arquivo CSV original e verificações iniciais da tabela bruta.
-- As consultas abaixo permitem validar a carga, inspecionar o schema e confirmar o volume de registros antes do início das transformações.

-- 4.1.2 Preview dos dados após ingestão do arquivo CSV original
SELECT *
FROM consultas_fbn_bruta
LIMIT 20;

-- 4.1.3 Inspeção do schema da tabela bruta
DESCRIBE TABLE consultas_fbn_bruta;

-- 4.1.4 Contagem total de registros
SELECT
  COUNT(*) AS total_registros
FROM consultas_fbn_bruta;
