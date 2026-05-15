-- Unemployment rate (arbetsloshetsgrad) per year
-- Calculated by dividing unemployed by (unemployed + employed)
-- Demonstrates JOIN between two tables and arithmetic calculations
-- Source: SCB AKU 2001-2025

SELECT 
    a.ar,
    a.antal_tusental AS arbetslosa,
    s.antal_tusental AS sysselsatta,
    ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1) AS arbetsloshetsgrad
FROM arbetslosa a
JOIN sysselsatta s 
    ON a.ar = s.ar 
    AND a.kon = s.kon
WHERE a.kon = 'totalt'
AND a.arbetskraftstillhorighet LIKE 'arbetsl%'
AND s.anknytningsgrad LIKE 'syssel%'
ORDER BY a.ar;