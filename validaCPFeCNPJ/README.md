# validaCPFeCNPJ
Rotinas para validação de CPF e CNPJ diretamente no banco de dados mySQL.

## Conteúdo do pacote

##validacpf.sql
Rotina para validação de CPF diretamente no banco de dados mysql. Permite que seja garantida a integridade dos dados inseridos.
Nota do autor: *O uso dessa rotina não dispensa uma eventual validação prévia na própria aplicação.*

###Instruções de implementação:
Para usar a função basta importar o arquivo no banco de dados mySQL.
Recomendo a implementação de uma trigger no banco de dados antes da inserção do registro no banco a fim de realizar a validação do CPF. Nesse caso a coluna do cpf não deverá permitir que o campo seja nulo. Como o mySQL não permite interromper abortar a inserção a partir da execução de uma trigger a sugestão seria que a trigger definisse o valor da coluna como NULL em caso de erro de validação, isso causará com que o insert não possa ser realizado em função da coluna não permitir nulo.

Exemplo:

```
CREATE DEFINER = CURRENT_USER TRIGGER `brasil`.`pessoas_BEFORE_INSERT` BEFORE INSERT ON `pessoas` FOR EACH ROW
BEGIN
IF (NOT validacpf(NEW.cpf)) THEN
   SET NEW.cpf=NULL;
END IF;
END
```
##validacnpj.sql


# Autor
Renato Monteiro Batista


