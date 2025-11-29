BEGIN TRANSACTION;

------------- Tabela Autor --------------

CREATE TABLE Autor (
    id_autor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT (50) NOT NULL 
);

------------- Tabela Categoria --------------

CREATE TABLE Categoria (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_categoria TEXT (50) NOT NULL
);

------------- Tabela Leitor --------------

CREATE TABLE Leitor (
    id_leitor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT (50) NOT NULL,
    cpf TEXT (15) UNIQUE NOT NULL,
    telefone TEXT (15),
    endereco TEXT (100)
);

------------- Tabela Bibliotecario --------------

CREATE TABLE Bibliotecario (
    id_bibliotecario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT (50) NOT NULL,
    cpf TEXT (15) UNIQUE NOT NULL
);

------------- Tabela Livro --------------

CREATE TABLE Livro (
    id_livro INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    editora TEXT (50),
    ano_publicacao DATE,
    id_categoria INTEGER NOT NULL,
    id_autor INTEGER NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categoria (id_categoria),
    FOREIGN KEY (id_autor) REFERENCES Autor (id_autor)
);

------------- Tabela Exemplar --------------

CREATE TABLE Exemplar (
    id_exemplar INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo_exemplar TEXT (20) UNIQUE NOT NULL,
    status TEXT (20) NOT NULL, -- Ex: "Disponível", "Emprestado", "Reservado" --
    id_livro INTEGER NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES Livro (id_livro)
);

------------- Tabela Emprestimo --------------

CREATE TABLE Emprestimo (
    id_emprestimo INTEGER PRIMARY KEY AUTOINCREMENT,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE, -- Pode ser NULL se ainda não foi devolvido --
    id_exemplar INTEGER NOT NULL, 
    id_leitor INTEGER NOT NULL, 
    id_bibliotecario INTEGER NOT NULL, 
    FOREIGN KEY (id_exemplar) REFERENCES Exemplar (id_exemplar),
    FOREIGN KEY (id_leitor) REFERENCES Leitor (id_leitor),
    FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecario (id_bibliotecario)
);

------------- Tabela Devolução --------------

CREATE TABLE Devolucao (
    id_devolucao INTEGER PRIMARY KEY AUTOINCREMENT,
    data_devolucao DATE NOT NULL,
    id_emprestimo INTEGER UNIQUE NOT NULL,  -- Uma devolução para cada empréstimo --
    id_bibliotecario INTEGER NOT NULL,
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo (id_emprestimo),
    FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecario (id_bibliotecario)
);

COMMIT;