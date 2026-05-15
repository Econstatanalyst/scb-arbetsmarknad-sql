# Svensk Arbetsmarknadsanalys med SQL

## Om projektet
Detta projekt analyserar svensk arbetsloshet och sysselsattning med hjalp av SQL 
och oppen data fran Statistiska centralbyran (SCB). Projektet demonstrerar 
fardigheter inom datahantering, SQL-analys och statistisk metodik.

## Datakallor
Datan kommer fran SCB:s statistikdatabas (AKU - Arbetskraftsundersokningarna):

| Tabell | Beskrivning | Period |
|---|---|---|
| arbetslosa | Antal arbetslosa 15-74 ar efter kon | 2001-2025 |
| sysselsatta | Antal sysselsatta 15-74 ar efter kon | 2001-2025 |

## Fragestallningar och SQL-koncept

| # | Fil | Fragestallning | SQL-koncept |
|---|---|---|---|
| 01 | 01_total_arbetsloshet.sql | Hur har arbetslosheten utvecklats over tid? | SELECT, WHERE, ORDER BY |
| 02 | 02_men_vs_kvinnor.sql | Skillnader mellan man och kvinnor? | Filter, sortering |
| 03 | 03_covid_impact_2020.sql | Hur paverkade COVID-19 arbetslosheten? | IN-operator |
| 04 | 04_arbetsloshetsgrad.sql | Vad ar den faktiska arbetsloshetsgraden? | JOIN, aritmetik |
| 05 | 05_forandring_per_ar.sql | Hur mycket andras arbetslosheten per ar? | LAG window function |
| 06 | 06_arbetsloshets_niva.sql | Ar arbetslosheten lag, medel eller hog? | CTE, CASE WHEN, standardavvikelse |

## Tekniker
- SQL (SQLite)
- Python (datakonvertering och rensning)
- Git / GitHub

## Hur mankor projektet
1. Klona repot
2. Installera SQLite
3. Oppna scb_arbetsmarknad.db i DB Browser for SQLite
4. Kor SQL-fragorna i mappen queries/

## Datakalla
Statistiska centralbyran (SCB) - www.scb.se