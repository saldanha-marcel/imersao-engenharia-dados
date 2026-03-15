# Projeto DBT E-commerce

Este projeto DBT implementa um data warehouse moderno para um e-commerce, utilizando as melhores práticas de engenharia de dados. O projeto está estruturado em camadas de dados (Bronze, Silver, Gold) para ingestão, transformação e análise de dados.

## Estrutura do Projeto

```
etapa-03/ecommerce/
├── README.md                          # Este arquivo
├── dbt_project.yml                    # Configuração do projeto DBT
├── profiles.yml                       # Perfis de conexão com bancos de dados
├── requirements.txt                   # Dependências Python
├── models/                            # Modelos DBT
│   ├── _sources.yml                   # Definição das fontes de dados
│   ├── schema.yml                     # Esquemas, testes e documentação
│   ├── bronze/                        # Camada Bronze (dados brutos)
│   │   ├── bronze_clientes.sql        # Modelo para clientes
│   │   ├── bronze_produtos.sql        # Modelo para produtos
│   │   ├── bronze_vendas.sql          # Modelo para vendas
│   │   └── bronze_preco_competidores.sql # Modelo para preços de concorrentes
│   ├── silver/                        # Camada Silver (dados limpos)
│   │   ├── silver_clientes.sql        # Clientes com transformações
│   │   ├── silver_produtos.sql        # Produtos com validações
│   │   ├── silver_vendas.sql          # Vendas com filtros
│   │   └── silver_preco_competidores.sql # Preços com limpeza
│   └── gold/                          # Camada Gold (dados analíticos)
│       ├── customer_success/
│       │   └── clientes_segmentacao.sql # Segmentação de clientes
│       ├── pricing/
│       │   └── precos_competitividade.sql # Análise de competitividade de preços
│       └── sales/
│           └── vendas_temporais.sql   # Análise temporal de vendas
├── tests/                             # Testes de qualidade de dados
│   ├── assert_precos_positivos.sql    # Testa preços positivos
│   └── assert_vendas_tem_cliente_valido.sql # Testa vendas com clientes válidos
└── target/                            # Artefatos gerados (logs, manifest, etc.)
```

## Camadas de Dados

### Bronze Layer
Modelos que ingerem dados brutos diretamente das fontes CSV:
- **bronze_clientes**: Dados de clientes (ID, nome, estado, país, data_cadastro)
- **bronze_produtos**: Catálogo de produtos (ID, nome, categoria, preço, data_atualizacao)
- **bronze_vendas**: Histórico de vendas (ID_venda, ID_cliente, ID_produto, quantidade, preco_unitario, data_venda)
- **bronze_preco_competidores**: Preços de concorrentes (ID_produto, nome_concorrente, preco_concorrente, data_extracao)

### Silver Layer
Modelos com limpeza e validações:
- **silver_clientes**: Clientes com datas convertidas
- **silver_produtos**: Produtos com preços positivos
- **silver_vendas**: Vendas com quantidades e preços válidos
- **silver_preco_competidores**: Preços de concorrentes filtrados

### Gold Layer
Modelos analíticos e KPIs:
- **clientes_segmentacao**: Segmentação de clientes por gasto (Basic, Regular, Premium)
- **precos_competitividade**: Competitividade de preços vs. concorrentes
- **vendas_temporais**: Receita, vendas e clientes por data

## Pré-requisitos

- Python 3.8+
- DBT Core instalado
- Banco de dados compatível (PostgreSQL recomendado)
- Dados CSV na pasta `data/` do repositório principal

## Instalação e Configuração

1. **Instale as dependências:**
   ```bash
   pip install -r requirements.txt
   dbt deps
   ```

2. **Configure o perfil de conexão:**
   Edite `profiles.yml` com suas credenciais de banco de dados.

3. **Execute o projeto:**
   ```bash
   dbt run          # Executa todos os modelos
   dbt test         # Roda os testes de qualidade
   dbt docs generate # Gera documentação
   dbt docs serve    # Serve a documentação localmente (porta 8080)
   ```

## Fontes de Dados

As fontes são definidas em `models/_sources.yml` e apontam para os arquivos CSV em `../../../data/`:
- `clientes`
- `produtos`
- `vendas`
- `preco_competidores`

## Testes

Testes automatizados garantem a qualidade dos dados:
- Preços devem ser positivos
- Vendas devem ter clientes válidos

Execute com `dbt test`.

## Documentação

Após executar `dbt docs generate`, acesse a documentação em `target/index.html` ou via `dbt docs serve`.

## Recursos Adicionais

- [Documentação DBT](https://docs.getdbt.com/)
- [Comunidade DBT](https://community.getdbt.com/)
- [Blog DBT](https://blog.getdbt.com/)

---

Este projeto demonstra um pipeline completo de dados para e-commerce, desde ingestão até análise avançada.
