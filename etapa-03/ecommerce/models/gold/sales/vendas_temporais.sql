-- =============================================
-- Model: vendas_temporais
-- Description: analytics
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    v.data_venda_date AS data_venda,
    v.ano_venda,
    v.mes_venda,
    SUM(v.receita_total) AS receita_total,
    COUNT(DISTINCT v.id_venda) AS total_vendas
FROM {{ ref('silver_vendas') }} v
GROUP BY 1, 2, 3
ORDER BY data_venda DESC