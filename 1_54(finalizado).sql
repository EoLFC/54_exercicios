/*select * from pais;
select count(pais) from pais;
select * from pais where pais like '%a';
select distinct ano_de_lancamento from filme;
select titulo, duracao_do_filme, classificacao from filme where duracao_do_filme > 100 and classificacao like 'G';
select classificacao, count(*) from filme group by classificacao;
select distinct preco_da_locacao from filme; /*7*/
/*select * from filme; update filme set ano_de_lancamento = 2007 where titulo like 'B%'; 
set sql_safe_updates=0;
/*select titulo, ano_de_lancamento, classificacao from  filme; update filme set ano_de_lancamento = 2008 where duracao_da_locacao < 4 and classificacao = 'PG';
/*select idioma_id, nome from idioma where nome = 'German'; update filme set idioma_id = 6 where preco_da_locacao > 4;
/*select idioma_id, nome from idioma where nome = 'Japanese'; update filme set idioma_id = 3 where preco_da_locacao = 0.99;
select distinct preco_da_locacao from filme;
select preco_da_locacao, count(*) from filme group by preco_da_locacao;
select distinct preco_da_locacao from filme group by preco_da_locacao > 340;
select filme_id, count(ator_id) as atores from filme_ator group by filme_id order by atores asc;
select filme_id, count(ator_id) as atores from filme_ator group by filme_id having atores > 5 order by atores desc;
select filme_ator.filme_id, count(ator_id) as atores, titulo from filme_ator, filme where idioma_id = 3 and filme_ator.filme_id = filme.filme_id group by filme_ator.filme_id, titulo having atores > 10 order by titulo;
select max(duracao_da_locacao) from filme;
select count(duracao_da_locacao) from  filme where duracao_da_locacao = 7;
select count(duracao_da_locacao) from  filme where idioma_id = 3 and duracao_da_locacao = 7 or idioma_id = 6 and duracao_da_locacao = 7;
select classificacao, preco_da_locacao, count(titulo) from  filme group by classificacao, preco_da_locacao;
select max(duracao_da_locacao), categoria_id from filme_categoria, filme group by categoria_id;
select classificacao, count(titulo) as quantidade_de_filmes from filme group by classificacao;
select count(f.titulo), c.nome from filme as f, categoria c, filme_categoria fc where f.classificacao = "G" and f.filme_id = fc.filme_id and fc.categoria_id= c.categoria_id; group by c.categoria_id;
select count(f.titulo), c.nome from filme as f, categoria c, filme_categoria fc where (f.classificacao = "G" or f.classificacao = 'PG') and f.filme_id = fc.filme_id and fc.categoria_id= c.categoria_id; group by c.categoria_id;
select f.classificacao, fc.categoria_id, count(*) as quantidade_Filmes from filme f, filme_categoria fc where f.filme_id = fc.filme_id group by f.classificacao, fc.categoria_id;
select ator_id, count(filme_id) as filmes from filme_ator group by ator_id order by filmes desc;
select ano_de_lancamento, count(filme_id) as filmes from filme group by ano_de_lancamento order by filmes asc; 
select ano_de_lancamento, count(filme_id) as filmes from filme where filmes > 400 ;
select f.ano_de_lancamento, count(f.titulo) from filme f,categoria c, filme_categoria fc where f.preco_da_locacao > 2.98 and f.filme_id = fc.filme_id and fc.categoria_id= c.categoria_id and nome="Children" group by f.ano_de_lancamento having count(f.titulo) > 100 ;
select p.pais, c.cidade from pais p, cidade c where p.pais like 'A%' and p.pais_id = c.pais_id;
select p.pais_id, p.pais, count(c.cidade) from pais p, cidade c where p.pais_id = c.pais_id group by c.pais_id order by 3 desc
select p.pais_id, p.pais, count(c.cidade) from pais p, cidade c where c.cidade like "a%" and p.pais_id = c.pais_id group by c.pais_id order by 3
select p.pais_id, p.pais, count(c.cidade) from pais p, cidade c where c.cidade like "a%" and p.pais_id = c.pais_id group by p.pais having count(c.cidade) > 3;
select p.pais_id, p.pais, count(c.cidade) from pais p, cidade c where (c.cidade like "a%" or c.cidade like '%r%') and p.pais_id = c.pais_id group by p.pais having count(c.cidade) > 3;
select cl.primeiro_nome, cl.ultimo_nome, cl.endereco_id from cliente cl, endereco e, cidade c, pais p where (cl.endereco_id = e.endereco_id and e.cidade_id = c.cidade_id and p.pais_id = c.pais_id) and p.pais = 'United States';
select count(cliente_id) as Clientes_no_Brasil from cliente cl, endereco e, cidade c, pais p where (cl.endereco_id = e.endereco_id and e.cidade_id = c.cidade_id and p.pais_id = c.pais_id) and p.pais = 'Brazil';
select count(cliente_id) as Clientes_no_pais, p.pais as Pais from cliente cl, endereco e, cidade c, pais p where (cl.endereco_id = e.endereco_id and e.cidade_id = c.cidade_id and p.pais_id = c.pais_id) group by pais
select count(cliente_id) as Clientes_no_pais, p.pais as País from cliente cl, endereco e, cidade c, pais p where (cl.endereco_id = e.endereco_id and e.cidade_id = c.cidade_id and p.pais_id = c.pais_id) group by pais having count(Clientes_no_pais) > 10;
select avg(duracao_da_locacao), idioma_id from filme group by idioma_id;
select count(ator_id) as atores_total, titulo from filme_ator fa, filme f, idioma i where (fa.filme_id = f.filme_id and f.idioma_id = i.idioma_id) and nome = 'English' group by titulo;
select primeiro_nome, ultimo_nome from filme_ator fa, filme f, ator a where fa.filme_id = f.filme_id and fa.ator_id = a.ator_id and titulo = 'BLANKET BEVERLY';
select count(titulo) , c.nome from categoria c,filme_categoria fc, filme f where c.categoria_id = fc.categoria_id and f.filme_id = fc.filme_id group by c.nome having count(titulo) > 60;
select distinct f.titulo, f.filme_id, p.pais from filme f, inventario i, aluguel a, cliente cl, endereco e, cidade c, pais p where (f.filme_id = i.filme_id and i.inventario_id = a.inventario_id and a.cliente_id = cl.cliente_id and cl.endereco_id = e.endereco_id and e.cidade_id = c.cidade_id and c.pais_id = p.pais_id) and p.pais_id = 6 group by f.titulo;
select f.titulo, f.filme_id, p.pais from filme f, inventario i, aluguel a, cliente cl, endereco e, cidade c, pais p where (f.filme_id = i.filme_id and i.inventario_id = a.inventario_id and a.cliente_id = cl.cliente_id and cl.endereco_id = e.endereco_id and e.cidade_id = c.cidade_id and c.pais_id = p.pais_id) and p.pais_id = 22 group by f.titulo;
select a.funcionario_id, count(*) as quantidade_alugueis from aluguel a group by a.funcionario_id;
select a.funcionario_id, fc.categoria_id, count(*) AS quantidade_alugueis from aluguel a, inventario i, filme_categoria fc where a.inventario_id = i.inventario_id and i.filme_id = fc.filme_id group by a.funcionario_id, fc.categoria_id;
select titulo from filme where preco_da_locacao > (select avg(preco_da_locacao) from filme);
select c.categoria_id, SUM(f.duracao_do_filme) as soma_duracao from filme f, filme_categoria fc, categoria c where f.filme_id = fc.filme_id and fc.categoria_id = c.categoria_id group by c.categoria_id;
select year(a.data_de_aluguel) as ano, month(a.data_de_aluguel) as mes, count(*) as quantidade_filmes_locados from aluguel a group by ano, mes order by ano, mes;
select f.classificacao, sum(p.valor) AS total_pago from filme f, aluguel a, pagamento p, inventario i where (a.inventario_id = i.inventario_id and i.filme_id = f.filme_id and a.aluguel_id = p.aluguel_id) and year(a.data_de_aluguel) = 2006 group by f.classificacao;
select month(a.data_de_aluguel) as mes, avg(p.valor) as media_valor_pago from filme f, inventario i, aluguel a, pagamento p where (f.filme_id = i.filme_id and i.inventario_id = a.inventario_id and a.aluguel_id = p.aluguel_id and YEAR(a.data_de_aluguel) = 2005) group by month(a.data_de_aluguel);
select c.cliente_id, sum(p.valor) as total_pago from cliente c, aluguel a, pagamento p, inventario i, filme f where (a.cliente_id = c.cliente_id and a.aluguel_id = p.aluguel_id and a.inventario_id = i.inventario_id and i.filme_id = f.filme_id) and MONTH(a.data_de_aluguel) = 6 and year(a.data_de_aluguel) = 2006 group by c.cliente_id;