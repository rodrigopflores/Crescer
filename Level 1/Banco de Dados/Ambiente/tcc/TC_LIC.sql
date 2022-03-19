create table LIC_CIDADE
(
  idcidade INTEGER not null,
  nome     VARCHAR(100) not null,
  uf       VARCHAR(2) not null
);

create table LIC_CLASSE_MATERIAL
(
  idclasse_material INTEGER not null,
  codigo            NUMERIC(4) not null,
  nome              VARCHAR(256) not null,
  grupo             VARCHAR(256) not null
);

create table LIC_CONTRATANTE
(
  idcontratante INTEGER not null,
  nome          VARCHAR(512) not null,
  idcidade      INTEGER not null,
  esfera        CHAR(1) not null
);

create table LIC_EMPRESA
(
  idempresa         INTEGER not null,
  nome              VARCHAR(128) not null,
  idcidade          INTEGER not null,
  cnpj              VARCHAR(20),
  faturamento_anual NUMERIC(12,2) not null,
  data_abertura     DATE,
  situacao          CHAR(1) not null,
  cpf               VARCHAR(20),
  tipo_pessoa       CHAR(1) default 'J' not null
);

create table LIC_LICITACAO
(
  idlicitacao        INTEGER not null,
  idcontratante      INTEGER not null,
  titulo             VARCHAR(100) not null,
  modalidade         CHAR(1) not null,
  tipo_selecao       CHAR(1) not null,
  procedimento       CHAR(1) not null,
  data_fechamento    DATE not null,
  inicio_vigencia    DATE,
  fim_vigencia       DATE,
  situacao           CHAR(1) not null,
  valor_estimado_min NUMERIC(12,2) not null,
  valor_estimado_max NUMERIC(12,2) not null,
  valor_homologado   NUMERIC(12,2) not null
);

create table LIC_MATERIAL
(
  idmaterial        INTEGER not null,
  nome              VARCHAR(756) not null,
  idclasse_material INTEGER,
  codigo            INTEGER
);

create table LIC_ITEM_LICITACAO
(
  iditem_licitacao INTEGER not null,
  idlicitacao      INTEGER not null,
  idmaterial       INTEGER not null,
  quantidade       NUMERIC(9,3) not null,
  observacao       VARCHAR(256),
  valor_minimo     NUMERIC(12,2) not null,
  valor_maximo     NUMERIC(12,2) not null,
  valor_homologado NUMERIC(12,2) not null
);

create table LIC_PROPOSTA
(
  idproposta     INTEGER not null,
  idlicitacao    INTEGER not null,
  idempresa      INTEGER not null,
  situacao       CHAR(1) default 'A' not null,
  data_inscricao DATE,
  valor_inicial  NUMERIC(12,2),
  valor_final    NUMERIC(12,2)
);

create table LIC_PROPOSTA_ITEM
(
  idproposta_item  INTEGER not null,
  valor_unitario   NUMERIC(9,2) not null,
  idproposta       INTEGER not null,
  iditem_licitacao INTEGER not null
);


alter table LIC_CIDADE
  add constraint PK_LIC_CIDADE primary key (IDCIDADE);

create index IX_CLASSE_MATERIAL on LIC_CLASSE_MATERIAL (GRUPO, IDCLASSE_MATERIAL);
alter table LIC_CLASSE_MATERIAL
  add constraint PK_CLASSE_MATERIAL primary key (IDCLASSE_MATERIAL);


create unique index PK_CONTRATANTE on LIC_CONTRATANTE (IDCONTRATANTE);
alter table LIC_CONTRATANTE
  add constraint PK_LIC_CONTRATANTE primary key (IDCONTRATANTE);
alter table LIC_CONTRATANTE
  add constraint FK_LIC_CONTRATANTE_LIC_CIDADE foreign key (IDCIDADE)
  references LIC_CIDADE (IDCIDADE);
alter table LIC_CONTRATANTE
  add check (esfera IN(
        'E',
        'F',
        'M'
    ));


create unique index PK_EMPRESA on LIC_EMPRESA (IDEMPRESA);
alter table LIC_EMPRESA
  add constraint PK_LIC_EMPRESA primary key (IDEMPRESA);
alter table LIC_EMPRESA
  add constraint FK_LIC_EMPRESA_LIC_CIDADE foreign key (IDCIDADE)
  references LIC_CIDADE (IDCIDADE);


alter table LIC_LICITACAO
  add constraint PK_LICITACAO primary key (IDLICITACAO);
alter table LIC_LICITACAO
  add constraint FK_LICITACAO_CONTRATANTE foreign key (IDCONTRATANTE)
  references LIC_CONTRATANTE (IDCONTRATANTE);



create index IX_MATERIAL_CLASSE on LIC_MATERIAL (IDCLASSE_MATERIAL);
alter table LIC_MATERIAL
  add constraint PK_LIC_MATERIAL primary key (IDMATERIAL);
alter table LIC_MATERIAL
  add constraint UK_CLASSE_MATERIAL_CODIGO unique (CODIGO);
alter table LIC_MATERIAL
  add constraint FK_MATERIAL_CLASSE foreign key (IDCLASSE_MATERIAL)
  references LIC_CLASSE_MATERIAL (IDCLASSE_MATERIAL);


alter table LIC_ITEM_LICITACAO
  add constraint PK_ITEM_LICITACAO primary key (IDITEM_LICITACAO);
alter table LIC_ITEM_LICITACAO
  add constraint FK_ITEM_LICITACAO_LICITACAO foreign key (IDLICITACAO)
  references LIC_LICITACAO (IDLICITACAO);
alter table LIC_ITEM_LICITACAO
  add constraint FK_ITEM_LICITACAO_MATERIAL foreign key (IDMATERIAL)
  references LIC_MATERIAL (IDMATERIAL);



comment on column LIC_PROPOSTA.situacao
  is 'S: selecionada, D: desqualificada, N: não selecionada';
alter table LIC_PROPOSTA
  add constraint PK_PROPOSTA primary key (IDPROPOSTA);
alter table LIC_PROPOSTA
  add constraint FK_PROPOSTA_EMPRESA foreign key (IDEMPRESA)
  references LIC_EMPRESA (IDEMPRESA);
alter table LIC_PROPOSTA
  add constraint FK_PROPOSTA_LICITACAO foreign key (IDLICITACAO)
  references LIC_LICITACAO (IDLICITACAO);


alter table LIC_PROPOSTA_ITEM
  add constraint PK_PROPOSTA_ITEM primary key (IDPROPOSTA_ITEM);
alter table LIC_PROPOSTA_ITEM
  add constraint FK_PROPOSTA_ITEM_ITEM_LICITAC foreign key (IDITEM_LICITACAO)
  references LIC_ITEM_LICITACAO (IDITEM_LICITACAO);
alter table LIC_PROPOSTA_ITEM
  add constraint FK_PROPOSTA_ITEM_PROPOSTA foreign key (IDPROPOSTA)
  references LIC_PROPOSTA (IDPROPOSTA);



