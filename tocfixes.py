'''
Mit diesem Skript wird eine pdftk data_dump Datei bearbeitet, sodass die Bookmark Eintraege des Inhaltsverzeichnisses um zwei erhoeht werden. Dies ist notwendig, weil beim mergen des Mantelbogens mit dem Inhalt zwei zusaetzliche Seiten vorne angehaengt werden.
'''

with open('metadata.txt') as file:
    with open('metadata_updated.txt','a') as outfile:
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