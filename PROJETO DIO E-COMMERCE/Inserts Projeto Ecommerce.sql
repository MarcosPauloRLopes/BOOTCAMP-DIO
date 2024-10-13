use e_commerce;

show tables;

select * from Cliente;
INSERT INTO Cliente(Primeiro_Nome, Nome_meio, Ultimo_nome, CPF, Endereço) VALUES 
('Maria', 'M', 'Silva', 123456789, 'rua silva de prata 29, Carangola - Cidade das flores'),
('Matheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, Centro - Cidade das flores'),
('Ricardo', 'F', 'Silva', 45678913, 'rua alameda vinha 1009, Centro  - Cidade das flores'),
('Julia', 'S', 'França', 789123456, 'rua lareijras 861, Centro  - Cidade das flores'),
('Roberta', 'G', 'Assis', 98745631, 'avenidade koller 19, Centro - Cidade das flores'),
('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 29, Centro - Cidade das flores');

select * from Produto;
INSERT INTO Produto (Produto_Nome, Classificação_kids, Categoria_produto, Avaliação, Dimensão) VALUES 
('Fone de ouvido', false, 'Eletronico', '4', null),
('Barbie Elsa', true, 'Brinquedos', '3', null),
('Body Carters', true, 'Vestimenta', '5', null),
('Microfone Vedo - Youtuber', false, 'Eletronico', '4', null),
('Sofá retratil', false, 'Moveis', '3', '3x57x80'),
('Farinha de arroz', false, 'Alimentos', '2', null),
('Fire Stick Amazon', false, 'Eletronico', '3', null);

select * from pedido;
INSERT INTO Pedido (Pedido_Cliente, Pedido_status, Comentario_pedido, Valor_pedido, PagamentoDinheiro) VALUES
(1, 'Em processamento', 'Compra via aplicativo', null, 1),
(2, 'Em processamento', 'Compra via aplicativo', null, 1),
(2, 'Em processamento', 'Compra via aplicativo', 50, 0),
(3, 'Confirmado', null, null, 1),
(4, 'Em processamento', 'Compra via website', null, 0);

select * from produto_pedido;
INSERT INTO produto_pedido (idproduto_pedido, idpedido, quantidade_produto,produto_pedido_status) VALUES
(1,1,2,null),
(2,1,1,null),
(3,2,1,null);

select * from estoque;
INSERT INTO estoque (Local_estoque, Quantidade) VALUES
('Rio de Janeiro',1000),
('Rio de Janeiro',500),
('São Paulo',10),
('São Paulo',100),
('São Paulo',10),
('Brasília',60);

select * from local_estoque;
INSERT INTO local_estoque(idLocal_produto, idLocal_estoque, Localizacao) VALUES
(1,2,'RJ'),
(2,6,'GO');

select * from fornecedor;
INSERT INTO fornecedor(Razão_Social, CNPJ, Contato) VALUES
('Almeida e filhoes', 123456789123456, 21985474),
('Eletronicos Silva', 854519649153457, 21985484),
('Eletronicos Valva', 934567893934695, 21975474);

select * from produto_fornecedor;
INSERT INTO produto_fornecedor(idproduto_fornecedor, idfornecedor_produto, quantidade) VALUES
(1,1,500),
(1,2,400),
(2,4,633),
(3,3,5),
(2,5,10);

select * from vendedor;
INSERT INTO vendedor (Razão_Social, Local_vendedor, Nome_Fantasia, CPF, CNPJ, Contato) VALUES
('Tech eletronics','Rio de Janeiro', null, null, 123456789456321, 219946287),
('Botique Durgas', 'Rio de Janeiro', null, 123456783, null, 219567895),
('Kids World', 'São Paulo', null, null, 456789123654485, 1198657484);

select * from produto_vendedor;
INSERT INTO produto_vendedor (idVendedor, idProduto, Quantidade_produto) VALUES
(1,6,80),
(2,7,10);