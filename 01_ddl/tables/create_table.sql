
-- Create tables

CREATE TABLE product.product_type_t (
    prod_type_no NUMBER generated always as IDENTITY PRIMARY KEY,
    prod_type_name VARCHAR2(100) NOT NULL UNIQUE,
    ins_date DATE DEFAULT SYSDATE NOT NULL,
    upd_date DATE DEFAULT SYSDATE NOT NULL,
    del_date DATE
);


COMMENT ON TABLE product.product_type_t IS 'Stores information about the product category/type';

COMMENT ON COLUMN product.product_type_t.prod_type_no IS 'Auto generated product type no using sequence';

COMMENT ON COLUMN product.product_type_t.prod_type_name IS 'Name of the product type';


CREATE TABLE product.colour_t (
    col_no NUMBER generated always as IDENTITY PRIMARY KEY,
    col_name VARCHAR2(100) NOT NULL UNIQUE,
    ins_date DATE DEFAULT SYSDATE NOT NULL,
    upd_date DATE DEFAULT SYSDATE NOT NULL,
    del_date DATE
);



COMMENT ON TABLE product.colour_t IS 'Stores master data of the colours can be used for the products ';

COMMENT ON COLUMN product.colour_t.col_no IS 'Auto generated Colour no using sequence';

COMMENT ON COLUMN product.colour_t.col_name IS 'Name of the colour';






CREATE TABLE product.product_t (
    product_no NUMBER generated always as IDENTITY PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL UNIQUE,
    prod_type_no NUMBER NOT NULL,
    ins_date DATE DEFAULT SYSDATE NOT NULL,
    upd_date DATE DEFAULT SYSDATE NOT NULL,
    del_date DATE,
    CONSTRAINT fk_product_type
      FOREIGN KEY (prod_type_no)
      REFERENCES product.product_type_t(prod_type_no)
      ON DELETE CASCADE
);


COMMENT ON TABLE product.product_t IS 'Stores master data of the products and the related product type ';

COMMENT ON COLUMN product.product_t.product_no IS 'Auto generated product no using sequence';

COMMENT ON COLUMN product.product_t.product_name IS 'Name of the product';

COMMENT ON COLUMN product.product_t.prod_type_no IS 'Connected product type of the product';




CREATE TABLE product.prod_col_t (
    product_no NUMBER NOT NULL,
    col_no NUMBER NOT NULL,
    ins_date DATE DEFAULT SYSDATE NOT NULL,
    upd_date DATE DEFAULT SYSDATE NOT NULL,
    del_date DATE,
    CONSTRAINT pk_prod_col PRIMARY KEY (product_no, col_no),
    CONSTRAINT fk_pc_product
      FOREIGN KEY (product_no)
      REFERENCES product.product_t(product_no)
      ON DELETE CASCADE,
    CONSTRAINT fk_pc_colour
      FOREIGN KEY (col_no)
      REFERENCES product.colour_t(col_no)
      ON DELETE CASCADE
);

COMMENT ON TABLE product.prod_col_t IS 'Stores the products and its connected colours ';

COMMENT ON COLUMN product.prod_col_t.product_no IS 'product no from product_t table';

COMMENT ON COLUMN product.prod_col_t.col_no IS 'Colour no from colour_t table';



CREATE TABLE product.product_log_t (
  log_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  module_name   VARCHAR2(50),
  input_value   VARCHAR2(200),
  error_message VARCHAR2(4000),
  reg_date      DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON TABLE product.product_log_t IS 'Used to store logs for transactions';