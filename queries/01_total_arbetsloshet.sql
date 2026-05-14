-- Total unemployment per year (in thousands)
-- Source: SCB AKU, Arbetslosa 15-74 ar

SELECT 
    ar,
    antal_tusental
FROM arbetslosa
WHERE kon = 'totalt'
AND arbetskraftstillhorighet LIKE 'arbetsl%'
ORDER BY ar;