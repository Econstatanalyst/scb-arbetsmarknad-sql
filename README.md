# scb-arbetsmarknad-sql
arbetsmarknadsstatistik

# Svensk Arbetsmarknadsanalys med SQL

## Om projektet
Detta projekt analyserar svensk arbetsloshet med hjalp av SQL och oppen data 
fran Statistiska centralbyran (SCB). Projektet ar skapat for att demonstrera 
fardigheter inom datahantering och SQL-analys.

## Datakalla
Datan kommer fran SCB:s statistikdatabas:
- **Kalla:** Statistiska centralbyran (SCB)
- **Tabell:** Arbetslosa 15-74 ar (AKU)
- **Period:** 2001-2025
- **Matt:** Antal arbetslosa i tusental

## Fragestallningar
Projektet besvarar foljande fragor med SQL:

1. **Hur har arbetslosheten utvecklats over tid?**
   - Se: queries/01_total_arbetsloshet.sql

2. **Finns det skillnader i arbetsloshet mellan man och kvinnor?**
   - Se: queries/02_men_vs_kvinnor.sql

3. **Hur paverkade COVID-19 arbetslosheten 2020?**
   - Se: queries/03_covid_impact_2020.sql

## Tekniker
- SQL (SQLite)
- Python (datakonvertering)
- Git / GitHub

## Hur man kör projektet
1. Klona repot
2. Installera SQLite
3. Oppna scb_arbetsmarknad.db i DB Browser for SQLite
4. Kör SQL-fragorna i mappen queries/