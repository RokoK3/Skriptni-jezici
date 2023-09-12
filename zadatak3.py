import os
import sys

inputPath = sys.argv[1]

files = os.listdir(inputPath)

labData = {}
currentGroup = []
students = {}
studentNames = inputPath + "/studenti.txt"

with open(studentNames, 'r') as file:
    for line in file:
        data = line.rstrip().split(" ")
        students[data[0]] = [data[1], data[2]]
files.sort()

for file in files:
    if file == "studenti.txt":
        continue
    group = file.split("_")[2].split(".")[0][1:] # Uzmi broj grupe, prvo podijeli po _, zatim po . , nakon toga zanemari slovo g i uzmi samo broj
    currentLabNumber = int(file.split("_")[1]) # Broj labosa

    labDataPath = inputPath + "/" + file
    with open(labDataPath, 'r') as labGroupData:
        for student in labGroupData:
            jmbag = student.split(" ")[0]
            result = student.split(" ")[1].rstrip()

            val = labData.get((jmbag, currentLabNumber))
            if val: # Ako su vec zapisani podatci za nekog studenta
                print("Za studenta %s u labosu %d već postoje podatci" % (jmbag, int(currentLabNumber)))
                exit(-1)

            labData[(jmbag, currentLabNumber)] = result

print("{:16s} {:20s}".format("JMBAG", "Prezime, Ime"), end="")
for i in range(1, currentLabNumber):
    print("{:6}".format("L"+str(i)), end="")
print()

for key, value in students.items():
    print("{:16s} {:20s}".format(key, value[0] + ", " + value[1]), end="")
    for i in range(1, currentLabNumber):
        print("{:6}".format(labData.get((key, i), "-")), end="")
    print()

