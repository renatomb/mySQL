# validaCPFeCNPJ
Rotinas para validação de CPF e CNPJ diretamente no banco de dados mySQL.

## Conteúdo do pacote
Rotinas para validações de CPF e CNPJ diretamente no banco de dados mysql. Permite que seja garantida a integridade dos dados inseridos.
Nota do autor: *O uso dessa rotina não dispensa uma eventual validação prévia na própria aplicação.*

## Instruções de implementação:
Para usar a função basta importar o arquivo respectivo no banco de dados mySQL.

### Impedindo que sejam inseridos dados inválidos definindo-os como NULL
Recomendo a implementação de uma trigger no banco de dados antes da inserção do registro no banco a fim de realizar a validação do CPF/CNPJ. Nesse caso a coluna do cpf/cnpj não deverá permitir que o campo seja nulo. 
A implementação desse bloqueio consiste em uma trigger que defina o valor da coluna como NULL em caso não passe na função de validação, isso causará com que o insert não posso ser realizado pois a tabela não aceita aquela coluna como NULL.

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
Para exemplo completo de tabelas com a validação implementada consulte o arquivo `exemplo-null.sql`.

### Impedindo que sejam inseridos dados inválidos e retornando mensagem de erro personalizada
Outra possibilidade de implementação consiste na mesma trigger antes da inserção do registro validando o CPF/CNPJ, porém nesse caso em vez de alterar o valor da coluna para null será retornada uma mensagem de erro personalizada.

## Exemplos:
### Trigger para validação do CPF:

```
CREATE DEFINER = CURRENT_USER TRIGGER `brasil`.`pessoas_BEFORE_INSERT` BEFORE INSERT ON `pessoas` FOR EACH ROW
BEGIN
IF (NOT validacpf(NEW.cpf)) THEN
   SIGNAL SQLSTATE '45000' 
   SET MESSAGE_TEXT = "CPF Invalido!";
END IF;
END
```
### Trigger para validação do CNPJ:

```
CREATE DEFINER = CURRENT_USER TRIGGER `brasil`.`empresas_BEFORE_INSERT` BEFORE INSERT ON `empresas` FOR EACH ROW
BEGIN
IF (NOT validacnpj(NEW.cnpj)) THEN
   SIGNAL SQLSTATE '45000' 
   SET MESSAGE_TEXT = "CNPJ Invalido!";   
END IF;
END
```
Para exemplo completo de tabelas com a validação implementada consulte o arquivo `exemplo-mensagem.sql`.

# Autor
Renato Monteiro Batista | [Site Pessoal](http://871982.xyz) | [GitHub](https://github.com/renatomb/mySQL/tree/master/validaCPFeCNPJ)


