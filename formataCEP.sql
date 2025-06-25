-- Esta função formata um CEP no formato XXXXX-XXX
-- O CEP deve ser passado como um número inteiro de 8 dígitos, sem traços ou pontos
-- A função retorna o CEP formatado como uma string no formato XXXXX-XXX
-- Exemplo de uso:
-- SELECT formataCEP(12345678); -- Retorna '12345-678'
-- Data: 2018-12-16
-- Autor: Eng. Renato Monteiro Batista (https://renato.ovh) - RMB Informatica (https://rmbinformatica.com)

CREATE FUNCTION formataCEP (`cep` INT( 8 ) UNSIGNED ZEROFILL) 
RETURNS VARCHAR( 9 ) 
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER 
BEGIN 
RETURN CONCAT(SUBSTRING(cep,1,5),'-',SUBSTRING(cep,6,3));
END