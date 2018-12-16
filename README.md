# mySQL
Este repositório contém rotinas (funções e procedures) e exemplos de estruturas de dados para o mySQL.

# Conteúdo do pacote
## validaCPFeCNPJ
Rotinas para validação de CPF e CNPJ diretamente no banco de dados mySQL
## formataCPF.sql
Considerando um CPF armazenado no banco de dados como `BIGINT(11)`, essa rotina devolve o CPF mascarado  no formato `999.999.999-99`.
## formataCNPJ.sql
Considerando um CNPJ armazenado no banco de dados como `BIGINT(14)`, essa rotina devolve o CNPJ mascarado no formato `99.999.999/9999-99`.
## formataCEP.sql
Considerando um CEP armazenado no banco de dados como `INT(8)`, essa rotina devolve o CEP mascarado no formato `99999-999`.
## haversine.sql
Calcula a distância em metros entre duas coordenadas  GPS. Sendo `gps_lat`/`gps_lon`, respectivamente, a latitude e longitude do primeiro ponto e `pos_lat`/`pos_lon`, respectivamente, a latitude e longitude do segundo ponto.


# Autor
Renato Monteiro Batista | [Site Pessoal](http://871982.xyz) | [GitHub](https://github.com/renatomb/)


