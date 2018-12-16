CREATE FUNCTION validacnpj(cnpj BIGINT(14) UNSIGNED ZEROFILL) 
RETURNS TINYINT 
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER
BEGIN
/* Funcao de validacao de cnpj diretamente banco mysql */
/* Baseada na discussao publicada em https://goo.gl/DPgYJ8 */

DECLARE INDICE, SOMA, DIG1, DIG2 INT;

/* cnpj com numeros repetidos ou quantidade de digitos insuficiente sao imediatamente recusados */
IF ((cnpj = "11111111111111") OR (cnpj = "22222222222222") OR (cnpj = "33333333333333") OR (cnpj = "44444444444444") OR (cnpj = "55555555555555") OR (cnpj = "66666666666666") OR (cnpj = "77777777777777") OR (cnpj = "88888888888888") OR (cnpj = "99999999999999") OR (cnpj = "00000000000000")) THEN
 RETURN FALSE;
ELSE
 /* Caso nao sejam numeros repetidos, inicia a validacao */
 /* Calculo do digito 1 */
 SET INDICE = 1;
 SET SOMA = 0;
 WHILE (INDICE <= 12) DO
  IF (INDICE <= 4) THEN
   SET SOMA = SOMA + CAST(SUBSTRING(cnpj, INDICE, 1) AS UNSIGNED) * (6 - INDICE);
   SET INDICE = INDICE + 1;
  ELSE
   SET SOMA = SOMA + CAST(SUBSTRING(cnpj, INDICE, 1) AS UNSIGNED) * (14 - INDICE);
   SET INDICE = INDICE + 1;
  END IF;
 END WHILE;
 SET DIG1 = 11 - (SOMA % 11);
 IF DIG1 > 9 THEN
  SET DIG1 = 0;
 END IF;
 /* Calculo do digito 2 */
 SET INDICE = 1;
 SET SOMA = 0;
 WHILE (INDICE <= 13) DO
  IF (INDICE <= 5) THEN
   SET SOMA = SOMA + CAST(SUBSTRING(cnpj, INDICE, 1) AS UNSIGNED) * (7 - INDICE);
   SET INDICE = INDICE + 1;
  ELSE
   SET SOMA = SOMA + CAST(SUBSTRING(cnpj, INDICE, 1) AS UNSIGNED) * (15 - INDICE);
   SET INDICE = INDICE + 1;
  END IF;
 END WHILE;
 SET DIG2 = 11 - (SOMA % 11);
 IF DIG2 > 9 THEN
  SET DIG2 = 0;
 END IF;
 /* Validando */
 IF ((DIG1 = SUBSTRING(cnpj, LENGTH(cnpj)-1, 1)) AND (DIG2 = SUBSTRING(cnpj, LENGTH(cnpj), 1))) THEN
  RETURN TRUE;
 ELSE
  RETURN FALSE;
 END IF;
END IF;
END