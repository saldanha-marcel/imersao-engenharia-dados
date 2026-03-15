-- =============================================
-- Model: clientes_segmentacao
-- Description: analytics
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

WITH silver_vendas AS (
    SELECT * FROM {{ ref('silver_vendas') }}
),
silver_clientes AS (
    SELECT * FROM {{ ref('silver_clientes') }}
),
stats_clientes AS (
    SELECT
        id_cliente,
        SUM(receita_total) AS receita_total,
        COUNT(DISTINCT id_venda) AS total_compras,
        MIN(data_venda_date) AS primeira_compra,
        MAX(data_venda_date) AS ultima_compra
    FROM silver_vendas
    GROUP BY 1
)

SELECT
    c.id_cliente,
    c.nome_cliente,
    c.estado,
    s.receita_total,
    s.total_compras,
    s.primeira_compra,
    s.ultima_compra,
    -- Uso das variáveis do dbt_project.yml
    CASE 
        WHEN s.receita_total >= {{ var('segmentacao_vip_threshold') }} THEN 'VIP'
        WHEN s.receita_total >= {{ var('segmentacao_top_tier_threshold') }} THEN 'TOP_TIER'
        ELSE 'REGULAR'
    END AS segmento_cliente
FROM silver_clientes c
LEFT JOIN stats_clientes s ON c.id_cliente = s.id_cliente