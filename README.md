# Größentabellen – JTL-Shop 5 Plugin

Zeigt herstellerspezifische Größentabellen für Snowboard-Schuhe und Bindungen auf Produktdetailseiten an. Eine separate Übersichtsseite kann im Footer verlinkt werden.

---

## Funktionsumfang

- **Produktdetailseite**: Button öffnet ein Modal mit der passenden Größentabelle des jeweiligen Herstellers – getrennt für Schuhe und Bindungen
- **Übersichtsseite**: Alle Größentabellen auf einen Blick, erreichbar über eine verlinkbare Shop-Seite (`/groessentabellen`)
- **Flexibles Matching**: Jede Tabelle wird einer oder mehreren Warengruppen zugewiesen; die Anzeige erfolgt nur auf Artikeln der passenden Warengruppe und des passenden Herstellers
- **Demo-Daten**: 30 vordefinierte Tabellen (11 Schuhmarken, 19 Bindungsmarken) per Knopfdruck laden und wieder löschen
- **Backend-Suche**: Tabellen im Admin nach Name und Hersteller durchsuchen

---

## Installation

1. Plugin-Ordner nach `plugins/size_tables/` kopieren
2. Im JTL-Admin unter **Plugin-Verwaltung** installieren
3. Die Übersichtsseite ist nach der Installation unter **Inhalte → Seiten** in der Linkgruppe „Versteckt" zu finden – von dort in die gewünschte Linkgruppe (z. B. Footer) verschieben

---

## Einstellungen

Unter **Plugin → Einstellungen**:

| Einstellung | Beschreibung |
|---|---|
| Plugin aktiv | Schaltet die Anzeige der Buttons auf Produktseiten ein/aus |
| Für Mobile aktiv | Aktiviert die Anzeige auch auf Mobilgeräten |
| Name auf Button aktiv | Zeigt den Text „Größentabelle" neben dem Icon im Button an |

---

## Größentabellen verwalten

### Neue Tabelle anlegen

1. Im JTL-Admin **Plugin → Größentabellen → Neu** klicken
2. Felder ausfüllen:
   - **Name** – frei wählbar, z. B. „Burton Schuhe"
   - **Hersteller** – Auswahl aus den im Shop angelegten Herstellern; muss exakt mit dem Hersteller der Artikel übereinstimmen
   - **Warengruppe** – eine oder mehrere Warengruppen auswählen (Strg/Cmd + Klick); Tabelle erscheint nur auf Artikeln dieser Warengruppen
   - **Typ** – `Boot` oder `Bindung`
   - **Geschlecht** – `Herren`, `Damen`, `Kinder` oder `Unisex`
3. Tabellengröße eingeben und **Tabelle erstellen** klicken
4. Zellen befüllen und mit **Speichern** sichern

### Demo-Daten

Über die Karte **Demo-Daten laden** am unteren Rand der Übersicht können 30 vordefinierte Tabellen eingefügt werden. Dafür müssen vier Warengruppen angegeben werden:

| Dropdown | Inhalt |
|---|---|
| Schuhe WG 1 | Erste Warengruppe für Snowboard-Schuhe |
| Schuhe WG 2 | Zweite Warengruppe für Snowboard-Schuhe |
| Bindungen WG Herren | Warengruppe für Herren-Bindungen |
| Bindungen WG Damen | Warengruppe für Damen-Bindungen |

Unisex-Bindungen werden automatisch beiden Bindungs-Warengruppen zugewiesen. Bereits vorhandene Einträge werden übersprungen. Über **Demo-Daten löschen** werden alle 30 Einträge wieder entfernt.

---

## Anzeige auf der Produktdetailseite

Das Plugin hängt sich in den Hook `HOOK_ARTIKEL_PAGE` ein. Sobald ein Artikel geladen wird, prüft es:

1. Ist ein Hersteller am Artikel gesetzt?
2. Hat der Artikel eine Warengruppe?
3. Gibt es Größentabellen für diesen Hersteller, die der Warengruppe des Artikels zugewiesen sind?

Treffen alle drei Bedingungen zu, erscheint auf der Produktseite ein Button pro Typ (Schuhe / Bindungen). Ein Klick öffnet das Modal mit der jeweiligen Tabelle.

---

## Übersichtsseite

Die Seite `/groessentabellen` zeigt alle angelegten Tabellen in zwei Bootstrap-Accordions (Schuhgrößen / Bindungsgrößen), je ein aufklappbares Panel pro Hersteller. Bei Bindungen wird ein farbiges Badge (Herren/Damen) angezeigt.

**Verknüpfung im Footer:**
1. JTL-Admin → **Inhalte → Seiten**
2. Seite „Größentabellen" (Linkgruppe: Versteckt) bearbeiten
3. Linkgruppe auf die gewünschte Footer-Gruppe ändern

---

## Kompatibilität

| Plugin-Version | JTL-Shop      |
|----------------|---------------|
| 1.3.5          | 5.2.4 – 5.8.0 |
| 1.3.4          | 5.2.4 – 5.7.0 |

---

## Changelog

### 1.3.5
- Kompatibilität mit JTL-Shop 5.8.0 geprüft (DataModel, GenericModelController, Hook 140, Template-Erweiterung von `productdetails/details.tpl`, Frontend-Link, Migrationen und alle Templates unter Smarty 5.7), MaxShopVersion auf 5.8.0 angehoben

### 1.3.4
- Übersichtsseite `/groessentabellen` als verlinkbare Frontend-Seite hinzugefügt
- Accordion-IDs mit zuverlässigem Zähler statt Smarty `@iteration` auf Key-Variablen

### 1.3.3
- Demo-Seeder: separate Warengruppen-Dropdowns für Herren- und Damen-Bindungen
- Unisex-Bindungen werden automatisch beiden Warengruppen zugewiesen

### 1.3.2
- Mehrere Warengruppen pro Tabelle (kommasepariert, Multi-Select im Backend)
- Backend-Suche nach Name und Hersteller
- Migrations: `kWarengruppe` von INT auf VARCHAR(500) erweitert
- Checkbox-Einstellungen durch Selectbox Y/N ersetzt

### 1.3.1
- Demo-Daten Seeder mit 30 vordefinierten Tabellen (11 Schuh-, 19 Bindungsmarken)
- Demo-Daten löschen Funktion

### 1.3.0
- Warengruppen- und Hersteller-Zuordnung direkt an der Tabelle statt als globale Einstellung
- Hersteller-Dropdown aus Shop-Herstellerliste

### 1.2.3
- Einstellungen von Checkbox auf Selectbox umgestellt (JTL-Bug: Checkboxen können nicht deaktiviert werden)

### 1.2.2
- Warnung für Bindungsangaben hinzugefügt
