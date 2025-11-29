------------ PARTE 1: CONSULTAS (SELECT) ---------------------

-- Consulta 1: Listar todos os exemplares disponíveis do livro "Canção Para Ninar Menino Grande" (JOIN e WHERE) --
SELECT
    E.codigo_exemplar,
    L.titulo,
    E.status
FROM
    Exemplar E
JOIN
    Livro L ON E.id_livro = L.id_livro
WHERE
    L.titulo = 'Canção Para Ninar Menino Grande' AND E.status = 'Disponível';

-- Consulta 2: Encontrar leitores com empréstimos ativos (data_devolucao é NULL) (JOINs e WHERE) --
SELECT
    Le.nome AS leitor,
    L.titulo AS livro_emprestado,
    E.data_emprestimo
FROM
    Emprestimo E
JOIN
    Leitor Le ON E.id_leitor = Le.id_leitor
JOIN
    Exemplar Ex ON E.id_exemplar = Ex.id_exemplar
JOIN
    Livro L ON Ex.id_livro = L.id_livro
WHERE
    E.data_devolucao IS NULL
ORDER BY
    E.data_emprestimo;

-- Consulta 3: Listar todos os livros, autores e categorias, ordenados por Título (Múltiplos JOINs e ORDER BY) --
SELECT
    L.titulo,
    A.nome AS nome_autor,
    C.nome_categoria
FROM
    Livro L
JOIN
    Autor A ON L.id_autor = A.id_autor
JOIN
    Categoria C ON L.id_categoria = C.id_categoria
ORDER BY
    L.titulo ASC;

-- Consulta 4: Listar os 2 livros mais antigos do acervo (ORDER BY e LIMIT) --
SELECT
    titulo,
    ano_publicacao
FROM
    Livro
ORDER BY
    ano_publicacao ASC
LIMIT 2;

-- Consulta 5: Contar quantos exemplares de cada status existem (GROUP BY)
SELECT
    status,
    COUNT(id_exemplar) AS total_exemplares
FROM
    Exemplar
GROUP BY
    status;

--------------------- PARTE 2: ATUALIZAÇÕES (UPDATE) ---------------------------

-- UPDATE 1: Atualizar o status do exemplar 'MPBC-001' (id_exemplar = 1) para 'Disponível' (simulando uma devolução que já ocorreu) --
UPDATE Exemplar
SET status = 'Disponível'
WHERE codigo_exemplar = 'MPBC-001';

-- UPDATE 2: Corrigir o telefone da Leitora 'Ana Silva' (id_leitor = 1) --
UPDATE Leitor
SET telefone = '(21) 99999-0000'
WHERE id_leitor = 1;

-- NOVO UPDATE 3 (Adicionado para cumprir o requisito de 3 UPDATES e corrigir um erro potencial) --
UPDATE Livro
SET editora = 'Editora Nova'
WHERE id_livro = 2;


----------------------- PARTE 3: EXCLUSÕES (DELETE) ------------------------

-- DELETE 1: Excluir a Categoria 'Ficção Científica' (id_categoria = 4).
-- O nome foi corrigido para 'Ficção Científica'.
DELETE FROM Categoria
WHERE nome_categoria = 'Ficção Científica';

-- DELETE 2: Excluir o Autor 'Graciliano Ramos' (id_autor = 5).
-- O nome foi corrigido para 'Graciliano Ramos'.
DELETE FROM Autor
WHERE nome = 'Graciliano Ramos';

-- DELETE 3: Excluir o registro de empréstimo devolvido com id_emprestimo = 1.

-- Passo 3a: Excluir a Devolução primeiro (por causa da FK de Devolucao para Emprestimo)
DELETE FROM Devolucao
WHERE id_emprestimo = 1;

-- Passo 3b: Excluir o Empréstimo (id_emprestimo = 1) que foi devolvido
DELETE FROM Emprestimo
WHERE id_emprestimo = 1;