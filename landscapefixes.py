'''
Mit diesem Skript wird eine pdftk data_dump Datei bearbeitet, sodass der Linienfahrplan im queerformat ist, weil beim mergen des Mantelbogens mit dem Inhalt zwei zusaetzliche Seiten vorne angehaengt werden.

Erwartet, dass dass das erste Komandozeilenargument den Dateinamen der urspruenglichen Metadaten enthaelt und das zweite den Dateinamen der geupdateten.

Beispiel: python tocfixes.py metadaten.txt metadaten_updated.txt
'''

import sys

if len(sys.argv) < 2:
    print("Dieses Skript benoetigt zwei Dateinamen als Argumente.\nBeispiel: python tocfixes.py metadaten.txt metadaten_updated.txt\n")

found = 0

with open(sys.argv[1]) as file:
    with open(sys.argv[2],'a') as outfile:
        line = file.readline()
        while line:
            found -= 1
            if 'PageMediaRotation: 90' in line:
                line = 'PageMediaRotation: 0\n'
                outfile.write(line)
                found = 10
            else:
                if found == 0:
                    line = 'PageMediaRotation: 90\n'
                outfile.write(line)
            line = file.readline()
file.close()