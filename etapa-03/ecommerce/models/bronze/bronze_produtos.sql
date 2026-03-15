-- =============================================
-- Model: bronze_produtos
-- Description: raw data
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_produto,
    nome_produto,
    categoria,
    marca,
    preco_atual,
    data_criacao
FROM {{ source('raw', 'produtos') }}