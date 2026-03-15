-- =============================================
-- Model: precos_competitividade
-- Description: analytics
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

WITH comp_stats AS (
    -- Estatísticas dos concorrentes por produto
    SELECT
        id_produto,
        AVG(preco_concorrente) AS preco_medio_concorrentes,
        MIN(preco_concorrente) AS preco_minimo_concorrentes,
        MAX(preco_concorrente) AS preco_maximo_concorrentes,
        COUNT(DISTINCT nome_concorrente) AS total_concorrentes
    FROM {{ ref('silver_preco_competidores') }}
    GROUP BY 1
),
vendas_stats AS (
    -- Desempenho de vendas por produto
    SELECT
        id_produto,
        SUM(receita_total) AS receita_total,
        SUM(quantidade) AS quantidade_total
    FROM {{ ref('silver_vendas') }}
    GROUP BY 1
)

SELECT
    p.id_produto,
    p.nome_produto,
    p.categoria,
    p.marca,
    p.preco_atual AS nosso_preco,
    c.preco_medio_concorrentes,
    c.preco_minimo_concorrentes,
    c.preco_maximo_concorrentes,
    c.total_concorrentes,
    -- Cálculos de diferença percentual
    ((p.preco_atual - c.preco_medio_concorrentes) / NULLIF(c.preco_medio_concorrentes, 0)) * 100 AS diferenca_percentual_vs_media,
    -- Classificação de preço conforme o README
    CASE 
        WHEN p.preco_atual > c.preco_maximo_concorrentes THEN 'MAIS_CARO_QUE_TODOS'
        WHEN p.preco_atual < c.preco_minimo_concorrentes THEN 'MAIS_BARATO_QUE_TODOS'
        WHEN p.preco_atual > c.preco_medio_concorrentes THEN 'ACIMA_DA_MEDIA'
        ELSE 'ABAIXO_DA_MEDIA'
    END AS classificacao_preco,
    v.receita_total,
    v.quantidade_total
FROM {{ ref('silver_produtos') }} p
LEFT JOIN comp_stats c ON p.id_produto = c.id_produto
LEFT JOIN vendas_stats v ON p.id_produto = v.id_produto