Select *
From CovidDeaths
Order By 3,4

Select *
from CovidVaccinations
Order by 3,4

Select location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Order by 1,2

---Looking at Total cases vs Total Deaths
---shows likelyhood of dieing if you contract covid in your country
Select location, date, total_cases,total_deaths, 
(cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
Where location LIKE '%Nigeria%'
Order by 1,2

Select location, date, total_cases,total_deaths, 
(cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
Where location LIKE '%states%'
Order by 1,2

---looking at total cases vs population
---shows what percentage of population got covid
Select location, date, population, total_cases, 
(cast(total_cases as float)/cast(population as float))*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
Where location LIKE '%states%'
Order by 1,2

--- looking at countries with highest infection rate compared to population
Select Location, Population, MAX(total_cases) as HighestInfectionCount, 
MAX(cast(total_cases as float)/cast(population as float))*100 as PercentPopulationInfected
From CovidDeaths
Group by location, population
Order by 1,2

---Showing Countries with highest death count per Population
Select Location, MAX(Total_deaths) as Totaldeathcount
From CovidDeaths
Group By location
Order By Totaldeathcount desc

---Death count by continent
Select continent, MAX(total_deaths) as TotalDeathCount
From CovidDeaths
Where continent IS NOT NULL
Group By continent
Order By TotalDeathCount desc

---looking at Total Population vs Total Vaccinations
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths dea
Join CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
Where dea.continent Is Not Null
Order by 1,2


