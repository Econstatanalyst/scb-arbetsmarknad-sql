import csv

input_file = 'sysselsatta.csv'
output_file = 'sysselsatta_long.csv'

with open(input_file, encoding='latin-1') as f:
    reader = csv.reader(f)
    next(reader)  # skip title row
    next(reader)  # skip empty row
    headers = next(reader)  # real header row
    years = headers[4:]  # years start at column 5 this time

    with open(output_file, 'w', newline='', encoding='utf-8') as out:
        writer = csv.writer(out)
        writer.writerow(['anknytningsgrad', 'typ_av_data', 'kon', 'alder', 'ar', 'antal_tusental'])

        for row in reader:
            if not row or len(row) < 4:
                continue
            anknytningsgrad = row[0]
            typ_av_data = row[1]
            kon = row[2]
            alder = row[3]
            for i, year in enumerate(years):
                value = row[4 + i]
                if value:
                    writer.writerow([anknytningsgrad, typ_av_data, kon, alder, year, value])