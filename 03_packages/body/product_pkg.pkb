
create or replace PACKAGE BODY         product_pkg

AS


    /* **************************Create Product Type************************************************ */
  PROCEDURE p_ins_product_type (
  p_prod_type_name VARCHAR2
)

IS
  l_cnt NUMBER;
  l_err_msg VARCHAR2(4000);
BEGIN
    -- Validation of mandatory input parameter
    IF p_prod_type_name IS NULL or length(p_prod_type_name)=0 THEN
      RAISE_APPLICATION_ERROR(
        -20102,
        'Product type name is mandatory '
      );
    END IF;

    -- Validation with leading/trailing space trimming and case-insensitive duplicate detection
    SELECT COUNT(*)
    INTO l_cnt
    FROM product.product_type_t
    WHERE trim(UPPER(prod_type_name)) = trim(UPPER(p_prod_type_name))
      AND del_date IS NULL;

    IF l_cnt > 0 THEN
      RAISE_APPLICATION_ERROR(
        -20103,
        'Product type already exists: '|| p_prod_type_name 
      );
    END IF;

    -- Registers new product types in the master catalog
    INSERT INTO product.product_type_t (
      prod_type_name
    )
    VALUES (
      trim((p_prod_type_name))
    );

        EXCEPTION
      WHEN OTHERS THEN
      -- Captures exceptions and logs error details into product_log_t for auditing and troubleshooting
        l_err_msg := SQLCODE|| ' : '||SQLERRM;
        INSERT INTO product.product_log_t (
          module_name,
          input_value,
          error_message
        )
        VALUES (
          'P_INS_PRODUCT_TYPE',
          trim(p_prod_type_name),
          l_err_msg
        );


  END p_ins_product_type;
-------------------------------------------------------------------------------------------------------------------------------------------

    /* **************************Create Colour****************************************************** */
  PROCEDURE p_ins_colour (
  p_col_name VARCHAR2
)
IS
  l_cnt NUMBER;
   l_err_msg VARCHAR2(4000);
BEGIN
  -- Validation of mandatory input parameter
    IF p_col_name IS NULL THEN
      RAISE_APPLICATION_ERROR(
        -20202,
        'Colour name is mandatory '
      );
    END IF;

    -- Validation with leading/trailing space trimming and case-insensitive duplicate detection
    SELECT COUNT(*)
    INTO l_cnt
    FROM product.colour_t
    WHERE trim(UPPER(col_name)) = trim(UPPER(p_col_name))
      AND del_date IS NULL;

    IF l_cnt > 0 THEN
      RAISE_APPLICATION_ERROR(
        -20203,
        'Colour already exists: '  || p_col_name
      );
    END IF;

    -- Insert
    INSERT INTO product.colour_t (
      col_name
    )
    VALUES (
      p_col_name
    );
    EXCEPTION
      WHEN OTHERS THEN
      --Captures exceptions and logs error details into product_log_t for auditing and troubleshooting
        l_err_msg := SQLCODE|| ' : '||SQLERRM;
        INSERT INTO product.product_log_t (
          module_name,
          input_value,
          error_message
        )
        VALUES (
          'P_INS_COLOUR',
          trim(p_col_name),
          l_err_msg
        );
  END p_ins_colour;

----------------------------------------------------------------------------------------------------------------------------------------------

    /* **************************Create Product Informations**************************************** */
  PROCEDURE p_ins_product(  p_product_name IN VARCHAR2,
  p_prod_type_no IN NUMBER,
  p_col_no IN NUMBER)
IS
  l_cnt number:=0;
  l_prod_prodt_cnt number:=0;
  l_prod_name_cnt number:=0;
  l_col_cnt number:=0;
  l_product_no product.product_t.product_no%TYPE;
   l_err_msg VARCHAR2(4000);
BEGIN

    --Validation of mandatory input parameters
    IF p_product_name IS NULL or length(trim(p_product_name))=0 THEN
      RAISE_APPLICATION_ERROR(
        -20021,
        'Product name is mandatory   ' 
      );
    END IF;

    IF p_prod_type_no IS NULL or length(trim(p_prod_type_no))=0 THEN
      RAISE_APPLICATION_ERROR(
        -20022,
        'Product type number is mandatory  ' 
      );
    END IF;

        IF p_col_no IS NULL  or length(trim(p_col_no
        ))=0  THEN
      RAISE_APPLICATION_ERROR(
        -20022,
        'Colour number is mandatory' 
      );
    END IF;

    -- Validates the existence of product type no in the respective master tables
    SELECT COUNT(*)
    INTO l_cnt
    FROM product.product_type_t
    WHERE trim(prod_type_no) = trim((p_prod_type_no))
      AND del_date IS NULL;

    IF l_cnt = 0 THEN
      RAISE_APPLICATION_ERROR(
        -20023,
        'Invalid product type no '
      );
      end if;
   -- Validates the existence of colour no in the respective master tables
    SELECT COUNT(*)
    INTO l_cnt
    FROM product.colour_t
    WHERE trim(col_no) = trim(p_col_no)
      AND del_date IS NULL;

    IF l_cnt = 0 THEN
      RAISE_APPLICATION_ERROR(
        -20023,
        'Invalid color no ' 
      );
    END IF;

     -- Validation with leading/trailing space trimming and case-insensitive duplicate detection
    SELECT COUNT(*)
    INTO l_prod_name_cnt
    FROM product.product_t
    WHERE trim(UPPER(product_name)) = trim(UPPER(p_product_name))
      AND del_date IS NULL;

         SELECT COUNT(*)
    INTO l_prod_prodt_cnt
    FROM product.product_t
    WHERE trim(UPPER(product_name)) = trim(UPPER(p_product_name))
    and trim(PROD_TYPE_NO)=  trim(p_prod_type_no)
      AND del_date IS NULL;


      select count(1) into l_col_cnt
      from product.prod_col_t
      where trim(product_no) in (select trim(product_no) FROM product.product_t
      WHERE trim(UPPER(product_name)) = trim(UPPER(p_product_name)) AND del_date IS NULL)
      and trim(col_no)=trim(p_col_no) AND del_date IS NULL;

      IF (l_col_cnt > 0 and l_prod_prodt_cnt>0 and l_prod_name_cnt>0) THEN
      RAISE_APPLICATION_ERROR(
        -20004,
        'Product informations already exists:  '  || p_product_name
      );
      elsif (l_col_cnt = 0 and l_prod_prodt_cnt=0 and l_prod_name_cnt=0) then 
           --  Insert data into product_t and prod_col_t 
         INSERT INTO product.product_t (product_name,prod_type_no)VALUES (trim(p_product_name),trim(p_prod_type_no)) returning product_no into l_product_no;
         insert into product.prod_col_t(product_no,col_no) values (l_product_no,trim(p_col_no));
      elsif (l_col_cnt = 0 and l_prod_prodt_cnt>0 and l_prod_name_cnt>0) THEN
            -- add new color for existing product product type combination
             select product_no into l_product_no FROM product.product_t  
             WHERE trim(UPPER(product_name)) = trim(UPPER(p_product_name)) AND del_date IS NULL;
             insert into product.prod_col_t(product_no,col_no) values (l_product_no,trim(p_col_no));
     elsif ( l_prod_prodt_cnt=0 and l_prod_name_cnt>0) then
              RAISE_APPLICATION_ERROR(
        -20005,
        'Product name is already connected other product type.' 
      );
      else
       null;
      END IF;

          EXCEPTION
      WHEN OTHERS THEN
      --Captures exceptions and logs error details into product_log_t for auditing and troubleshooting
        l_err_msg := SQLCODE|| ' : '||SQLERRM;
        INSERT INTO product.product_log_t (
          module_name,
          input_value,
          error_message
        )
        VALUES (
          'P_INS_PRODUCT',
          trim(p_product_name)||','||trim(p_prod_type_no)||','||trim(p_col_no),
          l_err_msg 
        );
  END p_ins_product;

------------------------------------------------------------------------------------------------------------------------------------------------

END product_pkg;
/