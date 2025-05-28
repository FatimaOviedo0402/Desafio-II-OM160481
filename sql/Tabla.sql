CREATE TABLE dbo.stg_mobility_sv
(
    dpto            VARCHAR(100)    NULL,   
    cod_dpto        NCHAR(10)       NULL,
    mes             SMALLINT        NULL,
    fecha           DECIMAL(18,0)   NULL,
    parks_pct       DECIMAL(18,0)   NULL,
    retail_pct      DECIMAL(18,0)   NULL,
    grocery_pct     DECIMAL(18,0)   NULL,
    transit_pct     DECIMAL(18,0)   NULL,
    workplaces_pct  DECIMAL(18,0)   NULL,
    residential_pct DECIMAL(18,0)   NULL
);