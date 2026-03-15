Este repositório contém o projeto completo da **Imersão em Engenharia de Dados**, um curso prático que aborda pipelines de dados para um e-commerce, incluindo ingestão, transformação, análise e testes de qualidade usando ferramentas como DBT.

O foco é fornecer uma experiência hands-on em engenharia de dados, cobrindo conceitos como camadas de dados (Bronze, Silver, Gold), ETL/ELT, e automação de processos.

## Sumário

- [Sobre o Projeto](#sobre-o-projeto)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Descrição dos Dados](#descrição-dos-dados)
- [Contribuição](#contribuição)
- [Licença](#licença)

---

## Sobre o Projeto

Este projeto é dividido em etapas práticas de implementação de pipelines de dados:

- **Etapas**: Implementações progressivas de pipelines de dados.
- **Dados**: Conjunto de dados simulados de um e-commerce para análise.

O objetivo é construir um data warehouse moderno usando melhores práticas de engenharia de dados, incluindo versionamento com Git, documentação e testes automatizados.

### Objetivos de Aprendizado

- Processar dados com Python (Pandas, leitura de arquivos, integração com bancos).
- Modelar dados com DBT (transformações incrementais, testes).

---

## Estrutura do Projeto

```
imersao-engenharia-dados/
├── README.md                          # Este arquivo
├── requirements.txt                   # Dependências Python globais
├── data/                              # Dados brutos do projeto
│   ├── clientes.csv                   # Dados de clientes
│   ├── preco_competidores.csv         # Preços de concorrentes
│   ├── produtos.csv                   # Catálogo de produtos
│   ├── vendas.csv                     # Histórico de vendas
│   └── gold_kpi_clientes_top_rows.csv # KPIs agregados (exemplo)
├── etapa-01/                          # Etapa 1: Ingestão inicial
│   └── main.py                        # Script de ingestão
├── etapa-02/                          # Etapa 2: Processamento e limpeza
│   └── main.py                        # Script de processamento
└── etapa-03/                          # Etapa 3: Projeto DBT completo
    └── ecommerce/
        ├── README.md                  # Descrição do projeto DBT
        ├── dbt_project.yml            # Configuração DBT
        ├── profiles.yml               # Conexões
        ├── requirements.txt           # Dependências
        ├── models/                    # Modelos DBT
        │   ├── _sources.yml           # Fontes de dados
        │   ├── schema.yml             # Esquemas e testes
        │   ├── bronze/                # 4 modelos Bronze
        │   ├── silver/                # 4 modelos Silver
        │   └── gold/                  # 3 modelos Gold (pricing, customer_success, sales)
        ├── tests/                     # Testes de qualidade
        │   ├── assert_precos_positivos.sql
        │   └── assert_vendas_tem_cliente_valido.sql
        └── target/                    # Artefatos gerados pelo DBT
```

---

## Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Python 3.8+**: [Download](https://www.python.org/downloads/)
- **Git**: [Download](https://git-scm.com/downloads)
- **PostgreSQL** ou outro banco compatível (para DBT)
- **DBT Core**: Instalado via pip

### Dependências Python

As dependências estão listadas em `requirements.txt` e nos arquivos específicos de cada etapa.

---

## Instalação

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/saldanha-marcel/imersao-engenharia-dados.git
   cd imersao-engenharia-dados
   ```

2. **Crie um ambiente virtual:**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # Linux/Mac
   # ou
   .venv\Scripts\activate     # Windows
   ```

3. **Instale as dependências globais:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Para DBT (etapa-03):**
   ```bash
   cd etapa-03/ecommerce
   pip install -r requirements.txt
   dbt deps  # Instala dependências DBT
   ```

---

## Como Usar

### Etapas Práticas

#### Etapa 01
Script de ingestão inicial dos dados.

```bash
cd etapa-01
python main.py
```

#### Etapa 02
Processamento e limpeza dos dados.

```bash
cd etapa-02
python main.py
```

#### Etapa 03
Projeto DBT completo para modelagem de dados.

- Configure o perfil em `profiles.yml` (ex: PostgreSQL).
- Execute:
  ```bash
  cd etapa-03/ecommerce
  dbt run          # Executa todos os modelos
  dbt test         # Roda os testes
  dbt docs generate  # Gera documentação
  dbt docs serve     # Serve a documentação localmente
  ```

---

## Tecnologias Utilizadas

- **Linguagens**: SQL, Python
- **Ferramentas**:
  - DBT: Para transformação de dados
  - Pandas: Para manipulação de dados em Python
  - PostgreSQL: Banco de dados (exemplo)
- **Outros**: Git, Docker, Jupyter (opcional)

---

## Descrição dos Dados

Os dados simulam um e-commerce e estão em formato CSV:

- **clientes.csv**: Informações de clientes (ID, nome, estado, país, data de cadastro).
- **produtos.csv**: Catálogo de produtos (ID, nome, categoria, preço atual, data de atualização).
- **vendas.csv**: Histórico de vendas (ID venda, ID cliente, ID produto, quantidade, preço unitário, data venda).
- **preco_competidores.csv**: Preços de concorrentes (ID produto, nome concorrente, preço, data extração).
- **gold_kpi_clientes_top_rows.csv**: Exemplo de KPIs agregados (clientes top por gasto).

Esses dados são usados para construir um data warehouse com camadas Bronze (raw), Silver (limpo) e Gold (analítico).

---

## Contribuição

Contribuições são bem-vindas! Siga estes passos:

1. Fork o repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`).
4. Push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

### Diretrizes

- Mantenha o código limpo e documentado.
- Adicione testes para novas funcionalidades.
- Atualize o README se necessário.

---

## Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

---

Para dúvidas ou sugestões, abra uma issue no [GitHub](https://github.com/saldanha-marcel/imersao-engenharia-dados)!