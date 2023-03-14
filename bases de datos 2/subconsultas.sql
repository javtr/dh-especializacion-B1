select * from facturas f inner join clientes c on f.id_cliente = c.id;

select *, 
(select sum(f2.total) from facturas f2 where f2.id_cliente = c.id) as total 
from facturas f inner join clientes c on f.id_cliente = c.id;