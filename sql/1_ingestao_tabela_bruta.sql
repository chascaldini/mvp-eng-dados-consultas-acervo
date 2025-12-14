-- Criação da tabela bruta a partir do CSV original

CREATE TABLE consultas_fbn_bruta
USING csv
OPTIONS (
  path = '/FileStore/consultas/CCSL_2024_Obras_consultadas_por_pesquisadores.csv',
  header = 'true',
  inferSchema = 'true'
);
