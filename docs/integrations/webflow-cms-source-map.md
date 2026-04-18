# Webflow CMS Source Map

Date: 2026-04-18

This project's CMS story content is currently accessible through Webflow MCP tools, not through SharePoint paths like Library/Webflow.

## Confirmed Webflow Collections

- Article Types (id: 699e12d16ef041f10a195348)
- Interviews (id: 699e12d16ef041f10a19536e)
- Files (id: 699e12d16ef041f10a19538e)
- Photos (id: 699e12d16ef041f10a1953ae)
- Authors (id: 699e12d16ef041f10a1953f3)
- Membership Tiers (id: 699e12d16ef041f10a195409)
- Sections (id: 699e12d16ef041f10a19541b)
- Blog Items (id: 699e12d16ef041f10a195425)
- Member Benefits (id: 699e12d16ef041f10a195426)
- Latest News (id: 699e12d16ef041f10a195427)
- Tags (id: 699e12d16ef041f10a195428)
- Categories (id: 699e12d16ef041f10a195429)
- Article Items (id: 69c074623c1904ef5e35c334)
- Website Postions (id: 69c07927b9c7fa2b14d96467)
- Featured Cards (id: 69dddb6c71efa71bfaa7ef0b)
- Featured Sections (id: 69dddcb72958ff72a26ed9c6)

## Story-Bearing Collections (Priority)

P1:
- Blog Items (20 items)
- Article Items (4 items)

P2:
- Latest News (1 item)
- Featured Cards (1 item)

P3:
- Interviews (0 items currently)

## Commands

List collections:

```bash
scripts/mcp-quick.sh webflow | jq -r '.result.content[0].text'
```

List items in a collection:

```bash
scripts/mcp-quick.sh webflow-items 699e12d16ef041f10a195425 | jq -r '.result.content[0].text'
```

## Saved Retrieval Artifacts

- data/working/webflow/collections.json
- data/working/webflow/items/blog-items.json
- data/working/webflow/items/article-items.json
- data/working/webflow/items/latest-news.json
- data/working/webflow/items/featured-cards.json
- data/working/webflow/items/interviews.json
