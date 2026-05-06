use DW_SupplyChain
--Criando a tabela de Produtos:
create table Dim_Produtos (
	Id_Produtos int primary key identity(1,1),
	Desc_Produto nvarchar(255) not null,
	Cod_Produto  as 'P' + right(concat('0000',cast(Id_produtos as varchar(10))),4) persisted,
	Unidade_Medida varchar(10) not null
)

-- Inserindo o Registro de segurnaça:
--Habilitando a inserção manual:
set identity_insert Dim_Produtos on

insert into Dim_Produtos(Id_Produtos,Desc_Produto,Unidade_Medida)
	values(-1,'NÃO INFORMADO','N/A')

--Desabilitando a inserção manual:
set identity_insert Dim_Produtos off
/* Nota: O registro -1 gera o código P00-1 devido à função RIGHT + P, servindo como identificador 
técnico de integridade para dados nulos */

------------------------------------------------------------------------------
-- Criando tabela Dim_localidade:

use DW_SupplyChain
Create table Dim_Localidade(
	Id_Localidade int primary key identity(1,1),
	Localizacao varchar(10) not null
)

-- Inserindo o Registro de segurnaça:
--Habilitando a inserção manual:
set identity_insert Dim_Localidade on

insert into Dim_Localidade(Id_Localidade,Localizacao)
	values(-1,'N/A')

--Desabilitando a inserção manual:
set identity_insert Dim_Localidade off

select * from Dim_Localidade

-----------------------------------------------------------------------------

--Criando tabela Dim_Categoria:

Create table Dim_Categoria (
	Id_Categoria int primary key identity(1,1),
	Categoria varchar(50) not null,
	Classe_Risco nvarchar(50) not null
)
-- Inserindo o Registro de Segurança:
-- Habilitando inserção manual no identity
set identity_insert Dim_Categoria on

insert into Dim_Categoria (Id_Categoria,categoria,Classe_Risco)
	values(-1,'NÃO INFORMADO','NÃO INFORMADO')
-- Desabilitando inserção manual no identity
set identity_insert Dim_Categoria off

--select * from Dim_Categoria

-------------------------------------------------------------------------------

--Criando a tabela Dim_setores:
Create table Dim_Setores(
	Id_Setor int primary key identity(1,1),
	Setor_Destino varchar(50) not null
)
-- Inserindo o Registro de Segurança:
-- Habilitando inserção manual no identity
set identity_insert Dim_Setores on

insert into Dim_Setores(Id_Setor,Setor_Destino)
	values(-1,'NÃO INFORMADO')

-- Desabilitando inserção manual no identity
set identity_insert Dim_Setores off

--select * from Dim_Setores
--drop table Dim_Setores
--------------------------------------------------------------------------------
--Criando Tabela Fact_pedidos:

Create table Fact_Pedidos(
	Id_Movimentacao int not null constraint  PK_Fact_pedidos Primary key nonclustered,
	Id_Produtos int not null,
	Id_Localidade int not null,
	Id_Categoria int not null,
	Id_Setor int not null,
	Peso_Bruto float not null,
	Data_Pedido date not null,
	Num_pedido varchar(50) not null,
	Status_Nf nvarchar(50) not null,
	Data_prev_chegada date not null,
	Data_real_Chegada date,
	Qtd_Volume int not null,
	Qtd_Por_Embalagem int not null,
	QTD_Total int not null,
	Custo_unitario float not null
);
create Clustered index IX_Fact_Pedidos_Data on Fact_pedidos (Data_Pedido);

alter table fact_pedidos
add constraint PFK_Id_Localidade foreign key (Id_localidade) references Dim_Localidade (Id_Localidade);

alter table fact_pedidos
add constraint PFK_Id_Produtos foreign key (Id_Produtos) references Dim_Produtos(Id_Produtos);

alter table fact_pedidos
add constraint PFK_Id_Categoria foreign key (Id_Categoria) references Dim_Categoria(ID_Categoria);

alter table fact_pedidos
add constraint PFK_Id_Setor foreign key (Id_Setor) references Dim_Setores(Id_Setor);


--select * from fact_Pedidos

--drop table Fact_Pedidos