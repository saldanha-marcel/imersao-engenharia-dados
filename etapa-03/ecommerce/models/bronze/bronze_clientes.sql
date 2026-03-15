-- =============================================
-- Model: bronze_clientes
-- Description: Bronze layer model for raw data ingestion from source.
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_cliente,
    nome_cliente,
    estado,
    pais,
    data_cadastro
FROM {{ source('raw', 'clientes') }}