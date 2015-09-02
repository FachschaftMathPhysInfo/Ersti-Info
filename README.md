# Ersti-Info

Das Ersti-Info ist eine Broschüre der Fachschaften Informatik, Mathematik und Physik, die jedes Jahr
am Anfang des Semesters allen neuen Studierenden ausgehändigt wird. Es

   * begleitet den Vorkurs
   * sorgt dafür, dass Erstis nicht mit allen Fragen zu uns kommen
   * beschreibt das Studium in Heidelberg
   * informiert über Hochschulpolitik
   * erklärt die Stadt
   * und ist super awesome :))

## Struktur

Das Ersti-Info besteht wie jedes größere LaTex-Dokument aus vielen Einzeldateien, die in 'ersti.tex' zusammengeführt werden.
Diese Datei ist also quasi die "Hauptdatei", in der die grundlegende Struktur und die Kapitel festgelegt sind.

Um die Übersichtlichkeit im Verzeichnis zu behalten, sind die einzelnen Artikel in Unterverzeichnissen 
nach Kapitel sortiert (und hoffentlich sinnvoll benannt ;). Besonders wichtig ist hier das 'zu_aktualisieren'-Verzeichnis,
in dem viele sich oft ändernde Dinge mit Aliasen benannt wird, um sie an einem zentralen Ort aktualisieren können.

Das sind im Wesentlichen auch alle Dinge, an denen man manuell als LaTeX-Amateur rumfummeln kann und will.

## Kompilieren und ähnliches

Dem Ersti-Info liegt ein Makefile bei, mit dem es kompiliert werden kann. Die folgenden Befehle erzeugen
immer subtil anderen Output (auf Druck/Website/nur Inhalt optimiert)

   * schnelle Vorschau - make
   * Druck - make druck
   * Webseite - make web
   * Druck + Webseite - make all

Wenn die SVG-Landkarten aktualisiert wurden, empfiehlt sich ein make makeRGBreal um auch die PDF Versionen 
zu aktualisieren, die letztendlich im Erstiinfo landen. Mit make spell kann man die Rechtschreibprüfung
starten (die leider auch einige LaTeX Befehle überprüft). 
