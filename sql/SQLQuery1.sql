CREATE DATABASE MovilityCOVID_SV2020;
USE MovilityCOVID_SV2020;

CREATE TABLE stg_mobility_sv (
    region           VARCHAR(100),
    fecha            DATE,
    parks_pct        FLOAT,
    retail_pct       FLOAT,
    grocery_pct      FLOAT,
    transit_pct      FLOAT,
    workplaces_pct   FLOAT,
    residential_pct  FLOAT
);
