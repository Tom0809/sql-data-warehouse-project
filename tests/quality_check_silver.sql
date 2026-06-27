-- ============================================
-- Silver Layer Data Quality Checks
-- ============================================


-- Check country standardization
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;


-- Check for NULLs or negative product cost
SELECT 
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 
   OR prd_cost IS NULL;


-- Check for unwanted spaces in category table
SELECT * 
FROM silver.erp_px_cat_g1v2 
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);


-- Check maintenance standardization
SELECT DISTINCT
    maintenance
FROM silver.erp_px_cat_g1v2;


-- Check for NULLs or duplicates in customer primary key
SELECT 
    cst_id,
    COUNT(*) AS duplicate_count
FROM silver.crm_cust_info
GROUP BY cst_id 
HAVING COUNT(*) > 1 
    OR cst_id IS NULL;


-- Check unwanted spaces in customer names
SELECT
    cst_firstname,
    cst_lastname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname) 
   OR cst_lastname != TRIM(cst_lastname);


-- Check customer gender standardization
SELECT DISTINCT 
    cst_gndr
FROM silver.crm_cust_info;


-- Check customer marital status standardization
SELECT DISTINCT
    cst_marital_status
FROM silver.crm_cust_info;


-- Check invalid sales dates in silver layer
-- Silver dates should already be DATE type, so check NULLs and unrealistic ranges
SELECT 
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt
FROM silver.crm_sales_details
WHERE sls_order_dt IS NULL
   OR sls_ship_dt IS NULL
   OR sls_due_dt IS NULL
   OR sls_order_dt < '1900-01-01'
   OR sls_order_dt > '2050-01-01'
   OR sls_ship_dt < '1900-01-01'
   OR sls_ship_dt > '2050-01-01'
   OR sls_due_dt < '1900-01-01'
   OR sls_due_dt > '2050-01-01';


-- Check for invalid date order
-- Order date should not be later than ship date or due date
SELECT 
    *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;


-- Check sales consistency
-- In silver layer, sales should equal quantity * price
SELECT 
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
   OR sls_sales != sls_quantity * ABS(sls_price)
ORDER BY sls_sales, sls_quantity, sls_price;


-- Identify out-of-range birthdays
SELECT DISTINCT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();


-- Check ERP customer gender standardization
SELECT DISTINCT 
    gen
FROM silver.erp_cust_az12;
