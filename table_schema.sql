drop table happiness_table;
drop table countrycode_table;
drop table capital_table;
drop table covid_cases;
drop table completed_table;

create table happiness_table(
	country varchar(256) primary key,
	ranking int,
	score float,
	social_support float,
	freedom_index float,
	corruption_index float
);

create table countrycode_table(
	iso_a3 varchar not null primary key,
	iso_a2 varchar,
	country varchar,
	continent varchar,
	subregion varchar,
	country_code int,
	continent_code int,
	subregion_code int
);

create table covid_cases (
	Country_Region varchar not null PRIMARY KEY,
	Population float,
	TotalCases float,
	TotalDeaths float,
	TotalTests float
);

create table capital_table (
	country varchar not null primary key,
	capital varchar,
	lat float,
	lng float,
	iso_a2 varchar
	)

create table completed_table (
	COVID_Ranking int,
	Country varchar,
	Country_Code varchar,
	Subregion varchar,
	Total_Cases float,
	Total_Deaths float,
	Total_Cases_Per_Million float,
	Total_Deaths_Per_Million float,
	Happiness_Score float,
	COVID_Rating float,
	Happiness_Ranking int);
    
select * from covid_cases;

select * from completed_table;

select * from covid_cases;

select * from happiness_table;

select * from countrycode_table;

select * from happiness_table
join countrycode_table
using(country)

select * from happiness_table
join countrycode_table
using(country)
join covid_cases
on happiness_table.country = covid_cases.country_region;
