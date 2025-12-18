
-- test the procedures 
-- Product type 
-- created collection type and stored the input values to test and process


DECLARE
type t_prod_type is table of varchar2(20);
i_prod_type t_prod_type:=t_prod_type(
'',  -- should raise error
null, -- should raise error
'Sofa', --already existing product type - should raise error
'Desk ', --new product type with space at the end. - empty spaces should be removed and saved. 
'Shelf'  --Shelf- new product type - Should get saved
);
BEGIN
  for i in 1..i_prod_type.count loop
  --dbms_output.put_line(i_prod_type(i));
  product.product_pkg.p_ins_product_type(i_prod_type(i));
  end loop;
END;
/

select * from product.product_type_t;
select * from product.product_log_t;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Colour 
-- created collection type and stored the input values to test and process


DECLARE
type t_colour is table of varchar2(20);
i_colour t_colour:=t_colour(
'', --  should raise error
null, --  should raise error
'Red', --already existing Colour - should raise error
'Brown ',  --new Colour with space at the end. - empty spaces should be removed and saved. 
'Beige' --Beige- new Colour - Should get saved
);
BEGIN
  for i in 1..i_colour.count loop
  --dbms_output.put_line(i_prod_type(i));
  product.product_pkg.p_ins_colour(i_colour(i));
  end loop;
END;
/


select * from product.colour_t;
select * from product.product_log_t;
------------------------------------------------------------------------------------------------------------------------------------------------
-- Product Information
--Add a new product. This endpoint should accept: name, product type id, colour id. 
-- created collection type and stored the input values to test and process


DECLARE
type t_product_info is record( product_name varchar2(100),  prod_type_no number,  col_no   number);
type t_product_info_tab is table of t_product_info;
i_product_info_tab t_product_info_tab:= t_product_info_tab(
t_product_info(null,6,6), -- null product name - error
t_product_info('Home Desk',null,6), -- null product type -error
t_product_info('Home Desk',6,null), -- null colour --error
t_product_info('Home Desk',666,6),  -- invalid product type no - error
t_product_info('Home Desk',6,666),  -- invalid colour no - error
t_product_info('Luxury Sofa',1,1),  -- existing product name,product type no, col no - error
t_product_info('Office Chair',1,1), -- existing product name , new product type no, new col no - error since one product= one product type
t_product_info('Dining Table',3,5), -- existing product name , existing product type no, new col no - sucess-colour should get added to product
t_product_info('Home Desk',6,6)     -- new product information - sucess
);

BEGIN
  for i in 1..i_product_info_tab.count loop
  --dbms_output.put_line(i_prod_type(i));
  product.product_pkg.p_ins_product(i_product_info_tab(i).product_name,i_product_info_tab(i).prod_type_no,i_product_info_tab(i).col_no);
  end loop;
END;
/


SELECT * FROM product.product_t;
SELECT * FROM product.prod_col_t;
SELECT * FROM product.product_info_v;
select * from product.product_log_t;
----------------------------------------------------------------------------------------------------------

-- •	Returns a list of products. The payload must contain: id, name. 

SELECT * FROM product.product_type_v;
SELECT * FROM product.colour_v;
SELECT PRODUCT_NO, PRODUCT_NAME FROM product.product_v;

-- •	Returns details about a product by id. The payload must contain: id, name, product type, colours associated with that product. 
SELECT * FROM product.product_info_v;

------------------------------------------------------------------------------------------------------------------