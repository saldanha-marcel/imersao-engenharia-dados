-- =============================================
-- Model: silver_clientes
-- Description: Silver layer model for data cleansing and transformation.
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_cliente,
    nome_cliente,
    estado,
    pais,
    DATE(data_cadastro::timestamp) AS data_cadastro_date
FROM {{ ref('bronze_clientes') }}