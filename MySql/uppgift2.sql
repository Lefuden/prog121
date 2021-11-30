INSERT INTO constellations(constellations.constellation, constellations.planets_in_constellations, constellations.hemisphere)
SELECT DISTINCT ind_starsconstellations.Constellation, ind_starsconstellations.Planets_in_Const, ind_starsconstellations.Hemisphere
FROM ind_starsconstellations
------------------------------------------------------------

/* DELETE FROM constellations;

INSERT INTO constellations(constellations.constellation, constellations.planets_in_constellations, constellations.hemisphere)
SELECT DISTINCT ind_starsconstellations.Constellation, ind_starsconstellations.Planets_in_Const, ind_starsconstellations.Hemisphere
FROM ind_starsconstellations
WHERE NOT ind_starsconstellations.Constellation IN (SELECT constellations.constellation FROM constellations);
*/

INSERT INTO constellations (constellations.constellation)
SELECT DISTINCT ind_deepskyconstellations.Constellation
FROM ind_deepskyconstellations
WHERE NOT ind_deepskyconstellations.Constellation IN (SELECT constellations.constellation FROM constellations);
------------------------------------------------------------

INSERT INTO deepskyobjects
(deepskyobjects.deepskyobject,
deepskyobjects.magnitude,
deepskyobjects.ra_dec,
deepskyobjects.distance_lyyears,
deepskyobjects.NGC,
deepskyobjects.Messier,
deepskyobjects.constellationID)
SELECT DISTINCT
ind_deepskyconstellations.DeepSkyObject,
ind_deepskyconstellations.Magnitude,
ind_deepskyconstellations.Ra_Dec,
ind_deepskyconstellations.Distance_LY,
ind_deepskyconstellations.NGC,
ind_deepskyconstellations.Messier,
constellations.ConstellationID
FROM ind_deepskyconstellations INNER JOIN constellations ON ind_deepskyconstellations.Constellation = constellations.constellation
------------------------------------------------------------

INSERT INTO spectral_classes(spectral_classes.spectral_class, spectral_classes.Colour, spectral_classes.S_Temperature)
SELECT DISTINCT ind_starsconstellations.Spectral_Class, ind_starsconstellations.Colour, ind_starsconstellations.Temperature
FROM ind_starsconstellations
------------------------------------------------------------

INSERT INTO stars(stars.star, 
                  stars.distance_LY_S, 
                  stars.constellationID, 
                  stars.spectral_classID)
SELECT DISTINCT ind_starsconstellations.Star, 
				ind_starsconstellations.Distance_LY,
                constellations.constellationID,
                spectral_classes.spectral_classID
FROM constellations 
	INNER JOIN ind_starsconstellations ON constellations.constellation = ind_starsconstellations.Constellation
	INNER JOIN spectral_classes ON spectral_classes.spectral_class = ind_starsconstellations.Spectral_Class
WHERE NOT ind_starsconstellations.Star IN (SELECT stars.star FROM stars)
------------------------------------------------------------

INSERT INTO planets(planets.Planet, 
                    planets.Diameter, 
                    planets.Temperature_K, 
                    planets.Temperature_C, 
                    planets.StarID)
SELECT DISTINCT ind_planetsmoons.Planet, 
				ind_planetsmoons.Diameter, 
                ind_planetsmoons.Temperature_K, 
                ind_planetsmoons.Temperature_C, 
                stars.StarID
FROM stars 
	INNER JOIN ind_planetsmoons ON stars.star = ind_planetsmoons.Star
	
WHERE NOT ind_planetsmoons.Planet IN (SELECT planets.Planet FROM planets)
------------------------------------------------------------

INSERT INTO moons(moons.Moon,
                  moons.distance_1000km,
                  moons.Period_days,
                  moons.Magnitute,
                  moons.PlanetID)
SELECT DISTINCT ind_planetsmoons.Moon,
				ind_planetsmoons.Distance_1000km,
                ind_planetsmoons.Period_days,
                ind_planetsmoons.Magnitude,
                planets.PlanetID
FROM planets 
	INNER JOIN ind_planetsmoons ON planets.Planet = ind_planetsmoons.Planet
	
WHERE NOT ind_planetsmoons.Moon IN (SELECT moons.Moon FROM moons)
------------------------------------------------------------

SELECT constellations.constellation, constellations.hemisphere, deepskyobjects.deepskyobject
FROM constellations INNER JOIN deepskyobjects ON constellations.constellationID = deepskyobjects.constellationID
WHERE constellations.hemisphere = 'N'
------------------------------------------------------------

SELECT stars.star, spectral_classes.spectral_class
FROM stars LEFT JOIN spectral_classes ON spectral_classes.spectral_classID = stars.spectral_classID
WHERE NOT spectral_classes.spectral_class = 'W'
------------------------------------------------------------

SELECT constellations.constellation, COUNT(stars.StarID) AS 'StarCount'
FROM stars RIGHT JOIN constellations ON stars.constellationID = constellations.constellationID
GROUP BY constellations.constellationID
ORDER BY StarCount
------------------------------------------------------------

SELECT
    `astronomy`.`planets`.`Planet` AS `Planet`,
    `astronomy`.`moons`.`Moon` AS `Moon`
FROM
    (
        `astronomy`.`planets`
    LEFT JOIN `astronomy`.`moons` ON
        (
            `astronomy`.`moons`.`PlanetID` = `astronomy`.`planets`.`PlanetID`
        )
    )
GROUP BY
    `astronomy`.`planets`.`PlanetID`
HAVING
    COUNT(`astronomy`.`moons`.`MoonID`) <= 0
------------------------------------------------------------
	
SELECT constellations.constellation, constellations.planets_in_constellations
FROM constellations
WHERE constellations.planets_in_constellations = '0'
------------------------------------------------------------

SELECT stars.star, IF(sf_restidLy(stars.distance_LY_S) > 0,  sf_restidLy(stars.distance_LY_S), 'N/A') AS 'Traveltime_LY'
FROM stars
------------------------------------------------------------

BEGIN
DECLARE sf_value INT(11);
SET sf_value = (Indata * 300000 * 60 * 60) / 100000;
RETURN sf_value;
END
------------------------------------------------------------

BEGIN

SELECT stars.star, IF(sf_restidLy(stars.distance_LY_S) > 0,  sf_restidLy(stars.distance_LY_S), 'N/A') AS 'Traveltime_LY'
FROM stars;

END
------------------------------------------------------------

CALL traveltimetoStars()
------------------------------------------------------------