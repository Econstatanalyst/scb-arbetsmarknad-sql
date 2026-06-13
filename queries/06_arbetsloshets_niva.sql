-- Classifies each year as low/medium/high unemployment
-- Based on the unemployment RATE (%) rather than absolute numbers
-- Thresholds are defined as mean +/- 1 standard deviation
-- Uses CTEs, JOIN, and CASE WHEN
-- Source: SCB AKU 2001-2025

WITH medel AS (
    SELECT AVG(ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1)) AS m
    FROM arbetslosa a
    JOIN sysselsatta s
        ON a.ar = s.ar
        AND a.kon = s.kon
    WHERE a.kon = 'totalt'
    AND a.arbetskraftstillhorighet LIKE 'arbetsl%'
    AND s.anknytningsgrad LIKE 'syssel%'
),
stats AS (
    SELECT
        m,
        SQRT(SUM((ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1) - m) *
                 (ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1) - m)) / COUNT(*)) AS stddev
    FROM arbetslosa a
    JOIN sysselsatta s
        ON a.ar = s.ar
        AND a.kon = s.kon, medel
    WHERE a.kon = 'totalt'
    AND a.arbetskraftstillhorighet LIKE 'arbetsl%'
    AND s.anknytningsgrad LIKE 'syssel%'
)
SELECT
    a.ar,
    ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1) AS arbetsloshetsgrad,
    CASE
        WHEN ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1) < (m - stddev) THEN 'lag'
        WHEN ROUND(a.antal_tusental / (a.antal_tusental + s.antal_tusental) * 100, 1) > (m + stddev) THEN 'hog'
        ELSE 'medel'
    END AS niva
FROM arbetslosa a
JOIN sysselsatta s
    ON a.ar = s.ar
    AND a.kon = s.kon, stats
WHERE a.kon = 'totalt'
AND a.arbetskraftstillhorighet LIKE 'arbetsl%'
AND s.anknytningsgrad LIKE 'syssel%'
ORDER BY a.ar;