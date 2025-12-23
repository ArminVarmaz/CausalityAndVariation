# Kausalität ist nicht gleich Variation  
MATLAB-Demos zur Unterscheidung von kausalen Effekten und erklärter Varianz

Dieses Repository enthält zwei einfache MATLAB-Skripte, die einen zentralen Punkt der modernen empirischen Ökonomie illustrieren:

Kausale Effekte können real und korrekt identifiziert sein, ohne einen nennenswerten Teil der beobachteten Variation zu erklären.

Die Skripte wurden für Lehrzwecke sowie begleitend zu einem Blogbeitrag erstellt.

Blogbeitrag:
https://affine07.blogspot.com/2026/01/kaisalitat-variation-warum-kausalitat.htm

---

## Inhalt

bDemo1.m  
Zeigt anhand eines einfachen linearen Modells, dass ein korrekt identifizierter kausaler Effekt nur einen kleinen Teil der Gesamtvariation erklären kann, wenn wichtige Einflussfaktoren nicht berücksichtigt werden.

bDemo2.m  
Demonstriert eine Within-Schätzung mittels Demeaning (Fixed-Effects-Idee ohne Dummy-Variablen). Der kausale Effekt bleibt interpretierbar, das erklärte Within-R² ist jedoch sehr klein.

---

## Ziel der Skripte

Die Skripte sind didaktisch motiviert. Sie sollen verdeutlichen:

- warum saubere kausale Identifikation oft mit dem Wegwerfen von Variation einhergeht,
- warum statistisch signifikante Effekte nicht automatisch ökonomisch relevant sind,
- warum die Frage „Wirkt x kausal auf y?“ nicht identisch ist mit
  „Was erklärt die Unterschiede in y?“.

---

## Intuition

Empirische Forschung beantwortet häufig die Frage, ob eine Variable kausal wirkt.  
In vielen wirtschaftspolitischen oder finanzökonomischen Anwendungen ist jedoch entscheidend, welche Faktoren den Großteil der beobachteten Unterschiede erklären.

Diese beiden Fragen sind nicht identisch.

---

## Ausführung

1. MATLAB öffnen (getestet mit aktuellen Versionen).
2. Arbeitsverzeichnis auf den Ordner mit den Skripten setzen.
3. Die Skripte ausführen:

   bDemo1  
   bDemo2  

Es werden Ausgaben im Command Window erzeugt; optional werden Streudiagramme angezeigt.

---

## Interpretation der Ergebnisse

bDemo1.m  
Der geschätzte Koeffizient ist kausal korrekt, das Bestimmtheitsmaß (R²) jedoch niedrig.

bDemo2.m  
Nach der Within-Transformation bleibt der kausale Effekt erhalten, aber das erklärte Within-R² ist sehr klein. Der Großteil der Variation liegt zwischen Gruppen und wird bewusst nicht genutzt.

---

## Einordnung

Die Beispiele sind bewusst stark vereinfacht. Sie dienen nicht der realistischen Modellierung, sondern der Illustration eines konzeptionellen Punktes, der insbesondere in der Arbeitsmarktökonomik, der Makroökonomik, im Asset Pricing und in der Evaluationsforschung eine wichtige Rolle spielt.

---

## Autor

Dr. Armin Varmaz  
Deutschland  

Erstellt für Lehre, akademische Blogs und Diskussionen zur empirischen Ökonomie.

---

## Lizenz

MIT License  
Freie Nutzung, Veränderung und Weitergabe mit Quellenangabe.
