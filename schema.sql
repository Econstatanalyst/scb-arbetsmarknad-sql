-- Schema for scb_arbetsmarknad.db
-- Run this to recreate the database structure
-- Then use the scripts in scripts/ to import data from data/

CREATE TABLE arbetslosa (
    arbetskraftstillhorighet TEXT,
    kon TEXT,
    alder TEXT,
    ar INTEGER,
    antal_tusental REAL
);

CREATE TABLE sysselsatta (
    anknytningsgrad TEXT,
    typ_av_data TEXT,
    kon TEXT,
    alder TEXT,
    ar INTEGER,
    antal_tusental REAL
);