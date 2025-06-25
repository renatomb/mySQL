-- Esta função formata um CNPJ no formato XX.XXX.XXX/XXXX-XX
-- O CNPJ deve ser passado como um número inteiro de 14 dígitos, sem traços ou pontos
-- A função retorna o CNPJ formatado como uma string no formato XX.XXX.XXX/XXXX-XX
-- Exemplo de uso:
-- SELECT formataCNPJ(12345678000195); -- Retorna '12.345.678/0001-95'
-- Data: 2018-12-16
-- Autor: Eng. Renato Monteiro Batista (https://renato.ovh) - RMB Informatica (https://rmbinformatica.com)

CREATE FUNCTION formataCNPJ (`cnpj` BIGINT( 14 ) UNSIGNED ZEROFILL) 
RETURNS VARCHAR( 18 ) 
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER 
BEGIN 
RETURN CONCAT(SUBSTRING(cnpj,1,2),'.',SUBSTRING(cnpj,3,3),'.',SUBSTRING(cnpj,6,3),'/',SUBSTRING(cnpj,9,4),'-',SUBSTRING(cnpj,13,2));
END