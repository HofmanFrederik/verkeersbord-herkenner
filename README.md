# Verkeersbord Herkenner

Een quizspel dat Belgische verkeersborden herkent via de camera van je smartphone. Het model is getraind met Google Teachable Machine (AutoML) en draait volledig in de browser.

**Live:** https://hofmanfrederik.github.io/verkeersbord-herkenner/
**Repo:** https://github.com/HofmanFrederik/verkeersbord-herkenner

**Student:** Frederik Hofman, 3MCT, Future Tech

## Track
Beeld (Teachable Machine Image Project), eigen idee. Het spel vraagt om een bord te tonen (bv. "Toon het bord: Stop"). Herkent het model dat bord met een zekerheid van minstens 90%, dan krijg je punten. Hoe sneller je het toont, hoe meer punten. Een reeks juiste antwoorden geeft bonuspunten.

## Hoe starten
1. Open de live link op je smartphone (HTTPS is nodig voor de camera).
2. Kies een bijnaam en geef toegang tot de camera. De achtercamera wordt gebruikt.
3. Toon de gevraagde borden aan de camera. Je hebt 8 borden en 15 seconden per bord.
4. Na het spel wordt je score opgeslagen en zie je de top 10.

Lokaal draaien: open de map met de Live Server extensie in VS Code (de camera werkt enkel via https of localhost).

## Hoe ik de dataset maakte
- **Klassen:** Stop, Voorrangsweg, Verboden toegang, Parkeren en Geen bord.
- **Bronnen:** afbeeldingen van Belgische verkeersborden uit de officiele wegcode (publiek domein), opgeslagen als screenshots op mijn gsm.
- **Opnames:** in Teachable Machine nam ik per klasse beelden op met de webcam terwijl ik het bord (op mijn gsm-scherm) voor de camera hield. Ik varieerde de afstand, de hoek en de achtergrond.
- **Aantal beelden per klasse:** [VUL IN, minstens 30]
- **Momenten en licht:** [VUL IN, bv. ochtend met daglicht, avond met lamp]
- **Klasse "Geen bord":** lege achtergronden en objecten, geen personen.
- **Privacy:** er zijn geen personen gefotografeerd. Trainen en voorspellen gebeurt in de browser, de camerabeelden verlaten het toestel nooit en worden niet opgeslagen. Het model werd geexporteerd naar TensorFlow.js.

## Technologie
- Teachable Machine (AutoML), export naar TensorFlow.js
- `@teachablemachine/image` en TensorFlow.js
- HTML, CSS en JavaScript
- Supabase (scorebord, tabel `scores`)
- GitHub Pages (hosting via HTTPS)

## Scorebord (Supabase)
1. Maak een gratis project op supabase.com.
2. Voer `supabase.sql` uit in de SQL Editor.
3. Vul `SUPABASE_URL` en `SUPABASE_ANON_KEY` in bij `index.html`. Die publieke sleutel is bedoeld om zichtbaar te zijn, de beveiliging zit in de RLS-regels uit `supabase.sql`.

Enkel een bijnaam en een score worden opgeslagen.

## Beperkingen
- Het model is getraind op schermafbeeldingen, dus het werkt mogelijk minder goed op geprinte of echte borden.
- Slecht licht of reflecties op het scherm verlagen de zekerheid.
- Het model kent enkel de 4 borden uit de dataset.

## Bestanden
- `index.html`: het spel
- `supabase.sql`: tabel en beveiligingsregels voor het scorebord
- `README.md`: deze uitleg
