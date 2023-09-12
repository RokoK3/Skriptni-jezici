import sys

def getQ(sortedList, q):
    index = int(len(sortedList)*q)
    return sortedList[index - 1]


file = sys.argv[1]

inputData = []
with open(file, 'r') as file:
    data = file.read()
    for line in data.split("\n"):
        if line:
            inputData.append([float(number) for number in line.split(" ")])

counter = 1
print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")
for row in inputData:
    for i in range(0, 10):
        if i == 0:
            print("%03d" % counter, end="")
            counter += 1
        else:
            row.sort()
            val = getQ(row, i/10)
            print("#" + str(val), end="")
    print()
