BEGIN TRANSACTION;

-------------- Tabela Autor ---------
INSERT INTO Autor (nome) VALUES
    ('Machado de Assis'),     
    ('Conceição Evaristo'),   
    ('Alan Moore'),           
    ('H. G. Wells'),          
    ('Graciliano Ramos');     
    
------------- Tabela Categoria --------------

INSERT INTO Categoria (nome_categoria) VALUES
    ('Romance Clássico'),    
    ('Ficção Literária'),                  
    ('Terror'),               
    ('Ficção Científica');    
    
------------- Tabela Leitor --------------

INSERT INTO Leitor (nome, cpf, telefone, endereco) VALUES
    ('Ana Silva', '111.111.111-11', '(21) 98765-4321', 'Rua A, 10 - Centro'),   
    ('Bruno Costa', '222.222.222-22', '(11) 99876-5432', 'Av. B, 20 - Pinheiros'), 
    ('Sofia Pereira', '444.444.444-44', '(31) 97777-7777', 'Alameda C, 30 - Savassi');

------------- Tabela Bibliotecario --------------

INSERT INTO Bibliotecario (nome, cpf) VALUES
    ('Carla Oliveira', '333.333.333-33'), 
    ('Rui Santos', '555.555.555-55');   

------------- Dados Livros --------------

INSERT INTO Livro (titulo, editora, ano_publicacao, id_categoria, id_autor) VALUES
    ('Memórias Póstumas de Brás Cubas', 'Athenas', '1881-01-01', 1, 1), 
    ('Canção Para Ninar Menino Grande', 'Pallas', '2018-06-08', 2, 2), 
    ('Do Inferno', 'Veneta', '2014-11-11', 3, 3), 
    ('A Máquina do Tempo', 'Darkside', '2021-10-08', 4, 4); 
    
------------- Dados Exemplar --------------

INSERT INTO Exemplar (codigo_exemplar, status, id_livro) VALUES
    -- Exemplares Livro 1 (Memórias Póstumas) --
    ('MPBC-001', 'Emprestado', 1),
    ('MPBC-002', 'Disponível', 1), 
    -- Exemplares Livro 2 (Canção Para Ninar Menino Grande) --
    ('CPNMG-001', 'Disponível', 2), 
    ('CPNMG-002', 'Disponível', 2), 
    -- Exemplares Livro 3 (Do Inferno) -- 
    ('DOINF-001', 'Emprestado', 3), 
    ('DOINF-002', 'Reservado', 3); 
    
------------ Dados Emprestimos -----------------

INSERT INTO Emprestimo (data_emprestimo, data_prevista_devolucao, data_devolucao, id_exemplar, id_leitor, id_bibliotecario) VALUES
    -- Empréstimo 1: Já devolvido --
    ('2025-11-20', '2025-12-05', '2025-11-27', 1, 1, 1),
    -- Empréstimo 2: Em andamento (data_devolucao NULL)
    ('2025-11-28', '2025-12-13', NULL, 5, 2, 1); 
    
------------ Dados Devolução -----------------

INSERT INTO Devolucao (data_devolucao, id_emprestimo, id_bibliotecario) VALUES
('2025-11-27', 1, 2); 

COMMIT;
