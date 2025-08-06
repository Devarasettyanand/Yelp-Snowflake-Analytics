
create or replace database Yelp ;


SELECT CURRENT_ROLE();


USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE DATABASE Yelp;           ---> created database

CREATE OR REPLACE schema  schema_Yelp;    ---> created schema

create or replace table yelp_review        ---> created 🚀table-1 
  (review_text variant) ;

create or replace table yelp_business        ---> created 🚀table-2 
(business_text variant) ;

create or replace FILE FORMAT json_FF      ---> created FILE FORMAT
TYPE = 'json' 
STRIP_OUTER_ARRAY = TRUE ; -- if the JSON is in an array format

SHOW FILE FORMATS ;


COPY INTO yelp_review
FROM 's3://snowflakeprojectyelp/yelp/'    ---> Snowflake treats the path ending in / like a directory and includes all files inside it.
CREDENTIALS=(
    AWS_KEY_ID='AKIATCCPONOBMTSOALR7'
    AWS_SECRET_KEY='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'
)
FILE_FORMAT=(TYPE=JSON);

select * from yelp_review limit 10 ;

COPY INTO yelp_business
FROM 's3://snowflakeprojectyelp/yelp/yelp_academic_dataset_business.json'   ---> to load particulat files 
CREDENTIALS=(
    AWS_KEY_ID='AKIATCCPONOBMTSOALR7'
    AWS_SECRET_KEY='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'
)
FILE_FORMAT=(TYPE=JSON);


select * from yelp_business limit 10 ;

