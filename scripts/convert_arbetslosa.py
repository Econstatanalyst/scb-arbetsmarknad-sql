import csv

input_file = 'arbetslosa.csv'
output_file = 'arbetslosa_long.csv'

with open(input_file, encoding='latin-1') as f:
    reader = csv.reader(f)
    next(reader)  # skip title row
    next(reader)  # skip empty row
    headers = next(reader)  # real header row
    years = headers[3:]

    with open(output_file, 'w', newline='', encoding='utf-8') as out:
        writer = csv.writer(out)
        writer.writerow(['arbetskraftstillhorighet', 'kon', 'alder', 'ar', 'antal_tusental'])

        for row in reader:
            if not row or len(row) < 3:
                continue
            arbetskraft = row[0]
            kon = row[1]
            alder = row[2]
            for i, year in enumerate(years):
                value = row[3 + i]
                if value:
                    writer.writerow([arbetskraft, kon, alder, year, value])