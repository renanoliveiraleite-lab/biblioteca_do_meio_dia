# Sistema de Gestão da Biblioteca "Biblioteca do Meio Dia"

Este repositório contém os scripts SQL para a criação e manipulação do banco de dados relacional da **Biblioteca do Meio Dia**, desenvolvidos como parte da disciplina de Modelagem de Banco de Dados.

## 📌 Fundamentos do Projeto

O banco de dados foi modelado logicamente (Modelagem Entidade-Relacionamento) e normalizado (3FN) para gerenciar o acervo, leitores, bibliotecários, e o fluxo de empréstimos e devoluções.

## 🛠️ Tecnologias e Ambiente

* **SGBD (Sistema Gerenciador de Banco de Dados):** Compatível com **SQLite**, **PostgreSQL** ou **MySQL**.
* **Ferramentas:** SQLiteStudio, DBeaver, MySQL Workbench, ou pgAdmin.
* **Linguagem:** SQL (DDL e DML).

## 🚀 Instruções de Execução

Siga a ordem dos arquivos para inicializar o banco de dados e aplicar os comandos de manipulação.

### 1. Criação do Esquema (DDL)

Execute o script `01_createTable.sql` para criar todas as 8 tabelas do projeto (`Autor`, `Categoria`, `Leitor`, `Bibliotecário`, `Livro`, `Exemplar`, `Emprestimo`, `Devolução`).

### 2. População Inicial (DML - INSERT)

Execute o script `02_InsertTable.sql` para inserir dados de demonstração em todas as tabelas.

### 3. Manipulação de Dados (DML - SELECT, UPDATE, DELETE)

Execute o script `03_Manipulacao.sql`. Este arquivo demonstra:

* **Consultas (SELECT):** Uso de `JOIN`, `WHERE`, `ORDER BY`, `LIMIT` e `GROUP BY`.
* **Atualizações (UPDATE):** Correções de dados e mudanças de status.
* **Exclusões (DELETE):** Remoção de dados que não comprometem a integridade referencial.
