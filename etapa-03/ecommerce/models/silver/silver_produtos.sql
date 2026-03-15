-- =============================================
-- Model: silver_produtos
-- Description: cleansing
-- Author: Marcelo Saldanha
-- Created: 2026-03-14
-- =============================================

SELECT
    id_produto,
    nome_produto,
    categoria,
    marca,
    preco_atual,
    -- Regra de negócio: Faixa de Preço
    CASE 
        WHEN preco_atual > 1000 THEN 'PREMIUM'
        WHEN preco_atual > 500 THEN 'MEDIO'
        ELSE 'BASICO'
    END AS faixa_preco,
    DATE(data_criacao::timestamp) AS data_criacao_date
FROM {{ ref('bronze_produtos') }}