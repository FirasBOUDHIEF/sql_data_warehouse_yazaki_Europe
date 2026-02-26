

/*
=====================================================
DDL Script : Create Bronze Tables
====================================================
Script Purpose : 
 this script creates tables in the 'bronze' schema .
Run this script to re-define the DDL structure of 'Bronze' tables
====================================================
/*





-- =========================================
-- CRÉATION DES TABLES (du parent vers enfant)
-- =========================================

------------------ Table project-------------------
CREATE TABLE bronze.crm_project_info (
    pjt_id INT IDENTITY(1,1),
    pjt_name NVARCHAR(50) NOT NULL
);
PRINT '✅ Table crm_project_info créée';

------------------ Table defaut-------------------
CREATE TABLE bronze.crm_defaut_info (
    dft_code NVARCHAR(50),
    dft_designation NVARCHAR(50) NOT NULL
);

------------------ Table Area-------------------

CREATE TABLE bronze.crm_area_info (
    area_id INT,
    area_designation NVARCHAR(50) NOT NULL
);


CREATE TABLE bronze.crm_metrictype_info (
    metrictype_id int,
    metrictype_name NVARCHAR(10) NOT NULL
);

CREATE TABLE bronze.crm_target_info (
    trgt_id INT,
    trgt_pjt_id INT,
    trgt_area_id INT,
    trgt_metrictype_id INT,
    trgt_target_value INT,
    trgt_effectiveDate DATE,
);


CREATE TABLE bronze.crm_production_info (
    prd_id INT,
    prd_dft_code NVARCHAR(50),
    prd_pjt_id INT,
    prd_area_id INT,
    prd_date DATE,
    prd_quantite INT,
    prd_defect_quantite INT,

   
);

