-- =============================================
-- Model: assert_vendas_tem_cliente_valido
-- Description: assertions
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    v.id_venda
FROM {{ ref('silver_vendas') }} v
LEFT JOIN {{ ref('silver_clientes') }} c ON v.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL