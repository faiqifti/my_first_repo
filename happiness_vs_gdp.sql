use datasets;
/*select Country, Happiness_Score, Economy_GDP_per_Capita
into h_2015
from happiness_2015;

alter table h_2015
add Year int;

update h_2015
set Year = '2015'
where Year is NULL;

select *
from h_2015;

select Country, Happiness_Score, Economy_GDP_per_Capita
into h_2016
from happiness_2016;

exec sp_rename 'h_2016, Happiness_Score', 'Happiness_Score_2016', 'column'

alter table h_2016
add Year int;

update h_2016
set Year = '2016'
where Year is NULL;

select *
from h_2016;

select h_2016.Country, h_2015.Happiness_Score_2015, h_2016.Happiness_Score_2016, h_2015.Economy_GDP_per_Capita_2015, h_2016.Economy_GDP_per_Capita_2016
from (h_2015
inner join h_2016
on h_2015.Country = h_2016.Country);

alter table h_2015
alter column Economy_GDP_per_Capita_2015 float;
alter table h_2016
alter column Economy_GDP_per_Capita_2016 float;

update h_2016
set Economy_GDP_per_Capita_2016 = Economy_GDP_per_Capita_2016 * 0.01;

select h_2016.Country, 
h_2015.Happiness_Score_2015, 
h_2016.Happiness_Score_2016, 
Happiness_Score_2016 - Happiness_Score_2015 as Changes_of_Happiness, 
h_2015.Economy_GDP_per_Capita_2015, 
h_2016.Economy_GDP_per_Capita_2016,
Economy_GDP_per_Capita_2016 - Economy_GDP_per_Capita_2015 as Changes_of_GDP
into h_2015_2016
from (h_2015
inner join h_2016
on h_2015.Country = h_2016.Country); */

alter table h_2015_2016
add What_About_Now nvarchar(50);

update h_2015_2016
set What_About_Now = (
case 
	when Changes_of_Happiness > 0 and Changes_of_GDP >0 then 'Happy and Rich'
	when Changes_of_Happiness > 0 and Changes_of_GDP <0 then 'Happy but Broke'
	when Changes_of_Happiness < 0 and Changes_of_GDP >0 then 'Sad but Rich'
	else 'Sad and Broke'
end);

select count(Country) as Sum_Country, What_About_Now
from h_2015_2016
group by What_About_Now
order by Sum_Country;


/*select top 2 *
from happiness_2017;

select top 2 *
from happiness_2018;

select top 2 *
from happiness_2019;*/