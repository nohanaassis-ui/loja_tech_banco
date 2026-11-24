# 🛒 TECHSTORE — BANCO DE DADOS RELACIONAL (`loja_tech`)

**Sistema de Gestão Comercial, Catálogo, Consultas Analíticas, Stored Procedures e Views**

* **Instituição:** Escola SENAI Suíço-Brasileira
* **Curso / Disciplina:** Banco de Dados
* **Professor:** Átila
* **Aluna:** Nohana Assis
* **Repositório:** [nohanaassis-ui/loja_tech_banco](https://github.com/nohanaassis-ui/loja_tech_banco)
* **SGBD / Ferramenta:** MySQL 8.0+ / MySQL Workbench
* **Data:** Novembro de 2026

---

## 📋 1. Apresentação e Objetivo do Projeto

Este repositório reúne a implementação completa das atividades práticas da disciplina de **Banco de Dados**, utilizando o domínio de negócio da **TechStore** (`loja_tech`). O projeto foi desenvolvido e validado no **MySQL Workbench** com o objetivo de aplicar na prática:

* Modelagem física e criação segura (idempotente) de bancos de dados relacionais com integridade referencial.
* Carga inicial de dados e geração de backup completo (`dump`).
* Construção de consultas SQL (DQL) envolvendo filtros, ordenações, buscas textuais, funções de agregação e junções (`INNER JOIN`).
* Encapsulamento de regras de negócio no servidor por meio de **Stored Procedures** (com parâmetros `IN` e `OUT`, validações condicionais, tratamento de erros e trilha de auditoria).
* Pesquisa técnica e aplicação prática de **Views**, demonstrando cenários em que objetos virtuais são mais adequados que rotinas procedurais.

---

## 🗂️ 2. Estrutura do Repositório

Todos os diretórios e arquivos seguem o padrão **`snake_case`** (letras minúsculas separadas por underline `_`, sem hífens ou caracteres especiais), garantindo compatibilidade entre sistemas operacionais e aderência às boas práticas de engenharia de dados.

```text
loja_tech_banco/
├── prints/
│   ├── schema_e_carga/          # Evidências da criação do banco, tabelas e INSERTs
│   ├── consultas/               # Evidências dos 10 desafios de consultas SQL (DQL)
│   ├── procedures/              # Evidências de execução das 7 Stored Procedures
│   └── views/                   # Evidências de criação e consulta das 5 Views
├── loja_tech_schema.sql         # DDL e DML inicial (criação do banco, tabelas e carga)
├── loja_tech_consultas.sql      # Resolução dos 10 exercícios de consultas SQL
├── loja_tech_procedures.sql     # 5 Procedures básicas + 2 Procedures completas com auditoria
├── loja_tech_views.sql          # 5 cenários aplicados de Views vs. Stored Procedures
├── loja_tech_dump.sql           # Backup completo exportado via MySQL Workbench (Data Export)
└── README.md                    # Documentação técnica completa do projeto
