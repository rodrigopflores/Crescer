/*
  Projeto Crescer - Treinamento de banco de dados 
  ---
  Laboratório 1: Comandos DDL, criação de tabelas e constraints.  
*/

Create table CidadeEX
(
  IDCidade  int         not null,
  Nome      varchar(30) not null,
  UF        varchar(2)  not null,
    constraint PK_CidadeEX1 primary key (IDCidade)
);	

Create table AssociadoEX
(
  IDAssociado    int         not null,
  Nome           varchar(50) not null,
  DataNascimento date    not null,
  Sexo           char(1)     not null,
  CPF            varchar(11) ,
  Endereco       varchar(35),
  Bairro         varchar(25),
  Complemento    varchar(20),
  IDCidade       int,
     constraint PK_AssociadoEX primary key (IDAssociado),
	 constraint FK_AssociadoEX foreign key (IDCidade)
	    references CidadeEX (IDCidade)
);