Select*
From Covid19..CovidDeaths



--Select*
--From Covid19..CovidVaccination


Select Location , date, total_cases, new_cases,total_deaths, population
From Covid19..CovidDeaths
order by 1,2
--Total positive cases and total number of deaths

Select Location , date, total_cases,total_deaths,( total_deaths/total_cases)*100 as DeathPercentage
From Covid19..CovidDeaths
Where location like '%India%'
order by 1,2
--Total Population vs Total Population
--Shows rating of positive covid19 cases in percentage

Select Location , date, total_cases,population,( total_cases/population)*100 as PercentagepopulationInfected
From Covid19..CovidDeaths
Where location like '%India%'
order by 1,2


--highest infection rate compared to population around the world

Select Location , Population,Max( total_cases) as HightestInfectioncount, Max( total_cases/population)*100 as PercentagePopulationInfected
From Covid19..CovidDeaths

Group by Location, Population
order by PercentagePopulationInfected desc



--Highest number of deaths per population
Select Location,Max(cast( total_deaths as int)) as HighestDeathCounts
From Covid19..CovidDeaths
where continent is not null
Group by Location
order by HighestDeathCounts  desc


--globablly 

Select date,SUM(new_cases)as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast( new_deaths as int))/ SUM(New_Cases)*100 as DeathPercentage
From Covid19..CovidDeaths
where continent is not null
Group by date
order by 1,2

--Looking at total population vs vaccinations
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From Covid19..CovidDeaths dea
Join Covid19..CovidVaccination vac
    On dea. location = vac. location
	and dea.date=vac.date
	where dea.continent is not null
Order by 2,3




