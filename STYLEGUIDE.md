# Styleguide

Es ist nicht ganz einfach, mit vielen Leuten gemeinsam ein Dokument zu schreiben, was sich so lesen soll, als wäre es von einer Autorin geschrieben worden. Deshalb versucht dieser Styleguide ein paar Empfehlungen zu geben, um den Stil zu vereinheitlichen und somit bessere Lesbarkeit zu gewährleisten. Wie der Name schon sagt, ist vieles eine Stilfrage, welche vom persönlichen Geschmack abhängt. Jedoch ist das Ziel, genau diesen persönlichen Einfluss aus dem Ersti-Info fernzuhalten und mit einem einheitlichen Stil zu versehen.

## Generisches Femininum

Immer wenn man allgemein über Personen spricht, wird im Ersti-Info das generische Femininum verwendet. So erspart man sich diverse typographisch grausame Gender-Zeichen wie \*/\_:. Gleichzeitig regt es die Leserin natürlich zum Denken an, weshalb bei einem Ersti-Info Heft der Fachschaften Mathematik, Informatik und Physik wohl das generische Femininum verwendet wurde, was sich zugegebenermaßen manchmal etwas komisch liest, jedoch ist genau dies auch eine Absicht.

Es wird also anstelle von `Dozenten, Professoren und Studenten` was das generische Maskulinum wäre, im generischen Femininum `Dozentinnen, Professorinnen und Studentinnen` geschrieben. Einzige Ausnahme: Bei Positionen, die aktuell von männlichen/weiblichen Einzelpersonen bekleidet werden, wird die Positionsbezeichnungen auch dementsprechend gegendert, zum Beispiel: `der Rektor` oder `die Kanzlerin`. Die neutralen Bezeichnungen `Studierende` oder `Studis` können ebenfalls verwendet werden, das generische Femininum wird jedoch bevorzugt.

## Pronomen

Auch wenn wir versuchen, die Erstis möglichst persönlich anzureden mit dem Ersti-Info, werden alle Pronomen klein geschrieben, da es sich nicht um eine Email oder einen Brief handelt. Insbesondere werden `du`, `euch`, `deiner`, `euer`, `ihr` klein geschrieben. Außer sie stehen am Satzanfang.

## Sprache

Das Ersti-Info wird in Deutsch geschrieben. Es sollte korrekte Rechtschreibung und Kommasetzung angewandt werden. Vom Stil her, muss es nicht all zu formell sein, ein legerer Ausdruck ist gut geeignet, um Erstsemester ungezwungen und zwanglos anzusprechen.

## Auslassungspunkte

Bei Auslassungspunkten kommt es darauf an, was ausgelassen wurde:

    Ganze Wörter: mit Abstand
    Abbrechungen: ohne Abstand
    Interpunktionen, Klammern, Anführungszeichen: ohne Abstand
    Gedankenstriche: mit Abstand

Quelle: Friedrich Forssman, Ralf de Jong: Detailtypografie. S. 189. Verlag Hermann Schmidt, Mainz 2014.

Wenn also ein ganzes Wort (oder mehrere Wörter) ausgelassen wird, dann setzt man die Punkte so, wie man auch das Wort gesetzt hätte.
Beispiel:

    Hier wurde etwas … weggelassen …!
    Hier w… anderes.
    „…“ (… bla …) […]

Insbesondere tritt häufig der Fall auf, dass am Ende eines Satzes noch Punkte stehen, zum Beispiel so ...
Da würde sich ein halber Abstand mit `\,` anbieten.

## Grafiken

Bilder im Inhaltsteil müssen für die Druckversion in Graustufen umgewandelt werden, sodass nach Abzug aller Schwarzwerte nichts mehr zu sehen ist. Für die Webversion können farbige Bilder verwendet werden.

Idealerweise liegen Grafiken als Vektorgrafiken vor, also zum Beispiel als svg oder pdf Dateien. Alternativ können auch Bitmapgrafiken verwendet werden, solange sie eine hohe Auflösung besitzen. Sollte dies nicht der Fall sein, wird es zu einem verpixelten Druck führen, was nicht schön ist.

## Abstände bei besonderen Zeichen

Bei folgenden Zeichen sollte ein halbes Leerzeichen (`\,`) verwendet werden:

- vor und nach Schrägstrichen, zum Beispiel `Anfängerpraktikum/Fortgeschrittenenpraktikum`
- zwischen der Zahl und einem Prozentzeichen: z.B. `50% der Übungszettelpunkte`
- bei Abkürzungen wie, `d.h.`, `z.B.`, `etc.` jeweils nach den Punkten

Ein halbes Leerzeichen verwendet nicht zu viel Platz im Vergleich zu einem ganzen, lässt jedoch etwas Abstand, um dem Leser die Trennung einfacher zu machen.

## Vorlesungs- und Modulbezeichnungen

Um besser hervorzuheben, dass es sich bei diesen Namen um Vorlesungen oder Module handelt, werden diese **fett** und _kursiv_ gesetzt. Dies passiert automatisch, wenn man die Bezeichnung in eine VL-Umgebung packt, zum Beispiel: `\vl{Lineare Algebra 1}`. Die Definition, wie Vorlesungsbezeichnungen gesetzt werden sollen, lässt sich in der Präambel an einer Stelle zentral ändern.

## Emails und URLs

Werden Emails im Dokument erwähnt, sollten diese in eine `\email{}` Umgebung gesetzt werden, sodass in der digitalen Version auch eine entsprechende Verlinkung eingebaut wird. Selbiges gilt für URLs und den `\url{}` Befehl.

## Hervorhebungen

Wenn einzelne Wörter hervorgehoben werden sollen, kann dies im _kursiven_ Schrifsatz geschehen mit `\emph{}`. Der Einheitlichkeit und Schönheit halber ist von Anführungszeichen abzusehen.
