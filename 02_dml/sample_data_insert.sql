
--  Insert master data 

INSERT INTO product.product_type_t (prod_type_name) VALUES ('Sofa');
INSERT INTO product.product_type_t (prod_type_name) VALUES ('Chair');
INSERT INTO product.product_type_t (prod_type_name) VALUES ('Table');
INSERT INTO product.product_type_t (prod_type_name) VALUES ('Bed');
INSERT INTO product.product_type_t (prod_type_name) VALUES ('Cupboard');
--INSERT INTO product.product_type_t (prod_type_name) VALUES ('Desk');
--INSERT INTO product.product_type_t (prod_type_name) VALUES ('Shelf');
--INSERT INTO product.product_type_t (prod_type_name) VALUES ('Stool');
--INSERT INTO product.product_type_t (prod_type_name) VALUES ('Cabinet');
--INSERT INTO product.product_type_t (prod_type_name) VALUES ('Drawer');


INSERT INTO product.colour_t (col_name) VALUES ('Blue');
INSERT INTO product.colour_t (col_name) VALUES ('Red');
INSERT INTO product.colour_t (col_name) VALUES ('Green');
INSERT INTO product.colour_t (col_name) VALUES ('Black');
INSERT INTO product.colour_t (col_name) VALUES ('White');
--INSERT INTO product.colour_t (col_name) VALUES ('Brown');
--INSERT INTO product.colour_t (col_name) VALUES ('Beige');
--INSERT INTO product.colour_t (col_name) VALUES ('Grey');
--INSERT INTO product.colour_t (col_name) VALUES ('Ruby');
--INSERT INTO product.colour_t (col_name) VALUES ('Yellow');


INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Luxury Sofa', 1);
INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Office Chair', 2);
INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Dining Table', 3);
INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('King Bed', 4);
INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Kitchen Cupboard', 5);
--INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Home Desk', 6);
--INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Wall Shelf', 7);
--INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Bar Stool', 8);
--INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Living Room Cabinet', 9);
--INSERT INTO product.product_t (product_name, prod_type_no) VALUES ('Bedroom Drawer', 10);


INSERT INTO product.prod_col_t (product_no, col_no) VALUES (1, 1);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (1, 2);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (2, 2);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (2, 3);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (3, 3);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (3, 4);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (4, 4);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (4, 5);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (5, 5);
INSERT INTO product.prod_col_t (product_no, col_no) VALUES (5, 1);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (6, 4);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (6, 7);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (7, 7);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (7, 8);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (8, 2);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (8, 9);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (9, 1);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (9, 4);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (9, 5);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (10, 6);
--INSERT INTO product.prod_col_t (product_no, col_no) VALUES (10, 3);
