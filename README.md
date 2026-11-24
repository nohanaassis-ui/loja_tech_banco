
# TECHSTORE — BANCO DE DADOS RELACIONAL (`loja_tech`)

![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-2EA44F?style=for-the-badge)
![SENAI](https://img.shields.io/badge/SENAI-Su%C3%AD%C3%A7o--Brasileira-E30613?style=for-the-badge)
![Padrão](https://img.shields.io/badge/Nomenclatura-snake__case-blueviolet?style=for-the-badge)

**Sistema de Gestão Comercial, Catálogo de Produtos, Consultas Analíticas (DQL), Stored Procedures com Auditoria e Views**

* **Instituição:** Escola SENAI Suíço-Brasileira
* **Professor:** Átila
* **Disciplina:** Banco de Dados
* **Autora:** Nohana Assis
* **Turma:** SEDUC 2
* **Repositório:** [github.com/nohanaassis-ui/loja_tech_banco](https://github.com/nohanaassis-ui/loja_tech_banco)
* **Ambiente:** MySQL Server 8.0+ / MySQL Workbench
* **Data:** 24/11/2026

---

## 1. Apresentação e Escopo do Projeto

Este projeto consiste na aplicação prática de modelagem relacional, consultas analíticas (DQL), rotinas armazenadas (Stored Procedures) e visões virtuais (Views) no Banco de Dados Relacional **`loja_tech`**, desenvolvido e validado no **MySQL Workbench**. A atividade tem como objetivo consolidar a leitura de esquema, a sintaxe fundamental de consulta e manipulação de dados, a auditoria transacional e a criação de Stored Procedures parametrizadas para o gerenciamento operacional da loja de tecnologia **TechStore**.

### Escopo Operacional
* **Gestão de Clientes:** Cadastro centralizado de consumidores, controle de dados de contato (e-mail, CPF e telefone) e histórico de compras realizadas na plataforma.
* **Catálogo de Produtos e Categorias:** Organização de itens tecnológicos por departamentos, precificação, busca textual e monitoramento de disponibilidade em estoque.
* **Controle de Pedidos e Faturamento:** Acompanhamento do status das vendas (como pedidos pendentes de pagamento), associação entre cliente e pedido e apuração do faturamento bruto.
* **Automação com Stored Procedures e Views:** Encapsulamento de regras de consulta, inserção, atualização, contagem de registros, logs de auditoria e abstração de dados no servidor MySQL utilizando boas práticas de programação.

---

## 2. Estrutura do Repositório

Todos os arquivos e diretórios seguem estritamente o padrão **`snake_case`** (letras minúsculas e underline `_`, sem hífens ou caracteres especiais), conforme boas práticas adotadas em sala de aula:

```text
loja_tech_banco/
├── prints/
│   ├── schema_e_carga/          # Evidências da criação do banco, tabelas e INSERTs
│   ├── consultas/               # Evidências dos 10 desafios de consultas SQL (DQL)
│   ├── procedures/              # Evidências de execução das 7 Stored Procedures e logs
│   └── views/                   # Evidências de criação e consulta das 5 Views
├── loja_tech_schema.sql         # Criação do banco, 6 tabelas relacionais e carga inicial
├── loja_tech_consultas.sql      # Resolução comentada dos 10 desafios de consultas DQL
├── loja_tech_procedures.sql     # 5 Procedures da lista + 2 Procedures avançadas com auditoria
├── loja_tech_views.sql          # 5 cenários práticos comparando Views e Stored Procedures
├── loja_tech_dump.sql           # Backup completo (estrutura, dados, procedures e views)
└── README.md                    # Documentação técnica completa do projeto
