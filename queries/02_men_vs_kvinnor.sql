-- Unemployment by gender per year (in thousands)
-- Shows the difference between male and female unemployment
-- Source: SCB AKU, Arbetslosa 15-74 ar

SELECT 
    ar,
    kon,
    antal_tusental
FROM arbetslosa
WHERE arbetskraftstillhorighet LIKE 'arbetsl%'
AND kon != 'totalt'
ORDER BY ar, kon;