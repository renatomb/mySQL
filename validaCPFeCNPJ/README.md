# validaCPFeCNPJ
Rotinas para validação de CPF e CNPJ diretamente no banco de dados mySQL.

## Conteúdo do pacote
Rotinas para validações de CPF e CNPJ diretamente no banco de dados mysql. Permite que seja garantida a integridade dos dados inseridos.
Nota do autor: *O uso dessa rotina não dispensa uma eventual validação prévia na própria aplicação.*

## Instruções de implementação:
Para usar a função basta importar o arquivo respectivo no banco de dados mySQL.

### Impedindo que sejam inseridos CPF/CNPJ inválidos no banco
Recomendo a implementação de uma trigger no banco de dados antes da inserção do registro no banco a fim de realizar a validação do CPF/CNPJ. Nesse caso a coluna do cpf/cnpj não deverá permitir que o campo seja nulo. 
NOTA: *Como o mySQL não permite interromper abortar a inserção a partir da execução de uma trigger a sugestão seria que a trigger definisse o valor da coluna como NULL em caso de erro de validação, isso causará com que o insert não possa ser realizado em função da coluna não permitir nulo.*

## Exemplos:
### Trigger para validação do CPF:

```
CREATE DEFINER = CURRENT_USER TRIGGER `brasil`.`pessoas_BEFORE_INSERT` BEFORE INSERT ON `pessoas` FOR EACH ROW
BEGIN
IF (NOT validacpf(NEW.cpf)) THEN
   SET NEW.cpf=NULL;
END IF;
END
```
### Trigger para validação do CNPJ:

```
CREATE DEFINER = CURRENT_USER TRIGGER `brasil`.`empresas_BEFORE_INSERT` BEFORE INSERT ON `empresas` FOR EACH ROW
BEGIN
IF (NOT validacnpj(NEW.cnpj)) THEN
   SET NEW.cnpj=NULL;
END IF;
END
```
Para exemplo completo de tabelas com a validação implementada consulte o arquivo `exemplo.sql`.
# Autor
Renato Monteiro Batista | [Site Pessoal](http://871982.xyz) | [GitHub](https://github.com/renatomb/mySQL/tree/master/validaCPFeCNPJ)


