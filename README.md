# TECHSTORE — BANCO DE DADOS RELACIONAL (`loja_tech`)

![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-2EA44F?style=for-the-badge)
![SENAI](https://img.shields.io/badge/SENAI-Su%C3%AD%C3%A7o--Brasileira-E30613?style=for-the-badge)
![Padrão](https://img.shields.io/badge/Nomenclatura-snake__case-blueviolet?style=for-the-badge)

**Sistema de Gestão Comercial, Catálogo de Produtos, Consultas Analíticas (DQL), Stored Procedures com Auditoria e Views**

* **Instituição:** Escola SENAI Suíço-Brasileira
* **Disciplina:** Banco de Dados
* **Professor:** Átila
* **Aluna:** Nohana Assis
* **Repositório:** [github.com/nohanaassis-ui/loja_tech_banco](https://github.com/nohanaassis-ui/loja_tech_banco)
* **Ambiente:** MySQL Server 8.0+ / MySQL Workbench
* **Data de Entrega:** Novembro de 2026

---

## 1. Apresentação e Escopo do Projeto

Este repositório apresenta a resolução completa das atividades práticas da disciplina de **Banco de Dados**, modeladas sobre o domínio de e-commerce da **TechStore** (`loja_tech`). Todo o desenvolvimento foi estruturado seguindo padrões profissionais de engenharia de dados, priorizando segurança transacional, legibilidade de código, idempotência e rastreabilidade de operações.

### Competências Técnicas Aplicadas
* **DDL & DML Idempotentes:** Criação segura de esquemas e tabelas (`IF NOT EXISTS`) e carga inicial sem duplicidade (`INSERT IGNORE`).
* **Consultas Relacionais (DQL):** Extração de indicadores comerciais utilizando filtros compostos, buscas textuais, ordenação, funções de agregação e junções (`INNER JOIN`).
* **Programação no Servidor (Stored Procedures):** Encapsulamento de regras de negócio com parâmetros de entrada (`IN`) e saída (`OUT`), variáveis locais, validações defensivas (`IF / ELSEIF / ELSE`), múltiplos *Result Sets* e gravação de trilha de auditoria.
* **Abstração e Segurança (Views):** Estudo comparativo e implementação prática de 5 cenários onde `VIEW` supera o uso de `STORED PROCEDURE`.
* **Backup e Versionamento:** Exportação completa (`dump`) via MySQL Workbench e controle de versão com commits atômicos no Git/GitHub.

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
