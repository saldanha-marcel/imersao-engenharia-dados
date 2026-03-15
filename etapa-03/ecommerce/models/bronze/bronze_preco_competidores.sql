-- =============================================
-- Model: bronze_preco_competidores
-- Description: raw data
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_produto,
    nome_concorrente,
    preco_concorrente,
    data_coleta
FROM {{ source('raw', 'preco_competidores') }}