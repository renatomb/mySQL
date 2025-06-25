-- Esta função formata um CPF no formato XXX.XXX.XXX-XX
-- O CPF deve ser passado como um número inteiro de 11 dígitos, sem traços ou pontos
-- A função retorna o CPF formatado como uma string no formato XXX.XXX.XXX-XX
-- Exemplo de uso:
-- SELECT formataCPF(12345678909); -- Retorna '123.456.789-09'
-- Data: 2018-12-16
-- Autor: Eng. Renato Monteiro Batista (https://renato.ovh) - RMB Informatica (https://rmbinformatica.com)

CREATE FUNCTION formataCPF (`cpf` BIGINT( 11 ) UNSIGNED ZEROFILL) 
RETURNS VARCHAR( 14 ) 
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER 
BEGIN 
RETURN CONCAT(SUBSTRING(cpf,1,3),'.',SUBSTRING(cpf,4,3),'.',SUBSTRING(cpf,7,3),'-',SUBSTRING(cpf,10,2));
END