---
url: https://www.youtube.com/watch?v=yFRkfzHtnG8
fetched_at: 2026-04-26 21:30
re_ingested_at: 2026-04-26 21:45
title: "Zbuduj bazę wiedzy, z której AI sam sięga po kontekst | Obsidian + Claude Code"
authors: ["Krzysztof Tutak", "Krzysztof Błohaczek"]
format: AI Ninjas open workshop, recorded livestream (~120 attendees joined)
published: 2026-04-16
platform: YouTube (live stream)
language: Polish
views_at_fetch: 3413
hashtags: ["#AndrejKarpathy", "#Obsidian", "#ClaudeCode"]
transcript_source: whisper
transcript_words: ~21000
---

# Zbuduj bazę wiedzy, z której AI sam sięga po kontekst | Obsidian + Claude Code

Polish-language **AI Ninjas workshop** co-hosted by [[Krzysztof Tutak]] and [[Krzysztof Błohaczek]]. Topic: *"Zbuduj swój Second Brain z wykorzystaniem Claude Code i Obsidiana"* (Build your Second Brain using Claude Code and Obsidian). Recorded live, ~120 live attendees, then published to YouTube.

> Transcript was unavailable on first ingest (chapter list + sidebar only). Re-ingested 2026-04-26 via local Whisper after building the `yt-transcript.sh` pipeline. The curated digest is the body of this file; the **full ~21k-word Whisper transcript** is appended at the bottom under `## Transcript`.

## Hosts (verified)

- **Krzysztof Tutak** — host of the *Bliskie Spotkania z AI* podcast, organizer of the **AI Miners** conference, 10+ years as a programmer. (Earlier stub guessed his AI Ninjas co-host was Daniel Ura — wrong; that was a different show.)
- **Krzysztof Błohaczek** — fellow AI Ninja, programmer in the financial sector, full-stack + AI integration. Active on LinkedIn and YouTube; co-runs the AI Ninjas community workshops.

## Tutak's actual second-brain stack (the workshop demo)

The headline finding from the transcript: Tutak runs a **fully automated ingest pipeline** that goes well beyond Karpathy's gist. Architecture as he describes it on screen:

### 1. Sources (`row/` directory)
- **Obsidian Web Clipper** — articles → `row/articles/`, YouTube links → `row/videos/`
- **Manual file drops** — PDFs, PNGs, MP4s into typed subfolders

### 2. Auto-preprocessing (PowerShell file-system watcher + Claude Code hooks)
- Watcher monitors `row/videos/`. New file → automatic transcription:
  - **YouTube link**: try `youtube-dlp` captions first
  - **No captions**: `youtube-dlp` downloads audio → local **Whisper Large** transcribes
  - **MP4 / audio**: straight to Whisper
- Images → **GLM OCR** model. Tutak claims it beats Gemini 3 Pro and GPT-5.2 on some OCR benchmarks.
- All preprocessing runs locally → **zero tokens spent**.

> "Pobieranie tych transkrypcji materiałów z YouTuba nie kosztuje mnie nic. To jest po prostu zero tokenów, bo wykorzystuję gotową bibliotekę lub lokalny model do tej transkrypcji."

### 3. Compilation (LLM)
Triggered three ways:
- Manually via `/ingest` slash command
- Automatically nightly at **23:00** via a Claude Code `session start` hook acting as a cron
- File-watcher-driven for individual new files

Three things the LLM compile pass produces:
1. **Synthesis + wiki-links** between concepts
2. **Backlinks** that surface in the graph view
3. **Encyclopedia entries** — concept page split into points / details / key conclusions

### 4. Wiki structure
- **Sources** — short summaries of each input
- **Concepts** — one-topic-one-page (Tutak's examples: *embeddings*, *RAG*, *fine-tuning*)
- **Entities** — people, companies, projects (e.g. *AI Ninjas*, *Astrofaza*)
- **Index** — one file aggregating everything; **the first file the LLM opens when answering**

### 5. Operations
- **Ask** — answers synthesized from the wiki, not from raw sources
- **Lint** — broken links, orphaned pages, contradictions, consistency
- **Custom commands** — e.g. `/daily` produces a daily digest of new notes

### 6. Distribution
Tutak built the workflow as a **Claude Code Skill** describing how to compile knowledge per Karpathy's concept. Shared to AI Ninjas community members.

## Notable Q&A excerpts

**On Anthropic's new "Daily / included routine runs" feature in Cloud:**
> Both prefer custom cron jobs. Reason: Anthropic's solution only works inside Claude Code, no mobile or external trigger. Custom CRON gives them control + integration with anything.

**On privacy:**
> "Niektóre rzeczy będą musiały być zrobione, zadbana ta prywatność, więc albo anomalizacja danych, albo przetwarzanie też na lokalnych modelach."
> Sensitive data path: anonymize OR run on local models (Whisper, GLM OCR).

**Reference to Kuba Masztalski:**
> Mentioned he attended a meetup where Kuba Masztalski demonstrated his own Karpathy-LLM-Wiki variant for SMEs as a paid service. (Worth tracking later.)

**On daily use:**
> Tutak's biggest win: *"Jeśli pracuję nad parę projektów jednocześnie, to dużo wiedzy mi potrafi uciekać"* — running multiple parallel projects, the second brain prevents context loss.

## Why this matters to Claude Brain

- **The 23:00 hook pattern** — Tutak uses Claude Code's `session start` hook as a cron. Claude Brain currently runs scans on remote routines (08:00 / 09:00 Warsaw); the local-hook pattern is a complementary option, especially for users without Anthropic remote routines.
- **The auto-ingest pipeline** — file-watcher + yt-dlp/Whisper for sources is the natural extension of the [yt-transcript.sh](../../.claude/scripts/yt-transcript.sh) we just built today (ingest-005). Worth considering whether to add a watcher.
- **GLM OCR** — net-new tool the wiki should track if we ever ingest scanned docs / screenshots.
- **Skill packaging** — Tutak distributes his workflow as a Skill. We could do the same once the schema stabilises.

## Polish-specific terminology used

- "Drugi mózg" / "Second Brain" — used interchangeably; the EN term is more common in the workshop.
- "Wiki", "Encje" (entities), "Koncepty" (concepts), "Indeks" — Polish naming for the wiki page types Tutak uses.
- "Hooky" — Polish-anglicization for hooks.
- "Row" (raw) — kept as English in his folder names.


## Transcript

Source: local Whisper (whisper.cpp `ggml-large-v3-turbo`), language auto-detected as Polish. Lightly noisy (proper-noun spellings may be off; pause-words preserved). Each line is one Whisper segment.

```
 Music.
 Dzień dobry, dzień dobry moi drodzy, witam was serdecznie na kolejnym warsztacie AE Ninjas, który standardowo prowadzą dla was Krzysztof Tutak i Krzysztof Błohaczek.
 I Krzysztof Błohaczek, witam, witam również.
 Standardowo zanim wskoczymy do dzisiejszego tematu, to pytanko do was, czy nas widać, słychać i czuć.
 No i że będziemy tutaj wdzięczni, bo demowie, bogowie demo zazwyczaj nie są łaskawi.
 Mam nadzieję, że dzisiaj właśnie będzie.
 Ooo, mamy już tutaj jednego ninja, który ma bardzo dobry węch, to bardzo dobrze świadczy.
 Mnie gorzej słychać, może się spróbuję przepiąć na drugi mikrofon, to może będzie lepiej, ale...
 Ok, widać i słychać, super, wielkie dzięki, także tutaj pomału już osoby się zbierają, mamy już na pokładzie 120 osób, więc bardzo fajnie, cieszymy się.
 Zanim jeszcze wskoczymy do dzisiejszego tematu, to takie pytanko do ciebie Krzysztof, co tam ciekawego się wydarzyło przez ostatni miesiąc?
 Powiem ci, że dosyć intensywnie, w ogóle nie mieliśmy nawet okazji gdzieś tam zgrać w tym miesiącu, na pewno było ciężko.
 Dopiero co święta, teraz po świętach majówka się zaraz szykuje, także strasznie tych dni ucieka, natomiast pozytywnie, raczej pozytywnie narzekam.
 Wszystko w porządku, dzisiaj nowy warsztat, inny temat niż zwykle, także też jestem ciekawy jak to nam wyjdzie i czy wam temat w ogóle się spodoba.
 Także to tyle ode mnie, może ty Krzyśku tutaj też coś powiesz?
 Dla mnie to też mega był intensywny czas, ostatni miesiąc, sporo rzeczy się tutaj dzieje, zarówno w kontekście biznesowym, czy też właśnie tematów, z którymi działam na co dzień.
 Natomiast tutaj już chyba nie ma zbytnio co przedłużać, więc lecimy tutaj dalej z tematem.
 Jak już pewnie tutaj zobaczyliście teraz na ekranie dzisiejszy temat, to zbuduj swój second brain z wykorzystaniem cloudcoda i obsidiana.
 I to co będziemy chcieli wam dzisiaj...
 Dobra, ale zanim jeszcze tutaj wskoczymy do tematu, to może kilka słów o nas.
 Krzyśku, może byś rozpoczął?
 Tak, no to ja jestem tak samo jak Krzysiek Ninjo, jednym z AI Ninjas, natomiast na co dzień zajmuję się, jestem programistą w sektorze finansowym,
 gdzie po prostu działam od strony Fullstacku, ale też różnej integracji z AI.
 Na co dzień też działam mocno w social mediach, szczególnie na Linkedinie i też właśnie teraz na YouTubie
 w ramach właśnie edukowania z wykorzystania po prostu mądrego AI.
 I dodatkowo właśnie prowadzę warsztat tutaj jako jeden połówka, że tak powiem, ninży, AI Ninjas,
 wraz z Krzyśkiem, gdzie również dzielimy się wiedzą na takich bezpłatnych warsztatach oraz w naszej społeczności.
 Jeśli chodzi o mnie, to pewnie część osób kojarzy mnie z takich inicjatyw jak podcast "Bliskie spotkania z AI",
 które mam przyjemność prowadzić, czy też może z konferencji AI Miners, którą organizuję.
 Na co dzień zajmuję się AI już od dłuższego czasu, a ponad 10 lat mam doświadczenie jako programista,
 więc tutaj w takich bardzo technicznych obszarach się poruszałem przez dłuższy czas.
 No i myślę, że tyle, nie ma co tutaj już tak zbytnio przedłużać.
 I jaki mamy plan jazdy na dzisiaj?
 Wyjaśnijmy od wyjaśnienia koncepcji Second Braina.
 Czym w ogóle to jest?
 Po co w ogóle taki budować Second Brain?
 A następnie wskoczymy do serii aż czterech live demo, gdzie pokażemy w jaki sposób można dokonać tej migracji notatek z Notion do Obsidiana.
 Pokażemy, jak można realizować sobie research i syntezę wiedzy z wykorzystaniem właśnie tutaj Cloud Coda.
 A następnie wskoczymy do demo, w którym poopowiadamy o takim koncepcji, który ukrół pewien człowiek, zwany Carpatim.
 Gdzie pokazuje taki sprytny sposób, w jaki można stworzyć takie sobie ELM Wiki.
 A następnie skoczymy do kolejnych takich przykładów, gdzie pokażemy, jak można ocerować dokumenty i wrzucać je bezpośrednio do naszego Obsidianowego Volta.
 Czy też kilka innych takich case'ów pokazujących, w jaki sposób można planować zadania i kilka innych.
 Z wykorzystaniem tutaj właśnie tego tandemu, czyli Cloud Code i Second Brain.
 A na sam koniec przejdziemy sobie do sekcji Q&A.
 No i oczywiście na koniec tej części merytorycznej mamy też dla Was jeszcze pewną niespodziankę, którą będziemy zdradzać później.
 Dokładnie. Może nie wszystko na starcie.
 Dokładnie.
 Także tutaj już możemy przejść do tej części z demo.
 Przepraszam, nie z demo, tylko tutaj do wyjaśnienia, czym jest w ogóle ten Second Brain, więc tutaj już oddaję Majka Krzyśkowi.
 Dziękuję bardzo, ja się tu jeszcze włączę na pełen ekran.
 No właśnie.
 Czym jest w ogóle Second Brain?
 Czym jest wbudzowanie takiej bazy wiedzy?
 I tak krótko zaczynając tutaj tym slajdem.
 Twoja wiedza zasługuje na więcej niż tylko wyszukiwarkę.
 I mianowicie, co mam na myśli.
 Z AI jest pewien problem.
 I taki, którego już jak zauważysz, to raczej nie odzobaczysz.
 I ten problem nie dotyczy tego, że AI halucynuje, albo że jest drogie, to z tym musimy się liczyć na co dzień.
 Natomiast chodzi o coś głębszego.
 O to, jak układamy sobie z nim relacje i budujemy wiedzę.
 No bo takie klasyczne podejście, to jest przeważnie, większość po prostu z nas używa AI w sposób:
 Pytasz, dostajesz jakąś odpowiedź, no i następnie zamykasz, czy to czat, czy to jakiegoś asystenta.
 Jutro masz podobne pytanie, może z tego samego obszaru, tego samego projektu.
 No i znowu musisz zadać pytanie, wytłumaczyć kontekst, wytłumaczyć w ogóle AI-owi, z czym mamy do czynienia.
 No i na poziomie pojedynczego pytania to jest całkiem dobre, ale zatrzymajmy się i spójrzmy, co tu się właściwie dzieje.
 Każde pytanie startuje od zera.
 Czyli AI nie pamięta, co wczoraj tak naprawdę dostał od ciebie.
 Nie pamięta też, że zadawałeś podobne pytania tydzień temu, czy miesiąc temu.
 Nie pamięta, w jakim miejscu jest twój projekt.
 Nie zna kontekstu tak naprawdę tego, co się dzieje wokół ciebie na co dzień.
 I nic się nie zapisuje, tak?
 Przynajmniej tak patrząc na takich asystentów przeglądarkowych.
 Mamy oczywiście tam sekcję memory, ale tak patrząc na takiego podstawowego asystenta, no to ten kontekst faktycznie się nie składa.
 Praca, którą włożyłeś dzisiaj na sformułowanie dobrego prompta, wytłumaczenia czegoś asystentowi, jutro wyparuje.
 No i mamy taki mechanizm, ten mechanizm ma pewną nazwę RAC, czyli Retrieval Augmented Generation.
 To jest technika, której używa chociażby ChatGPT, jak wrzucisz mu pliki, notebook.lm, klo z załącznikami.
 Wszystko to działa w tym samym schemacie.
 Czyli wrzucasz dokumenty, AI je indeksuje do wektorów, zadajesz pytanie, AI wyciąga pasujące fragmenty, czyli te czanki, a następnie składa z nich odpowiedź.
 Czyli jest w stanie na bazie twoich jakichś dokumentów, załączników, faktycznie przetwarzać i wyciągać informacje.
 Działa to jak najbardziej w tych asystentach przeglądarkowych, ale każde kolejne pytanie, no RAC zaczyna po prostu od zera.
 Szuka, wyciąga, składa i tak dalej od początku.
 I to, co właśnie wcześniej mówiłem, nic się składa, to znaczy, to jest jeden z tych problemów, czyli nic nie rośnie w czasie.
 Czyli wyobraź sobie takiego badacza, który powiedzmy tygodniami czyta różne publikacje naukowe i teraz gdybyś mu powiedział, hej, jutro zapomnisz wszystko, no to to brzmi dosyć absurdalnie, ale tak to właśnie działa.
 Czyli to, co dokładnie robimy z AI na co dzień.
 Z czasem zauważysz, że po prostu pracujesz dla AI, musisz za każdym razem tłumaczyć mu kontekst po raz piąty, dziesiąty w tym samym miesiącu,
 po prostu zrobić, żeby AI pracowało dla ciebie i było świadome tych projektów i narzędzi, z którymi działasz na co dzień.
 I to, co ostatnio taka publikacja, którą przygotował Carpati, czyli współzałożyciel OpenAI,
 były szef AI Tesli, to przygotował taki, można powiedzieć, dokument, gdzie wytłumaczył, jak może działać taka personalna baza wiedzy,
 wiki, on to tak nazywa, i wrzucił właśnie na Twittera post i dołożył takiego właśnie dłuższego gista, taki plik właśnie dokumentowy.
 Jednym zdaniem przewrócił ten model do góry nogami, może troszeczkę tutaj podkoloryzowuje, bo to może nie jest coś nowego,
 natomiast można powiedzieć, że dał temu tematowi drugie życie.
 Czyli Obsidian to ID, LLM to programista i wiki to codebase. Obsidian jako narzędzie właśnie do zarządzania tą naszą bazą wiedzy.
 LLM, czyli nasz model, tworzy właśnie te różne powiązania, a wiki to jest to nasze źródło, które, ta cała właśnie wiki, którą utrzymujemy.
 To jest kod, czy właśnie różna struktura plików. I chciałbym, żebyś na chwilę tutaj z nami uczestniku tego live'u zatrzymał się nad tym zdaniem.
 Jak to rozpakujesz, to po prostu zmienia to pewien sposób myślenia o notatkach.
 AI już nie wyszukuje, nie tyle wyszukuje, ale też buduje.
 I tu jest pewny switch, który trzeba zauważyć.
 Czyli zamiast zadawać pytanie i kazać, szukać po dokumentach, dajesz mu rolę takiego programisty, badacza, który utrzymuje twoje repozytorium, twoją bazę wiedzy.
 Tyle, że ten codebase, twoje repozytorium to nie jest sam kod, tylko właśnie, tak jak mówię, różne notatki,
 różna syntetyzowana wiedza, podsumowania. I teraz one są zlinkowane między sobą, czyli mogą do siebie również te różne notatki nawiązywać.
 Więc to jest też bardzo ważne, czyli rosną również w czasie. Po prostu jak rozwija się to repozytorium, rozwija się twoja baza wiedzy, to one też po prostu rosną wraz z tobą.
 AI czyta nowe źródło, aktualizuje istniejące strony, tworzy nowe tam, gdzie po prostu jest to wymagane, więc synteza robi się raz, a potem rośnie.
 Czym jest w ogóle Vault? Jest takie określenie w terminologii Obsidiana. Vault to jest nic innego jak folder.
 Czyli to, co też jest dużą przewagą tego narzędzia Obsidian, o którym dzisiaj będziemy tutaj rozprawiać, to to, że tak naprawdę pod spodem to jest zwykły folder na waszym pulpicie,
 czy w jakimkolwiek innym katalogu, który zawiera pliki markdown. I to jest na tyle proste.
 Także pierwsza też rzecz, albo dodatkowa, którą tutaj daje nam przewagę Obsidian, to to, że nie mamy vendor lockina, czyli prosto mówiąc, nie jesteśmy związani z żadnym dostawcą.
 Równie dobrze możemy odinstalować tego naszego Obsidiana i dalej z nim działać w ramach tych po prostu plików, tej płaskiej struktury, którą wypracowaliśmy.
 No dobrze, i pod spodem to, co powiedziałem przed chwilką, to są różne pliki markdown, które mogą znajdować się na twoim dysku.
 I teraz, jak jutro chociażby Obsidian wniknie, no to dalej te notatki zostają u ciebie na komputerze, także nie musisz w ich w żaden sposób za nowo pobierać.
 Także to, co ja, gdzieś tam moje takie przemyślenia na ten temat, czemu w ogóle Obsidian i czemu zacząłem też korzystać z Obsidiana, a mianowicie przez trzy lata prowadziłem Notion.
 Rozwijałem swoją bazę wiedzy, taki second brain, z notatkami przez, no właśnie długi okres, trzy lata.
 I na moim przykładzie dużo z tych notatek, czy to właśnie projekty, researche, jakieś różne wyciągi z książek, no tej wiedzy było bardzo dużo.
 Natomiast w pewnym momencie im więcej tych rzeczy miałem, tym rzadziej do tego zaglądałem.
 A to z tego powodu, że oprócz dodawania nowych rzeczy, to trzeba się też zajmować utrzymaniem takiego naszego second brain'a.
 No i moje notatki często stawały się już cmentarzyskiem, często do niektórych z notatek w ogóle nie byłem w stanie wrócić,
 nie byłem w stanie się połapać w strukturze, gdzie one właściwie są, więc było na pewno ciężko.
 No i właśnie tutaj to są też powody, dlaczego mój Notion umarł, czyli no nie było czegoś takiego jak integracja z AI.
 Nie mógł mi AI przeglądać, wyciągać tych danych.
 Jeśli chodzi o MCP, no bo dzisiaj mamy coś takiego w Notion jak MCP, czyli jesteśmy w stanie łączyć się
 naszymi agentami do tej bazy wiedzy i wyciągać informacje.
 To samo MCP jest dosyć toporne, żera dużo tokenów.
 To wyszukiwanie działa słabo i dosyć punktowo i często gubił po prostu jakieś treści, których szukałem,
 albo były problemy, musiałem wiele razy iterować, żeby dostać konkretny dokument, a już nie mówię o edycji.
 No i też Notion wymagał pewnego remontu, o którym powiedziałem.
 Jeśli miałbym to robić ręcznie, no to zajęłoby mi na pewno to parę tygodni.
 Także to, co ja zrobiłem, nawet przed tym jeszcze przygotowaliśmy się jeszcze przed tym warsztatem,
 to pierwsza rzecz, która mi przyszła na myśl, czemu nie wyeksportować tego właśnie do Obsidian'a i zarządzać tym lokalnie.
 Obsidian świetnie pracuje teraz chociażby po różnych CLI, czyli rozwiązania takich narzędziach terminalowych z właśnie asystentami, z agentami.
 I tutaj eksport takiego pliku zajął mi, mojego wielkiego Notion zajął mi niecałą godzinkę,
 to akurat nie po API było wszystko wyciągane.
 Później klot zrobił audyt, stwierdził co jest do poprawy, jakie linki są już przestarzałe, nieaktualne
 i też był w stanie otagować je i przygotować mi taką bazę wiedzy.
 I to też chcę wam dzisiaj pokazać.
 Także już tak słowem wstępu trochę się rozgadałem, natomiast przejdźmy i pokażę wam w praktyce, jak wy możecie to zrobić u siebie.
 Oczywiście jeśli chodzi o Obsidian, to co pokażę jeszcze, to nie musimy oczywiście zamykać się tylko do konkretnie Notion.
 Oczywiście te integracje działają z wieloma innymi narzędziami.
 Tutaj z takich rzeczy, z którymi możemy się integrować to chociażby Notion, natomiast mamy też Evernote'a,
 mamy też chociażby Google Notes, na przykład notatki w iOS.
 Także jest tego bardzo, bardzo dużo i nie musimy za to płacić, bo to narzędzie jest w pełni darmowe.
 Także to też jest ważny punkt.
 Teraz jak możemy w ogóle sobie takie integracje zrobić.
 Ja tu jeszcze tylko na szybko chcę pokazać właśnie to, co będziemy dzisiaj pokazywać.
 Są pewne plug-iny stworzone przez społeczność, z tego powodu, że to jest rozwiązanie dostępne za darmo,
 no to jest duża społeczność za tym projektem i ludzie dzielą się różnymi przemyśleniami.
 I też różnymi plug-inami, rozwiązaniami do swoich Obsidianów.
 I takim jednym z najpopularniejszych wtyczek to jest właśnie importer.
 On właśnie nam ułatwia tą całą integrację.
 Zobaczcie, tutaj są przeróżne narzędzia, jakby Bear, mamy Evernote, Notion, OneNote, Apple Notes.
 Także można się tutaj z tym zaznajomić.
 Można nawet zwykłe pliki markdown, zlcasten, mamy też zwykłe pliki html.
 Także jest tego dużo, dużo.
 Wy możecie oczywiście na czacie napisać, gdzie wy macie na przykład swoje notatki,
 gdzie wy je przytrzymujecie, więc też można później w ramach Q&A poruszyć ten temat,
 jak można to sprytnie zaimportować.
 Ja dzisiaj na tapet wziąłem Notion.
 I tutaj mamy parę sposobów.
 Albo przez API, czyli będziemy musieli wygenerować sobie integrację po stronie Notion,
 wygenerować swój klucz i następnie będziemy mogli za pomocą tego klucza
 po prostu sobie te notatki ściągnąć.
 Mamy też file import, czyli po prostu wchodzimy na nasz Notion do general,
 zakładki ogólne i możemy wyeksportować pliki.
 Tutaj jeśli chodzi o ten eksport, on nie jest aż taki dobry jak po API.
 Często te informacje są gubione.
 Dostawałem bardzo dużo błędów przy takim imporcie.
 Także tutaj, jeśli macie opcję zrobienia tego po API, to trwa o wiele dłużej.
 Natomiast jakość tego codebase'u jest o wiele lepsza.
 I też jest coś takiego jak Notion zip, czyli możemy po prostu pobrać całego zip'a i też go sobie zaimportować.
 Ja akurat też przy tym konkretnym imporcie miałem problemy.
 Ale przejdźmy teraz na szybciutko do Notion, to może Wam pokażę jak to u mnie w praktyce wygląda.
 W ogóle zacznijmy od Notion, żeby nie było, że ja to wymyśliłem i że to nie jest właśnie moje Notion.
 Także tutaj oczywiście bez pokazywania jakiejś bardzo szerokiej listy tych notatek, które mam w tym Notion, no to mamy jakieś różne page'e.
 To jest właśnie moja baza wiedzy, którą sobie tutaj buduję przez lata.
 I teraz jest coś takiego jak settings.
 Jak przejdziemy do ustawień, to będziemy mogli sobie, chwileczkę, to będzie tutaj settings.
 To będziemy mogli sobie taką integrację tutaj w connections wygenerować.
 Mam tu różne aplikacje podpięte, natomiast co będziemy musieli zrobić, to stworzyć sobie właśnie taki nowy connection.
 I teraz ja już mam tutaj tego obsidiana połączonego.
 On może sobie po tym API korzystać.
 Stąd mogę sobie skopiować mój integration token.
 I teraz jak mam skopiowany ten token, to mogę wrócić do naszego obsidiana.
 Jeśli chodzi o instalację obsidiana, jest to bardzo proste, bo wystarczy wpisać obsidian, download i linki też są na internecie.
 Oczywiście podrzucimy to w ramach takiej notatki podsumowującej po warsztacie na wasze maile.
 I teraz to, co widzicie po lewej stronie, to są przeróżne struktury, które ja tutaj mam w ramach mojego Notion.
 I jak ja to w ogóle zaimportowałem wszystko?
 No bo nie robię tego oczywiście ręcznie, bo to by mi zajęło bardzo, bardzo długo.
 Ale to, co powiedziałem wcześniej, mamy wtyczki.
 I teraz jak przyjdziemy sobie do przeglądania wtyczek, tutaj widzę, że aktualnie mam jakiś problem,
 ale pokażę wam może drugie też repozytorium, drugi Notion, który mam tutaj na boku też odpalony,
 w którym budowałem sobie tak naprawdę też notatki w ramach obsidiana.
 Czyli zrobiłem sobie osobnego Volta, w którym badam, co można potencjalnie zrobić ciekawego jeszcze z obsidianem.
 To jest takie źródło dla mnie wiedzy, w którym rozbudowuję sobie właśnie w tym konkretnym temacie.
 I jeśli wejdę tutaj w te wtyczki Preferences, proszę bardzo, wbudowane wtyczki.
 Ja już mam ich troszeczkę poinstalowanych i też postaram się je omówić później,
 jak jeszcze po Krzyśku prezentacji, jak będziemy mieć chwilę.
 Ale takie najważniejsze, co ja mam, to właśnie importer.
 Nie wiem czemu akurat dzisiaj jest jakiś problem, to tak jak zwykle przy demo.
 Generalnie, jeśli mamy zainstalowanego tego importera, to jak tutaj z poziomu wtyczek społeczności,
 jak dodamy sobie tego importera, możemy go śmiało wyszukać.
 Importer, dzisiaj widzę, że jest jakiś problem.
 Wyświetli wam się tutaj jako plugin i następnie jak go zainstalujemy, klikamy zainstaluj,
 to jest bardzo intuicyjne.
 Tutaj ptaszkiem z poziomu wtyczki społeczności będziemy musieli go włączyć.
 To on nam się pojawi tutaj po lewej stronie w zakładkach.
 Ja może to zoomuję, bo wiem, że ekran może być malutki.
 O, proszę bardzo, będzie lepiej.
 Mamy open importer.
 I co tu ciekawego mamy?
 Różne file formaty.
 Czyli możemy importować CSV, Google Keep, Evernote, to co mówiłem wcześniej.
 Więc my wybieramy Notion i tutaj wprowadzamy swój token.
 Następnie mamy załadowane też tabelki, które wskazują nam,
 ja może widzę, że teraz akurat tego tokena nie skopiuję,
 natomiast jak już pobiorę ten token, to będę mógł sobie zobaczyć,
 jakie konkretne tabele mam do załadowania.
 Możemy wybrać oczywiście, nie musimy wybierać wszystkich.
 Możemy też dodać tutaj import taki inkrementalny,
 czyli jak w przyszłości będziemy importować jakieś rzeczy z Notion,
 to nie będzie na nowo dodawać tych samych page'y,
 ale sprawdzi, które są nowe i zaimportuje te,
 które są no właśnie zaktualizowane lub jakieś nowsze.
 I tutaj są różne ustawienia jeszcze do tego,
 jak chcemy podejść do tego importu.
 Także polecam sobie poczytać, jak dokładnie ma być to sformatowane.
 Następnie klikamy import i voila.
 I tak naprawdę to jest tyle.
 Będziemy musieli poczekać chwileczkę, aż ten import przebiegnie, pomyślnie.
 No mi trwał taki import do około 40 minut,
 ale też mam bardzo rozbudowaną tą wiedzę, tą bazę wiedzy.
 I teraz co jeszcze można ciekawego zobaczyć z poziomu Obsidianu,
 oprócz tego, że mam tutaj te notatki.
 Mamy coś takiego jak otwórz podgląd grafu.
 I to jest właśnie to, co jest też przewagą Obsidiana.
 A mianowicie nie to, że mamy jakiś tam śmieszny wizualny podgląd,
 ale to, że te notatki mogą do siebie, mogą się ze sobą łączyć.
 Mogą być różne nawiązania do różnych notatek.
 I teraz widzimy takie pewne zbiory.
 Tutaj mam różne, chociażby AI Toolkit.
 To jest taki lead magnet z różnymi narzędziami, które ja stworzyłem.
 Taki przybornik z różnymi narzędziami AI.
 I teraz jak kliknę sobie w ten przybornik, to mam bazę ze wszystkimi linkami różnych,
 różnorakich narzędzi, 409 pozycji.
 I teraz w poziomu tego grafu mogę zobaczyć, jakie konkretne tutaj notatki,
 jakie konkretne wpisy są z tym połączone.
 Czyli jak przejdę znowu do tego Toolkitu, mamy przeróżne, każde kropka,
 każdy tutaj obiekt to jest osobna jakaś notatka.
 Czyli włączam i mam podgląd danego widoku, czyli właśnie notatka z Notion,
 z konkretnym opisem, oceną tego narzędzia, linkiem i tak dalej, i tak dalej.
 Także to, co chcę wam przekazać, że to jest właśnie też potęga obsydiana,
 że jesteśmy w stanie budować przeróżne powiązania pomiędzy naszymi właśnie tą wiedzą, notatkami.
 Ale żeby to było jasne, tutaj akurat mam to zrobione z poziomu mojego Notion.
 Tutaj nic nie było modyfikowane, ale w tym drugim Obsidianie,
 tu jest te wszystkie powiązania pomiędzy nimi, no są budowane ręcznie.
 Może nie ręcznie, tylko automatycznie, automatycznie przez Cloda.
 Mianowicie mam tutaj mojego pomocnika w terminalu
 i tutaj jestem w stanie generować sobie po prostu przeróżne,
 możemy sobie zrobić nowy czat, tak?
 Zrobimy sobie nowy czat i jestem w stanie z tym Voltem pracować, tak?
 Czyli powiedz mi, czego dotyczy ten Volt?
 Tak, czyli mogę śmiało Cloda zapytać tutaj w terminalu, z czym mamy do czynienia.
 Tutaj po lewej mamy oczywiście nasze folderki, mam tutaj row, mam wiki, mam personę,
 czyli też określonego siebie jako osobę, mój styl pisania, tworzenia,
 żeby też Clod lepiej zrozumiał, w jaki sposób ja też piszę moje notatki,
 żeby tworzył coś podobnego na mój wzór, tak?
 Czyli mam opisane pokrótce, dedykowany research hub o trzech głównych tematach,
 Obsidian, Cloud Code, no i też integracja pomiędzy tymi dwoma narzędziami.
 No i też jest prosta warstwa, czyli mamy row, czyli takie miejsce,
 gdzie wrzucam wszystkie źródła jak idzie, wiki to jest synteza tej wiedzy,
 no i Cloud to jest cały schemat, taka konstytucja naszego Volta,
 czyli definiuje w jaki sposób te reguły mają się zachowywać,
 jeśli chodzi o tworzenie tych notatek.
 I teraz jeśli chodzi o samego podejście do Carpatiego,
 ja troszeczkę mam to rozwiązanie rozbudowane o różne tutaj integracje,
 pluginy, mam też tutaj różne stopniowania tych notatek,
 czyli na ile jest to źródło zaufane, na ile nie.
 Natomiast tutaj nie będę się rozgadywał, bo Krzysiek Wam też trochę wytłumaczy,
 czym w ogóle jest ta koncepcja LLM wiki.
 Ja tutaj tylko pokazuję Wam jak to wygląda u mnie tak domyślnie i tak na szybciutko,
 żeby pokazać jak to mniej więcej może działać.
 Czyli wejdziemy sobie do przeglądarki i mam przykładowo jakiś filmik,
 powiedzmy Carpatie Obsidian Cloud Code, tak?
 Czyli mogę sobie wrzucić, wyszukać jakiś link, na przykład Obsidian Rack, tak?
 I teraz klikając w ten filmik, biorąc link, mogę sobie też śmiało wziąć i albo skopiować link
 i wrzucić go bezpośrednio do Obsidiana w ten sposób, czyli bierzemy row, wrzucamy nowa notatka
 i dajemy mu tutaj jakiś link.
 Mogę to śmiało tak zostawić.
 I teraz jakiś tam filmik ety, tak?
 I teraz co mogę zrobić, to powiedzieć mu ingest, czy tam syntezuj wiedzę
 i co on zrobi, to przeglądnię sobie te surowe materiały, część z nich już po prostu,
 większość z nich jest już przetworzona, więc doszła nowa jedna jakaś notatka
 i co teraz Cloud zrobi, to zobaczy jakie pliki nie były przetworzone w mojej bazie wiedzy,
 wyłapie takie pliki, nawet jest ich więcej, nie jedno, ale pięć i teraz co on zrobi,
 to te pliki sobie wyciągnie i na bazie ich będzie mógł przygotować właśnie tą wiedzę,
 syntetyzować notatki.
 Proszę bardzo, znalazł pięć różnych źródeł i teraz co mogę zrobić, to powiedzieć mu,
 mam ten filmik na YouTube, tak, tutaj, powiedzieć syntezuj, syntezuj,
 na razie tylko ten jeden, tak, żeby się zajął tylko tym, na razie nie będziemy robić wszystkiego,
 żeby to długo nie trwało, ja działam na opusie oczywiście tutaj do takich notatek,
 możemy śmiało wykorzystać jakiś model typu Sonet, będzie to na pewno wydajniejsze
 i co on teraz robi, to wykorzystuje też skillet, które ma pod spodem,
 do pobierania danych właśnie o tym filmie i następnie przygotuje pewną syntezę
 na bazie tej wiedzy, którą ma i będzie ją aktualizował o te nowe informacje z tej notatki.
 I również jeśli zauważy, że są jakieś sprzeczne argumenty, to też jest w stanie tego,
 w tym wolcie mi to zaznaczyć, że coś jest na przykład nieaktualne,
 albo coś na przykład, tutaj ktoś pokazuje inne podejście i teraz on też może rozważyć,
 które podejście jest stosowne albo zapytać się mnie, więc razem ze mną buduje to wiedzę.
 Tutaj też, Krzyśku, możesz powiedzieć gdzieś tam swoje, jakie przemyślenie masz na ten temat,
 bo to, co też pokazał na przykład Carpatii, to ja widzę tutaj pewien minus w tym wszystkim,
 to to, że w sumie w każdym ragu to tak działa, czyli jeśli dajemy jakiś garbage in,
 czyli jakieś śmieci do środka naszej bazy wiedzy, no to musimy się liczyć z tym,
 że później garbage out, czyli ta wiedza z różnymi błędami może nam później ciążyć w tej naszej bazie wiedzy.
 Także też trzeba brać pod uwagę, co my w ogóle wrzucamy do tego Volta,
 czy te dane, które wrzucamy są poprawne, czy w ogóle wnoszą jakąś prawdziwą wartość do tego Volta,
 czy są jakimś śmieciem, który może nam przynieść mniej korzyści,
 a bardziej zaśmiecić tą naszą bazę wiedzy.
 To możesz też, Krzyśku, powiedzieć, czy z czymś takim się spotkałeś.
 Ja tu tylko jeszcze, zanim oddam Ci głos, bo będziemy się przepinać,
 Krzysiek pokaże też to u siebie już bardziej szczegółowo, jak to można setupować.
 Mianowicie dostałem informację.
 Zanim syntetyzuję, proszę bardzo, dostałem informację.
 Dużo tu pokrywa się z tym, co mamy.
 Czyli Klot nie wrzuca tego bezmyślnie do mojego obsydiana,
 do mojej takiej biblioteki pamięci i wiedzy, tylko pyta mnie,
 czy w ogóle chcemy to wrzucić, czy widzisz tutaj coś ciekawego,
 co moglibyśmy śmiało dodać.
 Mogę mu powiedzieć śmiało, że dwójka chce, żeby stworzył osobną stronę Wiki.
 Wiki Chase AI to jest ten gość, który przygotował autor tego filmu.
 I następnie, no właśnie, na bazie tego będziemy mieć też jakąś notatkę do tego filmu,
 ale będzie to osobna notatka, która nie będzie pokrywała się z innymi.
 Więc zbogacam istniejące strony o nowe claimy tutaj z Chase'u,
 będzie dodawał z tego filmu.
 I co się dzieje tu w tle u góry po prawej, co możecie zauważyć,
 to to, że co chwilę, jak coś się edytuje w moim wolcie,
 jak coś dodaje, czy też Klot zmienia, to co chwilę leci mi tutaj aktualizacja z boku.
 A to z tego powodu, że ten projekt z Klodem mam też wrzuconego do GitHub'a.
 Czemu? Bo teraz za każdym razem, jak robi się jakaś zmiana,
 od razu dostaję nową wersję na GitHub'a
 i mogę ten projekt włączyć sobie z poziomu telefonu,
 z poziomu innego urządzenia, tabletu.
 Także ta baza wiedzy jest ze mną w każdym miejscu,
 nie tylko na moim komputerze.
 I myślę, że to jest też bardzo ważne, no bo po co tworzyć bazę wiedzy,
 która jest niedostępna z innych miejsc, tylko z naszego komputera.
 No jest to dosyć karkołomne i też dodawanie takich notatek
 do takiej bazy byłoby na pewno utrudnione.
 Więc ja mogę w takim setupie dodawać sobie notatki równie dobrze
 z poziomu mojego telefonu.
 I tutaj już jest dodawana notatka.
 Tylko jeszcze pokażę na szybko, jak to wygląda.
 Czyli mamy wiki/karpatyllmwiki, tak?
 Czyli mogę sobie przejść tutaj po lewej, jak mam tego Volta,
 do tej notatki, tak?
 I tutaj poniżej gdzieś zaraz powinno się pojawić to nawiązanie.
 Widzę, że jeszcze się chyba aktualizuje dokładnie.
 Jeszcze musimy chwileczkę poczekać.
 Ale on w różnych plikach, proszę bardzo, dodał sobie te uwagi
 po prostu odnośnie tego filmu.
 Także to też jest fajne.
 Proszę bardzo Obsidian Web Clipper, czyli to jest notatka
 samego tego narzędzia, które też Krzysztof zaraz pokaże
 do łapania różnych treści z przeglądarki, z internetu.
 Też dodał sobie informacje o tym Chase'ie.
 Zaraz to się powinno zaktualizować.
 Będziemy to widzieć.
 Także jeszcze chwileczkę poczekajmy.
 A, dokładnie.
 To, co ja zrobiłem, to to jest folder row, czyli to są surowe dane.
 Więc ja nie chcę też, żeby mojej wiedzy takiej podstawowej,
 którą rzucałem, żeby tu on robił jakieś modyfikacje.
 Chcę, żeby to były surowe notatki, żeby w każdej chwili można było do nich wrócić
 i zobaczyć, co jest bazą do tych notatek syntetyzowanych przez AI.
 To mi daje też pewne źródło wiarygodności, że te notatki nie wzięły się znikąd.
 I tu, jak wrócę do Wiki, tu już są syntetyzowane notatki,
 więc tu będziemy widzieć chociażby nawiązanie do tego filmu.
 Proszę bardzo, tutaj mamy, proszę bardzo, Chase AI.
 Jest jakieś nawiązanie, decyzja i tutaj jeszcze jakbyśmy poszukali dalej,
 to będą pewnie nawiązania do innych plików.
 Proszę bardzo, mogę się pomiędzy nimi przełączać i zobaczyć,
 gdzie one mnie dokładnie prowadzą, tak?
 Więc jak wrócę tutaj do mojej bazy wiedzy, to też można zobaczyć,
 czy ona się bardzo rozrasta.
 I też ostatnia rzecz, którą jeszcze tutaj dodam od siebie,
 to mam też logi, czyli mój obsydian też z każdą zmianą zapisuje,
 co się wydarzyło.
 Mogę sobie wrócić i zobaczyć dokładnie każdego dnia, co doszło do moich notatek,
 jakie zmiany poczyniliśmy, co zaktualizowaliśmy.
 To jest też ważne, żeby mieć świadomość, jak ten volt się rozrasta
 i w którym miejscu jesteśmy.
 I też, co robiliśmy wcześniej, tak?
 Żeby nawet wyłapać potencjalne jakieś błędy,
 a może chcemy coś poprawić.
 To jest też bardzo ważne, żeby widzieć, jaki stan jest na dany dzień tego naszego volta.
 Także rozgadałem się, Krzyśku, także wybacz mi za to.
 I chciałbym, żebyś też pokazał perspektywę ze swojej strony,
 bo też, szczerze mówiąc, nie kontaktowaliśmy się między sobą,
 jeśli chodzi o te projekty, które dzisiaj dla Was przygotowaliśmy.
 Także dla mnie to też będzie ciekawe, jak Ty do tego podszedłeś.
 Podszedłem w dość podobny sposób do Ciebie, bo też oparłem się o Carpatiego,
 aczkolwiek nie modyfikowałem to, jak Ty to uczyniłeś,
 tylko przeszedłem to w powiedzmy 1:1,
 ale wprowadziłem wiele automatyzacji w tym procesie,
 który będę chciał Wam właśnie pokazać.
 Ale zanim jeszcze do tego wskoczymy, to wielka prośba do Was:
 dajcie nam znać, czy to, co pokazaliśmy do tej pory, podoba się Wam.
 Czy widzicie w tym wartość?
 A jeśli tak, to bylibyśmy wdzięczni,
 jeśli byście się odwdzięczyli subem, lajkiem, komentarzem,
 bo to pozwala nam po prostu dotrzeć do większej liczby osób,
 a uważamy, że to, co pokazujemy na tych warsztatach,
 naprawdę jest dobrej jakości,
 a tym bardziej, że jeszcze realizujemy to na żywo,
 to tym bardziej oczekujemy,
 że po prostu się odwdzięczycie w postaci właśnie tych subskrypcji, lajków.
 Oczywiście przymuszamy, to jest Wasza dobra wola.
 Natomiast zapraszamy, zapraszamy tutaj do lajkowania
 i też komentowania.
 Jeśli macie jakieś uwagi, to też to, co ja powiem,
 to ja też w ramach takiego bonusu,
 jak zostaniecie do samego, wytrwacie z nami do Q&A,
 to też z chęcią podzielę się projektem,
 który przygotowałem do zbudowania właśnie takiego wiki od zera.
 Mam przygotowany template tego,
 podobnie jak działa takie moje wiki,
 i przygotowałem szablon, który będziecie mogli sobie
 zaczytać do swojego kloda na swój komputer
 i z nim zbudować taką bazę wiedzy.
 Tam będziecie prowadzeni za rączkę, krok po kroku,
 o czym chcecie tworzyć tą Waszą wiki,
 ten drugi mózg,
 jaka jest Wasza persona, też będziecie mogli opisać.
 To jest też, myślę, ważne do tego, żeby Wasz projekt i Wasz AI
 też rozumiał, z czym ma do czynienia, z kim ma też do czynienia.
 Także też coś takiego podrzucę, natomiast to też dla wytrwałych,
 którzy z nami zostaną, także to dopiero później.
 Także Krzyśku, też tutaj zapraszam na pokazanie siebie też.
 Także oddaję pałeczkę, oddaję ekran.
 Jasne, wielkie dzięki Krzychu, świetna robota.
 Mam już też pierwsze sygnały, że jest git, jasne, że się podoba, sub poszedł, wielkie dzięki.
 Także tutaj sporo osób na czacie jest zadowolona z tego, co dotychczas pokazaliśmy.
 Pamiętajcie, że to, co my teraz pokazujemy, to chcemy Wam pokazać pewne możliwości,
 jakie możecie zrobić z Obsidianem, co on daje realnie.
 I nie jesteśmy w stanie, że tak powiem, pokazać tutaj tego setupu na żywo od zera totalnego.
 Natomiast też to, co myślę, to w ramach takich też materiałów po warsztacie,
 dostaniecie na pewno na maila, o to się postaram, taką podsumowanie z najciekawszymi linkami
 i też nawet z tymi materiałymi bonusowymi, o których tutaj wspominałem przed chwilką,
 żebyście mogli ruszyć z swoim Obsidianem, jeśli wcześniej z nim nie pracowaliście oczywiście.
 Bo jeśli ktoś już działał, to również będą ciekawe take'i i moje uwagi,
 które ja też wprowadziłem w tym wiki.
 Bo to, co ja tu pokazuję, to nie jest taki klasyczny Karpati,
 tylko trochę rozbudowany o moje potrzeby.
 Bo te wiki, które budujecie, te drugie mózgi, że tak powiem,
 powinny być dostosowane jak najbardziej pod Was.
 Każdy ma troszeczkę inny styl pracy.
 I myślę, że to, co też Krzyśwu ty pokażesz, to też jest troszeczkę inne podejście.
 Dokładnie, zgadza się.
 Zanim jeszcze ja skoczę na swoją część, którą chciałbym wam pokazać,
 to taka mała przypominajka.
 Jeśli macie jakieś pytania, to śmiało zadawajcie je na poziomie czatu.
 Fajnie jak jeszcze je oznaczycie na przykład jako Q, czyli jako question,
 to nam też to pomoże później odpowiedzieć na te wszystkie pytania,
 bo my oczywiście po naszej tej części merytorycznej zostaniemy jeszcze z Wami
 przez jakieś 30-40 minut, żeby poodpowiadać na te Wasze wszystkie pytania.
 I postaramy się dość mocno zaeksplorować te tematy, które będziecie tutaj do nas rzucać.
 I jeszcze takie pytanko do Was, jakbyście mogli się podzielić na czacie,
 czy ktoś w ogóle już zbudował swój second brain i czy dowozi on wartość.
 Dobra, ja już się tutaj przepinam na prezentację.
 Miałem dopiero zamiar budować.
 Fajnie tutaj zostaliśmy komentarz od Nexora.
 Myślę, że też z tym szablonem będziecie o wiele prościej ruszyć po prostu
 i zbudować taki pierwszy swój second brain,
 bo chodzi o to, żeby ruszyć i zacząć coś z tym robić,
 a nie czekać, nie oglądać setki, tysiące tutoriali,
 tylko już zacząć z tym działać i zobaczyć, jak wam się z tym pracuje,
 bo ja widzę dużo benefitów, chociażby z tym, co powiedziałem wcześniej,
 czyli dania drugiego życia swoim starym notatkom, do których nie zaglądacie,
 bo nie macie na to przestrzeni albo nie chcecie tym zarządzać od nowa, od zera,
 budować,
 tylko możecie też do tego wykorzystać Claude'a czy jakiegoś innego asystenta,
 który będzie z waszym obsidianem mógł współpracować i wyciągać tą wiedzę, syntetyzować.
 Widzę tutaj, że już pierwsze osoby dzielą się informacjami,
 że właśnie są na etapie tworzenia swoich second brainów.
 Kolejna osoba też dzisiaj już tutaj działała, więc to nas tym bardziej cieszy.
 Dobra, jeszcze w ogóle taki mały news, bo odpaliłem przed chwilą nową sesję Claude'a,
 a tutaj...
 Niespodzianka, 4,7 wyszedł.
 Także będziemy mieli okazję dzisiaj na żywo przetestować od razu opusika 4,7.
 Zobaczymy, jak sobie będzie radził z tymi notatkami.
 Natomiast tak jak Krzysiak wam obiecał, że rozszerzę wam trochę koncepcję Carpathiego,
 o co w ogóle w tym wszystkim chodzi.
 Więc tutaj wam pokażę, w jaki sposób Carpathi podszedł do tej koncepcji.
 Bo wiecie, Andrzej Carpathi jest tak naprawdę jednym z ojców tego nowoczesnego AI.
 I on właśnie wpadł na bardzo prosty pomysł, jak używać LLM do zarządzania wiedzą.
 Krzyśku, może na pełny ekran, bo to jest faktycznie, żebyś nawet przybliżył ten właśnie diagram,
 bo nawet na pełny ekran idę, to też super.
 Świetnie, od razu lepiej.
 Jasne, tutaj jak najbardziej tutaj otworzymy.
 Dobra, powinno teraz być już widoczne dla was.
 Okólnie, jeśli chodzi tutaj o tą całą ideę, większość ludzi używa AI jak wyszukiwarki.
 Z taką ideą w ogóle wyszedł Andrzej Carpathi.
 Masz po prostu pytanie, dajesz mu jakieś dokumenty, on ich szuka, za każdym razem od zera.
 Jakbyś za każdym razem tłumaczył nowej osobie całą historię, powiedzmy swojej firmy.
 A co gdyby zrobić to inaczej?
 Z takim pytaniem wyszedł właśnie Andrzej Carpathi i tu pojawiała się jego analogia.
 Wyobraź sobie, że twoje notatki, jakieś artykuły, PDF-y, czy nawet kod źródłowy, z którym pracujesz, jest surowy, nieprzetworzony dla człowieka do czytania.
 Ale LLM jest właśnie takim kompilatorem, który jest po prostu takim naszym kompilatorem, który przetwarza go raz i produkuje coś gotowego do użycia.
 I właśnie tym elementem do użycia, jak tutaj nazwał swoim tym całym koncepcie, jest właśnie to wiki, czyli taki skompilowany już program, gotowy, poukładany z linkami między tematami.
 Nie kompilujesz go za każdym razem, kiedy chcesz go uruchomić, czyli mamy już gotowe, przetworzone notatki.
 No i kolejnym takim etapem to jest taki test suite, który zaproponował, czyli tak zwany lint, który jest to taka kluczowa zmiana.
 Za każdym razem, jak zaprzemy tego naszego test suuta, to on po prostu sprawdza, czy nie mamy jakichś brakujących linków,
 może trzeba coś uzupełnić, może są jakieś sprzeczności, brakuje jakiejś informacji.
 Więc to pozwala nam utrzymać ten nasz second brain w ryzach.
 No i takim ostatnim elementem jest już ten runtime, którym on tak ładnie to nazwał.
 I to jest właśnie kluczowa zmiana, że zamiast za każdym razem szukać w dokumentach,
 masz gotową bazę wiedzy, z którą AI zbudował dla ciebie i możemy sobie z nią rozmawiać.
 Więc w tej fazie po prostu mamy już taką typową interakcję, eksplorację tego, co zbudowaliśmy.
 No i też możemy sobie to podejrzeć właśnie z poziomu takiego graph view.
 Co ważne, Carpatty tutaj też zauważył pewne problemy, że to słabo się skaluje, ale o tym Wam opowiem trochę później.
 I może byśmy już tutaj przeszli od razu do jakichś przykładów, gdzie ja już tutaj mam zbudowaną tą całą strukturę.
 Jak możecie zauważyć, mam tutaj ten właśnie mój fordel row, który zawiera te nieprzetworzone notatki oraz tą całą wiki,
 która już ma skompilowaną wiedzę za pomocą LLM-a.
 I przejdźmy może do jakichś takich pierwszych już przykładów demo, gdzie pokażę Wam właśnie użycie WebClickera, którego Krzysiek wcześniej już używał.
 Załóżmy, że chciałbym sobie dodać ten materiał wideo do moich notatek, więc klikam sobie w WebClickera i daję Add to Obsidian.
 I teraz jak widzicie, otworzył mi się ten Obsidian, a w tle wykonuje się pewna magia.
 Bo jak wcześniej wspomniałem, ja dodałem sobie kilka automatyzacji.
 I jak tutaj już możecie zobaczyć, została dodana cała transkrypcja tego materiału z tego filmu na YouTubie.
 Która trafiła bezpośrednio do moich tutaj notatek, które mam je tutaj w videos.
 Czyli mamy dowody na życie poza ziemią.
 Taki dość kontrowersyjny temat.
 Natomiast, załóżmy, że też mamy jakieś materiały, które przechowywujemy na przykład w postaci PDF-ów.
 Więc ja mam tutaj taki w tej mojej strukturze katalog na PDF-y.
 Więc wrzucę sobie tutaj plik z PDF-em i za chwilkę powinna znów się wykonać pewna magia,
 gdzie tutaj do folderu z przetworzonymi tymi PDF-ami powinien pojawić mi się dokument markdownowy,
 w którym mam dokładnie odzorowaną tą strukturę tego PDF-a.
 To chwileczkę potrwa, bo jest to przetwarzane przez model lokalnie u mnie tutaj na komputerze.
 Aczkolwiek za chwilkę Wam opowiem, w jaki sposób w ogóle zbudowałem tą całą architekturę,
 w jaki sposób te automatyzacje się tutaj wykonują.
 Także jeszcze chwileczkę musimy się uzbroić w cierpliwość,
 a ja w międzyczasie pokażę Wam, jak w ogóle wygląda ten dokument.
 Oczywiście to jest wygenerowany na potrzeby tego warsztatu, więc te wszystkie dane są fikcyjne.
 Więc mamy taki dokumencik, który jest umową o doradztwo strategiczne w zakresie AI.
 Wskoczmy sobie z powrotem do tutaj i jak widzicie, mam już odzorowany ten dokument,
 zapisany całkowicie w formacie markdowna.
 Więc dokonaliśmy sobie ocerowania tego dokumentu.
 Nie stoi też nic na przeszkodzie, żebym wziął na przykład dokument, który jest obrazkiem.
 Mam akurat ten sam dokument, ale zapisany już w formacie jpg.
 Więc jeśli sobie znów go przerzucę tutaj do notesów.
 Notes, notes tutaj. Dobra.
 A, widzicie mi wrzuca tutaj, o nie, tu gdzie bym chciał.
 Dobra, to zróbmy może na razie tak.
 To co jest, myślę Krzyśku, ważne to, żeby wybrzmiało tutaj, no bo ok, no klot sam w sobie też umie czytać różne dokumenty.
 Natomiast to co ty zrobiłeś, to przygotowałeś narzędzie, które, taki przepływ, że tak powiem, przetwarzania tych dokumentów, że on nie leci przez te modele chmurowe,
 tylko masz model lokalny, który trawi ci ten dokument i później te dane jest w stanie zapisać gdzieś w projekcie, na przykład jakieś najważniejsze informacje.
 To to jest, myślę, że ważne do zaznaczenia, czyli to nie jest taka standardowa ścieżka, no bo też nie polecałbym nikomu wklejać jakiś danych poufnych, umów i tak dalej bezpośrednio do cloda.
 Także tutaj to, co Krzysiek zrobi pod spodem, to właśnie ten cały pipeline lokalny.
 Tak, ja za chwilkę tutaj rozszerzę dokładnie, jak ta architektura działa, bo ja za chwilkę tutaj też zapuszczę pewne zadania do tego modelu, które będą trwały sobie kilka minut,
 a w międzyczasie będziemy mogli sobie rozwinąć te wszystkie koncepcje, jak działają te w ogóle automatyzacje,
 ale jak widzicie, ten dokument w postaci JPG został już też przetworzony.
 Czyli ja nie muszę wykonywać żadnych akcji, po prostu wpada mi tutaj dokument, czy to z pomocą WebClippera,
 czy wrzucam manualnie jakiegoś PDFa, PNG, cokolwiek, wszystko jest automatycznie przetwarzane.
 Dobra, zanim jeszcze przejdę do wytłumaczenia tej całej architektury, jak to zostało w ogóle zbudowane, jak to się dzieje tam pod spodem,
 to chciałbym sobie porozmawiać teraz z tymi dokumentami, bo wrzuciłem sobie właśnie ten film z YouTube'a między innymi i tak dalej,
 i mamy tutaj kilka, mamy tutaj do dyspozycji kilka takich elementów, jeśli chodzi o operacje w kontekście,
 w kontekście właśnie tego całego mojego second brain'a wzorowanego na Carpatium.
 Możemy mieć tak zwany ingest, czyli to są takie interaktywna dyskusja z moimi źródłami,
 który czyta właśnie moją tą wiki, ten indeks, sprawdza czy zostało to już przekompilowane,
 następnie mogę sobie z nim porozmawiać, jak to w ogóle działa i tak dalej.
 No i w międzyczasie tego wykonania, tego ingesta, jest realizowana właśnie ta cała kompilacja,
 która trafia do tego katalogu wiki.
 I mogę też sobie normalnie rozmawiać później z tymi notatkami, mogę wykonywać tego linta,
 o którym wcześniej właśnie wspominałem, czyli tak zwany ten health check naszej wiki,
 który sprawdza czy nie mam jakichś uszkodzonych wiki linksów, czy nie ma jakichś brakujących backlinków,
 czy nie wiem, jakichś sprzeczności, brakujących stron, cokolwiek.
 Więc do kolejnych tutaj jeszcze operacji, za chwilkę wrócimy, ale właśnie wykonajmy sobie teraz tego ingesta.
 Więc porozmawiajmy sobie tutaj z tym naszym teraz modelem.
 Także pierwszy taki teścik na żywo, jeśli chodzi o tego naszego opusa.
 Więc ja mam przygotowane w ogóle już takie komandy i skillsy.
 Ja akurat mam tutaj komanda, który kompiluje tą wiedzę.
 Ja sobie go mogę teraz wybrać i jeśli wskażę mu po prostu jako new,
 to on tylko weźmie wszystkie te nowe, które źródła się pojawiły,
 więc za chwilkę opusik powinien mi zwrócić jakie rzeczy pojawiły się w RAW.
 Jak widzicie, on już tutaj sobie zaczyna indeksować, że tu jest właśnie ten przegląd ofert,
 czyli ten mój PDF jako notatka, ten mój JPEG też powinien za chwilkę sobie przetworzyć.
 O widzicie, a jeśli w układzie słonecznym coś tam, czyli już po prostu te materiały wideo,
 które zostały w tym RAW rzucone.
 One są już teraz przetwarzane przez model w ramach tego ingesta i on za chwilkę będzie tutaj z nami rozmawiał,
 czy te źródła chcemy jakoś pogłębić i tak dalej.
 O i widzicie, on już właśnie teraz przeczytał i okazuje się, że w tym moim RAW mam aż pięć różnych źródeł.
 I on tak w skrócie nam opisuje, że do tego mojego RAW skoczyła właśnie jakaś tutaj umowa, skoczył jakiś tutaj materiał dotyczący astronomii,
 czy jeśli tam w Układzie Słonecznym mamy jakieś sondy obcych.
 Skoczył też materiał między innymi tutaj Krzyśka Bohaczyka, klotką za darmo, do którego was oczywiście zachęcam obejrzenia,
 bo świetny materiał Krzyśkowi wyszedł.
 I kolejny materiał, czy mamy dowody na życie poza ziemią, czyli ten, który właśnie wrzucałem w ramach tego materiału.
 No i teraz strategia kompilacji.
 I mam tutaj w jakim kierunku chcę tutaj pójść, czyli PDF/JPG jako jeden wspólny,
 bo on właśnie wykrył, że to są te same.
 Stwierdził, że tutaj mamy jeszcze dwa wideo z astronomią i tak dalej.
 Więc ja mogę mu powiedzieć, że weźmy teraz tylko skompiluj te źródła związane z tymi filmami wideo o astronomii.
 Także dokonujemy sobie teraz tej kompilacji.
 I ten etap trochę potrwa, więc w międzyczasie przejdziemy sobie do wytłumaczenia tej całej architektury,
 jak to zostało przeze mnie tutaj zbudowane.
 Mianowicie całość tutaj opiera się o kilka takich mechanizmów.
 Pierwszym z nich są hooky, czyli jest to mechanizm wbudowany bezpośrednio w Cloud Coda i te hooky, w zależności jakie wybierzemy,
 są uruchamiane albo przed wykonaniem jakiejś komendy, po zakończeniu jakiejś komendy,
 czy też po prostu możemy je wykorzystywać nawet w ramach skryptów pisanych, tutaj oczywiście przez koda jakichś bashowych, powershellowych i tak dalej.
 Ja na przykład mam kilka takich przygotowanych już rzeczy, jeśli chodzi o hooky i między innymi jednym z takich hooków jest session start.
 I on jest wykonywany, co ciekawe, raz w nocy o 23.
 Czyli każdego dnia o 23.00 te wszystkie notatki, które trafiają do row, są kompilowane do wiki.
 Jest to o tyle fajny mechanizm, bo ja sam nie muszę wchodzić i rozmawiać teraz z moimi źródłami.
 Tylko dzięki temu zyskuję, na przykład jak rano sobie usiądę, że mam wszystkie te źródła już ładnie przerobione.
 Ważne, czy ja tam wrzucę PDF-a, wrzucę PNG, czy wrzucę jakieś linki do filmów na YouTubie, wszystko zostanie przetworzone.
 Bo jak już wcześniej widzieliście, jest tutaj właśnie taka automatizacja jak File System Watcher.
 Jest to zbudowany powershellowy skrypt, który tak naprawdę zasadza się na przykład na ten row videos katalog i on śledzi.
 Jeśli pojawi się jakiś w nim nowy plik, to automatycznie wykonuje transkrypcję.
 No i też to zostało zrobione w taki sprytny sposób w moim przypadku, że w pierwszej kolejności, jeśli jest to materiał na YouTubie,
 to pobieram bezpośrednio z YouTuba napisy za pomocą takiej biblioteki jak YouTube DLP.
 Ale jeśli nie ma napisów, to wtedy wykorzystuję fallbacka, którym jest lokalny model, czyli Whisper Large, który pobiera sobie...
 Wróć, pobieram sobie za pomocą tego właśnie YouTube DLP materiał audio, a następnie transkrybuję go za pomocą Whispera.
 Dzięki czemu pobieranie tych transkrypcji materiałów z YouTuba nie kosztuje mnie nic.
 To jest po prostu zero tokenów, bo wykorzystuję gotową bibliotekę lub lokalny model do tej transkrypcji.
 Tak samo jeśli wpadnie mi plik MP4 czy jakiś inny format wideo, to on jest wtedy z automatu realizowany przez właśnie tego Whispera.
 I te wszystkie akcje wykonują się w tle, zarówno OCR-y i tak dalej.
 I w przypadku OCR-a wybrałem dość taki ciekawy model, mianowicie jest to GLM OCR.
 Jest to model, który według benchmarków, o ile można im wierzyć, jest dużo lepszy niż nawet taki Gemini 3 Pro, jeśli chodzi o kilka benchmarków.
 Wypada dużo, dużo lepiej, czy nawet taki GPT 5.2.
 Więc to jest naprawdę fajny, solidny model i jak możecie zauważyć, jego rezultaty są naprawdę bardzo fajne,
 bo jak sobie przejdę tutaj do tych Proceed, to bardzo fajnie sobie poradził choćby z tym dokumentem.
 Dobra, trochę się rozgadałem o tych hookach, więc skąd w ogóle biorą się te źródła, warto sobie odpowiedzieć na takie pytanie.
 Więc jeśli chodzi o te źródła, to mamy tak naprawdę kilka tutaj opcji.
 Pierwszą z nich, którą wam pokazałem wcześniej, jest Obsidian Web Clipper.
 Czyli po prostu wchodzę sobie na jakąś stronę i mogę zapisać, czy to jakiś artykuł blogowy, który leci do row articles,
 albo jakiś link z YouTube'a, który leci do row videos.
 Jest zapisywany, albo po prostu manualnie mogę sobie przerzucać te wszystkie pliki,
 jak wcześniej też zresztą to zrobiłem w przypadku tych umów, czy obrazków,
 które lecą do konkretnego folderu i z automatu za pomocą właśnie tych watcherów,
 które są uruchomiane przez hooki, są natychmiast transkrybowane, oceorowane i tak dalej.
 Następnie właśnie jest wykonywany ten preprocessing, o którym kilka chwil wcześniej wam opowiedziałem.
 Czyli odpalają się watchery i robimy OCRy obrazków, czy jakieś transkrypcje materiałów za pomocą właśnie tego YouTube DLP,
 czy nawet Whispera, jeśli to jest plik audio.
 No i następnie jest wykonywany kolejny etap i ten etap to jest tak naprawdę właściwie ten kompilator,
 o którym mówił Carpaty, czyli LM bierze przygotowane źródła i kompiluje z nich wiki.
 Ale mamy trzy sposoby, żeby to w ogóle uruchomić.
 Mamy takie trzy etapy, których się tutaj dzieją.
 Czyli mamy tę syntezę tej wiedzy i tworzenie tych wiki-linksów, o których wam Krzysiek tam wcześniej mówił,
 czyli te połączenia między tymi wszystkimi elementami.
 Generujemy backlinki, czyli takie powiązane sekcje, na podstawie których tworzy się graf wiedzy, który wam też Krzysiek wcześniej pokazał.
 No i mamy też taki element encyklopedii, czyli system po prostu pokazuje koncept choćby tej strony podzielony na jakieś punkty, detale,
 przedstawiający jakieś kluczowe wnioski i tak dalej.
 No i te tryby są uruchamiane na wszelaki sposób, bo mogę uruchomić sobie coś ręcznie, czyli tak jak teraz tego ingesta sobie uruchomiłem.
 Czyli po prostu robię /ingest i zostaje to realizowane.
 Natomiast ja mam jeszcze te hooki, o których wam wcześniej wspominałem.
 I właśnie mam tutaj takiego hooka, który nazywa się session start.
 Może trochę niefortunna nazwa, ale on generuje mi właśnie taki ingest o 23 każdego dnia, który jest kompilowany właśnie do tego wiki.
 I to jest właśnie ten cały cron job.
 Dobra, kolejny, czyli jak już ten lm compiler sobie zadziała, to mamy tutaj, w końcu lądujemy właśnie w tym całym naszym, wszystko to ląduje w tym naszym wiki.
 I jest to właśnie ten skompilowany program według analogii Carpatiego.
 I mamy tutaj strony źródeł, czyli takie krótkie podsumowania każdego artykułu, PDF-a, transkrypcji, co tam było, po co to czytaliśmy.
 Mamy też jakieś takie koncepty stron, czyli jeden temat, jedna strona, jakieś embeddigi, ragi, fine tuningi, każdy temat ma jakby swoją tutaj stronę.
 No i mamy też generowane te esencje, czyli tutaj możemy mieć na przykład jakieś konkretne osoby, firmy, projekty, które pojawiają się w tych naszych materiałach.
 No i mamy jeszcze ten cały indeks, czyli to jest taka jedna strona, która zbiera wszystko.
 To jest pierwszy plik, który lm otwiera, kiedy zadajesz jakieś pytanie.
 No i następnie w ramach tego wiki możemy sobie robić tak naprawdę trzy rzeczy.
 Czyli możemy zadawać pytania, czyli dostajesz odpowiedź syntezowaną na podstawie tej naszej wiki.
 Nie z tych dokumentów już skompilowanej wiedzy, ale właśnie z tej takiej syntezy w ramach wiki.
 Możemy też sobie sprawdzać, robić linty, czyli możemy sprawdzać tą naszą wiki, czy ona jest spójna, czy nie ma jakichś zepsutych linków, osieroconych stron, sprzeczności między artykułami.
 No i możemy sobie wykonywać jeszcze polecenia typu ingest, daily i tak dalej.
 Czyli na przykład mam też tutaj takiego komanda, który przygotowuje mi takie codzienne podsumowanie tych notatek.
 No ale teraz weźmy sobie, przejdźmy może do tych elementów w ramach tej wiki, żeby zobaczyć jak to zostało tutaj wygenerowane.
 Bo jak widzicie tutaj ta operacja trwa już 10 minut i jeszcze pewnie z jakiejś 2-3 minutki potrwa zanim się to skończy.
 Ale możemy sobie już w międzyczasie zajrzeć do rzeczy, których tutaj miałem.
 No i tutaj są właśnie te nasze koncepty.
 Czyli widzicie, że tu są jakieś czerwone karły i tak dalej.
 Czyli mamy tworzone notatki na podstawie każdego elementu, który jest w naszym źródle.
 Czyli jeśli wrzucamy jakiś materiał o jakichś gwiazdach, no to jeśli pojawiło się jakieś stwierdzenie o czerwonych karłach,
 czy na przykład czerwone nadolbrzymy, no to każdy z takich ważnych pojęć zostaje przygotowany jako taka notatka przedstawiająca ten główny koncept.
 Mamy tutaj właśnie te entities i tak jak wam wspomniałem, to mogą być osoby, firmy i tak dalej.
 I na przykład mamy tutaj AI ninjas, mamy tutaj choćby astrofazę, jeśli chodzi o te materiały związane z astronomią.
 Mamy tutaj właśnie te sources, czyli już te nasze takie przetworzoną syntezę tych naszych notatek.
 No i mamy ten indeks, który przygotowuje taką listę tych wszystkich materiałów, jakie znajdują się w tych naszych źródłach.
 Także tutaj troszeczkę ich mam, jeśli chodzi o sources, jeśli chodzi o entities i jeśli chodzi o koncepty.
 O, jak widzicie, właśnie tutaj Cloud już skończył pracę nad skompilowanymi źródłami.
 Jak możecie zauważyć, miałem tutaj dwa pliki wideo.
 I na podstawie tych dwóch plików wideo zostało stworzonych aż 21 konceptów.
 I między innymi tu jakiś paradoks ten, przepraszam, biostruktury, jakieś technosygnatury, egzoplanety i wiele podobnych rzeczy.
 No i tutaj zostały dwie encje przygotowane i tymi encjami jest akurat autor astrofazy czy autor paradoksu tego Fermiego.
 Więc tutaj to wszystko zostało ładnie przygotowane.
 Mamy też opisane to wszystko w metadanych, czyli trafiło do indeksu naszego, trafiło do wiki.
 A więc jeśli możemy sobie przejrzeć ten nasz log, to też mamy tutaj informacje co, kiedy, gdzie trafiało, czy to była jakaś inicjalizacja wiki, czy ingest, czy rozmowa i tak dalej.
 W ramach indeksu też trafił ten materiał, trafiły te wszystkie materiały.
 Dobra, no i możemy sobie teraz rozmawiać z tymi naszymi materiałami.
 Możemy sobie zapytać o jakąś rzecz, na przykład czym jest paradoks Fermiego.
 I te nasze wszystkie rzeczy mogą trafiać później do tego wiki jako answers.
 Czyli po prostu zachowujemy później też wszystkie te nasze rozmowy z tym naszym second brainem.
 No i tutaj mamy opisaną właśnie ten paradoks w takim wielkim skrócie.
 Mamy też główne klasy odpowiedzi, tak, na podstawie jakich tutaj dokładnie materiałów,
 jakich hipotez, na przykład ciemnego lasu, czy jakiegoś kosmicznego zoo i tak dalej to zostało otworzone.
 Oczywiście możemy też z tymi notatkami jeszcze pracować.
 Na zasadzie mogę sobie sprawdzić, jakie są taski.
 Więc to jest taka już ostatnia rzecz, którą chciałbym Wam dzisiaj pokazać.
 Czyli na podstawie tych moich notatek mogę poprosić jeszcze model,
 aby przejrzał, czy nie ma tam jakichś action itemów.
 Więc tutaj już sobie zapuszczam to.
 A w międzyczasie, kiedy tutaj czekamy na odpowiedź, czy mamy tu jakieś zadania,
 ja jeszcze bym skoczył do ostatniej rzeczy, jeśli chodzi o te diagramy, które dla Was przygotowałem.
 O czym warto jeszcze pomyśleć?
 Bo koncepcja Carpathiego średnio się skaluje.
 Sam zresztą Andrii Carpathi o tym wspomina, że w zależności od jakiego modelu,
 jakiego rodzaju masz notatki, to możesz efektywnie za pomocą takiego cloudcoda,
 czy innej sieci agencyjnej przetwarzać od stu do nawet dwóch tysięcy notatek.
 Ale co później?
 Bo one się już przestają mieścić w kontekście i tak dalej.
 Dlatego warto też pomyśleć nad tym, aby rozbudować tą naszą bazę wiedzy o kilka kolejnych elementów.
 Czyli na przykład przygotowanie raga, o którym Krzysiek mówił.
 I fajnie się tutaj może sprawdzić taki multimodalny rag,
 przygotowany choćby przez Google'a, czyli tam Gemini multimodal rag,
 który jest w stanie przetwarzać nasze wideo, obrazki, teksty i tak dalej,
 dzięki czemu będziemy mieli zaindeksowane i będziemy mogli wykorzystywać
 tak zwany semantic search do zapytań o naszej całej bazie.
 Warto jeszcze tutaj taki nasz second brain według mnie rozszerzyć o pewne integracje,
 czyli na przykład dać dostęp do skrzynki, czy to Gmail'a, Outlook'a,
 dodać na przykład dostęp do kalendarza, czy dostęp do jakichś komunikatorów,
 z których korzystamy, typu Slack, Teams'y,
 może nie wiem, pobieranie jakichś newsletterów, RS feed'ów.
 Ja tylko Krzyśku powiem jedną rzecz, że myślę, że to jest właśnie największa przewaga
 budowania takiego lokalnego, że tak powiem, second brain'a, to to, że będziemy mogli
 właśnie go zintegrować z naszymi narzędziami, które używamy na co dzień.
 No bo po co nam taki second brain, do którego tak naprawdę będziemy musieli wszystko,
 że tak powiem, wprowadzać ręcznie, upatologicznie, no to jest mało, że tak powiem,
 łatwe do zarządzania i utrzymania w dzisiejszym świecie, który jest mega zagoniony
 i chcemy wszystko robić szybko, sprawnie, no i niestety gdzieś to nam, że tak powiem,
 takie przygotowanie, zbieranie tej wiedzy ucieka.
 Także to, co mówisz Krzyśku, jest mega fajne i ja też tak w ramach swojego prywatnego
 jednego z woltów zrobiłem, to zrobiłem integrację nawet z Gmail'em.
 Tam nie muszą być jakieś duże uprawnienia.
 Chodzi o samego reeda, czytanie, jakiegoś konkretnego taga, tak?
 Czyli na przykład newslettery i może mi ściągać taką wiedzę i sam się aktualizować, co nie?
 Czyli ja nie muszę nawet gdzieś tam go promptować, ani mu, że tak powiem,
 dostarczać te materiały ręcznie, tylko można zautomatyzować ten proces
 właśnie przez takie różne narzędzia, co nie? To jest świetne.
 Okej, już tutaj kończąc, o co warto jeszcze rozszerzyć, to no jakieś też pewnie
 do task managementu, narzędzia, czy na przykład jakieś API'e, czy automatyzacje, tak?
 Bo często może korzystamy z jakichś, nie wiem, natenów, zapierów,
 może mamy jakieś customowe serwery MCP, może chcemy sobie wysłać jakieś
 powiadomienia, alerty, no cokolwiek, bo wtedy budujemy takie narzędzie,
 które przykładowo na podstawie, nie wiem, notatki z rozmowy z klientem,
 może przygotować nam już drafta maila, tak?
 Którego sobie sprawdzimy i ewentualnie poprawimy i wyślemy do niego.
 Możemy na przykład na podstawie tej notatki zaplanować dalsze kroki,
 czyli na przykład wystawić spotkanie w kalendarzu, tak?
 Które będzie follow-upem do tego pierwszego.
 Możemy powiadomić na Slacku nasz team, więc to naprawdę później na podstawie
 tego secondbraina możemy budować taką fajną machinę, która może zarządzać
 czy to naszym życiem prywatnym, czy firmowym.
 I w międzyczasie właśnie Klaudiusz skończył przetwarzanie i on zobaczył,
 że w moich notatkach jest transkrypcja rozmowy, tak?
 Mamy tutaj taką fake transkrypcję rozmowy o wdrożeniu AI.
 I ta rozmowa była między Krzyśkiem a Markiem, która była tam 14 kwietnia.
 No i kontekst właśnie wdrożenie AI w ich firmie.
 No i wywnioskował z tych moich notatek, że do piątku 17 miałem wysłać temu Markowi ofertę,
 odebrać od Marka jakieś 50 próbek faktur, PDF-ów.
 Oczywiście tutaj nie będę się przechodził przez to wszystko,
 ale koncepcja Wam powinna być doskonale już nakreślona.
 No i tutaj mamy po prostu przygotowane teraz taski, które mógłbym sobie wrzucić
 do jakiegoś narzędzia typu Todoist Jira, czy czegokolwiek tam używam.
 Dlatego też, jak widzicie, ja nie tylko muszę rozmawiać z tymi notatkami,
 ale przy odpowiednich integracjach z narzędziami czy jakimiś API-ami i tak dalej,
 możemy też realizować jakieś konkretne action itemy.
 Czyli tak jak wcześniej wspomniałem, pisać jakiegoś drafta maila,
 napisać do zespołu, przekazać jakąś wiadomość dalej na podstawie notatki,
 czy tak jak teraz w tym ostatnim przykładzie, który Wam pokazałem,
 przejść do na przykład sprawdzenia, czy w moich notatkach
 nie ma jakichś właśnie action itemów, czyli coś, co ja powinienem zrobić,
 czyli jakieś taski.
 I to jest według mnie naprawdę bardzo ciekawa rzecz, jeśli chodzi o ten second brain.
 No i w zasadzie to jest tyle, co dla Was dzisiaj tutaj przygotowałem.
 Powiedzcie, jak Wam się w ogóle podobało, czy nie było za dużo, że tak powiem,
 no bo staramy się tutaj szanować Waszą uwagę i też to, żeby nie przedłużać tych warsztatów.
 Krzyśku, Twojej kamery nie widać.
 Tak, tak, tak, ok, widzę, już się musiał wyłączyć, już uzupełniam.
 O, proszę bardzo.
 Tak jak Krzysiek wspomniał, staraliśmy się zrobić naprawdę taką syntezę tej wiedzy,
 żeby pokazać Wam mniej więcej cały taki zarys, bo oczywiście w ramach takiej godzinki,
 czy tam tych siedemdziesięciu minut jest bardzo ciężko tutaj przedstawić te wszystkie koncepty
 i wejść w nie bardzo głęboko.
 Dlatego my zrobiliśmy taki big picture tego, jak my podeszliśmy do budowania tego second brain'a.
 Oczywiście za chwilkę też przejdziemy do tej sesji z Q&A, ale chciałbym tutaj jeszcze Krzyśkowi oddać na chwilę głos,
 bo też przygotowaliśmy dla Was pewną tutaj niespodziankę, o której tutaj Krzysiek Wam opowie, więc ja też tutaj jeszcze czekam, aż Krzychu udostępni ekran.
 Tak, tak, tak, tak, już udostępniam.
 Tak, a w międzyczasie też możecie dać nam znać, co w ogóle sądzicie o tym, co pokazaliśmy, czy podobało Wam się?
 Może macie jakieś pytania do tej części, którą pokazaliśmy? Może coś wymaga, nie wiem, rozszerzenia?
 Tak, czy w ogóle już mówię, czy widzicie w tym potencjał na to, żeby budować w ogóle taki second brain u siebie?
 Tak.
 Tak, że tutaj też możecie śmiało dać znać, a ja już się włączam też z tym, co mam Wam do pokazania, też z tymi bonusami, które przygotowałem tutaj dla Was.
 To też śmiało chcę Wam też pokazać.
 Tak, oczywiście zadawajcie tutaj pytania na czacie, bo za chwilkę przejdziemy właśnie do tej części Q&A, w której postaramy się zaeksplorować wszystkie tutaj pytania, które zadaliście dotychczas.
 No i liczymy, że też zaangażujecie się później bardziej w tę naszą dyskusję, bo też chcielibyśmy z Wami jeszcze chwileczkę porozmawiać.
 Tak, tak, tak, tak, już śpieszę w ogóle, bo tak, tutaj gdzieś tam patrzyłem, gdzieś tam czasami zerkałem na czat, chociaż on bardzo szybko nam tutaj uciekał.
 Mianowicie widziałem, że ludzie się pytali o to, no dobra, pokazujecie tyle, dużo ciekawych rzeczy, ale jak to w ogóle, że chcę coś takiego zbudować, ale jak to zbudować?
 Tak, tu się widzę, że pojawiają te pytania, jak w ogóle do tego siąść?
 Także wiem, że to może być troszeczkę przytłaczające, bo tych rzeczy jest bardzo dużo, także już udostępniam ekran i też pokażę Wam, co w ramach takiego bonusu przygotowaliśmy dla Was.
 Tak, o, proszę bardzo. Także to, co ja przygotowałem tutaj w ramach z Krzyśkiem, to taką trochę syntezję tego, co dzisiaj omówiliśmy i takie najważniejsze rzeczy.
 Tą instrukcję, tutaj co mam w Notion, oczywiście w Notion, bo będzie mi tak proście udostępnić tutaj tego przez Obsidiana, Wam nie daje tutaj dostępu do siebie do Obsidiana.
 Natomiast, co tutaj znajdziecie, to na pewno krok po kroku instalacji Obsidiana, zrobienie pierwszego Volta, ale również i GitHub'a do naszego projektu, który opisuje krok po kroku, jak można w ogóle taki projekt u siebie zbudować.
 Tutaj jest rozpisany też krok po kroku, jak wyglądają te warstwy, jak wyglądają operacje, czyli właśnie ingest, to co mówił Krzysiek, czyli dodawanie wiedzy, jak wygląda query, czyli zadawanie pytania, no i też link, czyli taki health check, spójność naszej po prostu bazy, bo oprócz tego, że dodajemy nowe rzeczy, też trzeba po prostu tym sprytnie zarządzać i aktualizować.
 To jest totalnie normalne. To są też takie bonusy, które ja też od siebie dodaję, czyli taką customizację, czyli jeśli chodzi o ile źródeł potwierdza chociażby jakość tej wiedzy, confidence, taki score.
 Też mam tutaj świeżość tych notatek, czyli kiedy były weryfikowane. Możecie sobie śmiało poczytać i zobaczyć, jaką tutaj koncepcję ja na to przyjąłem. Generalnie pomysł jest prosty. Wgrywacie, pobieracie ten projekt u siebie na komputer, wpuszczacie cloda i on ma też tutaj plik bootstrap, który przeprowadzi Was za rączkę krok po kroku i wytłumaczy Wam, jak takiego Volta skonfigurować pod Wasze zadanie konkretne, tak?
 Czy jakiego używasz AI-a, jak piszesz, jaki jest Twój styl pisania i też o czym jest Wasz Volt, tak? Bo Wasz Volt może być typowo o, nie wiem, o marketingu. Wasz może być Volt o właśnie jakimś zbieraniu researchu, czy też może jakiś projekt Wasz, jeśli chodzi o firmę. To też można sprecyzować.
 Także coś takiego dostaniecie i tutaj krok po kroku będziecie mogli przez to przejść. Mail już powinien u Was wylądować. Krzyśku, możesz też, jakbym Cię prosił, wysłałem Ci na Discorda linka, jakbyś mógł też przy okazji wkleić na czat. Może, że mi się teraz szybciutko uda to zrobić. To też udało mi się nawet.
 Nawet mi się udało, także zostawiam linka, żeby nie było, że tutaj nagadaliśmy się na szybko, a nie ma gdzieś tam tego kroku po kroku, jak można z tym zacząć.
 Oczywiście każdy może ten Volt budować po swojemu. Nie ma jednej idealnego podejścia, więc polecam Wam poeksperymentować i zobaczyć, co dokładnie można jeszcze tutaj ciekawego zrobić.
 A jeśli nie do końca wiecie, w którą stronę pójść, albo właśnie chcecie być na bieżąco, ale tych informacji jest bardzo, ale to bardzo dużo.
 Zresztą tak jak dzisiaj wyszedł nowy model Opus 4.7 przed warsztatem, nie mieliśmy w stanie nawet jeszcze jego przetrawić.
 Ja tam oczywiście jakieś wstępne researche zrobiłem, natomiast jest tego bardzo dużo.
 To, co mamy z Krzyśkiem Wam do pokazania, to mianowicie społeczność AI Ninjas, którą rozwijamy już od jakoś początku stycznia.
 Jest to miejsce, które gromadzi właśnie osoby, które są zajawione podobnym tematem, czyli sztucznej inteligencji.
 I co tutaj ciekawego można znaleźć, to warsztaty co dwa tygodnie z ekspertami, które prowadzimy.
 Bibliotekę nagrań, czyli można do wszystkich nagrań wrócić śmiało.
 Gotowe procedury, czyli jakieś konkretne rozwiązania, wdrożenia, które my robimy i się nimi dzielimy.
 Jakieś konkretne skille, czy tak właśnie nawet to, co w ramach Obsydiana przygotowaliśmy, to też dzielimy się w ramach społeczności już bardziej szerzej.
 Tak powiem, tam mamy więcej przestrzeni na to, żeby poruszać te wątki jako osobne lekcje.
 No i to też co najważniejsze to to, że jesteście, obracacie się między ludźmi, którzy również po prostu są zainteresowani podobnymi tematami,
 chcą się rozwijać i zgłębiać tę wiedzę.
 To są też różne wycinki z naszych poprzednich warsztatów, czyli chociażby automatyzacja odpowiedzi e-mail z lokalnym modelem, czyli też takie fajne rozwiązanie pod firmy.
 Więc też wykorzystanie tego AI do marketingu, czy też generowanie wideo.
 Tutaj są przeróżne tematy, nie tylko programistyczne, tylko też dla osób, które dopiero zaczynają i chciałyby w ogóle wykorzystać ten potencjał, jaki nam daje AI.
 Bo daje bardzo duże, ale trzeba to zrobić z głową.
 I taka propozycja też dla Was i oferta z tego powodu, że wytrwaliście w ogóle z nami dzisiaj, to najniższa okazja do dołączenia, a mianowicie minus 50 złotych zniżki na dołączenie po prostu do naszej społeczności.
 Jest to oczywiście pakiet miesięczny, także nie chcemy Wam tutaj sprzedawać czegoś, z czego nie będziecie mogli się wycofać, powiedzmy, za miesiąc, dwa.
 Jeśli stwierdzicie, że to jest dla Was niewystarczające, to w każdej chwili możecie zrezygnować.
 Także tym na pewno się różnimy, więc chcemy być Wami szczerzy.
 Jeśli Wam się podoba to, co robimy i szukacie więcej takiej wartości, no to też w ramach takiego AI Ninja społeczności zaraz pokażę też, jak mniej więcej to wygląda w środku.
 Będziecie mogli do nas dołączyć i z nami po prostu przemierzać ten świat sztucznej inteligencji.
 Więc to, co tutaj na stronie jest, ja też podrzuciłem linki, to zniżka minus 50 złotych.
 To jest najniższa cena, jaką mamy i podejrzewam, że to będzie ostatnia taka duża promocja, mianowicie ten kod jest ważny przez trzy miesiące.
 Czyli jak raz dołączycie, to przez trzy miesiące macie tą najlepszą cenę.
 Tu są trzy pakiety.
 Pakiet najtańszy to jest 99 złotych za miesiąc.
 Macie dostęp do minikursów, do biblioteki gotowych procedur, do warsztatów co dwa tygodnie z ekspertami.
 Mieliśmy tematy chociażby stworzenia stron, które nie wyglądają jak AI Slope, czyli przypominające po prostu wygenerowane z AI.
 Mieliśmy warsztat też ze scrapowania, pobierania danych z internetu, z różnych stron.
 Także też scrapowania, pobierania danych o konkurencji i też warsztaty chociażby z programowania z AI.
 Także różne, że tak powiem tematy.
 Tutaj pas żółty jest droższy, w nim też jest Perplex City Pro na rok i też chociażby godzina konsultacji.
 No i mamy też Czarny Pas to jest roczny plan, czyli raz płacisz i też ta cena jest o wiele tańsza, bo ona chyba wychodzi z tego spada 10 miesięcy.
 Czyli dwa miesiące oprócz tej przyceny jest po prostu taniej.
 Także też zapraszamy Was, jeśli jesteście zainteresowani.
 A to też jak wygląda społeczność w środku.
 Mamy taką społeczność na skólu.
 Dzielimy się, tak jak mówię, różnymi wątkami.
 Tu są chociażby różne benchmarki.
 Też już tutaj trzy godziny temu była też moja taka synteza tego, co ciekawego jest w tym nowym modelu Opus 4.7.
 Przeróżne pytania od innych uczestników.
 Też nasze warsztaty i też to co ciekawe myślę Classroom, czyli zakładka z przeróżnymi minikursami, które przygotowujemy.
 Mieliśmy ostatnio warsztat z OpenFlow.
 Tutaj pokazywaliśmy jak po kroku takiego agenta uruchomić.
 I to za nieduże pieniądze, bo nawet w ramach takich parunastu złotych już można było coś takiego sobie wystartować na swoim serwerze.
 Są też lokalne modele, czyli jak się zabrać do tego z głową.
 Czy to w firmie, czy nawet prywatnie przetwarzać przeróżne dane bez wycieku tego do chmury.
 Bo wtedy korzystamy z modeli na naszym komputerze.
 Są też fundamenty AI, czyli bardzo takie podstawy, chociaż też jest dużo usystematyzowania wiedzy.
 Czym właściwie są LLM-y?
 Jakie są konkretne parametry, jeśli chodzi o różne ustawienia naszych LLM-ów?
 Też wytłumaczenie jak pracować z dokumentami, czym właściwie właśnie są te LLM-y.
 Także też tutaj w ramach takiej społeczności przygotowujemy lekcje.
 I też tutaj, co Krzyśkowi muszę oddać, to w ramach tych lokalnych modeli też dał dużo serducha,
 bo przygotował materiały łącznie tam w 40-parę minut, które pokazują też jak robi taki setup,
 po prostu instalacje u siebie na komputerze, jak sobie to dokładnie skonfigurować.
 Oczywiście też tutaj są lekcje do tego, też o małych modelach językowych.
 Także staramy się przekazywać tę wiedzę w taki prosty, przejrzysty sposób.
 I też tak, żebyście byli na bieżąco z tym, co się dzieje.
 No bo ja nie ukrywam, jest to na pewno wyciągające.
 I też biorąc pod uwagę na to, ile tych rzeczy się dzieje w tak krótkim odstępie,
 no to żeby być na bieżąco, no to naprawdę trzeba by było po prostu traktować to jako osobną robotę
 i nad tym siedzieć i na bieżąco analizować, co się dzieje w tym internecie,
 bo tego jest naprawdę dużo.
 Także jeśli chodzi o to, materiały bonusowe już Wam też się pojawiły na mailu.
 Wysyłałem linka oczywiście wyżej.
 Także to też macie i też zniżkę do naszej społeczności wraz z opisem, co dokładnie w niej jest.
 To też dostajecie na maila.
 Ta zniżka zostaje do 17 kwietnia.
 Tu jest licznik, czyli za 27 godzin, 32 minuty tej zniżki nie będzie.
 Dostawaliśmy maile, pamiętam, parę minut, czasami godzinę po północy
 z zapytaniem, czy można jeszcze dołączyć.
 Niestety też chcemy być, że tak powiem fair z osobami, które dołączyły do nas w tej okazji,
 w tej ofercie, więc nie robimy, że tak powiem takich kart ulgowych,
 żeby kogoś wpuszczać po tym konkretnym oknie.
 Jeśli ktoś się załapie na tą lepszą cenę, to może po prostu dołączyć w tańszej ofercie.
 Jeśli nie, to po prostu będzie musiał zapłacić 149 zł.
 To jest i tak uważam bardzo dobra cena, jeśli chodzi o te rzeczy, które znajdziecie w środku.
 Także to tyle ode mnie.
 Może też Krzyśku powiesz coś od siebie.
 Jak w ogóle ty to oceniasz i co ciekawego w ogóle robiliśmy w społeczności.
 Jasne. Ja chciałbym tutaj w ogóle zaznaczyć, że nieważne na jakim etapie jesteś rozwoju tutaj sztucznej inteligencji.
 Czy dopiero zaczynasz, czy na przykład jesteś też osobą taką bardziej techniczną i wymagasz takich bardziej zaawansowych materiałów.
 W ramach społeczności zagospodarowujemy zarówno oba obszary, czyli osoby, które dopiero wchodzą w tą przygodę ze sztuczną inteligencją,
 mogą sobie właśnie przejść do materiału w Classroomie, gdzie obejrzą sobie te fundamenty AI,
 z których właśnie dowiedzą się w jaki sposób efektywnie rozmawiać z tymi modelami AI.
 Mogą też przejrzeć warsztaty, czy też porozmawiać, poodbijać wiedzę z innymi osobami,
 które zawsze tutaj chętnie pomogą, czy to zarówno my, czy osoby wewnątrz społeczności.
 A też takim dużym bonusem jest na pewno dostęp do nas, bo my tam staramy się być bardzo aktywni i staramy się odpisywać na wszystkie rzeczy.
 Więc tutaj nawet, nie wiem, Krzyśku, mógłbyś w międzyczasie pokazać, zobaczyć, że jak są jakieś pytania, my bardzo szybko reagujemy
 i dajemy gotowe praktycznie rozwiązania do wdrożenia tutaj osobom, tak?
 Więc jak tutaj przefiltrujemy coś po questions, tu jest akurat właśnie podejście w jakiś sposób skillami,
 ale też automatyzację, nowy film na YouTube, to jest na przykład do Todoista, już tam minąłeś tu, Krzyśku.
 I troszkę wyżej.
 Jeszcze jeden wyżej.
 O, dokładnie.
 Więc jak tutaj zobaczycie, no my staramy się bardzo szybko tutaj odpisywać i dawać konkretne rady, w jaki sposób to zrealizować, tak?
 Zadanie, które jakaś osoba…
 Jesteście zblokowani, zastanawiacie się je obejść i potrzebujecie, że tak powiem, białkowej pomocy, doradztwa,
 to też w ramach takiej społeczności oczywiście jesteśmy i służymy pomocą.
 No i tak jak widzicie, realizujemy co dwa tygodnie, macie tutaj na przykład warsztat z Robertem, który prowadził OSPEC Driven Development, czyli w jak sposób...
 A ja może pokażę warsztaty, jakie mieliśmy w ogóle.
 Tak.
 Tak.
 Otóż warsztatów, które robiliśmy wcześniej, to też mamy warsztaty z ekspertami, już mieliśmy pięć takich wydań, zaraz będzie się szukować szóste, też stworzenia stron w takich no-code'owych narzędziach dla osób, które są nietechniczne.
 Także budowanie stron to jest na pewno temat, który w ogóle poruszyliśmy na starcie z Krzyśkiem i uważam, że to był naprawdę dobry materiał godzinny,
 gdzie podzieliliśmy się konkretnymi tipami, to jak stworzyć stronę, która nie wygląda jak tarny AI Slope.
 Tutaj zresztą macie gdzieś tam malutki spoiler tego, co tutaj poruszaliśmy i też w ramach takich po prostu warsztatów robimy taką notatkę podsumowującą,
 żebyście dokładnie zobaczyli, co ciekawego poruszyliśmy, tak żebyście mogli to szybko strawić.
 To są czasami warsztaty po półtorej godziny, także na pewno takie notatki podsumowujące są po prostu łatwiejsze do, wybaczcie, strawienia.
 No i też staramy się tutaj pokrywać wszelkie takie obszary, bo np. warsztat nr 3 dotyczył bezpieczeństwa pracy z modelami AI na produkcji,
 czyli w jaki sposób walidować to, co wchodzi i wychodzi z tego naszego modelu, aby nie zrobić sobie krzywdy w firmie.
 Więc tutaj mamy naprawdę taki szeroki przekrój materiałów od takich osób, które dopiero zaczynają swoją drogę, aż po takie mega zaawansowane rzeczy.
 No i też warto zaznaczyć, że cały czas staramy się tutaj rozwijać te materiały.
 Czyli np. w Classroomie jeśli są jakieś lekcje, choćby programowanie z AI, no to od czasu do czasu wlatują tam jakieś nowe lekcje i staramy się je na bieżąco aktualizować.
 No i też wielką wartością jest ta zakładka Community, gdzie dzielimy się zarówno jakimiś newsami, przemyśleniami, jak my pracujemy,
 bo my też często zdradzamy tajniki AI ninjas, czyli w jaki sposób my podchodzimy do zarządzania zadaniami,
 czy kilkoma innymi elementami, które wykorzystujemy w ramach naszego warsztatu, czy to automatyzacji, czy pracy z AI,
 więc też można sporo się dowiedzieć jak my pracujemy za kulisami AI ninjas.
 A nie ukrywam, że ta praca się bardzo zmienia, z każdym miesiącem ta praca potrafi ewoluować i troszeczkę zmieniać tą formę.
 Chociaż, że tak powiem, fundamenty na pewno są stabilne, no ale tutaj dużo rzeczy i takich różnych rozwiązań wychodzi, że można tą pracę jeszcze bardziej optymalizować, jeśli chodzi o to.
 Także tutaj zachęcamy Was do dołączenia do ninjas, a już tutaj widzę, że pierwsze osoby nam zaufały i do nas dołączyły, także wielkie dzięki.
 Dziękujemy bardzo jeszcze raz i myślę, że to będzie na pewno owocna, że tak powiem, współpraca.
 A ja tylko dodam od siebie, że tak naprawdę to dołączenie jest bez ryzyka, a mianowicie macie 14 dni, żeby tak naprawdę się zapoznać z tym, co oferujemy.
 I tak naprawdę jeśli do 14 dni stwierdzicie, ok, to nie jest dla mnie, to mnie nie interesuje, to równie dobrze możesz po prostu napisać nam wiadomość, a my zwrócimy Ci pełne koszty.
 To oczywiście nie ma żadnych ukrytych dodatkowych jakichś prowizji, także po prostu jeśli zapłaciłeś 349 zł albo 99 zł za pakiet, no to oddamy Ci pełną kwotę, oczywiście pod warunkiem, że napiszesz nam tą wiadomość i powiesz, no to nie jest dla mnie.
 Także oczywiście może być tak, że stwierdzisz, że po prostu to Ci się nie przydaje albo nie widzisz, jak możesz to wykorzystać, to w każdej chwili do tych 14 dni możesz po prostu z tego zrezygnować.
 Także też to, co gdzieś tam chcę zaznaczyć, to nie jest to w żaden sposób jakieś ryzyko.
 A myślę, że po pierwszych, tak powiem, wykorzystaniach tego, co zdobędziecie tam wiedzę, bo tam też były chociażby informacje odnośnie automatyzacji reklam, marketingu, właśnie skrapowania, wyciągania wiedzy, ofert różnych, czy też konkurencji, no to jest na tyle tej wiedzy w tych warsztatach i w materiałach, że tak naprawdę to się powinno zwrócić wielokrotnie po pierwszym miesiącu.
 Także tutaj to jest taka gwarancja moja słowna, że tak powiem.
 Oczywiście nie jest żadna oferta, że tak powiem, finansowa.
 To nie są żadne gamblingi, tutaj nie mamy ruletki.
 Natomiast jeśli będziecie chcieli naprawdę coś z tego wyciągnąć dla siebie, no to myślę, że w ramach AnyJazz na pewno to znajdziecie.
 I co, przechodzimy, Krzyśku, tutaj jak już osoby pierwsze dołączają, nie pierwsze, ale, że tak powiem, po tym warsztacie, no bo już, że tak powiem,
 nie prowadzimy tej społeczności od teraz, to może przejdziemy do tych pytań, które się pojawiały, a było ich bardzo dużo.
 Jasne.
 Jasne, już tutaj przechodzimy sobie spokojnie.
 A tutaj dla Was jeszcze przypomnienie, właśnie tutaj z tą zniżką, że do 23:59 do jutra, a my sobie teraz na spokojnie przejdziemy przez te wszystkie pytania, które się pojawiają.
 Także, jeśli macie jakieś pytania, to wciąż zachęcamy.
 Ja już tutaj sobie przechodzę na sam początek, bo dzisiaj naprawdę sporo pytań się pojawiło.
 Ale dużo było widziałem w trakcie.
 Tak.
 Już tutaj patrzę na jakieś takie...
 Ok, bo widzę, tutaj też była jakaś taka dyskusja o notebook-elemie.
 I pewnie pojawiły się też tam dalej jakieś pytania o różnicę z notebook-elemem, a obsydianem.
 Jakbyś tak, Krzyśko, nie wiem, miał powiedzieć, czy używać notebook-elema, czy obsydiana?
 W jakim kierunku Ty raczej wolałbyś pójść?
 Myślę, że notebook-elem to jest też narzędzie, jakaś warstwa, którą można wykorzystać na pewno do syntezy.
 Czyli możemy wrzucić tam różne linki, dokumenty i faktycznie możemy tę wiedzę wyciągnąć.
 Natomiast to, co na pewno jest w kontekście notebook-elem, to to, że działamy trochę w zamkniętym...
 No, nie trochę, działamy w zamkniętym narzędziu, to znaczy nie wiemy dokładnie, co się dzieje pod spodem.
 Możemy się domyślać.
 Natomiast to jest jakieś narzędzie, które przygotował Google.
 Też są różne limity, które są w ramach tego notebooka.
 Jak mamy oczywiście konto pro, to mamy tutaj więcej do działania.
 Jest to fajne narzędzie, na pewno.
 Natomiast ja bym trochę nie patrzył na wybór to lub to.
 A mianowicie nic nie stoi na przeszkodzie, żeby takiego obsydiana zintegrować sobie z notebookiem,
 pobierać od niego właśnie te różne researche, notatki.
 To może działać równie dobrze jedno z drugim.
 Ja widzę przewagę obsydiana w tym, że to jest właśnie lokalne na waszym urządzeniu.
 Czyli wy nie potrzebujecie dostępu do internetu, żeby te notatki przeglądać.
 No, Googlem to jest platforma, strona, na której musicie być zalogowani, żeby przeglądać to w chmurze.
 Także też wymaga konta Google.
 Więc obsydian jest o wiele lżejszy.
 Działa na tych plikach markdownowych.
 No i możemy je dokładnie jak chcemy przerabiać, edytować.
 Mamy też ten podgląd grafowy, pokazać jak te notatki się ze sobą łączą.
 No i myślę, to co jest takie najważniejsze, to co powinno tu wybrzmieć, to jest właśnie prywatność i 100% rozwiązanie lokalne.
 Czyli ty jesteś właścicielem swoich plików.
 Jeśli obsydian kiedykolwiek przestałby działać, no to twoje notatki i tak nadal zostają jako pliki tekstowe, które otworzysz w dowolnym innym programie.
 Też to co zaznaczam, to też personalizacja, czyli ogromna społeczność, która tworzy tysiące różnych wtyczek, pluginów.
 Więc tego obsydiana jesteśmy bardzo mocno w stanie skastomizować na swoje potrzeby, dostosować go.
 W przypadku Notebook LM korzystamy z tego, co nam daje po prostu Google.
 Więc mamy pewne ograniczenia, jak to działa.
 Notebook daje nam gotowe narzędzie, to jest super.
 Natomiast wraz z właśnie obsydianem jesteśmy w stanie to workflow, ten swój przepływ tych notatek dostosować do swoich potrzeb, zintegrować go z różnymi narzędziami.
 Notebook LM, to co powiedziałem, może być jedną z źródeł, z których korzysta obsydian.
 Nie wiem, Krzyśku, jak ty na to patrzysz, ale to też jest ciekawy take.
 Zupełnie się zgadzam z tym, co powiedziałeś, natomiast ja też bym rozwinął jeszcze tą część prywatności.
 Bo jeśli zależy nam na tej prywatności, to nic nie stoi na przeszkodzie, aby użyć lokalnych modeli.
 I ja też podpinałem sobie pod Code Code'a Bielika 7B Mitron i okazuje się, że świetnie sobie radzi, zarówno z syntezą tych notatek, czy też z odpowiadami na pytania.
 Więc pod względem takiej jakości nie widać dużej różnicy względem właśnie tych modeli Anthropica, aczkolwiek na pewno jest to dużo wolniejsze, ale wtedy mamy pełną prywatność.
 A dla niektórych to też może być kluczowe, zwłaszcza w firmach, żeby te nasze materiały nie przychodziły.
 Bo oczywiście trzeba też, można używać właśnie takich modeli jak Gemina, jak Cloud do pracy z tymi naszymi modelami, z naszymi notatkami, ale wtedy trzeba zadbać o po prostu anonymizację tych danych.
 Czyli musimy sobie zamieniać te nasze dane wrażliwe na jakieś takie zwane placeholdery, czyli takie np. zamiast mieć numer PESEL, to będziemy mieli w takich nawiasach wąsowych słowo PESEL.
 I dzięki temu też po prostu unikamy wycieku tych naszych danych, ale też trzeba o to umieć zadbać, żeby to efektywnie przekształcać te notatki.
 Nie no, jasne, pewnie. I to już kwestia tego, co dokładnie przetwarzamy.
 Ja akurat nie korzystam z Cloud'a, więc no tak, mamy prywatność, mamy te notatki u siebie, ale dalej jeśli korzystamy z jakiegoś modelu pod spodem, który jest chmurowy, no to tak, to nie jest może pełna prywatność, ale to właśnie kwestia tego, co tam dokładnie mamy.
 Ja akurat nie korzystam z Cloud'a, bo tworzę sobie takie wolty, gdzie syntetyzuję tę wiedzę i też te moje notatki, chociażby z Notion, to są takie rzeczy, którymi mogę się śmiało podzielić z AI-em i on może mu im nadać drugie życie.
 Ale to, co mówisz Krzyśku, to też jest fantastyczne, jeśli ktoś ma wystarczająco zasobów na swoim komputerze, a teraz te modele są coraz to lokalne, coraz to bardziej mądrzejsze.
 To też śmiało można wykorzystać nawet to, co pokazałeś w tej lekcji właśnie na społeczności w ramach lokalnych modeli do podpięcia tego pod właśnie naszego Obsidiana.
 Także myślę, że to jest też świetne zastosowanie. Rozgadaliśmy się bardzo.
 Tak, mamy tutaj pytanie, czy będzie nagranie. Tak, oczywiście będzie dostępne.
 Tak i od razu, tak jak mówię, też materiały dodatkowe, tam też znajdzie się link do YouTube'a, zostały już wysłane na waszego maila, także będziecie mogli na spokojnie po tym warsztacie się z tym zapoznać, jeśli jesteście zapisani na AI Ninjas.
 A tutaj w ogóle Tomek pisze, że ostatnio namówili mnie na OpenClaw, po dwóch tygodniach zutylizowałem Homara.
 Chętnie też się dowiemy, co było przyczyną właśnie utylizacji.
 Tak, OpenClaw poruszaliśmy na poprzednim warsztacie, ja OpenClaw'a mam też na swoim Whatsappie zintegrowanym na swoim serwerze VPS, to jest poprzedni materiał, także też zapraszamy.
 Te technologie ewoluują, teraz dużo Cloud Sam w sobie wdraża takich rozwiązań, też podobnych do tego, co oferuje OpenClaw.
 Natomiast dalej OpenClaw to jest projekt otwarty, także można go dostosować do swoich potrzeb, nie jesteśmy uzależnieni od żadnego dostawcy, także myślę, że to jest duży plus, jeśli chodzi o to rozwiązanie.
 Nie wiem, co dokładnie tutaj, że tak powiem Grześkowi nie zadziałało. Co w sytuacji, kiedy notatek klików mamy już tyle, że czytanie ich przez Cloud'a pożera większość tokenów.
 Czyli tutaj rozmawiamy o zarządzaniu z większymi takimi kazami.
 Ja może pokażę tutaj ten mój diagram, bo akurat tutaj omawiałem właśnie, co warto zrobić dalej.
 No i właśnie jeśli dochodzimy do momentu, kiedy słabo się skalują te już rozwiązania oparte o Cloud Code'a, bo nie wiem, nie mieści się to w tym kontekście,
 to o tym też w ogóle dość mocno Andrzej Karpati wspominał, że to jest od 100 do 2000 notatek, w zależności jakiego rodzaju przechowujecie, jaki model używacie i tak dalej.
 W końcu dojdziecie do tej ściany, dlatego też Andrzej Karpati, on ma takie podejście, że on tworzy kilka wiki.
 Każde wiki dotyczy konkretnego obszaru.
 Czyli na przykład ma wiki związane z biznesem, wiki związane z programowaniem, wiki związane z czymś tam innym.
 To jest jedna z opcji, jak można rozwiązać ten problem, ale lepszym rozwiązaniem, które ja zacząłem budować sobie już tutaj na boku,
 jest właśnie rozwinięcie tej koncepcji, którą dzisiaj Wam zaprezentowaliśmy o właśnie na przykład multimodalnego raga,
 czyli taką naszą bazę wiedzy, którą zamieniamy na te wektory, z którymi później możemy sobie za pomocą tych modeli rozmawiać.
 I dzięki temu jesteśmy w stanie przetwarzać już o wiele, wiele rzędów więcej tych notatek niż za pomocą takiego samego cloudcoda,
 który w pewnym momencie, jak dojdziemy do odpowiedniej skali, zacznie już się gubić w tych naszych notatkach,
 bo choćby załadowanie tego pliku index, który mamy, czy pliku z logami, on już będzie na tyle duży, że on będzie zapełniał praktycznie w całości ten nasz kontekst.
 No i wtedy rozmowa z tymi notatkami nie będzie w ogóle efektywna, dlatego będzie trzeba sięgać po takie rozwiązania właśnie jak Rack.
 Nie wiem czy Ty się akurat tutaj Krzysku zgodzisz z tą tezą, czy jednak poszedłbyś w innym kierunku.
 Czyli dwie opcje, albo tworzenie osobnych wiki, albo rozwijanie jako jedno źródło wiedzy z dodatkowym ragiem.
 Nie no, to akurat to jak ja na przykład pokazałem tego obsidiana, ten obsidian research,
 to były typowo takie wiki skupione na jednej domenie, jednym temacie, czyli research obsidiana.
 I to działa bardzo fajnie.
 Jeśli chcemy, bo też takie pytanie się pojawiło, jak ma się zarządzać, jeśli mamy parę woltów,
 czy one mogą się wymieniać informacjami i tak dalej.
 To ja w takim podejściu polecam, jeśli mamy jakąś wiedzę, którą chcemy dziedziczyć między różnymi woltami,
 to czemu nie zrobić jednego wolta, który będzie właśnie w takim schemacie para, takiej metody para,
 które służy do tego, żeby na przykład możemy mieć różne obszary naszych projektów, które się ze sobą łączą.
 Na przykład tak jak my mamy AI Ninjas, Krzyśku, działamy nad AI Ninjas, ja działam też nad swoimi projektami,
 mam swojego YouTube'a, gdzie też dzielę się wiedzą o sztucznej inteligencji i dużo tematów, że tak powiem, ze sobą są połączone.
 Mam newsletter Detective, tak samo o sztucznej inteligencji, więc ja lubię mieć też swój projekt, gdzie łączę parę tematów i to jest również ok.
 Natomiast jeśli chodzi o skalowanie, no to myślę, że to też trzeba dobrze zastanowić się nad strukturą w ogóle naszego Obsidiana
 i też myślę, że to jest kwestia takiego mądrego zarządzania tymi notatkami i aktualizowania tej bieżącej wiedzy,
 bo też oprócz takiej higienizacji, tego lintowania też warto się zastanowić, czy ta wiedza, którą mamy gdzieś tam wrzuconą,
 którą już nie aktualizujemy od paru tygodni, miesięcy, czy ona powinna być w jakimś stopniu zarchiwizowana,
 jeśli to już nie jest nieaktualne, tak, więc tutaj trzeba też mądrze do tego podchodzić, nie tylko dorzucać, dorzucać, dorzucać,
 ale też mądrze, że tak powiem, tym zarządzać i też czasami poczyścić pewne rzeczy, które są już nieaktualne
 albo je zarchiwizować, żeby nie brać ich pod uwagę na przykład w querowaniu, tak.
 Myślę, że na tyle ta baza grafowa, właśnie te połączenia grafowe dają tą przewagę,
 że Claude jest w stanie bardzo szybko łączyć fakty po prostu i łączyć tą wiedzę z różnych notatek,
 czego jakby nie miał, no to musiałby sam sobie po prostu syntetyzować i szukać tych informacji,
 jak ze sobą połączyć konkretne fragmenty. Tutaj po tym połączeniu grafowym on od razu też widzi,
 więc myślę, że to jest pewne jakieś ułatwienie i oszczędność tokenów, jeśli korzystamy z Obsidian CLI,
 bo też z Obsidiana możemy korzystać z linii command, co jest świetne do integracji z właśnie agentami.
 Ale prawdziwy potencjał, według mnie, ukazuje się, kiedy połączymy,
 zrobimy takie hybrydowe rozwiązanie, kiedy połączymy właśnie tą bazę grafową,
 którą mamy w Obsidianie z bazą wektorową, czyli korzystamy z obu, aby uzyskać informacje.
 I wtedy to naprawdę uwierzcie mi, że skuteczność rozmowy z tymi notatkami rośnie dramatralnie.
 A tutaj, Krzyśku, wspominałeś o tych kilku woltach, że ktoś tutaj wychodzi od takiego pytania, że ma kilka woltów.
 No i w sumie jest na to rozwiązanie, jak efektywnie korzystać, nawet mając w kilku woltach,
 bo mamy coś takiego jak Obsidian CLI, który pozwala nam się łączyć do różnych woltów.
 Więc możemy sobie w projekcie, na przykład jakimś tam cloud codzie,
 mieć plik, który opisuje, że hej, w tym wolcie trzymam to, w tym trzymam to, w tym to.
 Możemy też na poziomie publiczny, prywatny wolt to realizować.
 I do prywatnych, na przykład on nie będzie miał dostępu, tylko do publicznych.
 Więc za pomocą Obsidian CLI, mając kilka woltów, możemy z innego projektu się dobierać nawet do pięciu różnych woltów.
 A te, które są oznaczone jako prywatne, no to sorry, ale nie pozwolimy tam ci wjechać.
 Więc też możemy sobie to ograniczać na sposób taki, że w woltach publicznych trzymamy notatki, które możemy upubliczyć nawet każdemu.
 Bo to są jakieś, nie wiem, nasze notatki związane z blogami, artykułami, newsami i tym podobnymi rzeczami, których wyciek niczym nam tak naprawdę nie grozi.
 I one mogą być sobie nawet publicznie w internecie.
 Ale możemy też mieć notatki prywatne, na przykład związane z naszą firmą, które będą trzymane w woltach, które są oznaczone jako private.
 I dzięki temu też zapewniamy, że na przykład taki Cloud Code za pomocą tego Obsidiana na kilku oczywiście mechanizmach.
 Nie możemy tylko ufać temu Obsidian CLI i Cloudowi, że on tam nie wejdzie do prywatnego.
 I jesteśmy w stanie to realizować.
 Dobra, kolejne pytanie.
 A powiem, że też teraz eksploruję takie repozytoria i różne koncepcje, jeśli chodzi o Obsidiana.
 Mianowicie też różnego podejścia do tego wyszukiwania, czyli do pobierania tych informacji.
 No bo mamy ten taki native search, czyli po prostu, że szukamy sobie chociażby z tym Obsidian CLI.
 To co powiedziałeś.
 Mamy też tę gra view.
 Natomiast też można pójść o krok dalej i robić jakiegoś na przykład fuzii searcha.
 Możemy też zrobić właśnie jakieś wyszukiwanie semantyczne.
 Można po prostu to w różne...
 Czy nawet leksykalne.
 Tak, także oczywiście to są to co powiedziałeś, wymagane embeddingi, ale też możemy pójść o krok dalej i coś takiego zrobić.
 Także to jest myślę, że tak naprawdę też ciekawe rozwinięcie i myślę, że też w jakimś wątku na społeczności to poruszę, jak po prostu będę już miał, że tak powiem wypracowaną jakąś swoją metodykę, jeśli chodzi o to, bo to jest ciekawy temat.
 Znaczy no hybrydowe rozwiązanie, według mnie, gdzie mamy bazę tą grafową plus bazę wektorową, no bardzo mocno tutaj zwiększa tą skuteczność i możemy przechować nawet miliony tych naszych notatek.
 Możesz tylko tylko chwileczkę jeszcze, bo właśnie jedną rzecz tylko bym pokazał.
 Jeszcze możesz oczywiście kontynuować, ja tylko chciałem pokazać, że mam tutaj te oczywiście row, właśnie te surowe pliki, różne notatki, ale później też w syntezie, co ważne, mam też przeróżne tagi, mam też skąd, jakie są sourcy, właśnie ten poziom confidence, czyli też różne takie tagi, które pozwalają później LLM-owi, naszemu AI-owi querować po tych notatkach, czyli on nie szuka tylko po samym, że tak powiem, jakimś słowie, jakimś znaczeniu,
 tylko też jest w stanie wyszukać po konkretnym, na przykład sprawdzić, kiedy te notatki, na ile one są aktualne, zobaczyć po tagach, może coś po tagach już znajdzie ciekawego, także też ten poziom zaufania do tych notatek, czyli im wyższy, to znaczy, że jest poparty większą ilością źródeł.
 To też są ciekawe sposoby, jak można, że tak powiem, to wyszukiwanie robić jeszcze mądrzejsze, inteligentniejsze przez właśnie różne metadany, które dodajemy z poziomu właśnie tutaj atrybutów do danych notatek.
 To też jest w stanie Wam prowadzić LLM i też jako taki LLM as a judge po prostu oceniać Wam, które te notatki są warte, a które są na przykład marketingowe.
 Ja Ci powiem tylko, Krzyśku, jeszcze jedną wstawkę. Wrzuciłem mu materiał, jeden ciekawy blog, który miałem, który nie przeczytałem tak naprawdę i stwierdziłem,
 brzmi ciekawy jakiś wstęp, wrzucę i zobaczę, co mi powie mój Obsidian, czy może już takie wiadomości mam.
 I on mi powiedział, Claude, że po prostu to jest jakaś marketingowa papka i faktycznie pod tym blogiem była jakaś firma, która sprzedawała swoje rozwiązanie.
 I tam Obsidiana było mało samego w sobie, ale przez to dostałem informację od Claude'a, czy na pewno chcę to dodać.
 I wtedy się zawahałem i stwierdziłem, faktycznie nie będę dodawać sobie jakiegoś marketingowego, że tak powiem,
 jakieś paplaniny do mojej bazy, bo to będzie zaśmiecanie jej.
 Także to jest też o tyle fajne, że ja na przykład gdzieś tam na szybko wrzucając te dane, nie wyłapałbym tego,
 a my możemy sobie to skonfigurować z poziomu Claude'a tak, że on będzie w stanie zweryfikować te źródła i zobaczyć, co tam dokładnie jest.
 Tak, możemy w ogóle sobie, ja to jeszcze rozwinę tą Twoją koncepcję, możemy sobie stworzyć prosty filtr.
 Możemy w jakimś pliku markdownowym, czy nawet w Excelu, gdziekolwiek, mieć przygotowane takie filtry.
 Jakie treści nas interesują, bo załóżmy, nie wiem, mamy jakiś RSFeed, który nas z automatu, nie wiem, raz dziennie dodaje x notatek.
 No i na przykład dodajemy sobie notatki związane z finansami, tak, tak szeroko powiedzmy finansami.
 No i pojawiają się tam na przykład notatki związane z Forexem.
 Na przykład my nie jesteśmy zainteresowani Forexem, bo nas interesuje, nie wiem, jakieś oszczędzanie,
 jakieś, wiesz, jakieś takie pasywne inwestowanie w ETFy i tak dalej, więc Forex nie jest dla nas.
 Więc możemy sobie albo w tej tabelce na Excelu, albo nawet w pliku markdownowym wpisać w ramach filtrów na blacklistie Forex.
 No i teraz jeśli my pobieramy jakieś materiały związane z Forexem, automatycznie tutaj nasza baza wiedzy tego nie będzie dodawać,
 bo to nas nie interesuje.
 Więc możemy sobie tworzyć filtry zgodnie z naszymi zastosowaniami, tak, z naszymi upodobaniami,
 że tego typu treści chcemy, tego nie.
 No i dzięki temu możemy też mieć notatki tylko, które nas interesują.
 Na przykład, nie wiem, z AI-a interesują mnie na przykład, nie wiem, tylko rzeczy związane z ekosystemem Google'a.
 Więc jeśli będę chciał coś wrzucić z Antropikiem, no to Volt się zapyta,
 ej stary, na pewno ty chcesz to wrzucić, bo przecież powiedziałeś, że te wiadomości o Antropiku cię nie interesują.
 Więc możemy sobie dowolnie tworzyć takie filtry w bardzo prosty sposób.
 Musimy przyspieszyć, Krzyśku, bo za długo...
 Musimy przyspieszyć.
 I teraz tak.
 Kolejne pytanie, które dotyczy, czy do tych notatek będę miał raz dostęp na telefonie,
 jeśli nie, to bez sensu.
 I jak najbardziej.
 Możesz mieć, i na to jest kilka różnych sposobów,
 jeśli nie chcesz tego mieć publicznie dostępne,
 no to możesz mieć to całkowicie lokalnie zamknięte w swojej sieci
 i wykorzystać genialne narzędzie, z którego ja korzystam od dawien dawna,
 czyli SyncFing.
 Czyli taki open source'owy projekt, darmowy,
 który sobie uruchamiacie na swoim komputerze
 i on synchronizuje notatki w ramach waszej sieci lokalnej,
 czyli musisz oczywiście być połączony do tego samego Wi-Fi,
 na przykład z laptopem i z telefonem
 i wtedy synchronizują się notatki między tymi wszystkimi źródłami.
 Kolejną rzeczą, jeśli chcecie mieć to przechowywane już publicznie dostęp,
 na przykład można wykorzystać GitHub'a,
 dzięki któremu zyskujemy też jeszcze wiele dobrodziejstw, które przynosi nam Git.
 Oczywiście tutaj nie chciałbym już jakoś rozwodzić, bo chcemy tutaj przyspieszyć.
 Kolejną rzeczą jest na przykład jakieś VPS'a.
 Albo na VPS'ie, czyli na swoim serwerze, tak jak pokazywaliśmy na Mikrusie poprzednio.
 Ja akurat nie to, co chciałem powiedzieć, to też gdzieś tam w ramach społeczności na dniach
 popublikuję moją synchronizację, bo tutaj też widziałem dużo komentarzy,
 jak to dodać na przykład na telefon.
 To, co Krzyśku mówisz, też jest fajne, ale ja na przykład właśnie robię przez GitHub'a
 i taki projekt mi się automatycznie przez pluginy aktualizuje,
 więc ja nie muszę tego robić nawet ręcznie.
 Nie muszę, że tak powiem, aktualizować tego projektu.
 On sam po prostu wrzuca zmiany na mojego GitHub'a i ja mogę później taki projekt
 odpalić z poziomu telefonu.
 Nawet jeśli ktoś nie ma specjalnych aplikacji do tego, to równie dobrze może sobie
 takie repozytory podpiąć pod cloda z poziomu asystenta webowego z telefonu
 czy tam z aplikacji i też dodawać jakieś zmiany.
 Także to jest na pewno wygodne i proste.
 No i żeby też to wybrzmiało, na przykład taki SyncFing, jeśli jest wystawiony na świat,
 to z dowolnego miejsca też się same zsynchronizują.
 On po prostu śledzi foldery, któremu mówicie, a dajecie mu całego Volta
 i wtedy cokolwiek się doda na Volcie, macie praktycznie real time
 odzwierciedlone na innych urządzeniach, które po prostu są wpięte do śledzenia tego Volta.
 Więc wrzucam na telefonie i od razu widzę na komputerze.
 Dobra, lecimy dalej.
 Dobra, tak patrzę tutaj jeszcze, jakieś dyskusje między?
 Tak, konkretne pytania.
 Tam widziałem, że ludzie Q dwukropek robili, tak fajnie oznaczali.
 Widzę, że taka konwencja wyrobiła, to mi się bardzo podobało.
 Także możesz takie Q specjalnie też powrzucać, bo myślę, że to też...
 No to są konkretne pytania, na pewno łatwo to odpilkować.
 Okej. Czy te wiązania same się budują, czy trzeba je jakoś magicznie zrobić?
 No i właśnie tutaj za tą całą magię odpowiada model pod spodem, tak?
 To jest piękne w tym wszystkim. Właśnie o to chodzi, żeby...
 Ja rozumiem, że ta koncepcja polega na tym, żeby ręcznie tym wszystkim nie zarządzać, nie pochłaniać się na łączeniu tych notatek, ale pozwolić LLM-owi, czyli naszemu modelowi, samemu właśnie łączyć te kropki na bazie tego, co już mamy.
 Także to, co pokazywałem ja, to co pokazywał Krzysiek, ta baza się aktualizuje sama, czyli ty nie musisz ręcznie wchodzić, wrzucać notatki, robić podsumowania tej notatki i następnie łączyć je z innymi notatkami.
 Dla mnie, jako osoby, która jest, że tak powiem, nadreaktywna, byłoby to za długie i ten proces by trwał na tyle długo, żebym nie zrobił go poprawnie.
 A teraz z klodem mogę sobie to zautomatyzować. Oczywiście też warto zweryfikować, jakie połączenia powstają, ale to możemy już później, że tak powiem, wejść w tą notatkę i zobaczyć, co tam dokładnie jest.
 Także możemy to później zweryfikować i też ewentualnie poprawić. To jest akurat nieproste.
 Kolejne pytanie, czy mogę mieć jedną stronę z linkami w katalogu RAW, czy każdy link musi być osobną notatką?
 No i odpowiedź jest następująca.
 Tworząc taki second brain czy wiki, personalizujesz pod siebie. Jak tobie jest wygodnie pracować, tak to realizujesz.
 A dla modelu wyciągnięcie nawet 100 linków z jednego pliku markdownowego, czy mieć 100 osobnych plików, to jest żadna różnica.
 Kwestia zdefiniowania zasad, w jaki sposób pracujesz.
 Tak, tak, tutaj mamy dowolność.
 Jak generujesz logi Obsidiana? Znów ta cała magia dzieje się właśnie za pomocą modelu.
 To wszystko jest zdefiniowane zazwyczaj albo na poziomie jakichś skillsów, albo pliku CloudMD czy AgentsMD, tak?
 I tutaj opisujemy właśnie te wszystkie zasady, w jaki sposób on będzie generował te logi, w jaki sposób będziemy dostarczać te notatki do tego RAW, czy w jaki sposób on te wiki będzie generował.
 Oczywiście my przestawiliśmy jedną koncepcję, tak, Carpatiego, ale nie znaczy, że ona jest jedyna słuszna.
 Może warto wziąć to jak Krzysiek i ją dostosować pod siebie.
 Albo pójść w takim kierunku jak ja, gdzie ja teraz buduję w całkiem innej koncepcji swój second brain,
 gdzie też inspiruję się choćby takimi projektami jak Open Cloud i kilkoma innymi, z których wyciągam ciekawostki
 i realizuję tutaj swój second brain, który jest mega zautomatyzowany.
 Tak, i nawet chyba nie wiem, czy w tym templacie, który wrzuciliśmy w ramach maila i też społeczności,
 podzieliliśmy się właśnie tym szablonem, jak tworzyć takiego przykładowego Volta,
 takiego jakiego ja pokazałem, to też tam nawet definiowałem, określałem takie reguły do robienia logowania,
 więc można też śmiało sobie podpatrzeć i wziąć coś dla siebie.
 To jest na pewno ciekawe, także to tylko jeszcze tak ode mnie dodając.
 To robi wszystko klot dokładnie.
 Graf Rack.
 Ten graf, który pokazałeś przed chwilą, to był graf Rack, czy po prostu jakaś baza wiedzy na grafie?
 Prawdopodobnie to było odniesienie do tego, co pokazałeś w obsydianie.
 To jest obsydianowy graf, pokazujący połączenia między notatkami.
 Tak, to są właśnie te linki, które się znajdują po różnych notatkach, które linkują do innych notatek,
 stąd powstaje taki ładny graf.
 Tutaj mieliśmy pytanie, jakie skille są potrzebne w klotko-pilot, aby tak fajnie to działało?
 Teraz ciężko nam się odnieść po tak długim czasie, więc jeśli jesteś z nami jeszcze, Nexor,
 to chętnie odpowiemy na te twoje pytania, jakbyś doprecyzował, o co tam dokładnie dopytywałeś.
 Rozumiem, że w tym obsydianie, jakie skille wykorzystujemy, żeby on tak sprytnie, że tak powiem, działał.
 Ja od ciebie powiem, że sam klot w sobie bardzo dobrze radzi sobie z tą konwencją obsydiana.
 Nie potrzebuje tutaj dużo, żeby się po nim poruszać.
 Oczywiście możemy włączyć obsydian CLI, on też sobie może sam później poprzez helpa,
 czyli taką komendę sprawdzić, jakie ma komendy w ramach obsydiana.
 Natomiast są też skille, które są publiczne na GitHubie.
 Ludzie dzielą się takimi gotowymi umiejętnościami, które też, że tak powiem,
 szczegółowo definiują, jak się poruszać po takich woltach, jak robić notatki.
 Także to też chyba w tych materiałach dodatkowych projekt wrzuciłem Kipano Skills.
 Kipano Obsidian Skills polecam sobie też sprawdzić.
 Na mailu będziecie to mieli.
 Tam są właśnie skille odnośnie tego, jak tworzyć takie dokumenty markdown,
 jak tworzyć bazy, czyli te widoki takie bazowe w Obsidianie,
 jak robić JSON Canvas, jak się poruszać po CLI.
 Także myślę, że to też są fajne, gotowe umiejętności, które możecie później dostosować do siebie,
 ale one nie są wymogiem.
 To, żeby było jasne, to nie jest wymóg.
 I warto dodać, że to są skille bezpośrednio od twórcy Obsidiana.
 Dokładnie, tak.
 No i tutaj w sumie jest analogiczne pytanie o te skillsy.
 Zresztą to, jak ja pokazywałem u siebie ten ingest czy te inne rzeczy,
 to to są po prostu skillsy, które definiują, w jaki sposób on ma dokonywać tej kompilacji,
 tej wiedzy.
 Więc ja też mam customowe skillsy, czy do tasków, które dzisiaj pokazywałem.
 Dlatego warto tworzyć rozwiązanie, które jest spersonalizowane pod nas.
 To, co potrzebujemy, po prostu o to rozszerzyć ten nasz Obsidian.
 Ja tu tylko wyskoczę jeszcze szybko, bo widzę, że Nexor odpowiedział tylko,
 że doprecyzowanie chodzi klot, czy dodatkowe skillsy instalowaliście do Obsidiana,
 aby ładnie szedł w proces.
 To to już powiedzieliśmy, czyli możesz zacząć naprawdę z bazowym projektem,
 takim jak ja pokazałem i nie musisz nawet mieć dodatkowe skillsy,
 on sobie i tak dobrze z tym poradzi.
 Natomiast jeśli dodasz skillsy, to na pewno będzie taki nice to have dodatek,
 żeby usystematyzować tą wiedzę, jak on ma pracować z tymi twoimi notatkami Obsidianowymi.
 Myślę, że to nie zaszkodzi, a może pomóc.
 Dobra.
 Katarzyna tutaj napisała, że zbudowała swój second brain,
 ale nie z Obsidianem.
 Oczywiście to nie jest jedyna słuszna droga, aby budować second brain
 z wykorzystaniem Obsidiana.
 Zresztą ja sam Obsidiana wykorzystuję tylko po to,
 żeby dostać ten graf plus Wikilinks.
 A jako frontend ja wykorzystuję po prostu antygravity.
 Ja nie wyjdziemy z antygravity, gdzie Krzysiek pokazał całkiem inne podejście,
 gdzie on siedzi wyłącznie w tym Obsidianie, gdzie też sobie uruchamia terminal i tak dalej.
 Tak, bo to terminal, jeśli ktoś by chciał uruchomić w ogóle,
 z poziomu Obsidiana to jest wtyczka, ona się nazywa po prostu terminal dosłownie.
 Także to, co ja pokazywałem, że miałem takiego po prostu na pośrodku terminal,
 to właśnie spowodowany tą wtyczką.
 Także można sobie też to tak ustawić, żebyśmy mieli w ramach tej aplikacji po prostu dostęp do cloda.
 No dobra, co tam jeszcze ciekawego?
 Mamy.
 Tutaj jest pytanie do Ciebie, Krzyśku.
 Jak przeglądasz i dodajesz notatki z telefonu?
 To się już pojawiło, czyli po prostu jestem w stanie sobie go zsynchronizować po GitHubie.
 Mam tą wtyczkę do Gita, to też wrzuciłem w ramach materiałów bonusowych.
 Jest to wtyczka Git, ona pozwala mi zapisywać te notatki do GitHuba,
 a później jak już mamy GitHub, to wystarczy jakakolwiek aplikacja do zarządzania repozytorium,
 czy też po prostu są też takie aplikacje, które nadbudowywują, że tak powiem.
 Nawet musiałbym sobie przypomnieć, bo jest teraz taka nowa aplikacja,
 którą sprawdzałem dzisiaj.
 To się też podziela jak może gdzieś tam, że tak powiem, może w mailu jakimś podrzucę
 albo w tych materiałach bonusowych, która wykorzystuje dosłownie tego GitHuba
 do integracji z GitHubem, tworzy nam po prostu takiego obsidiana w naszym telefonie.
 Natomiast można to po prostu zrobić poprzez GitHuba.
 Ja tak robię, że sobie łączę się z tym projektem na telefonie nawet z poziomu cloudcoda najprościej,
 czyli wrzucam w zakładkę Code, tam łączę się z moim GitHubowym projektem
 i mam już do niego dostęp i mogę z nim normalnie, naturalnie pisać.
 Także mogę wyciągać wiedzę, mogę dodawać nowe rzeczy.
 Także to jest tak bardzo, że tak powiem, banalnie wytłumaczone.
 Można to wykorzystać w cloudzie przeglądarkowym,
 ale również i, no tak jak mówię, można sobie pobrać GitHuba
 i też wprowadzać jakieś zmiany z poziomu telefonu przez inne aplikacje.
 To jest już dowolnie, jak sobie to ustalimy.
 I tu kolejne pytanie.
 Czy masz własny workflow do przetwarzania słabej jakości źródeł?
 Mam sporo luźnych, niskiej jakości notatek w Apple Notes.
 Nie chciałbym zaśmiecać nimi RAW, zanim zostaną wstępnie uporządkowane.
 Właśnie po to jest ten RAW.
 Tam wrzucamy surowe, nieuporządkowane notatki.
 I one takie mają zostać.
 Tak, i właśnie przechodzimy później przez proces kompilacji za pomocą LLM-a,
 który nam już uporządkowuje.
 Tworzy syntezę, wyciąga z nich koncepty, opisuje każdy koncept i tak dalej.
 Więc wtedy dostajemy uporządkowaną.
 Więc RAW to jest idealne miejsce, aby wrzucać, jak to nazwałeś, słabej jakości źródła.
 Do tego to służy, dokładnie.
 Kolejne pytanie, a jak jest z łączeniem, dzieleniem wiedzy na różne obszary?
 To już było też.
 Każdy potrzebuje innej wiedzy, cały drugi mózg.
 Dokładnie, już o tym rozmawialiśmy.
 Albo rozbijasz to na osobne wiki, albo tworzysz jedną bazę wiedzy,
 ale w pewnym momencie będziesz musiał rozszerzyć to o raga.
 Więc zachęcamy tutaj też do powrotu kilka minut,
 gdzie o tym przez kilka minut szerzej opowiadaliśmy.
 Dobra, szukam teraz kolejnych pytań.
 Czy będzie pokazane, jak zrobić sobie wszechstrony dostęp,
 jak Ty masz na telefonie i nie tylko?
 Tak, myślę, że ogólnie większy setup,
 taki, że tak powiem, to co pokazaliśmy w ramach materiałów bonusowych
 i też tego, co pokazujemy w ramach tego warsztatu,
 no to na pewno taki pogląd na to z góry z tego powodu,
 że nie jesteśmy w stanie wszystkiego szczegółowo pokazać
 w ramach takiego webinaru, warsztatu półtora godzinnego.
 Natomiast myślę, że też więcej będę mógł zdradzić
 w ramach po prostu naszego community,
 gdzie już będziemy mogli po prostu rozłożyć to na pierwsze,
 że tak powiem, na cząstki pierwsze.
 I nawet nie myślę, Krzyśku, nad tym, czy nie zrobimy tak,
 że nawet zrobimy w ramach community po prostu taki warsztat,
 gdzie sobie pokażemy te konkretne nasze rozwiązania
 i skupimy się na jakichś konkretnych zastosowaniach,
 czy to właśnie tej integracji pomiędzy różnymi urządzeniami.
 Ja to też mogę pokazać wtedy już spokojnie przez godzinkę,
 jak można z tym zarządzać z różnych po prostu miejsc, tak,
 żeby to, no Psydian nie był tylko z poziomu komputera,
 ale wynieść go właśnie też na inne urządzenia.
 No bo o to z tym wszystkim chodzi,
 żeby łatwo z tym komunikować się z różnego miejsca,
 czy jesteśmy w domu, czy jesteśmy poza nim.
 Myślę, że to jest bardzo ważne.
 Warsztaty, które tutaj realizujemy na YouTubie,
 to jest tak naprawdę, aby Was zaciekawić,
 pokazać, sprzedać Wam konkretną koncepcję,
 jak z tym można sobie pracować,
 trochę przemycić teorii na ten temat,
 jak ruszyć w ogóle z takim tematem.
 Natomiast, aby pokazać krok po kroku,
 jak zbudować coś takiego,
 jak porobić te wszystkie integracje,
 jak wynieść to do telefonu i innych rzeczy,
 to każdy z tych elementów, które wymieniłem,
 to jest przynajmniej warsztat na kolejną godzinę.
 Więc z tego moglibyśmy równie dobrze zrobić kilkugodzinny warsztat,
 jak stworzyć taki naprawdę zautomatyzowany,
 synchronizujący się między różnymi urządzeniami,
 system do zarządzania wiedzą.
 Więc ciężko jest po prostu pogodzić to,
 ile pokazać na takim warsztacie,
 żeby zainspirować te osoby,
 bo jednak budowanie krok po kroku
 to jest kilka godzin tak naprawdę,
 żeby pokazać taki cały proces.
 Dlatego też to, co daliśmy w ramach materiałów bonusowych,
 to macie gotowy szablon,
 w którym możecie ruszyć już dzisiaj.
 Także tutaj możecie go sobie pobrać totalnie za darmo,
 zacząć z nim działać
 i zobaczyć, na ile wam to się przydaje
 takim pierwszym,
 od takiego właśnie, że tak powiem,
 template'u, gdzie macie już pewne szlaki przetarte.
 A jeśli jesteście ciekawi,
 dalej zgłębiania tego tematu
 i wchodzenia jeszcze głębiej w tego Obsidiana
 i jego wykorzystania,
 no to tu już mówię,
 tu trzeba by było, że tak powiem,
 jeszcze osobny materiał z tego robić,
 no bo jest dużo konceptów, tak?
 Są ZL Casteny, są metodyki Para,
 no właśnie jest chociażby LLM Carpati,
 Wiki, LLM Wiki bardziej, tak?
 To jest bardzo dużo konceptów,
 w jaki sposób można tego Obsidiana rozwijać.
 Możecie go rozwijać jako takiego asystenta,
 który ma wiedzę o waszych różnych projektach,
 różnych zadaniach, jeśli chodzi na co dzień, tak?
 Możecie sobie robić journal,
 czyli notatki, dziennik w ogóle,
 jakiś taki codzienny, tak?
 Także bardzo dużo koncepcji,
 które możecie robić,
 od rozwoju osobistego,
 poprzez budowanie jakiejś wiedzy firmowej,
 poprzez jakieś takie własne researche,
 projekty,
 z którymi chcecie właśnie
 w ramach takiego Volta się podzielić.
 Także jest tego bardzo,
 ale to bardzo dużo.
 Mateo, też zachęcamy tutaj
 do dołączenia do społeczności,
 bo zawsze każdy temat,
 który bierzemy tutaj na darmowy warsztat,
 rozbijamy głębiej w ramach społeczności
 i pokazujemy właśnie,
 jak krok po kroku
 takie rzeczy sobie skonfigurować.
 Kolejnym pytaniem,
 czy ktoś próbował to wdrożyć w MŚPL-u,
 w organizacji dla jednego krokodnego działu?
 Szczerze mówiąc,
 no my tutaj z Krzyśkiem już
 takie rozwiązanie sobie budujemy.
 Myślę, że można powiedzieć,
 bo dla swoich firm.
 Ale o to chodzi,
 żeby zacząć od siebie.
 Tak, ja też buduję dla swoich działalności
 też takie swoje bazy wiedzy.
 Co ciekawe,
 wczoraj też byłem na meetupie,
 gdzie Kuba Masztalski,
 więc jak nas słucha,
 to go serdecznie pozdrawiamy,
 gdzie też właśnie opowiadał o tym,
 jak on dla swojej firmy
 oraz jako usługę świadczy też taką rzecz
 dla MŚP,
 gdzie buduje właśnie takie second brainy,
 gdzie też pokazywał właśnie
 taką zmodyfikowaną koncepcję Carpatiego,
 więc jak najbardziej,
 jak najbardziej tego typu rzeczy
 się realizuje,
 aczkolwiek tutaj też trzeba mieć na uwadze,
 że momentami niektóre rzeczy
 będą musiały być zrobione,
 zadbana ta prywatność,
 więc albo anomalizacja danych,
 albo przetwarzanie też na lokalnych modelach,
 więc to trzeba mieć na uwadze.
 Okej, kolejne pytanie.
 Inke z Commenda,
 to jest Klaudiuszowa,
 czy dogrywa się ją
 i wygrywa skille?
 Wgrywa skille.
 To jest przeze mnie stworzony skill,
 który dokładnie opisuje,
 zgodnie z konceptem Carpatiego,
 w jaki sposób przygotować tą kompilację wiedzy
 przez LLM-a.
 Może Krzysztof też to wrzucisz w ramach społeczności,
 to też myślę, że ciekawa będzie rzecz.
 Tak, tak, tak.
 Właśnie tego typu skille i tak dalej
 my się dzielimy teraz tutaj na społeczności,
 więc pewnie w najbliższym czasie
 będziemy to wszystko udostępniać
 członkom, którzy są.
 Z kolejnego pytania.
 Sprawdziliście po update aplikację
 despołu Cloud?
 Pojawiła się zakładka
 Additional Features Daily,
 included routine runs.
 To dość istotne,
 jeśli mamy o automatyzacjach nocnych.
 To jest temat kompilowy typowy.
 Tak, już to testowałem,
 aczkolwiek nie wiem,
 nie wiem jak ty Krzyśku,
 ale ja jestem zwolennikiem
 jednak budowania swoich customowych
 jakichś Chrome Jobów,
 a poza tym to działa tylko
 z poziomu Cloud Coda.
 A co jeśli ja chcę na przykład,
 nie wiem, z poziomu telefonu,
 z jakiegoś innego narzędzia
 mieć też możliwość dostępu
 do tego mojego second brain'a,
 czy jakiegoś taska,
 który się wykonuje,
 no wtedy nie ma.
 Jesteśmy uciezieni wtedy.
 A poza tym ja teraz
 budowanie takich narzędzi
 z wykorzystaniem Cloud Coda
 to jest relatywnie proste
 na własne potrzeby
 i zbudowanie takich rozwiązań,
 które się odpalają,
 nad którymi mamy pełną kontrolę
 i jesteśmy w stanie je integrować
 z czym chcemy
 i w jaki sposób chcemy je dostosować
 jest bajecznie proste.
 Pełna zgoda, pełna zgoda.
 Kolejne pytanie.
 Jak praktycznie wygląda
 wasza codzienna praca
 z Second Brain
 i jak pomaga wam to
 oszczędzać czas,
 czy można prosić
 o dwa konkretne use case'y
 od każdego z was?
 No to co?
 Dawaj Krzuchu jako pierwszy.
 Jeśli chodzi o takie konkretne use case'y
 to na pewno to,
 że jeśli pracuję nad
 praroma projektami jednocześnie
 to dużo wiedzy mi,
 czyli dużo, że tak powiem,
 informacji potrafi mi uciekać.
 Dużo rzeczy pojawia się nowych,
 dużo rzeczy też próbuję gdzieś tam
 zapisać, zaplanować
 i też potrafią mi uciekać.
 To co ja robię,
 nawet to co robiłem wcześniej
 w ramach Notion,
 którego budowałem przez trzy lata
 i teraz to co robię z Obsidianem,
 to to, że jeśli pojawia mi się
 jakaś konkretna informacja,
 no chociażby pomysł
 na jakiś nowy film,
 na jakiś materiał,
 czy pojawia się jakiś nowy feature,
 jakieś rozwiązanie,
 które chciałbym się zapoznać,
 pierwsze co robię,
 to mogę taką informację
 od razu przerzucić sobie
 do takiego second brain'a,
 do takiej bazy wiedzy
 i właśnie zrobić sobie z tego notatkę,
 czyli już zostaje
 jakiś ślad po tym,
 co zobaczyłem.
 Więc teraz to co służy,
 do czego służy ten second brain,
 to on ma nam odciążyć
 trochę tą naszą głowę,
 bo jeśli my sobie będziemy mówić
 dobra, zapamiętam to
 i później do tego wrócę,
 to ja często mam taką sytuację,
 że do tego nie wracam,
 bo po prostu wylatuje to z głowy.
 Jest za dużo tematów,
 jesteśmy nimi bardzo przebodźcowani
 i właśnie budowanie takiego second brain'a
 ma nam to odciążyć,
 więc jesteśmy w stanie
 w tym second brain'ie
 po prostu takie rzeczy sobie zrzucać,
 syntetyzować, podsumowywać,
 no i to jest taki pierwszy case,
 no drugi to jest na pewno
 szybsze trawienie tych materiałów,
 to, żeby było jasne,
 nie chodzi też o to,
 żeby delegować to myślenie
 do LLMów
 i żeby one za nas trawiły tą wiedzę,
 a my nic później z nią
 nie będziemy robić,
 no trzeba oczywiście też
 czytać i analizować w ogóle,
 co się znajduje w tej bazie wiedzy,
 no bo o to w tym chodzi.
 Natomiast dla mnie to jest też uproszczenie,
 że mogę bardzo szybko syntetyzować,
 podsumować sobie jakąś wiedzę,
 zobaczyć pewne powiązania
 z tym, co już wcześniej zgromadziłem,
 może jakieś tematy się łączą,
 różne koncepcje mogą się na siebie najeżdżać,
 może ta jest słuszna,
 a może inna,
 także to też pozwala mi
 później to wszystko
 w ramach takiej mojej bazy wiedzy
 sobie odbić
 i stwierdzić,
 czy to, co na przykład
 jakaś nowa informacja
 jest słuszna,
 czy to jest coś nowego,
 czy to może jest ten sam temat,
 odgrzany kotlet,
 ale troszeczkę w inny sposób,
 więc to też
 w ramach takiego second braina
 mi pozwala
 zweryfikować pewne tematy
 i koncepcje.
 To tak ode mnie.
 To ja może uderzę
 w takim teraz
 koncepcie biznesowym.
 Oczywiście ja często biorę udział
 w spotkaniach z klientami
 i jeśli klient wyrazi zgodę,
 abym mógł sobie nagrać tą rozmowę,
 to ja właśnie nagrywam taką rozmowę,
 która później trafia jako
 transkrypcja do second braina,
 na podstawie której
 jest generowana notatka
 z takim podsumowaniem,
 o czym rozmawialiśmy,
 jakie są action itemy,
 kolejne kroki
 i tak dalej do wykonania
 i na podstawie tej notatki
 jest pisany draft maila,
 który mogę sobie wysłać do klienta.
 Więc to jest taki jeden z case'ów
 w kontekście biznesowym,
 który używam.
 A druga sprawa,
 jeśli chodzi o taki kontekst biznesowy,
 to też często
 właśnie mam tutaj taką całą bazę wiedzy
 zebraną na temat mnie,
 jakie realizuję projekty,
 jaką mam grupę docelową,
 jak wygląda mój, nie wiem,
 brand design i tym podobne rzeczy,
 no i na plus jakieś przykładowe pytania,
 odpowiedzi do klientów.
 Tak samo na podstawie tych transkrypcji
 można naprawdę mnóstwo rzeczy
 z rozmów z klientami wyciągnąć.
 No i teraz do tego wszystkiego
 ma dostęp mój model
 na podstawie czego
 ja mogę odpowiadać też klientom
 na jakieś pytania,
 które ich nurtują, tak,
 w bardzo szybki sposób,
 dostając się do moich notatek.
 Więc to są takie dwa case'y
 z życia biznesowego, tak,
 gdzie Krzysiek pokazał bardziej
 na zasadzie takiego content creator'a,
 a ja bardziej tutaj
 z perspektywy biznesowej.
 Dobra, kolejne pytanie.
 Czego używacie do odpalania,
 skedulowania na przykład hooksów?
 Ja używam tych hooków,
 które są wbudowane w Cloud Code'a,
 natomiast też pokazywałem,
 że poza tymi hookami
 ja też mam jakieś skrypty pythonowe
 czy skrypty powershellowe,
 które pomagają mi choćby
 śledzić jakiś katalog,
 bo przykładowo w hookach Cloud Code'a
 nie ma takiego,
 który pozwalałby mi właśnie
 ten cały czas monitorować ten katalog,
 czy się pojawi w nim jakiś nowy plik.
 Dlatego właśnie albo wykorzystujemy
 skrypty powershellowe,
 albo pythonowe,
 aby taką funkcjonalność
 sobie zapewnić.
 Krzyśku, chciałbyś coś do żyć?
 Ja może dodam to też,
 co ja w jednym projekcie testuję.
 Ja jestem w ekosystemie,
 pracuję macowym,
 Apple'owym,
 więc mam telefon z iOS-em
 i mam komputer z macOS-em
 i teraz korzystam również z chmury.
 I co ja robię w ramach takiej chmury?
 To można sobie wydzielić folder
 właśnie w ramach waszego iCloud'a
 i teraz ten folder może być równie dobrze voltem,
 więc jeśli wprowadzacie jakieś zmiany do tego volta z poziomu iCloud'a,
 czyli właśnie z poziomu telefonu mogą lądować jakieś notatki,
 możecie je edytować wtedy z różnych miejsc,
 to on też później się zsynchronizuje w ramach waszego komputera.
 I to jest też mega fajne i proste z tego powodu,
 że wtedy ten volt jest utrzymywany w tej konkretnej chmurze.
 Oczywiście to jest kwestia waszych preferencji,
 czy jesteście za chmurą, czy nie,
 natomiast to jest też jedna z opcji,
 jak można, że tak powiem,
 synchronizować się na tych różnych konkretnych narzędziach.
 I też to, co bardziej w tym temacie,
 co tutaj podałeś o skedżulowanie,
 to właśnie to, że jeśli mamy taki drive przykładowo,
 to tutaj my nie dbamy o samą,
 że tak powiem,
 nie musimy dbać nawet o jakiś mechanizm synchronizacji,
 ale to się synchronizuje by default po prostu przez,
 że tak powiem, różne procesy,
 które się dzieją pod spodem,
 jeśli chodzi o synchronizację takiej chmury.
 Także ja tutaj nie muszę, że tak powiem,
 dokładać kolejnych kroków,
 ale to się dzieje po prostu z automatu.
 To jest jedna, że tak powiem,
 z koncepcji taka inna troszeczkę,
 niż to, co ty pokazałeś, co nie?
 Tak tylko, żeby dać jakąś inną perspektywę.
 Dobra, wygląda to mega prosperująco,
 tylko jak to zbudować?
 Mam nadzieję, że w bonusie będzie pokazany krok po kroku.
 Tak, w bonusie dostajecie taki prosty scenariusz,
 jak to zbudować krok po kroku,
 natomiast zapraszamy do społeczności,
 gdzie tam pogłębimy ten temat,
 pokażemy też pewnie jakieś rzeczy
 z synchronizacją tych notatek,
 między telefonem,
 a innymi urządzeniami.
 Lub też, jakie można wykorzystać.
 No i pewnie wiele, wiele innych rzeczy
 i też, jeśli będzie takie zapotrzebowanie
 od strony społeczności,
 to też pokażemy,
 jak krok po kroku
 dokładnie zbudować
 takie bardziej zaawansowane rozwiązanie,
 niż to, co dzisiaj pokazaliśmy.
 W sumie tutaj widzę, że też się pojawiły takie dyskusje,
 że tutaj jest to głównie prezentacja,
 że liczyli na część warsztatową.
 Tak, była tutaj część warsztatowa,
 aczkolwiek w momencie,
 kiedy Klaudiusz przez 17 dokładnie minut,
 chyba jak dobrze pamiętam,
 robił syntezę,
 to było trzeba jakoś tutaj ten czas zagospodarować
 i wtedy to była idealna okazja,
 aby wytłumaczyć,
 jak ten cały koncept został zbudowany.
 Podobnie tutaj u Krzyśka to wyglądało.
 Jasne, dokładnie,
 więc pewne rzeczy na live,
 że tak powiem,
 się wydłużają,
 jeśli chodzi o to,
 no to trzeba to wziąć pod uwagę.
 Tak, ktoś tutaj w ogóle zauważył w międzyczasie,
 że 50 K tokenów poszło na dwa źródła.
 Jak się przetwarza właśnie takie dłuższe filmy
 na YouTubie i tak dalej,
 to tam ubito mieć sporo tokenów.
 Aczkolwiek jednak te mechanizmy,
 które tam pokazałem,
 typu te huki,
 które tam się odpalały,
 które robiły te transkrypcje i tak dalej,
 to one były realizowane na poziomie zeru tokenów,
 bo wykorzystywaliśmy albo napisy z YouTube'a,
 albo bibliotekę,
 przepraszam, bibliotekę,
 lokalny model Whispera,
 który robił transkrypcje.
 Ok, przejdźmy tutaj dalej.
 Tutaj od Wojtka pytanie,
 w jaki sposób kontrolujesz cały proces wiki zadziałał
 i jakie daje wyniki błędy, halucynacji i tak dalej?
 Ja rozumiem, że kontrolujesz właśnie przez te reguły, zasady,
 które zdefiniujesz w ramach po prostu tej konstytucji tego twojego Volta.
 Czyli to jest właśnie to, co wypracowujesz w ramach Skili,
 w ramach twojego CloudMD,
 czyli twojego głównego mózgu projektu.
 Tam możesz wszystkie, że tak powiem, zasady, reguły,
 jeśli chodzi o ingest,
 czyli przetrawienie, że tak powiem, tych plików,
 poprzez chociażby wyłapywanie jakiejś sytuacji,
 gdzie coś jest właśnie niepoprawne albo czegoś nie chcesz na przykład wrzucać do tego Volta,
 poprzez query, czyli wyciąganie tej informacji,
 link, czyli też zarządzanie tu spójnością,
 możesz to wszystko ustalić, że tak powiem, z poziomu tych instrukcji.
 I co ważne, no to ja też mam nawet takie rzeczy jak,
 mam też nawet takie zasady,
 którymi też się podzieliłem w ramach tego bonusu,
 mianowicie też takie coś jak super session,
 czyli zastępowanie wiedzy.
 Każda wiedza ma jakiś tam swój life cycle,
 czyli jakiś tam okres trwania, że tak powiem.
 Nowe źródło może zaprzeczyć po prostu staremu jakiemuś założeniowi
 i wtedy nie kasujemy tej wiedzy jawnie,
 ale po prostu ją zastępujemy.
 Więc też jesteśmy w stanie zapisać po prostu w dwóch miejscach,
 że po prostu taki nawet call out w treści,
 czytelny dla człowieka,
 że słuchaj, ten materiał jest już outdated,
 został zastąpiony nowym materiałem.
 Także też jesteś w stanie,
 że tak powiem,
 aktualizować tą wiedzę
 i nawet jeśli coś jest nieaktualne,
 to też to zaznaczyć.
 Da się tym też śmiało,
 to oczywiście jest dużo koncepcji,
 ja pokazuję też jedną ze swoich podejść,
 a oczywiście można to robić w inny sposób,
 ale to też jest jakaś jedna opcja na to,
 jak można zarządzać takimi zadaniami.
 I to też, co powiedziałem wcześniej,
 czyli dla każdej wiki to, co ja robię,
 to też stosuję ten podział taki stopniowania,
 jeśli chodzi o confidence score,
 czyli taki poziom pewności.
 Im więcej mam źródeł,
 które potwierdzają to samo doniesienie,
 tym to jest dla mnie też pewniejsze,
 że to wiki po prostu ma wtedy ten confidence
 na wysokim poziomie
 i to oznacza, że po prostu mogę temu zaufać.
 Jak ma coś niski ten poziom,
 no to znaczy, że nie ma na razie
 za dużo dowodów
 albo coś jest niejasne
 i trzeba by było to podeprzeć
 jakimiś innymi jeszcze materiałami.
 Także to są różne koncepcje.
 Dobra, Krzychu.
 A ile czasu zajęło Ci zbudowanie tego braina?
 Tak, najwięcej zbudowaniu,
 w sensie jeśli chodzi o sam notion,
 pobieranie tych danych.
 Tutaj bardziej notion traktuję jako
 sam już second brain w sobie.
 Tutaj nie musiałem za dużo edytować,
 no bo ja już jakąś strukturę wypracowałem
 w ramach tego notion przez te lata.
 Natomiast ten drugi obsidian,
 który pokazywałem w ramach tego researchu obsidianowego,
 zajął mi tak naprawdę,
 szczerze mówiąc,
 taki główny setup,
 najważniejsze rzeczy,
 jakoś około godzinki.
 Oczywiście to nie było gdzieś tam pierwsze zderzenie,
 już z obsidianem sobie też pracowałem wcześniej.
 Natomiast takie najważniejsze rzeczy,
 byłem w stanie gdzieś tam do godzinki sobie setupować,
 już jakieś pierwsze oczywiście źródła zaciągnąć,
 przygotować, że tak powiem, instrukcje, reguły,
 konkretne plug-iny,
 z których będę korzystał w ramach tego projektu
 i też skille.
 Także to myślę, że to jest taka baza, fundament.
 No a później to już jest tak naprawdę dalsza praca
 po prostu z tym obsidianem.
 I jeśli chodzi o zbudowanie tego braina,
 no to ciężko jest powiedzieć,
 ile zajęło,
 no bo pytanie,
 czy pytasz o samą strukturę wstępną,
 czy o całość,
 no bo wiadomo,
 że ten mózg,
 ta nasza baza wiedzy
 będzie ewoluować
 i on ewoluuje do dzisiaj,
 więc tak naprawdę...
 Ale powiedzmy ten silnik,
 powiedzmy ten silnik,
 który zbudowałeś, tak?
 Bo wiadomo,
 że dodawanie źródeł to na bieżąco,
 ale sam silnik.
 No to myślę,
 że do godzinki,
 żeby nawet gdzieś tam wypracować
 jakąś koncepcję.
 Takie, wiesz,
 ja to, co pokazałem w ramach tego Obsidian Vaulta,
 to jest bardzo prosta struktura.
 Ja tutaj też nie mam jakichś,
 że tak powiem,
 wodotrysków,
 jeśli chodzi o jakieś dodatkowe integracje,
 tak jak ty pokazałeś z różnymi narzędziami.
 Mam integrację z tym Obsidian Cliperem,
 mam oczywiście też,
 chociażby też synchronizację
 w innym projekcie z chmurą,
 ale to zależy od konkretnego projektu,
 a taki podstawowy projekt,
 no to byłem w stanie dowieźć do godzinki.
 Natomiast nie ukrywam,
 że teraz z wypracowanymi instrukcjami
 tak naprawdę tworzenie nowego Vaulta
 w innej tematyce zajmuje mi o wiele szybciej,
 no bo biorę gotowy template,
 nawet ten, co pokazałem w ramach tych bonusów,
 no i mogę już z nim sobie zacząć działać
 i tam klot mnie prowadzi za rączkę
 i wypytuje mnie konkretnie,
 co chcę zrobić.
 Także to idzie po prostu o wiele, wiele sprawniej.
 Oczywiście później zbieranie tej wiedzy,
 no to żeby zbudować
 taki konkretny second brain,
 no to trzeba siedzieć
 i coś do niego, że tak powiem,
 wrzucać i uzupełniać go jakieś informacje.
 Samo się to nie zrobi.
 No może, że masz faktycznie
 poautomatyzowane różne importy,
 to wtedy może się budować
 i sam, pewnie.
 Właśnie wiesz,
 ja po to stworzyłem sobie RS-Feedy,
 które są zapięte na tematy,
 które mnie interesują
 i one zbierają informacje i po prostu raz dziennie wrzucają materiały,
 które przechodzą jeszcze przez filtr,
 o którym wcześniej tam rozmawialiśmy.
 Na przykład, nie wiem,
 w tematach finansowych mnie nie interesuje Forex,
 tak?
 Więc po co mają mi tam lecieć
 i przepalać też jakieś tokeny,
 czy cokolwiek
 przy samej syntezie tych notatek.
 Natomiast u mnie też to nie zajęło długo.
 Ja tak naprawdę,
 to co ja zrobiłem,
 to ja wziąłem Gista i Tweeta
 od Carpatiego,
 wziąłem sobie Klaudiusza
 i powiedziałem,
 dobra, zaczynamy budować
 Second Brain z Cloud Code plus Obsidian
 na podstawie koncepcji właśnie Carpatiego.
 Tutaj masz te linki
 i od razu mu po prostu dorzuciłem,
 że hej stary,
 chciałbym po prostu w tej koncepcji
 zautomatyzować kilka rzeczy,
 daj mi kilka pomysłów.
 No i dosłownie po pięciu, dziesięciu minutach
 miałem już rozpisane wstępnie PRD,
 które przedstawia całą koncepcję
 tego Second Brain'a
 wraz z kilkoma pomysłami na automatyzację.
 Przedyskutowałem chwilkę te automatyzacje,
 stwierdziłem, dobra,
 robimy jakieś OCR-y,
 robimy jakieś RS-Feedy na automacie,
 robimy dodatkowo jakieś tam taski i tak dalej.
 No i w zasadzie po jakieś 30-40 minutach
 miałem gotowe PRD,
 które następnie przez kolejne 30 minut
 zostało zaimplementowane
 przez Klaudiusza.
 Oczywiście tam pojawiły się jakieś drobne błędy,
 więc dwie, trzy iteracje
 i po niespełnych dwóch godzinach
 miałem już gotowy silnik,
 który Wam dzisiaj pokazałem.
 I następnie tylko wygenerowałem
 jakieś fejkowe dane,
 aby mieć na warsztat
 i w sumie to szybko było do realizacji.
 Tak, to jest nawet, bo czasami się wydaje,
 że za bardzo komplikujemy.
 Często po prostu najprostsza metoda jest dobra,
 żeby zacząć.
 I to, co pokazywaliśmy,
 ja to też wrzuciłem,
 ja to już mówię tu któryś raz jak mantrę,
 wrzuciłem to w ramach materiałów,
 które macie na mailu.
 Tam jest również link do Carpatiego,
 do tej notatki, którą on wrzucił,
 która się stała viralem.
 I ją też równie dobrze,
 jeśli chcecie,
 możecie z nią zacząć,
 tak jak powiedział Krzysiek,
 wrzucić po prostu do cloda
 i zacząć z nim pracować.
 Albo skorzystać z tego template'u,
 który ja już rozwinąłem
 gdzieś tam pod siebie,
 albo zacząć od totalnego zera
 i zobaczyć,
 czego Wam tak naprawdę brakuje.
 Także to jest piękne w tym wszystkim,
 że każdy może sobie to dostosować
 do swoich własnych potrzeb.
 Nie ma jednej, że tak powiem,
 sprawdzonej, idealnej,
 że tak powiem, metody.
 Każdy musi sobie to dostosować
 na swoje potrzeby.
 Ok, macie gdzieś udostępnione narzędzia,
 które stosujecie w swoich AI.
 Akurat jeśli chodzi o swoich AI.
 Prawdopodobnie chodzi o projekty,
 w których korzystamy
 i ja właśnie na potrzeby społeczności
 buduję taki zbiór,
 który na dniach wrzucę,
 rekomendowanych narzędzi przez nas
 oraz alternatyw.
 Więc w ramach społeczności
 pojawi się taki bardzo
 rozbudowany zbiór.
 Ja dużo użyję skillów i narzędzi
 takich wokół tych moich projektów,
 które mogę reużywać,
 czyli nie tworzę jednego,
 że tak powiem,
 jak robię na przykład skillsy jakieś,
 to staram się robić je tak,
 żeby móc je wykorzystywać
 w wielu projektach jednocześnie,
 czyli takie globalne, że tak powiem,
 skille,
 to na przykład jest też
 mega fajnym rozwiązaniem.
 Ostatnie takie dwa pytania,
 w sumie na to już odpowiedzieliśmy wcześniej,
 czy można zainstalować Obsidiana
 w chmurze iCloud
 i trzymać projekty w niej Chromecode?
 Popatrz, nawet nie czytałem tego,
 przyznaję się.
 I w zasadzie już to wybrzmiało
 chyba trzykrotnie.
 Możesz sobie wolkę zainstalować
 na iCloudzie.
 Może, czy nawet w VPS-ie,
 własnym serwerze.
 Tak, i macie dzięki temu
 synka między wszystkimi
 waszymi Apple-owymi urządzeniami.
 Tu w ogóle pojawiło się pytanie,
 nie lepiej właśnie używać Gemini'a,
 przynajmniej będzie mógł bez problemu
 obejrzeć film z YouTube
 bez żadnych dodatkowych narzędzi.
 Pytanie,
 on też ma narzędzia pod spodem.
 To nie jest tak,
 że to się dzieje magicznie.
 Dalej ten model
 musi być jakieś narzędzie.
 Tak, pytanie,
 co realizujesz
 i pytanie,
 czy jesteś aż tak bardzo bogaty,
 żeby takie rozwiązanie
 sobie wprowadzić.
 Bo, nie wiem,
 jeśli chcemy sobie
 stworzyć transkrypcję,
 nawet używając Gemini'a,
 versus Gemini'a,
 aby obejrzał,
 zrozumiał,
 co się dzieje na filmie,
 a poza tym jest pewien,
 ja sam się bawiłem,
 bo ja też automatyzowałem
 choćby podcast,
 gdzie wykrywałem emocje,
 inne rzeczy
 za pomocą
 właśnie tego
 modelu Gemini'owego,
 no i się pojawia
 pewien problem.
 Mniej więcej przy około
 30-40 minutach
 zaczyna halucynować.
 Co zrobisz,
 jeśli będziesz miał
 dłuższy materiał?
 Druga sprawa,
 przetworzenie takiego materiału
 dwugodzinnego,
 w przypadku podcastu,
 czasami potrafi już kosztować
 nawet kilka dolarów
 po API.
 No i pytanie,
 czy faktycznie
 chcesz oglądać,
 rozumieć,
 co się dzieje
 na warstwie obrazu?
 Bo na warstwie obrazu
 oczywiście możemy zobaczyć,
 że tam jest czerwony samochód,
 jest jakaś ładna pani
 i tak dalej,
 ale czy to jest potrzebne
 tobie?
 Ja już osobiście
 sam bym wolał
 zbudować takie narzędzie,
 wziąć właśnie
 od Google'a
 narzędzie
 od Gemini'a
 multimodal embedding,
 gdzie sam bym sobie
 przetworzył
 za pomocą lokalnych modeli,
 bo można wykorzystać
 lokalne modele
 plus ten ich model embeddingowy,
 który jest właśnie
 dostępny jako open source
 i w całości
 zrobić sobie
 darmowy
 właśnie taki
 wektoryzację,
 dzięki czemu też
 możemy rozmawiać
 i zrozumieć,
 co się dzieje
 na tej warstwie.
 Więc ja osobiście
 Gemini'a
 wolałbym nie używać,
 bo już sam używałem
 i przepaliłem
 kilkanaście czy kilkadziesiąt
 dolarów tylko na testy,
 a w zasadzie
 nic konkretnego
 nie zostało zbudowane,
 a problem za problemem
 się pojawiał właśnie
 jak dłuższy materiał
 niż 30 minut,
 halucynacje
 i wiele innych problemów,
 więc ja często
 jestem zwolennikiem
 budowania nawet
 rozwiązań
 oparte o lokalne narzędzia,
 niż
 niż właśnie
 czasami
 korzystanie
 z jakichś gotowców.
 Dobra,
 moi drodzy,
 tutaj już tak
 przeglądając,
 już jakichś takich
 konkretnych pytań,
 nie widzę.
 łapka w górę,
 jeśli faktycznie jeszcze
 wytrwaliście z nami tutaj
 i jesteście z nami
 już chyba
 dwie godziny live'a,
 tak, nawet ponad,
 także fajnie tutaj
 dla wytrwałych
 jeszcze raz
 dziękujemy i polecamy.
 Bo sporo pytań
 tutaj widzę teraz,
 jak już do końca
 dyskusji jest
 powtarzających się,
 czyli tematy,
 na które już
 wcześniej odpowiedzieliśmy,
 więc tutaj nie widzę
 już żadnych
 takich pytań
 nowych,
 więc, no,
 pozostaje nam się
 już tylko z wami
 pożegnać,
 ale zanim to zrobimy,
 to oczywiście
 małe żebro
 lajkowanie,
 czyli jeśli
 to, co pokazaliśmy
 wam dzisiaj
 podoba się wam,
 to oczywiście
 prośba
 o zostawienie
 po sobie śladu
 w postaci
 subskrypcji,
 komentarza,
 lajka,
 bo pozwala nam to
 pozwala nam to
 docierać do nowych osób
 tak samo.
 docierać do nowych osób
 tak, że tutaj już
 widzimy, że Marek
 tutaj
 powiedział, że
 wykona
 akcję
 lajkowania,
 więc tutaj
 dzięki Marku.
 No i oczywiście
 dla osób, które
 dołączyły do nas,
 bo mamy kolejne,
 że tak powiem,
 nowe osoby
 na pokładzie
 AI Ninjas,
 także też za to
 dziękujemy
 i mam nadzieję,
 że po prostu
 ta
 ta społeczność
 w ramach
 też te materiały,
 które są w ramach
 społeczności
 wniosą wam
 realną wiedzę
 i po prostu
 będziecie mogli
 to wykorzystać
 w praktyce,
 w swoich rozwiązaniach.
 Ja tutaj jeszcze na czacie
 widziałem, że w międzyczasie
 się pojawiło pytanie,
 czy będzie kolejny live,
 tak?
 Będzie kolejny,
 kolejne spotkanie
 planujemy na maj.
 Jeszcze
 jeśli chodzi o jakieś
 konkrety,
 to
 będziemy was
 informować
 na liście mailowej,
 dlatego też
 warto się
 zapisać
 i być na bieżąco,
 bo na newsletterze
 też dzielimy się
 ogromem wiedzy.
 No i oczywiście
 zapraszamy was
 do dołączenia
 do społeczności
 i do jutra
 do 23.59
 ma się możliwość
 dołączenia
 w korzystnej cenie
 obniżonej
 aż o 50 zł
 taniej,
 więc
 naprawdę
 to nie są
 duże pieniądze,
 a w każdej chwili
 możecie zrezygnować.
 Także macie
 14 dni
 na wypróbowanie
 i możecie
 do nas napisać
 bez podania
 żadnej przyczyny,
 a my wam
 zwrócimy
 pieniądze,
 więc możecie
 sobie na spokojnie
 przez dwa tygodnie
 przetestować,
 czy społeczność
 AI Ninjas
 jest dla was.
 Chciałbyś
 coś dodać?
 Ja tylko
 tak dodam
 na
 domknięcie.
 Nie jesteśmy
 od wczoraj,
 oczywiście
 ten
 na naszym kanale
 i też
 na mailu
 dostajecie
 też w tym
 pierwszym
 takim powitanie,
 dostęp do
 poprzednich źródeł,
 poprzednich materiałów,
 to też w ramach
 naszego kanału
 możecie prześledzić
 poprzednie warsztaty,
 także
 to, co chcę też
 zaznaczyć,
 że nie jesteśmy
 od wczoraj
 i też jutro
 nie znikamy,
 także śmiało
 możecie też
 zapoznać się
 z poprzednimi
 publikacjami,
 tam też jest dużo,
 dużo wiedzy
 do, że tak powiem,
 skonsumowania
 odnośnie
 cloda,
 czy też
 marketingu
 z AI,
 ale nawet
 i open cloud,
 który jest też
 dosyć świeżym tematem,
 nawet z tego, co widzę,
 to on tutaj
 największym echem
 się odbył na naszym kanale,
 także też do nich
 zapraszam,
 no i widzimy się
 z niektórymi już
 w społeczności,
 także dzięki
 wielkie za zaufanie.
 Jeszcze z innymi
 osobami pewnie
 za kilka tygodni
 na kolejnym
 warsztacie
 i oczywiście
 i oczywiście
 też zachęcamy
 do wypełniania
 ankiet,
 bo oczywiście
 dzisiejszy temat
 został
 przez Was
 przez społeczność,
 więc
 my staramy się
 realizować materiały,
 które dla Was są
 potrzebne.
 No dobra,
 to co,
 albo widzimy się
 z częścią osób
 na społeczności,
 albo
 za kilka tygodni
 na kolejnym
 otwartym warsztacie,
 także wielkie dzięki
 za dzisiaj
 i do usłyszenia.
 Hej!
 Dzięki wielkie!
 Cześć!
```
