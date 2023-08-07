--select *
--from coviddeath

-- 1.looking at highest death count

--select location,max(cast(total_deaths as int)) as highest_death_rate
--from coviddeath
--where continent is not null
--group by location
--order by highest_death_rate desc


--2.loking at highest death count in each continent
--select continent,max(cast(total_deaths as int)) as higest_death_rate
--from coviddeath
--where continent is not null
--group by continent
--order by higest_death_rate desc


--3.looking at total population and vacciantion

--select coviddeath.date,coviddeath.location,coviddeath.population,covidvaccinations.new_vaccinations,
--sum(cast(covidvaccinations.new_vaccinations as int)) over (partition by coviddeath.location order by coviddeath.location,coviddeath.date ) as rolling_total_vaccinations
--from coviddeath join covidvaccinations on 
--coviddeath.date=covidvaccinations.date and
--coviddeath.location=covidvaccinations.location
--where coviddeath.continent is not null
--order by 2,3


with ROLLING_POPULATIONS(date,location,population,new_vaccinations,rolling_total_vaccinations)
as
(select coviddeath.date,coviddeath.location,coviddeath.population,covidvaccinations.new_vaccinations,
sum(cast(covidvaccinations.new_vaccinations as int)) over (partition by coviddeath.location order by coviddeath.location,coviddeath.date ) as rolling_total_vaccinations
from coviddeath join covidvaccinations on 
coviddeath.date=covidvaccinations.date and
coviddeath.location=covidvaccinations.location
where coviddeath.continent is not null
--order by 2,3
)
 
 select *,(rolling_total_vaccinations/population)*100 as Rolling_vaccination_percentage
 from ROLLING_POPULATIONS









