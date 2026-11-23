# Verkeersbord Herkenner

Een quizspel dat Belgische verkeersborden herkent via je webcam. Het model is getraind met Google Teachable Machine (AutoML).

## Hoe werkt het?
1. De pagina vraagt om een bord te tonen (bv. "Toon het bord: Stop").
2. Het model herkent het bord live via de webcam.
3. Hoe sneller je het juiste bord toont, hoe meer punten je krijgt.

## Gebruikte technologie
- Teachable Machine (Image Project, AutoML)
- TensorFlow.js en @teachablemachine/image
- HTML, CSS en JavaScript

## Model instellen
Vervang in `index.html` de waarde van `MODEL_URL` door de link van je eigen Teachable Machine model (eindigt op een `/`).

## Scorebord (Supabase)
1. Maak een gratis project op supabase.com.
2. Open de SQL Editor, plak de inhoud van `supabase.sql` en klik op Run.
3. Ga naar Project Settings, dan API, en kopieer de Project URL en de anon public key.
4. Vul ze in bij `SUPABASE_URL` en `SUPABASE_ANON_KEY` in `index.html`.

Er wordt enkel een bijnaam en een score opgeslagen. Camerabeelden verlaten je toestel nooit.

## Starten
De webcam werkt alleen via https of localhost. Open het project met de Live Server extensie in VS Code, of via GitHub Pages.

## Klassen in het model
Stop, Voorrangsweg, Verboden toegang, Parkeren, Geen bord

Gemaakt door Frederik Hofman, 3MCT Future Tech.
