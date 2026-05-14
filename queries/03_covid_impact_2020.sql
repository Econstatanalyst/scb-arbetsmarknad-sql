-- COVID impact on unemployment in 2020
-- Compares 2019 (pre-covid) vs 2020 (covid) vs 2021 (post-covid)
-- Source: SCB AKU, Arbetslosa 15-74 ar

SELECT 
    ar,
    kon,
    antal_tusental
FROM arbetslosa
WHERE arbetskraftstillhorighet LIKE 'arbetsl%'
AND kon = 'totalt'
AND ar IN (2019, 2020, 2021)
ORDER BY ar;