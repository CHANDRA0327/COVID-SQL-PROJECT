SELECT *
FROM PORTFOLIOPROJECT..covidDeaths$
ORDER BY 3,4

--SELECT *
--FROM PORTFOLIOPROJECT..CovidVaccinations$
--ORDER BY 3,4

SELECT location,date, population,total_cases,new_cases,total_deaths
FROM PORTFOLIOPROJECT..covidDeaths$
ORDER BY 1,2

SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Deathpercentage
FROM PORTFOLIOPROJECT..covidDeaths$
ORDER BY 1,2

SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Deathpercentage
FROM PORTFOLIOPROJECT..covidDeaths$
where location in ('india','Unitedstates')
ORDER BY 1,2



SELECT location,date,population, (total_cases),(total_cases/population)*100 as percentpopulationinfected
FROM PORTFOLIOPROJECT..covidDeaths$
where location in('india','china')
ORDER BY 1,2

SELECT location,population, max(total_cases) as HighestinfectionCount,max(total_cases/population)*100
as percentpopulationinfected
FROM PORTFOLIOPROJECT..covidDeaths$
group by location, population
ORDER BY percentpopulationinfected desc


SELECT location,max(total_deaths) as TOTALDEATHCOUNT
FROM PORTFOLIOPROJECT..covidDeaths$
group by location, population
ORDER BY TOTALDEATHCOUNT desc

SELECT continent,max(CAST(total_deaths AS INT)) as TOTALDEATHCOUNT
FROM PORTFOLIOPROJECT..covidDeaths$
WHERE continent is  not null
group by continent 
ORDER BY TOTALDEATHCOUNT desc


select DEA.continent,DEA.location,DEA.DATE,DEA.population ,VAC.new_vaccinations
from PORTFOLIOPROJECT..covidDeaths$ DEA
JOIN PORTFOLIOPROJECT..CovidVaccinations$ VAC
 ON  DEA.LOCATION=VAC.location
    AND DEA.date=VAC.DATE
	WHERE DEA.continent IS  NOT NULL
	ORDER BY 2,3


select DEA.continent, DEA.location, DEA.DATE, DEA.population,VAC.new_vaccinations,
SUM(CONVERT(INT,VAC.new_vaccinations)) OVER(PARTITION BY DEA.LOCATION ORDER BY DEA.LOCATION,DEA.DATE) AS CUMULATIVEVACCINATION
from PORTFOLIOPROJECT..covidDeaths$ DEA
JOIN PORTFOLIOPROJECT..CovidVaccinations$ VAC
 ON  DEA.LOCATION=VAC.location
    AND DEA.date=VAC.DATE
WHERE DEA.continent IS NOT NULL
ORDER BY 2,3



















