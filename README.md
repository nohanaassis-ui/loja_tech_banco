<div align="center">

# TechStore | loja_tech

**Consultas SQL, Stored Procedures e Views em MySQL**

![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL_Workbench-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-DQL%20%7C%20DML%20%7C%20DDL-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/status-concluído-success?style=for-the-badge)

*Atividade individual de Banco de Dados com o e-commerce fictício **TechStore**.*

</div>

---

## Índice

- [Sobre o projeto](#sobre-o-projeto)
- [Objetivos de aprendizagem](#objetivos-de-aprendizagem)
- [Estrutura do repositório](#estrutura-do-repositório)
- [Modelo de dados](#modelo-de-dados)
- [Como executar](#como-executar)
- [Parte 1: Consultas SQL](#parte-1-consultas-sql)
- [Parte 2: Stored Procedures](#parte-2-stored-procedures)
- [Parte 3: Views vs Stored Procedures](#parte-3-views-vs-stored-procedures)
- [Evidências de execução](#evidências-de-execução)
- [Boas práticas aplicadas](#boas-práticas-aplicadas)
- [Referências](#referências)
- [Autor](#autor)

---

## Sobre o projeto

A **TechStore** é uma loja de tecnologia que vende notebooks, smartphones, periféricos, monitores e armazenamento. O banco `loja_tech` guarda categorias, produtos, clientes, pedidos, itens de cada pedido e um log de auditoria.

Este repositório reúne a resolução completa da atividade:

| Parte | Entrega | Quantidade |
|:-----:|---------|:----------:|
| 1 | Consultas SQL (nível muito fácil) | **10** |
| 2 | Stored Procedures | **5** |
| 3 | Exemplos de uso de Views no lugar de Procedures | **5** |

## Objetivos de aprendizagem

- Praticar a sintaxe básica de `SELECT`, `WHERE`, `ORDER BY`, `LIKE`, `COUNT`, `SUM` e `INNER JOIN`.
- Criar procedures com parâmetros `IN` e `OUT`, `INSERT` e `UPDATE`.
- Entender **quando usar View e quando usar Stored Procedure**.
- Organizar e documentar um projeto de banco de dados em um repositório.

## Estrutura do repositório

```text
loja_tech_banco/
├── prints/                      # evidências de execução no MySQL Workbench
├── loja_tech_schema.txt         # criação do banco e das tabelas
├── loja_tech_dump.sql           # schema + carga inicial (importável)
├── loja_tech_consultas.txt      # 10 desafios de consultas SQL
├── loja_tech_procedures.txt     # 5 stored procedures
├── loja_tech_views.txt          # 5 exemplos: views vs stored procedures
└── README.md
```

## Modelo de dados

```mermaid
erDiagram
    categorias ||--o{ produtos : "possui"
    clientes ||--o{ pedidos : "realiza"
    pedidos ||--|{ itens_pedido : "contém"
    produtos ||--o{ itens_pedido : "está em"

    categorias {
        INT id_categoria PK
        VARCHAR nome
        TEXT descricao
        BOOLEAN ativo
    }
    produtos {
        INT id_produto PK
        INT id_categoria FK
        VARCHAR nome
        DECIMAL preco
        INT estoque
        INT estoque_minimo
        BOOLEAN ativo
    }
    clientes {
        INT id_cliente PK
        VARCHAR nome
        VARCHAR email
        CHAR cpf
        VARCHAR telefone
    }
    pedidos {
        INT id_pedido PK
        INT id_cliente FK
        DATETIME data_pedido
        ENUM status
        DECIMAL valor_total
    }
    itens_pedido {
        INT id_item PK
        INT id_pedido FK
        INT id_produto FK
        INT quantidade
        DECIMAL preco_unitario
        DECIMAL subtotal
    }
    log_operacoes {
        INT id_log PK
        VARCHAR tabela_afetada
        VARCHAR operacao
        TEXT descricao
    }
```

**Relacionamentos:** uma categoria tem vários produtos; um cliente faz vários pedidos; um pedido tem um ou mais itens; um produto pode aparecer em vários itens.

## Como executar

**Pré-requisitos:** MySQL 8.0+ e MySQL Workbench.

1. Clone o repositório:
   ```bash
   git clone https://github.com/nohanaassis-ui/loja_tech_banco.git
   ```
2. No Workbench, abra e execute `loja_tech_dump.sql`. Ele cria o banco `loja_tech` e carrega os dados iniciais.
3. Selecione o banco:
   ```sql
   USE loja_tech;
   ```
4. Abra `loja_tech_consultas.txt`, `loja_tech_procedures.txt` e `loja_tech_views.txt` e execute por blocos (`Ctrl + Enter`).

> Via terminal: `mysql -u root -p < loja_tech_dump.sql`

## Parte 1: Consultas SQL

Arquivo: [`loja_tech_consultas.txt`](./loja_tech_consultas.txt)

| # | Desafio | Conceito |
|:-:|---------|----------|
| 1 | Nome e e-mail de todos os clientes | `SELECT` |
| 2 | Produtos abaixo de R$ 500,00 | `WHERE` |
| 3 | Pedidos com status `pendente` | `WHERE` com ENUM |
| 4 | Produtos do mais caro ao mais barato | `ORDER BY DESC` |
| 5 | Produtos que contêm "Monitor" | `LIKE '%Monitor%'` |
| 6 | Periféricos com mais de 40 unidades | `AND` |
| 7 | Total de clientes (`total_clientes`) | `COUNT` + alias |
| 8 | Faturamento bruto (`faturamento_bruto`) | `SUM` + alias |
| 9 | Produto com o nome da categoria | `INNER JOIN` |
| 10 | Pedidos da cliente Ana Silva | `INNER JOIN` + filtro |

Exemplo (desafio 10):

```sql
SELECT pe.id_pedido, pe.status, pe.valor_total
FROM pedidos pe
INNER JOIN clientes c ON c.id_cliente = pe.id_cliente
WHERE c.nome = 'Ana Silva';
```

## Parte 2: Stored Procedures

Arquivo: [`loja_tech_procedures.txt`](./loja_tech_procedures.txt)

| Procedure | Parâmetros | O que faz |
|-----------|-----------|-----------|
| `listar_categorias_ativas` | nenhum | Lista categorias ativas em ordem alfabética |
| `buscar_pedidos_por_status` | `IN p_status` | Retorna pedidos com o status informado |
| `inserir_categoria` | `IN p_nome`, `IN p_descricao` | Insere uma nova categoria |
| `atualizar_telefone_cliente` | `IN p_id_cliente`, `IN p_telefone` | Atualiza o telefone do cliente |
| `contar_produtos_categoria` | `IN p_id_categoria`, `OUT p_total` | Devolve a quantidade de produtos da categoria |

Exemplo com parâmetro de saída:

```sql
DROP PROCEDURE IF EXISTS contar_produtos_categoria;
DELIMITER //
CREATE PROCEDURE contar_produtos_categoria(
    IN  p_id_categoria INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM produtos
    WHERE id_categoria = p_id_categoria;
END //
DELIMITER ;

CALL contar_produtos_categoria(3, @total);
SELECT @total AS total_produtos;
```

## Parte 3: Views vs Stored Procedures

Arquivo: [`loja_tech_views.txt`](./loja_tech_views.txt)

```mermaid
flowchart TD
    A{O que preciso?} --> B[Apenas LER dados<br/>de forma fixa]
    A --> C[Receber parâmetros,<br/>aplicar regras ou<br/>ESCREVER dados]
    B --> D[VIEW]
    C --> E[STORED PROCEDURE]
    D --> F[Usar em FROM e JOIN<br/>Filtrar com WHERE<br/>Ler em BI]
    E --> G[CALL nome<br/>IF, WHILE, TRANSACTION<br/>INSERT, UPDATE, DELETE]
```

### Cinco situações em que a View é a melhor escolha

| # | View | Situação | Por que View e não Procedure? |
|:-:|------|----------|-------------------------------|
| 1 | `vw_catalogo_produtos` | Vitrine com produto, categoria, preço e estoque | Consulta fixa e reutilizável, que pode ser filtrada com `WHERE` depois |
| 2 | `vw_pedidos_clientes` | Painel do atendimento com pedido e nome do cliente | Só leitura; esconde o `JOIN` e simplifica a consulta |
| 3 | `vw_estoque_baixo` | Alerta de reposição para a logística | Funciona como tabela virtual sempre atualizada |
| 4 | `vw_resumo_cliente` | Total de pedidos e valor gasto por cliente em dashboards | Ferramentas de BI leem views como tabelas; um `CALL` não entra em `FROM` ou `JOIN` |
| 5 | `vw_clientes_publico` | Perfil restrito que não pode ver CPF e telefone | Expõe só colunas permitidas, ajudando na proteção de dados (LGPD) |

### Comparativo rápido

| Característica | View | Stored Procedure |
|----------------|:----:|:----------------:|
| Aceita parâmetros | Não | Sim (`IN`, `OUT`, `INOUT`) |
| Pode ser usada em `SELECT ... FROM` | Sim | Não |
| Executa `INSERT`, `UPDATE` e `DELETE` | Limitado | Sim |
| Suporta `IF`, `WHILE` e transações | Não | Sim |
| Chamada | `SELECT * FROM vw_x` | `CALL proc()` |
| Melhor uso | Leitura e relatórios fixos | Regras de negócio e operações |

## Evidências de execução

Os prints do MySQL Workbench estão na pasta [`prints/`](./prints).

## Evidências de execução

Prints da execução no MySQL Workbench. Todos os arquivos ficam na pasta [`prints/`](./prints).

### Parte 1: Consultas SQL

**1. Listagem de clientes**

![Listagem de clientes](./prints/consultas/listagem_clientes.png)

**2. Produtos abaixo de R$ 500,00**

![Produtos abaixo de 500](./prints/consultas/produtos_abaixo.png)

**3. Pedidos pendentes**

![Pedidos pendentes](./prints/consultas/pedidos_pendentes.png)

**4. Catálogo ordenado por preço**

![Catálogo ordenado por preço](./prints/consultas/catalogo_ordenado_preco.png)

**5. Busca por "Monitor"**

![Busca por Monitor](./prints/consultas/busca_monitor.png)

**6. Periféricos com estoque acima de 40**

![Periféricos com estoque](./prints/consultas/perifericos_estoque.png)

**7. Total de clientes**

![Total de clientes](./prints/consultas/total_clientes.png)

**8. Faturamento bruto**

![Faturamento bruto](./prints/consultas/faturamento_bruto.png)

**9. Produto com categoria (INNER JOIN)**

![JOIN produto e categoria](./prints/consultas/join_produto.png)

**10. Pedidos da cliente Ana Silva**

![Pedidos da Ana Silva](./prints/consultas/pedidos_ana.png)

### Parte 2: Stored Procedures

**1. `listar_categorias_ativas`**

![listar_categorias_ativas](./prints/procedures/categoria_ativa.png)

**2. `buscar_pedidos_por_status`**

![buscar_pedidos_por_status](./prints/procedures/buscar_pedidos.png)

**3. `inserir_categoria`**

![inserir_categoria](./prints/procedures/inserir_categorias.png)

**4. `atualizar_telefone_cliente`**

![atualizar_telefone_cliente](./prints/procedures/atualizar_telefone.png)

**5. `contar_produtos_categoria`**

![contar_produtos_categoria](./prints/procedures/contar_produtos.png)

**Avançadas (atividade da aula)**

**`atualizar_preco_categoria`**

![atualizar_preco_categoria](./prints/procedures/atualizar_preco.png)

**`consultar_extrato_cliente`**

![consultar_extrato_cliente](./prints/procedures/consultar_extrato.png)

### Parte 3: Views

**Catálogo / vitrine**

![View catálogo vitrine](./prints/views/catologo_vitrine.png)

**Clientes (visão pública)**

![View clientes público](./prints/views/clientes_publico.png)

**Detalhes dos itens do pedido**

![View detalhes dos itens](./prints/views/detalhes_itens.png)

## Boas práticas aplicadas

- `DROP PROCEDURE IF EXISTS` antes de cada `CREATE PROCEDURE`
- `DELIMITER //` para criar as procedures
- Prefixo `p_` em todos os parâmetros
- Nomes descritivos (verbo + substantivo)
- Colunas listadas explicitamente, sem `SELECT *` dentro de procedures
- Comentários explicando cada bloco

## Referências

- Material de aula: *Stored Procedures no MySQL* (`aula-stored-procedures.pdf`)
- [MySQL 8.0 Reference Manual: Stored Routines](https://dev.mysql.com/doc/refman/8.0/en/stored-routines.html)
- [MySQL 8.0 Reference Manual: CREATE VIEW](https://dev.mysql.com/doc/refman/8.0/en/create-view.html)
- [GitHub Docs: Creating diagrams with Mermaid](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-diagrams)

## Autor

**Nohana Assis**
Disciplina de Banco de Dados
GitHub: [@nohanaassis-ui](https://github.com/nohanaassis-ui)

---

<div align="center">

Feito com muito SELECT e um pouco de café.

</div>
