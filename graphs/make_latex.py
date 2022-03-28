import csv

results = [[] for _ in range(100)]

SKIP = 2

with open('data/linear.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    r = -1 * SKIP
    for row in reader:
        r += 1
        if r < 0: continue
        results[r].append(row[1])
        results[r].append(row[2])

with open('data/binary.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    r = -1 * SKIP
    for row in reader:
        r += 1
        if r < 0: continue
        results[r].append(row[1])
        results[r].append(row[2])

with open('data/hash.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    r = -1 * SKIP
    for row in reader:
        r += 1
        if r < 0: continue
        results[r].append(row[1])
        results[r].append(row[2])


print('\\begin{tabular}{ | c | c | c | c | c | c | }')
print('\hline')
print('\multicolumn{2}{|c|}{Linear} & \multicolumn{2}{|c|}{Binary} & \multicolumn{2}{|c|}{Hash} \\\\ \hline')
print('Get & Set & Get & Set & Get & Set \\\\ \hline')

i = 0
for row in results:
    if i % 10 == 0: print(' & '.join(row) + ' \\\\ \hline')
    i += 1

print('\end{tabular}')
