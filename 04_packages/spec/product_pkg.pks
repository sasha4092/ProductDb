
--Package
create or replace PACKAGE         product_pkg 
AUTHID DEFINER
    /* **************************************************************************************************** */
    /*                                                                                                      */
    /*   Methods for Product Objetcs                                                                        */
    /*                                                                                                      */
    /* **************************************************************************************************** */
AS



    /* **************************Create Product Type******************************************************* */
    /*                                                                                                      */
    /*   1. Validation of mandatory input parameter                                                         */
    /*   2. Validation with leading/trailing space trimming and case-insensitive duplicate detection        */
    /*   3. Registers new product types into product_type_t table                                           */
    /*   4. Captures exceptions and logs error details into product_log_t for auditing and troubleshooting  */
    /*                                                                                                      */
    /* **************************************************************************************************** */
  PROCEDURE p_ins_product_type( p_prod_type_name VARCHAR2);





    /* **************************Create Colour************************************************************* */
    /*                                                                                                      */
    /*   1. Validation of mandatory input parameter                                                         */
    /*   2. Validation with leading/trailing space trimming and case-insensitive duplicate detection        */
    /*   3. Registers new Color into colour_t table                                                         */
    /*   4. Captures exceptions and logs error details into product_log_t for auditing and troubleshooting  */
    /*                                                                                                      */
    /* **************************************************************************************************** */
  PROCEDURE p_ins_colour( p_col_name VARCHAR2);




    /* **************************Create Product Info******************************************************  */
    /*                                                                                                      */
    /*   1. Validation of mandatory input parameter                                                         */
    /*   2. Validates the existence of colour and product type no in the respective master tables           */
    /*   3. Validation with leading/trailing space trimming and case-insensitive duplicate detection        */
    /*   4. Registers new product info into product_t,prod_col_t table                                      */
    /*   5. Captures exceptions and logs error details into product_log_t for auditing and troubleshooting  */
    /*                                                                                                      */
    /* **************************************************************************************************** */
  PROCEDURE p_ins_product( p_product_name IN VARCHAR2,
  p_prod_type_no IN NUMBER,
  p_col_no IN NUMBER);


END product_pkg;
/