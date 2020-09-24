'''
Mit diesem Skript wird eine pdftk data_dump Datei bearbeitet, sodass die Bookmark Eintraege des Inhaltsverzeichnisses um zwei erhoeht werden. Dies ist notwendig, weil beim mergen des Mantelbogens mit dem Inhalt zwei zusaetzliche Seiten vorne angehaengt werden.

Erwartet, dass dass das erste Komandozeilenargument den Dateinamen der ursprünglichen Metadaten enthält und das zweite den Dateinamen der geupdateten.

Beispiel: python tocfixes.py metadaten.txt metadaten_updated.txt
'''

import sys

if len(sys.argv) < 2:
    print("Dieses Skript benoetigt zwei Dateinamen als Argumente.\nBeispiel: python tocfixes.py metadaten.txt metadaten_updated.txt\n")

with open(sys.argv[1]) as file:
    with open(sys.argv[2],'a') as outfile:
        line = file.readline()
        while line:
            if 'BookmarkPageNumber' in line:
                for sub in line.split():
                    if sub.isdigit():
                        pagenumber = int(sub)
                        line = line.replace(sub,str(pagenumber+2))
                        outfile.write(line)
            else:
                outfile.write(line)
            line = file.readline()
file.close()