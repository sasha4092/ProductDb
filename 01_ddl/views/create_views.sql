-- CREATE VIEWS

CREATE OR REPLACE VIEW product.product_type_v AS
SELECT prod_type_no AS prodt_no,
       prod_type_name AS prodt_name
FROM product.product_type_t
WHERE del_date IS NULL;
/
CREATE OR REPLACE VIEW product.colour_v AS
SELECT col_no, col_name
FROM product.colour_t
WHERE del_date IS NULL;
/
CREATE OR REPLACE VIEW product.product_v AS
SELECT product_no,
       product_name,
       prod_type_no AS prodt_no
FROM product.product_t
WHERE del_date IS NULL;
/
CREATE OR REPLACE VIEW product.product_info_v AS
SELECT
  a.product_no,
  a.product_name,
  c.prodt_name AS product_type,
  LISTAGG(b.col_name, ', ')
    WITHIN GROUP (ORDER BY b.col_name) AS colours
FROM product.product_v a
JOIN product.prod_col_t d ON a.product_no = d.product_no
JOIN product.colour_v b ON d.col_no = b.col_no
JOIN product.product_type_v c ON a.prodt_no = c.prodt_no
WHERE d.del_date IS NULL
GROUP BY a.product_no, a.product_name, c.prodt_name;
