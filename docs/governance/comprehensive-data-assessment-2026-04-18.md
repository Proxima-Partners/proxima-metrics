# Comprehensive Data Assessment (2026-04-18)

Purpose: provide a full-pass assessment of all currently available project data across local sources, SharePoint-indexed files, and Webflow CMS content.

Scope baseline:
- Workspace files in this repository
- SharePoint-indexed corpus visible via MCP `list_sharepoint_files`
- Webflow CMS collections and item detail payloads visible via MCP Webflow tools

## 1) Corpus Inventory

### 1.1 Local source corpus (project data/source)

- Journal source files:
  - `data/source/Journal-2026.json` with 29 entries
  - `data/source/Writing-Journal.json` with 7 entries
- Mission/strategy sources:
  - `data/source/primary-source-for-mission.md`
  - `data/source/proxima-2025-annual-report.md`
  - `data/source/values-proxima-partners.md`

Total primary-entry count from journals: 36 entries.

### 1.2 SharePoint-indexed corpus (via MCP local mode)

- Total listed files: 88
- Top-level distribution:
  - Brand Assets: 25
  - Grants: 19
  - Images: 15
  - Library: 13
  - Templates-Virtuous: 6
  - Organization Docs: 6
  - Highest_Search_Priority: 2
  - MCP Server: 1
  - Applications: 1

Library subfolder distribution:
- ViewSpark_communication: 5
- Zoom_communication: 3
- Email_communication: 2
- Meeting_transcripts: 1
- connector-test/mcp-test files: 2

### 1.3 SharePoint extract corpus (processed)

Extracted text files currently ingested for mapping: 8
- Email communications (KD, ME)
- Meeting transcript (Basecamp 2026-04-17)
- Zoom updates (2)
- ViewSpark communication (1)
- Lilly narrative sections (2)

### 1.4 Webflow CMS corpus (via MCP)

Collections discovered: 16
Story-bearing collections assessed:
- Blog Items: 20
- Article Items: 4
- Latest News: 1
- Featured Cards: 1

Total detailed Webflow items retrieved and assessed: 26
- 20 blog
- 4 article
- 1 news
- 1 featured

Member-only distribution in assessed Webflow items:
- Member-only true: 9
- Non-member-only or unspecified: 17

## 2) Thematic Signal Comparison

Keyword-signal counts were computed over:
- SharePoint extracts text corpus
- Webflow item-detail text corpus

### 2.1 SharePoint extract signals

- coach: 40
- coaching: 38
- listen/listening: 13 combined
- discern: 9
- prayer: 16
- testimony: 11
- community: 29
- relationship: 12
- gospel: 9
- jesus: 6
- kingdom: 4
- trust: 8
- love: 13
- city: 24
- san francisco: 27

Interpretation:
- SharePoint extract set is strongly coaching/process/prayer oriented.
- Explicit operational coaching language is dominant.

### 2.2 Webflow item-detail signals

- listen/listening: 16 combined
- discern: 1
- testimony: 2
- community: 13
- relationship: 20
- gospel: 4
- jesus: 72
- kingdom: 10
- trust: 8
- surrender: 2
- process: 4
- love: 103
- city: 56
- san francisco: 45

Interpretation:
- Webflow corpus is theology-and-witness narrative heavy, with strong Jesus/love/city framing.
- Explicit coaching terms are much lower than in SharePoint extracts, suggesting channel specialization:
  - SharePoint communication sources: coaching operation and updates
  - Webflow publication sources: theological formation and public witness framing

## 3) Framework Coverage Assessment

Coverage source:
- `docs/governance/sharepoint-story-intake-and-mapping.md`

### 3.1 Activity unit coverage (A1-A15)

Observed in mapping:
- A1 through A15 are explicitly covered in the current mapping.

Assessment:
- 15/15 activity units now have explicit evidence coverage after gap-closure pass.

### 3.2 Marker coverage (M1-M11, J1-J6)

Observed M-marker coverage:
- All M1-M11 appear in current mapping (broad coverage achieved).

Observed J-marker coverage:
- Present: J1, J2, J3, J4, J5, J6

Assessment:
- Marker framework coverage is complete in current evidence mapping.

### 3.3 Values overlay coverage (SF + ORG)

Values source:
- `data/source/values-proxima-partners.md`

Assessment status:
- A formal values-overlay model has been incorporated into `docs/governance/sharepoint-story-intake-and-mapping.md`.
- Mapping now requires value tags on each source item (minimum 1 San Francisco value + 1 organization-wide value).
- Values language was re-checked against `docs/governance/theological-convictions.md` and no contradiction flags were identified.

## 4) Data Quality and Access Notes

1. Probing `Library/CMS`, `Library/Stories`, `Library/Webflow`, and `Library/Content` returns not found because those folders are not present in the indexed SharePoint tree.
2. Webflow CMS content is correctly accessed via Webflow MCP tools, not SharePoint folder paths.
3. Current connector mode is local-index style for SharePoint listing (OneDrive mirror path), with valid document retrieval and extraction.
4. Extracted corpora are now persisted locally for reproducibility:
- `data/working/sharepoint-extracts/`
- `data/working/webflow/item-details/`
- `data/working/webflow/item-metadata.csv`

## 5) Comprehensive Assessment Conclusion

The available data corpus is now substantial and multi-channel:
- Journals + mission/report anchors
- Values orientation source (SF driving values + organization-wide orientations)
- SharePoint communication/transcript/program materials
- Webflow public theological and narrative publications

Readiness judgment for next stage (metric development):
- Qualitative theology/practice evidence: strong
- Story and narrative breadth: strong
- Coaching/operations evidence: strong
- Explicit gap closure needed for full framework saturation: low

Overall status: comprehensive pass completed on currently accessible data.

### 5.1 Scorecard linkage update

- The qualitative scorecard baseline in [docs/governance/qualitative-metrics-scorecard-baseline-2026-04-18.md](docs/governance/qualitative-metrics-scorecard-baseline-2026-04-18.md) now references the expanded assessed corpus.
- Baseline reference pool used for confidence review: 34 unique references (8 SharePoint extracts + 26 Webflow items).
- S1-S8 and G1-G3 remain exemplar anchor rows for metric traceability.

## 6) Highest-Value Next Pass

1. Apply 0-8 scoring rubric per source item (not just per source cluster) to create a scored evidence ledger.
2. Backfill explicit value tags for every S1-S8 and G1-G3 entry so the new values-overlay rule is fully enforced at row level.
3. Promote top-scoring exemplars into `docs/governance/tangible-activities-from-convictions.md` as formal activity evidence entries.
4. Expand extraction to remaining unpulled P1/P2 sources for broader redundancy and longitudinal trend reliability.
