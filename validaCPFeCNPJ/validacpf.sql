CREATE FUNCTION validacpf(cpf bigint(11) UNSIGNED ZEROFILL) 
RETURNS TINYINT 
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER
BEGIN
/* Funcao de validacao de cpf diretamente no banco mysql */
/* Baseada na discussao publicada em https://goo.gl/DPgYJ8 */
DECLARE INDICE, SOMA, DIG1, DIG2 INT;
/* cpf com numeros repetidos ou quantidade de digitos insuficiente sao imediatamente recusados */
IF ((cpf = "11111111111") OR (cpf = "22222222222") OR (cpf = "33333333333") OR (cpf = "44444444444") OR (cpf = "55555555555") OR (cpf = "66666666666") OR (cpf = "77777777777") OR (cpf = "88888888888") OR (cpf = "99999999999") OR (cpf = "00000000000")) THEN
 RETURN FALSE;
ELSE
 /* Caso nao sejam numeros repetidos, inicia a validacao */
 SET INDICE = 1;
 SET SOMA = 0;
 WHILE (INDICE <= 9) DO
  SET SOMA = SOMA + CAST(SUBSTRING(cpf, INDICE, 1) AS UNSIGNED) * (11 - INDICE);
  SET INDICE = INDICE + 1;
 END WHILE;
 SET DIG1 = 11 - (SOMA % 11);
 IF DIG1 > 9 THEN
  SET DIG1 = 0;
 END IF;
 SET INDICE = 1;
 SET SOMA = 0;
 WHILE (INDICE <= 10) DO
  SET SOMA = SOMA + CAST(SUBSTRING(cpf, INDICE, 1) AS UNSIGNED) * (12 - INDICE);
  SET INDICE = INDICE + 1;
 END WHILE;
 SET DIG2 = 11 - (SOMA % 11);
 IF DIG2 > 9 THEN
  SET DIG2 = 0;
 END IF;
 IF ((DIG1 = SUBSTRING(cpf, LENGTH(cpf)-1, 1)) AND (DIG2 = SUBSTRING(cpf, LENGTH(cpf), 1))) THEN
  RETURN TRUE;
 ELSE
  RETURN FALSE;
 END IF;
END IF;
END