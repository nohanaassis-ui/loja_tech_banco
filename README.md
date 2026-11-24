# 🛒 TechStore — Consultas SQL, Stored Procedures e Views

Atividade individual de Banco de Dados (MySQL) usando o banco relacional **`loja_tech`**, que simula o e-commerce de uma loja de tecnologia.

##  Sobre o projeto

| Parte | Conteúdo |
|-------|----------|
| 1 | 10 consultas SQL (SELECT, WHERE, ORDER BY, LIKE, COUNT, SUM, INNER JOIN) |
| 2 | 5 Stored Procedures (sem parâmetros, IN, IN/OUT, INSERT e UPDATE) |
| 3 | 5 exemplos de situações em que **Views** são melhores que Stored Procedures |

##  Estrutura do repositório

```
.
├── README.md
├── atividade_loja_tech.sql      # consultas, procedures e views
└── (opcional) script_loja_tech.sql  # criação do banco e carga inicial
```

##  Modelo do banco

Tabelas: `categorias`, `produtos`, `clientes`, `pedidos`, `itens_pedido` e `log_operacoes`.

```
categorias 1──N produtos
clientes   1──N pedidos
pedidos    1──N itens_pedido
produtos   1──N itens_pedido
```

## ▶️ Como executar

1. Abra o **MySQL Workbench** (MySQL 8+).
2. Execute o script de criação e carga do banco `loja_tech` (material da aula).
3. Abra `atividade_loja_tech.sql` e execute por blocos (`Ctrl + Enter` na seleção).
4. Cada procedure e view tem um comando de teste logo abaixo.

## 🔎 Parte 1 — Consultas

| # | Objetivo | Técnica |
|---|----------|---------|
| 1 | Nome e e-mail dos clientes | `SELECT` |
| 2 | Produtos abaixo de R$ 500 | `WHERE` |
| 3 | Pedidos pendentes | `WHERE` com ENUM |
| 4 | Produtos do mais caro ao mais barato | `ORDER BY DESC` |
| 5 | Produtos "Monitor" | `LIKE '%Monitor%'` |
| 6 | Periféricos com estoque > 40 | `AND` |
| 7 | Total de clientes | `COUNT` + alias |
| 8 | Faturamento bruto | `SUM` + alias |
| 9 | Produto e categoria | `INNER JOIN` |
| 10 | Pedidos da Ana Silva | `INNER JOIN` + filtro |

## ⚙️ Parte 2 — Stored Procedures

Boas práticas aplicadas: `DROP PROCEDURE IF EXISTS`, `DELIMITER //` e prefixo `p_` nos parâmetros.

| Procedure | Parâmetros | Função |
|-----------|-----------|--------|
| `listar_categorias_ativas` | — | Lista categorias ativas em ordem alfabética |
| `buscar_pedidos_por_status` | `IN p_status` | Filtra pedidos por status |
| `inserir_categoria` | `IN p_nome, p_descricao` | Insere nova categoria |
| `atualizar_telefone_cliente` | `IN p_id_cliente, p_telefone` | Atualiza o telefone |
| `contar_produtos_categoria` | `IN p_id_categoria, OUT p_total` | Conta produtos da categoria |

Exemplo de uso com `OUT`:

```sql
CALL contar_produtos_categoria(3, @total);
SELECT @total;
```

## 👁️ Parte 3 — Views no lugar de Stored Procedures

| View | Situação | Por que View e não Procedure? |
|------|----------|-------------------------------|
| `vw_catalogo_produtos` | Catálogo com categoria | Consulta fixa, reutilizável, filtrável com `WHERE` |
| `vw_pedidos_clientes` | Painel do atendimento | Só leitura; esconde o JOIN |
| `vw_estoque_baixo` | Alerta de reposição | "Tabela virtual" sempre atualizada |
| `vw_resumo_cliente` | Dashboards de BI | Ferramentas de BI leem views em `FROM`/`JOIN`; `CALL` não |
| `vw_clientes_publico` | Segurança / LGPD | Expõe só colunas não sensíveis |

**Regra prática:** use **View** quando a necessidade é *ler* dados de forma fixa e reutilizável (e compor com outras queries). Use **Stored Procedure** quando há parâmetros, lógica condicional, transações ou escrita (INSERT/UPDATE/DELETE).

##  Referências

- Material de aula: *Stored Procedures no MySQL* (aula-stored-procedures.pdf)
- MySQL Reference Manual — Stored Routines: https://dev.mysql.com/doc/refman/8.0/en/stored-routines.html
- MySQL Reference Manual — CREATE VIEW: https://dev.mysql.com/doc/refman/8.0/en/create-view.html

##  Autor

**Seu Nome** — Disciplina de Banco de Dados
