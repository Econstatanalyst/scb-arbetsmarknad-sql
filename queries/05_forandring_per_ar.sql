-- Year-on-year change in unemployment (absolut och procentuell forandring)
-- Uses LAG window function to compare each year with the previous year
-- Notable: 2009 shows the impact of the global financial crisis (+34%)
-- Notable: 2020 shows the impact of COVID-19
-- Source: SCB AKU 2001-2025

SELECT 
    ar,
    antal_tusental AS arbetslosa,
    LAG(antal_tusental) OVER (ORDER BY ar) AS forra_aret,
    ROUND(antal_tusental - LAG(antal_tusental) OVER (ORDER BY ar), 1) AS absolut_forandring,
    ROUND((antal_tusental - LAG(antal_tusental) OVER (ORDER BY ar)) / LAG(antal_tusental) OVER (ORDER BY ar) * 100, 1) AS procentuell_forandring
FROM arbetslosa
WHERE kon = 'totalt'
AND arbetskraftstillhorighet LIKE 'arbetsl%'
ORDER BY ar;