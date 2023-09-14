--SELECT *
--FROM CovidDeaths$

--select *
--from CovidVaccinations$


--select continent,location,date,population,(total_deaths/total_cases)*100 as death_percentage
--from CovidDeaths$
--where location like 'aze%'
--order by 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

--select continent,location,date,population,(total_cases/population)*100 as case_percentage
--from CovidDeaths$
--where location like 'aze%'
--order by 2,3


--select location,population,max(total_cases) as highest_infected,max((total_cases/population)*100) as totalhighest_infected_rate
--from CovidDeaths$
--group by location,population
--order by totalhighest_infected_rate desc


---4.looking at max total death count in each countries
--select location,max(total_deaths) as max_death_per_location
--from CovidDeaths
--group by location
--order by max_death_per_location desc


--5.looking at global numbers

--select location, sum(new_cases) as total_cases ,sum(new_deaths) as total_deaths 
--from coviddeaths
--where continent is not null
--group by location
--order by 1,2
--select *
--from covidvaccinations



----6.looking at total_vaccinations and populations
--select coviddeaths.continent,coviddeaths.location,coviddeaths.date,coviddeaths.population,covidvaccinations.new_vaccinations 
--,sum(convert(int,covidvaccinations.new_vaccinations)) over(partition by coviddeaths.location order by coviddeaths.date) as total_vaccinations_per_day
--from coviddeaths join covidvaccinations on coviddeaths.location=covidvaccinations.location
--and coviddeaths.date=covidvaccinations.date
----where coviddeaths.continent is not null
--where coviddeaths.location like'aze%'
--order by 1,2 

-- with  pop_vac (continent,location,date,population,new_vaccinations,total_vaccinations_per_day)
--as
--(
--select coviddeaths.continent,coviddeaths.location,coviddeaths.date,coviddeaths.population,covidvaccinations.new_vaccinations 
--,sum(convert(int,covidvaccinations.new_vaccinations)) over(partition by coviddeaths.location order by coviddeaths.date) as total_vaccinations_per_day
--from coviddeaths join covidvaccinations on coviddeaths.location=covidvaccinations.location
--and coviddeaths.date=covidvaccinations.date
--where coviddeaths.continent is not null)
----order by 1,2
--select*,(total_vaccinations_per_day/population)*100 AS total_vaccinations_rate
--from pop_vac