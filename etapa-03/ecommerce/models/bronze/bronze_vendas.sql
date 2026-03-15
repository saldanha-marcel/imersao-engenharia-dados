-- =============================================
-- Model: bronze_vendas
-- Description: raw data
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_venda,
    data_venda,
    id_cliente,
    id_produto,
    canal_venda,
    quantidade,
    preco_unitario
FROM {{ source('raw', 'vendas') }}