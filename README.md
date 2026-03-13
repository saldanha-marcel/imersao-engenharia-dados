# Imersão Engenharia de Dados

Este projeto contém as etapas 01 e 02 do curso de Imersão em Engenharia de Dados.

## Sumário

- [Pré-requisitos](#pré-requisitos)
- [Instalação do Ambiente](#instalação-do-ambiente)
- [Execução das Etapas](#execução-das-etapas)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Referências](#referências)

---

## Pré-requisitos

- Python 3.8+
- [pip](https://pip.pypa.io/en/stable/)
- [virtualenv](https://virtualenv.pypa.io/en/latest/) (opcional, mas recomendado)

## Instalação do Ambiente

1. **Clone o repositório:**
    ```bash
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. **Crie e ative um ambiente virtual:**
    ```bash
    python3 -m venv .venv
    source .venv/bin/activate  # Linux/Mac
    .venv\Scripts\activate     # Windows
    ```

3. **Instale as dependências:**
    ```bash
    pip install -r requirements.txt
    ```

## Execução das Etapas

### Etapa 01

- Scripts e notebooks para ingestão e tratamento inicial dos dados.
- Execute:
  ```bash
  python etapa_01/ingestao.py
  ```

### Etapa 02

- Processamento, limpeza e análise dos dados.
- Execute:
  ```bash
  python etapa_02/processamento.py
  ```

## Estrutura do Projeto

```
├── etapa_01/
│   ├── ingestao.py
│   └── ...
├── etapa_02/
│   ├── processamento.py
│   └── ...
├── requirements.txt
└── README.md
```

## Referências

- [Documentação Oficial do Python](https://docs.python.org/3/)
- [Pandas](https://pandas.pydata.org/)
- [Imersão Engenharia de Dados](https://imersao.engdados.com/)

---

Sinta-se à vontade para contribuir ou abrir issues!