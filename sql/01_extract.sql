-- 4.1.2 Preview dos dados após ingestão do arquivo CSv original 
SELECT *
FROM consultas_fbn_bruta
LIMIT 20;

-- 4.1.3 Inspeção do schema da tabela bruta
DESCRIBE TABLE consultas_fbn_bruta;

-- 4.1.4 Contagem total de registros
SELECT COUNT(*) AS total_registros
FROM consultas_fbn_bruta;
