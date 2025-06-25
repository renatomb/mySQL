-- Este script contem exemplos de como calcular a idade de uma pessoa no MySQL
-- A tabela 'sua_tabela' deve conter uma coluna 'nascimento' do tipo DATE
-- A consulta calcula a idade com base na data atual (CURDATE())
-- Certifique-se de substituir 'sua_tabela' pelo nome real da sua tabela
-- Data: 2025-06-25
-- Autor: Renato Monteiro Batista


-- Exemplo de consulta para calcular a idade, pode ser usado para criar uma view ou uma consulta direta
-- A consulta retorna todas as colunas da tabela e a idade calculada
-- A idade é calculada subtraindo a data de nascimento da data atual
-- A função TIMESTAMPDIFF é usada para calcular a diferença em anos
-- A coluna 'nascimento' deve estar no formato DATE
-- Exemplo de uso:

SELECT *, TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) AS idade FROM sua_tabela;

-- Exemplo de consulta para calcular a idade e filtrar por pessoas maiores de 18 anos
-- A consulta retorna todas as colunas da tabela e a idade calculada
-- A idade é calculada subtraindo a data de nascimento da data atual
-- A função TIMESTAMPDIFF é usada para calcular a diferença em anos
-- A coluna 'nascimento' deve estar no formato DATE
-- Exemplo de uso:

SELECT *, TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) AS idade
FROM sua_tabela
WHERE TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) >= 18;

-- Exemplo de consulta para calcular a idade e ordenar por idade
-- A consulta retorna todas as colunas da tabela e a idade calculada
-- A idade é calculada subtraindo a data de nascimento da data atual
-- A função TIMESTAMPDIFF é usada para calcular a diferença em anos
-- A coluna 'nascimento' deve estar no formato DATE
-- A consulta ordena os resultados pela idade em ordem crescente

SELECT *, TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) AS idade
FROM sua_tabela
ORDER BY idade ASC;

-- Exemplo de uma coluna virtual para calcular a idade
-- A coluna virtual 'idade' é criada para calcular a idade com base na data de nascimento
-- A coluna virtual é atualizada automaticamente quando a data de nascimento é alterada
-- A coluna virtual não ocupa espaço em disco, pois é calculada dinamicamente
-- OBS.: Pode não ser suportado por todas as versões do MySQL

ALTER TABLE sua_tabela
ADD COLUMN idade INT GENERATED ALWAYS AS (TIMESTAMPDIFF(YEAR, nascimento, CURDATE())) VIRTUAL;