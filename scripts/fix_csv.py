import csv

with open('arbetslosa_long.csv', encoding='utf-8') as f:
    reader = csv.reader(f)
    next(reader)
    with open('arbetslosa_import.csv', 'w', newline='') as out:
        writer = csv.writer(out)
        writer.writerows(reader)