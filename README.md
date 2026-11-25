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
- **Klassen en aantal beelden:** stopbord (425), Voorrangsbord (551), verboden toegang (528), parkeersbord (551) en niets aan het doen (206). In totaal 2261 beelden.
- **Verkeersborden:** foto's van het internet. Ik koos zowel foto's van borden zonder achtergrond als foto's waarop het bord in een echte omgeving staat, met andere hoeken en andere dingen op de foto. Zo leert het model meerdere situaties kennen.
- **Eerste versie:** mijn eerste model was vooral getraind met borden zonder achtergrond of niet-echte foto's. Daardoor keek het model te veel naar kleur en vorm. Daarom heb ik een nieuw model getraind met meer echte foto's.
- **Klasse "niets aan het doen":** foto's die ik zelf binnen nam met mijn gsm, met mijn eigen gezicht.
- **Privacy:** enkel mijn eigen gezicht staat in de dataset, met mijn eigen toestemming. Er zijn geen andere personen gefotografeerd. Trainen en voorspellen gebeurt in de browser, de camerabeelden van het spel worden niet opgeslagen en de trainingsfoto's staan niet in deze repository. Het model werd geëxporteerd naar TensorFlow.js.

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

## Beperkingen en bias
- Het model kijkt vaak naar kleur en vorm. Bij een blauwe achtergrond twijfelt het soms omdat het parkeersbord ook blauw is, en het twijfelt soms tussen stopbord en verboden toegang omdat beide rood zijn.
- De dataset bestaat vooral uit internetfoto's, dus het model werkt mogelijk minder goed op borden in andere omgevingen of bij slecht licht.
- De klasse "niets aan het doen" bevat vooral mijn gezicht in dezelfde omgeving.
- Het model kent enkel de 4 borden uit de dataset.

## Mogelijke uitbreiding
Het model testen op echte verkeersborden langs de straat.

## Bestanden
- `index.html`: het spel
- `supabase.sql`: tabel en beveiligingsregels voor het scorebord
- `README.md`: deze uitleg
