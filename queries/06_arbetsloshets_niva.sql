-- Classifies each year as low/medium/high unemployment
-- Thresholds are defined as mean +/- 1 standard deviation
-- Uses CTEs and CASE WHEN to demonstrate advanced SQL concepts
-- Source: SCB AKU 2001-2025

WITH medel AS (
    SELECT AVG(antal_tusental) AS m
    FROM arbetslosa
    WHERE kon = 'totalt'
    AND arbetskraftstillhorighet LIKE 'arbetsl%'
),
stats AS (
    SELECT 
        m,
        SQRT(SUM((antal_tusental - m) * (antal_tusental - m)) / COUNT(*)) AS stddev
    FROM arbetslosa, medel
    WHERE kon = 'totalt'
    AND arbetskraftstillhorighet LIKE 'arbetsl%'
)
SELECT 
    a.ar,
    a.antal_tusental AS arbetslosa,
    CASE 
        WHEN a.antal_tusental < (m - stddev) THEN 'lag'
        WHEN a.antal_tusental > (m + stddev) THEN 'hog'
        ELSE 'medel'
    END AS niva
FROM arbetslosa a, stats
WHERE a.kon = 'totalt'
AND a.arbetskraftstillhorighet LIKE 'arbetsl%'
ORDER BY a.ar;