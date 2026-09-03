'''
Dieses Skript ermöglicht das Erstellen eines Tortendiagramms zur Visualisierung des Semesterbeitrags im XKCD Style.

Möglicherweise muss das Bild im Anschluss in einer Vektorgrafiksoftware nachbearbeitet werden, um die Labels besser zu positionieren.

Usage: python3 bilder/generate_semesterbeitrag_piechart.py
Outputs: bilder/semesterbeitrag.png, bilder/semesterbeitrag_grayscale.png
'''

import matplotlib.pyplot as plt
from PIL import Image

# Pie chart, where the slices will be ordered and plotted counter-clockwise:
labels = 'Theaterflatrate', 'VS-Beitrag', 'VRNextbike', 'Studierendenwerk',  'Verwaltungskostenbeitrag'

# Values taken from https://www.stura.uni-heidelberg.de/finanzen/vs-beitrag/
sizes = [ 2.5, 10, 2.3, 95, 80]

explode = (0.1, 0.2, 0.3, 0, 0)  # moved a bit outwards for better readability

# see https://matplotlib.org/stable/gallery/color/named_colors.html
# for more colors
colors = ['tab:orange', 'tab:blue', 'tab:cyan',
          'tab:purple',  'tab:red']


with plt.xkcd():

    plt.rcParams.update({'font.size': 11})

    plt.figure(figsize=(6, 3))

    plt.title("Wohin fließt mein Semesterbeitrag?") 

    p, tx, autotexts = plt.pie(sizes, explode=explode, labels=labels,
                            autopct='', startangle=0, colors=colors)

    # Equal aspect ratio ensures that pie is drawn as a circle.
    plt.axis('equal')

    # sets description with actual values. No decimal places if round value, otherwise two places
    for i, a in enumerate(autotexts):
        a.set_text("{:.2f} €"
                .format(sizes[i])
                .replace('.00', '')
                .replace('.', ','))

    plt.savefig('bilder/semesterbeitrag', dpi=300)

    # grayscale version for printing
    img = Image.open('bilder/semesterbeitrag.png').convert('LA')
    img.save('bilder/semesterbeitrag_grayscale.png')