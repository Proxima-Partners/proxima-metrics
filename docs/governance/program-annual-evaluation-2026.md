# Program Annual Evaluation (2026)

Purpose: annual evaluation using only the primary indices.

## 1) Primary Indices (Annual)

### Plain-Language Legend

Use this legend first.

- Authentic relationship development: Share of people who showed meaningful relationship-development signals during the year.
- Coaching activity: How many total coaching conversations happened this year?
- Coaching growth: How many people took a meaningful next step in coaching?
- Learning communities launched: How many learning groups actually ran?
- Learning community reach: How many people participated across those sessions?
- Resources published: How many practical resources did we produce this year?
- Resource impact: How many people took a real next step after using those resources?
- City presence: How many meaningful engagement moments happened across the city?
- Follow-through: How consistently did we reconnect with new people within 30 days?

### Coaching (35 points)

P1. Authentic Relationship Development

- Formula: participants showing 3 or more relationship development signals in year / participants with at least 1 relationship development signal in year.
- Signal set: conversation, faith interest, exploration, building trust, deepening faith interest.
- Process note: signals are non-linear and can appear in any order, within one encounter or across multiple years.
- Time note: annual reporting captures what is observed in the year, while longitudinal history should be retained for multi-year development paths.
- Governance note: foundational coaching metric; weighted in annual score.
- Weight: 10

P2. Coaching Conversations (annual total)

- Formula: total distinct coaching conversations during the calendar year.
- Weight: 10

P3. Coaching Level Progression Rate

- Formula: people advancing to next coaching step / people with first coaching contact.
- Weight: 15

### Learning Communities (20 points)

P4. Active Learning Communities

- Formula: number of learning communities run in year.
- Weight: 10

P5. Learning Community Participation

- Formula: total participant attendances across all sessions in year.
- Weight: 10

### Insights and Resources (25 points)

P6. Resource Production Velocity (annual count)

- Formula: number of micro-resources published in year.
- Weight: 12

P7. Resource-to-Engagement Conversion

- Formula: resource consumers who take a next ministry step / total resource consumers.
- Weight: 13

### City Engagement and Continuity (20 points)

P8. City Engagement Touchpoints

- Formula: distinct city engagement events in year.
- Weight: 12

P9. Relationship Continuity (30-day)

- Formula: new contacts with follow-up within 30 days / total new contacts.
- Weight: 8

## 2) Scoring Rules

Scoring model:

- Each metric receives a 0-4 performance score.
- Each metric has a weight.
- Weighted points = (metric score / 4) x weight.
- Final annual score = sum of weighted points (max 100).

Performance bands:

- 90-100: Strong and transferable
- 75-89: Healthy and consistent
- 60-74: Developing
- Below 60: Needs redesign

Rubric (default for all metrics unless adjusted):

- 0: Less than 50% of annual target
- 1: 50% to 69% of annual target
- 2: 70% to 89% of annual target
- 3: 90% to 109% of annual target
- 4: 110%+ of annual target

For rate metrics (percentages), use target attainment as:

- actual rate / target rate

## 3) Annual Evaluation Template

Use one row per metric with this schema:

- metric_id
- metric_name
- annual_target
- annual_actual
- target_attainment_percent
- score_0_to_4
- weight
- weighted_points
- notes

Template rows for 2026:

- P1 | Authentic Relationship Development | target: TBD | weight: 10
- P2 | Coaching Conversations | target: TBD | weight: 10
- P3 | Coaching Level Progression | target: TBD | weight: 15
- P4 | Active Learning Communities | target: 2 | weight: 10
- P5 | Learning Community Participation | target: TBD | weight: 10
- P6 | Resource Production Velocity | target: 15 | weight: 12
- P7 | Resource-to-Engagement Conversion | target: TBD | weight: 13
- P8 | City Engagement Touchpoints | target: TBD | weight: 12
- P9 | Relationship Continuity (30-day) | target: TBD | weight: 8

## 4) Data Fields

Minimum fields to compute the primary indices:

- date
- person_id or contact_id (anonymized if needed)
- interaction_type (coaching, learning_community, resource, city_engagement, follow_up)
- interaction_id
- relationship_signal (conversation, faith_interest, exploration, building_trust, deepening_faith_interest)
- relationship_signal_date
- next_step_flag (Y/N)
- follow_up_date
- resource_id (if applicable)
