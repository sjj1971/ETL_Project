-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "happiness_table" (
    "country" varchar   NOT NULL,
    "ranking" int   NOT NULL,
    "score" float   NOT NULL,
    "social_support" float   NOT NULL,
    "freedom_index" float   NOT NULL,
    "corruption_index" float   NOT NULL,
    CONSTRAINT "pk_happiness_table" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "countrycode_table" (
    "iso_a3" varchar   NOT NULL,
    "iso_a2" varchar   NOT NULL,
    "country" varchar   NOT NULL,
    "continent" varchar   NOT NULL,
    "subregion" varchar   NOT NULL,
    "country_code" varchar   NOT NULL,
    "continent_code" varchar   NOT NULL,
    "subregion_code" varchar   NOT NULL,
    CONSTRAINT "pk_countrycode_table" PRIMARY KEY (
        "iso_a3"
     )
);

CREATE TABLE "capital_table" (
    "country" varchar   NOT NULL,
    "capital" varchar   NOT NULL,
    "lat" float   NOT NULL,
    "lng" float   NOT NULL,
    "iso_a2" varchar   NOT NULL
);

CREATE TABLE "covid_countrycode_table" (
    "iso_code" varchar   NOT NULL,
    "location" varchar   NOT NULL,
    "date" date   NOT NULL,
    "total_cases" float   NOT NULL,
    "total_deaths" float   NOT NULL,
    "total_cases_per_million" float   NOT NULL,
    "total_deaths_per_million" float   NOT NULL,
    "cvd_death_rate" float   NOT NULL
);

CREATE TABLE "merged_covid_happiness_table" (
    "COVID_ranking" varchar   NOT NULL,
    "country" varchar   NOT NULL,
    "country_code" varchar   NOT NULL,
    "subregion" varchar   NOT NULL,
    "total_cases" float   NOT NULL,
    "total_deaths" float   NOT NULL,
    "total_cases_per_million" float   NOT NULL,
    "total_deaths_per_million" float   NOT NULL,
    "happiness_score" float   NOT NULL,
    "COVID_rating" float   NOT NULL,
    "happiness_ranking" float   NOT NULL,
    CONSTRAINT "pk_merged_covid_happiness_table" PRIMARY KEY (
        "COVID_ranking"
     )
);

ALTER TABLE "happiness_table" ADD CONSTRAINT "fk_happiness_table_country" FOREIGN KEY("country")
REFERENCES "countrycode_table" ("country");

ALTER TABLE "happiness_table" ADD CONSTRAINT "fk_happiness_table_ranking_score" FOREIGN KEY("ranking", "score")
REFERENCES "merged_covid_happiness_table" ("happiness_ranking", "happiness_score");

ALTER TABLE "countrycode_table" ADD CONSTRAINT "fk_countrycode_table_iso_a3" FOREIGN KEY("iso_a3")
REFERENCES "covid_countrycode_table" ("iso_code");

ALTER TABLE "countrycode_table" ADD CONSTRAINT "fk_countrycode_table_country" FOREIGN KEY("country")
REFERENCES "capital_table" ("country");

ALTER TABLE "merged_covid_happiness_table" ADD CONSTRAINT "fk_merged_covid_happiness_table_country_code" FOREIGN KEY("country_code")
REFERENCES "covid_countrycode_table" ("iso_code");

