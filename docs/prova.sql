/* Questão 1*/

/*a*/
CREATE TABLE CATEGORIA
(
    CODIGO_CATEGORIA NUMBER(9),
    DESCRICAO VARCHAR(100),
    PRIMARY KEY (CODIGO_CATEGORIA)

);
/*b*/
CREATE TABLE LIVROS_CATEGORIA
(
    COD_PRODUTO NUMBER(5),
    CODIGO_CATEGORIA NUMBER(9),
    PRIMARY KEY (CODIGO_CATEGORIA,COD_PRODUTO),
    CONSTRAINT FK_CODIGO_CATEGORIA FOREIGN KEY (CODIGO_CATEGORIA) REFERENCES CATEGORIA (CODIGO_CATEGORIA),
    CONSTRAINT FK_COD_PRODUTO FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTOS (COD_PRODUTO)
);


/*c*/
insert into CATEGORIA (CODIGO_CATEGORIA, DESCRICAO) 
select 1, 'Culinária' from dual
union all select 2, 'Tecnologia' from dual;


/*d*/
insert into LIVROS_CATEGORIA (CODIGO_CATEGORIA, COD_PRODUTO) 
select 1, 1 from dual
union all select 2, 1 from dual
union all select 2, 2 from dual;



/* Questão 2*/

/*a*/
SELECT * FROM PRODUTOS INNER JOIN LIVROS_CATEGORIA 
ON PRODUTOS.COD_PRODUTO = LIVROS_CATEGORIA.COD_PRODUTO WHERE LIVROS_CATEGORIA.CODIGO_CATEGORIA = 1 AND PRODUTOS.IMPORTADO = 'N';

/*b*/
SELECT NOME, EMAIL, NIVEL_PRIVILEGIO  FROM USUARIOS INNER JOIN ADMINISTRADORES
ON USUARIOS.COD_USUARIO = ADMINISTRADORES.COD_ADMINISTRADOR WHERE EMAIL LIKE '%@pucrs.br';

/*c*/
SELECT  ESTADOS.NOME FROM ESTADOS INNER JOIN CIDADES 
ON ESTADOS.UF = CIDADES.UF INNER JOIN ENDERECOS
ON CIDADES.COD_CIDADE = ENDERECOS.COD_CIDADE GROUP BY ESTADOS.UF, ESTADOS.NOME HAVING COUNT(ESTADOS.UF)>1;



/* Questão 3*/
DELETE FROM ESTADOS WHERE regiao = 'S';
/* Esse commando delete os estados em que a região é igual a S.
Etretanto a primary key uf é ultilizada com foreign key
da tabela cidade, portanto quando tentamos executar o commando ele falha com o erro

ORA-02292: integrity constraint (SYSTEM.FK_EST_CID) violated - child record found

dizendo que há cidades referenciandos estados da região S. E se recusando a efetivamente
executar o commando a fim de manter a integridade do banco. Evitando que cidade referenciam um estado que não existe.




*/


