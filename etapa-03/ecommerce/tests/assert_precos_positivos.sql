-- =============================================
-- Model: assert_precos_positivos
-- Description: Data quality test assertion.
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_produto,
    preco_atual
FROM {{ ref('silver_produtos') }}
WHERE preco_atual < 0