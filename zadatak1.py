import sys

# Funkcija za čitanje matrice iz teksta
def readmatrix(matrix):
    # Dobivanje broja redaka i stupaca iz prvog retka
    nrOfRowsAndCols = matrix.split("\n")[0]
    row = int(nrOfRowsAndCols.split(" ")[0])
    col = int(nrOfRowsAndCols.split(" ")[1])
    # Dobivanje ostalih redaka
    dataRows = matrix.split("\n")[1:] # Preskoci dimenzije matrice
    # Kreiranje rječnika za pohranu matrice
    dict = {"dimension": (row, col)}
    # Petlja kroz sve retke
    for row in dataRows:
        if row:
            # Dobivanje vrijednosti redaka, stupaca i vrijednosti za svaki redak
            rowProperties = row.split(" ")
            row = int(rowProperties[0])
            col = int(rowProperties[1])
            # Dodavanje vrijednosti u rječnik
            dict[(row, col)] = float(rowProperties[2])
    return dict

# Funkcija za množenje dvije matrice
def multiply(matrix1, matrix2):
    resultMatrix = {}
    # Petlja kroz sve redove prve matrice
    for row in range(0, matrix1.get("dimension")[0]):
        # Petlja kroz sve stupce druge matrice
        for col in range(0, matrix2.get("dimension")[1]):
            resultMatrix[(row, col)] = 0
            # Kalkulacija vrijednosti za svaki element u rezultirajućoj matrici
            for slidingCounter in range(0, matrix1.get("dimension")[1]):
                resultMatrix[(row, col)] = resultMatrix[(row, col)] + float(matrix1.get((row, slidingCounter), 0) * matrix2.get((slidingCounter, col), 0))
    resultMatrix["dimension"] = (matrix1.get("dimension")[0], matrix2.get("dimension")[1])
    return resultMatrix

# Funkcija za ispis matrice
def printMatrix(matrix):
    # Petlja kroz sve redove matrice
    for row in range(0, matrix.get("dimension")[0]):
        # Petlja kroz sve stupce matrice
        for col in range(0, matrix.get("dimension")[1]):
            # Ispisivanje vrijednosti svakog elementa
            value = matrix.get((row, col), 0) # Uzmi value od (row, col), a ako ne postoji onda uzmi 0
            print("%8.2f" % value, end="") # Formatiraj ispis, ne ispisuj newline na kraju
        print()

# Funkcija za spremanje rezultata u datoteku
def saveResultFile(matrix, outputFilePath):
    outputFile = open(outputFilePath, "w")
    outputFile.write(str(matrix.get("dimension")[0]) + " " + str(matrix.get("dimension")[1]) + "\n")
    for row in range(0, matrix.get("dimension")[0]):
        for col in range(0, matrix.get("dimension")[1]):
            if matrix[(row, col)] != 0:
                outputFile.write(str(row) + " " + str(col) + " " + str(matrix[(row, col)]) + "\n")

# Dobivanje argumenata s naredbene linije
inputFile = sys.argv[1]
outputFile = sys.argv[2]

# Otvaranje i čitanje ulazne datoteke
with open(inputFile, 'r') as inputFile:
    data = inputFile.read()

# Inicijalizacija rječnika za pohranu matrica
matrices = {}
matrixData = ""
index = {1: "A", 2: "B"}
counter = 1
for line in data.split("\n"):
    # Procesiranje redaka
    if not line: # Prazna linija označava  granicu dvije matrice
        # Dodavanje matrice u rječnik
        matrices[index.get(counter)] = readmatrix(matrixData) # U dict matrices zabiljezi matricu A i matricu B
        matrixData = ""
        counter += 1
        continue
    matrixData += line + "\n"

# Ispis matrica
for key, value in matrices.items():
    print("\n" + str(key) + ":")
    printMatrix(value)

# Množenje matrica i ispis rezultata
resultMatrix = {}
if matrices["A"].get("dimension")[1] == matrices["B"].get("dimension")[0]:
    resultMatrix = multiply(matrices["A"], matrices["B"])
else:
    print("Nemoguce pomnoziti ove matrice")
    sys.exit(-1)

print("\nA*B:")
printMatrix(resultMatrix)

# Spremanje rezultata u datoteku
saveResultFile(resultMatrix, outputFile)