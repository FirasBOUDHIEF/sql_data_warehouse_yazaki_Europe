/*
=====================================================
Stored Procedure : Load Bronze Layer (Source-->Bronze)
=====================================================
Scipt Purpose:
 it performs the following actions:
-Truncates The bronze Tables Before loading Data.
Uses The Bulk Insert Command to Load Data from csv Files to Bronze tables.

Parameters
 None
 this stored procedure does not accept any parameters or return any values

Usage Example:
 Exec Bronze.load_bronze;
========================================================================


*/




CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    
    BEGIN TRY
        PRINT '==============================';
        PRINT 'Loading Bronze Layer';
        PRINT '==============================';

        SET @batch_start_time = GETDATE();

        -- =====================================================
        -- 1. PROJECT INFO
        -- =====================================================
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table : bronze.crm_project_info';
        TRUNCATE TABLE bronze.crm_project_info;

        PRINT '>> Inserting Data into : bronze.crm_project_info';
        BULK INSERT bronze.crm_project_info
        FROM 'C:\Users\skyeg\Downloads\project_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK,
            CODEPAGE = '1200'  -- UTF-16
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '-----------------------';

        -- =====================================================
        -- 2. DEFAUT INFO
        -- =====================================================
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table : bronze.crm_defaut_info';
        TRUNCATE TABLE bronze.crm_defaut_info;

        PRINT '>> Inserting Data into : bronze.crm_defaut_info';
        BULK INSERT bronze.crm_defaut_info
        FROM 'C:\Users\skyeg\Downloads\defaut_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK,
            CODEPAGE = '1200'  -- UTF-16
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '-----------------------';

        -- =====================================================
        -- 3. AREA INFO
        -- =====================================================
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table : bronze.crm_area_info';
        TRUNCATE TABLE bronze.crm_area_info;

        PRINT '>> Inserting Data into : bronze.crm_area_info';
        BULK INSERT bronze.crm_area_info
        FROM 'C:\Users\skyeg\Downloads\area_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            DATAFILETYPE = 'widechar'  -- UTF-16
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '-----------------------';

        -- =====================================================
        -- 4. METRICTYPE INFO
        -- =====================================================
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table : bronze.crm_metrictype_info';
        TRUNCATE TABLE bronze.crm_metrictype_info;

        PRINT '>> Inserting Data into : bronze.crm_metrictype_info';
        BULK INSERT bronze.crm_metrictype_info
        FROM 'C:\Users\skyeg\Downloads\metrictype_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            DATAFILETYPE = 'widechar'  -- UTF-16
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '-----------------------';

        -- =====================================================
        -- 5. TARGET INFO
        -- =====================================================
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table : bronze.crm_target_info';
        TRUNCATE TABLE bronze.crm_target_info;

        PRINT '>> Inserting Data into : bronze.crm_target_info';
        BULK INSERT bronze.crm_target_info
        FROM 'C:\Users\skyeg\Downloads\target_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            DATAFILETYPE = 'widechar'  -- UTF-16
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '-----------------------';

        -- =====================================================
        -- 6. PRODUCTION INFO
        -- =====================================================
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table : bronze.crm_production_info';
        TRUNCATE TABLE bronze.crm_production_info;

        PRINT '>> Inserting Data into : bronze.crm_production_info';
        BULK INSERT bronze.crm_production_info
        FROM 'C:\Users\skyeg\Downloads\production_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            DATAFILETYPE = 'widechar'  -- UTF-16
        );




       SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '-----------------------';

        -- =====================================================
        -- FINAL SUMMARY
        -- =====================================================
        SET @batch_end_time = GETDATE();
        PRINT '==============================';
        PRINT 'Loading Bronze Layer is completed';
        PRINT ' - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '==============================';

    END TRY
    BEGIN CATCH
        PRINT '==============================';
        PRINT '❌ ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT '==============================';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT '==============================';
    END CATCH
END
GO
