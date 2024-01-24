-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yqQNhh
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE "Employee_salary"
CREATE TABLE "Employee_salary" (
    "id_employee" int   NOT NULL,
    "job_title" varchar(200)   NOT NULL,
    "salary" decimal   NOT NULL,
    "id_currency" int   NOT NULL,
    "salary_in_usd" decimal   NOT NULL,
    "id_work_year" int   NOT NULL,
    "id_experience_level" int   NOT NULL,
    "id_remote_ratio" int   NOT NULL,
    "id_company" int   NOT NULL,
    CONSTRAINT "pk_Employee_salary" PRIMARY KEY (
        "id_employee"
     )
);

CREATE TABLE "work_year" (
    "id_work_year" int   NOT NULL,
    "work_year" int   NOT NULL,
    CONSTRAINT "pk_work_year" PRIMARY KEY (
        "id_work_year"
     )
);

CREATE TABLE "Experience_level" (
    "id_experience_level" int   NOT NULL,
    "abbreviation" varchar(5)   NOT NULL,
    "description" varchar(100)   NOT NULL,
    "Comment" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Experience_level" PRIMARY KEY (
        "id_experience_level"
     )
);
DROP TABLE "Company_Data"
CREATE TABLE "Company_Data" (
    "id_company" int   NOT NULL,
    "id_employment_type" int   NOT NULL,
    "id_company_location" int   NOT NULL,
    "id_company_size" int   NOT NULL,
    CONSTRAINT "pk_Company_Data" PRIMARY KEY (
        "id_company"
     )
);

CREATE TABLE "Employment_type" (
    "id_employment_type" int   NOT NULL,
    "abbreviation" varchar(5)   NOT NULL,
    "description" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Employment_type" PRIMARY KEY (
        "id_employment_type"
     )
);

CREATE TABLE "remote_ratio" (
    "id_remote_ratio" int   NOT NULL,
    "remote_ratio" int   NOT NULL,
    "remote_ratio_description" varchar(50)   NOT NULL,
    CONSTRAINT "pk_remote_ratio" PRIMARY KEY (
        "id_remote_ratio"
     )
);
DROP TABLE "company_size"
CREATE TABLE "company_size" (
    "id_company_size" int   NOT NULL,
    "company_size" varchar(5)   NOT NULL,
    "company_size_description" varchar(50)   NOT NULL,
    "company_size_comment" varchar(50)   NOT NULL,
    CONSTRAINT "pk_company_size" PRIMARY KEY (
        "id_company_size"
     )
);

CREATE TABLE "salary_currency" (
    "id_currency" int   NOT NULL,
    "salary_currency" varchar(5)   NOT NULL,
    "currency_description" varchar(100)   NOT NULL,
    CONSTRAINT "pk_salary_currency" PRIMARY KEY (
        "id_currency"
     )
);

DROP TABLE "company_location_description"
CREATE TABLE "company_location_description" (
    "id_company_location" int   NOT NULL,
    "location_abbv" varchar(5)   NOT NULL,
    "location_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_company_location_description" PRIMARY KEY (
        "id_company_location"
     )
);

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_salary_id_currency" FOREIGN KEY("id_currency")
REFERENCES "salary_currency" ("id_currency");

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_salary_id_work_year" FOREIGN KEY("id_work_year")
REFERENCES "work_year" ("id_work_year");

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_salary_id_experience_level" FOREIGN KEY("id_experience_level")
REFERENCES "Experience_level" ("id_experience_level");

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_salary_id_remote_ratio" FOREIGN KEY("id_remote_ratio")
REFERENCES "remote_ratio" ("id_remote_ratio");

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_salary_id_company" FOREIGN KEY("id_company")
REFERENCES "Company_Data" ("id_company");

ALTER TABLE "Company_Data" ADD CONSTRAINT "fk_Company_Data_id_employment_type" FOREIGN KEY("id_employment_type")
REFERENCES "Employment_type" ("id_employment_type");

ALTER TABLE "Company_Data" ADD CONSTRAINT "fk_Company_Data_id_company_location" FOREIGN KEY("id_company_location")
REFERENCES "company_location_description" ("id_company_location");

ALTER TABLE "Company_Data" ADD CONSTRAINT "fk_Company_Data_id_company_size" FOREIGN KEY("id_company_size")
REFERENCES "company_size" ("id_company_size");



