-- criação banco de dados para cenário E-commerce.
-- create database e_commerce;
use e_commerce;
-- Criar tabela Cliente.
create table Cliente(
idCliente int auto_increment primary key,
Primeiro_Nome varchar(10) not null,
Nome_meio char(3),
Ultimo_nome varchar(20), 
CPF char(11) not null,
Endereço varchar(255),
constraint unique_cpf_cliente unique (CPF)
);
alter table Cliente auto_increment=1;
-- Criar tabela Produto.
create table Produto(
idProduto int auto_increment primary key,
Produto_Nome varchar(30) not null,
Classificação_kids bool default false,
Categoria_produto enum('Eletronico', 'Brinquedos', 'Alimentos', 'Vestimenta', 'Moveis') not null, 
Avaliação float default 0,
Dimensão varchar(15)
);
alter table Produto auto_increment=1;
-- Criar tabela Pedido.
create table Pedido(
idPedido int auto_increment primary key,
idPedido_Cliente int,
Pedido_status enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento', 
Comentario_pedido varchar(255),
Valor_pedido float default 10,
PagamentoDinheiro bool default false,
constraint fk_pedido_cliente foreign key (idPedido_Cliente) references Cliente(idCliente)
				on update cascade
);
alter table Pedido auto_increment=1;
-- Criar tabela Estoque
create table Estoque(
idEstoque int auto_increment primary key,
Local_estoque varchar(255),
Quantidade int default 0
);
alter table Estoque auto_increment=1;
-- Criar tabela Fornecer
create table Fornecedor(
idFornecedor int auto_increment primary key,
Razão_Social varchar(255) not null,
CNPJ char(15) not null,
Contato char(11) not null,
constraint unique_cnpj_fornecedor unique (CNPJ)
);
alter table Fornecedor auto_increment=1;
-- Criar tabela produto_fornecedor
create table produto_fornecedor(
idproduto_fornecedor int,
idfornecedor_produto int,
Quantidade int not null,
primary key (idproduto_fornecedor, idfornecedor_produto),
constraint fk_produto_fornecedor foreign key (idproduto_fornecedor) references Fornecedor(idFornecedor),
constraint fk_fornecedor_produto foreign key (idfornecedor_produto) references Produto(idProduto)
);
-- Criar tabela Vendedor
create table Vendedor(
idVendedor int auto_increment primary key,
Razão_Social varchar(255) not null,
Local_vendedor varchar(255) not null,
Nome_fantasia varchar(255),
CPF char(9),
CNPJ char(15),
Contato char(11) not null,
constraint unique_cnpj_fornecedor unique (CNPJ),
constraint unique_cpf_fornecedor unique (CPF)
);
alter table Vendedor auto_increment=1;
-- Criar tabela produto_vendedor
create table produto_vendedor(
idVendedor int,
idProduto int,
Quantidade_produto int not null,
primary key(idVendedor, idProduto),
constraint fk_produto_vendedor foreign key (idVendedor) references Vendedor(idVendedor),
constraint fk_vendedor_produto foreign key (idProduto) references Produto(idProduto)
);
-- Criar tabela produto_pedido
create table produto_pedido(
idproduto_pedido int,
idpedido int,
Quantidade_produto int default 1,
produto_pedido_status enum ('Disponivel', 'Sem Estoque') default 'Disponivel',  
primary key(idproduto_pedido, idpedido),
constraint fk_produto_pedido_vendedor foreign key (idproduto_pedido) references Vendedor(idVendedor),
constraint fk_produto_pedido_produto foreign key (idpedido) references Pedido(idPedido)
);
-- Criar tabela para localizar o estoque
create table Local_estoque(
idLocal_produto int,
idLocal_estoque int,
Localizacao varchar(255) not null,
primary key(idLocal_produto, idLocal_estoque),
constraint fk_produto_local_vendedor foreign key (idLocal_produto) references Produto(idProduto),
constraint fk_produto_local_produto foreign key (idLocal_estoque) references Estoque(idEstoque)
);-- Criar tabela Pagamentos.
show tables;