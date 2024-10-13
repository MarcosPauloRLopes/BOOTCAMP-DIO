use e_commerce;
-- Utilizando concat para refinar os dados juntando o nome do cliente facilitando a visualização dos dados.
select * from cliente;
select idCliente, concat(Primeiro_Nome,' ',Nome_meio,' ',Ultimo_nome) as Cliente, CPF, Endereço from Cliente;
-- Verificando o status do pedido e quantos pedidos o cliente tem.
select idCliente, concat(Primeiro_Nome,' ',Nome_meio,' ',Ultimo_nome) as Cliente, count(*) as Numero_pedidos, Pedido_status 
from cliente join pedido
where idcliente = idpedido_cliente
group by idCliente;
-- Verificando item pedido por cliente informando o nome do produto e o status do pedido
select idcliente, Primeiro_Nome, Produto_nome, Pedido_status
from cliente c join pedido p join produto_pedido pp join produto pro
where c.idcliente = p.idpedido_cliente and p.idpedido = pro.idproduto
group by pro.produto_nome;
-- Verificando locais de estoque q possuem 100 ou mais unidades de produtos.
select Local_estoque, Quantidade from estoque
having Quantidade >= 100;


