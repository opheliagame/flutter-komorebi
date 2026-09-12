# User Stories

## Product principles

These stories are written around the core idea that Kiritori is not a traditional notes app. It is a local, personal knowledge garden where notes, collections, and connections are all first-class. The user should feel like they are shaping a growing forest of thoughts rather than filing away static documents.

1. Notes are created in context, not in isolation.
2. Connections are as important as content.
3. The system should support easy reorganisation without friction.
4. Exploration should feel playful, calm, and serendipitous.
5. Privacy and offline usage are non-negotiable.

## Primary user types

### The collector

A user who imports ideas, quotes, articles, and images and wants to sort them into a meaningful structure.

### The thinker

A user who builds conceptual links between ideas, revisiting them later to see patterns and themes emerge.

### The explorer

A user who wants to roam through their existing knowledge, discover unexpected connections, and reframe their thinking.

## Core user stories

## 1. Create a note in context

### Story 1: Create a note only through a meaningful connection

As a thinker, I want to create a new note while deciding how it relates to the existing forest, so that my ideas are grounded in context instead of becoming disconnected fragments.

Acceptance criteria:

- A user can create a note only from an existing connection, a new connection, or a suggested connection.
- The UI makes the connection choice explicit before note content is saved.
- A note cannot be created as an orphan without being associated with at least one collection or connection.
- If a user has no connections yet, they are prompted to create one before continuing.

### Story 2: Capture quick thoughts without breaking flow

As a user, I want to capture a new idea quickly, so that I can preserve a moment of insight without losing momentum.

Acceptance criteria:

- A lightweight capture flow exists for short notes, snippets, and image references.
- The user can save a capture with minimal friction.
- The system prompts the user to attach the note to a relevant connection or collection.
- Saved captures remain searchable and editable later.

### Story 3: Add multiple kinds of content

As a user, I want to record text, images, and references in the same note experience, so that my thinking can remain multimodal and expressive.

Acceptance criteria:

- Notes can include text, images, and citations or references.
- Media attachments are stored locally and remain associated with the note.
- The user can review a note without losing context from attached resources.

## 2. Organise notes and collections

### Story 4: Review imported notes before they are placed

As a collector, I want to review notes that are imported but not yet assigned to a collection, so that I can sort and understand them before they become part of the forest.

Acceptance criteria:

- Imported notes appear in an unassigned or “waiting to be organised” area.
- The user can inspect a note before deciding its collection or connection.
- Bulk editing is available for assigning multiple notes to collections.
- The user can filter notes by unassigned, collection, connection, or media type.

### Story 5: Reorganise existing notes with low effort

As a user, I want to move notes between collections and connections easily, so that my system stays adaptable as my thinking changes.

Acceptance criteria:

- The user can edit a note’s collections or connections from a simple editor panel.
- Drag-and-drop or quick action controls are available for common reorganising tasks.
- The system updates related views immediately after a change.
- The user can undo or revert a collection move without losing note content.

### Story 6: Maintain a clear overview of the library

As a user, I want to see my notes and collections at different levels of granularity, so that I can switch between detailed review and a broader overview.

Acceptance criteria:

- The interface supports zooming or semantic scaling between overview and detail.
- Notes can be grouped by collection, connection, date, media type, or tag-like metadata.
- Dense layout modes are available for power users without sacrificing readability.

## 3. Explore and discover connections

### Story 7: Discover unexpected relationships

As an explorer, I want to browse the structure of my notes and see connections between them, so that I can uncover patterns I would not have found by reading each note in isolation.

Acceptance criteria:

- The user can view a visual or list-based relationship map for notes and collections.
- Related notes appear when exploring a connection or subject.
- Recommended connections can be surfaced based on shared metadata or proximity.
- The user can open a connection trail to follow a chain of thought.

### Story 8: Use roaming mode to browse serendipitously

As a user, I want a lightweight roaming mode that surfaces neighbouring ideas, so that I can explore my knowledge without needing a rigid plan.

Acceptance criteria:

- Roaming mode presents a small set of neighbouring notes or connections.
- The user can move between related items without losing context.
- Suggested items are based on existing notes, collections, and connection density.
- Exploration remains calming and non-disruptive rather than overloaded or chaotic.

### Story 9: Follow trails of thought

As a thinker, I want to trace the path between ideas, so that I can understand how one concept leads to another over time.

Acceptance criteria:

- The interface shows a trail or chain from one note to the next.
- Users can inspect why items are connected.
- A trail can be expanded or collapsed depending on the user’s focus level.
- Users can save a trail as a useful exploration path for later review.

## 4. Manage collections, metadata, and references

### Story 10: Build meaningful collections

As a user, I want to create and adjust collections that reflect how I think, so that my notes live in structures that fit my mental model rather than a generic taxonomy.

Acceptance criteria:

- The user can create, rename, and delete collections.
- Collections can be assigned multiple notes without forcing a strict hierarchy.
- Notes may belong to more than one collection when appropriate.
- The system preserves the relationship even as collections are renamed or reorganised.

### Story 11: Maintain bibliographic and citation context

As a researcher, I want to store references and citations locally, so that reading and writing remain grounded in source material without needing external services.

Acceptance criteria:

- Notes can include source metadata such as title, authors, date, and notes.
- Citations or references can be attached to relevant thoughts or collections.
- Users can export reference data when needed.
- The app does not require online access to manage local citation records.

### Story 12: Create “doors” between concepts

As a user, I want to create explicit doors or connections between notes and ideas, so that the system captures my reasoning as a web, not just a stack of files.

Acceptance criteria:

- A user can create a connection between two or more notes or collections.
- Each connection can have a description or reason for existing.
- Connections are visible in both the source and destination contexts.
- The user can later edit or remove a connection without deleting the underlying notes.

## 5. Keep knowledge private and local-first

### Story 13: Trust the app with personal knowledge

As a user, I want all behaviour to stay local and private, so that my notes and thought patterns are not exposed to a cloud service or tracking system.

Acceptance criteria:

- The app works without account creation or remote sync.
- No telemetry or user-data collection is required for basic functionality.
- Data remains stored locally on the device by default.
- Users understand that their knowledge is theirs alone.

### Story 14: Use the app offline

As a user, I want to capture and browse my knowledge even without internet connectivity, so that the app feels reliable in everyday life.

Acceptance criteria:

- The app functions fully without an internet connection.
- Imports, edits, and browsing continue while offline.
- Local data remains available and consistent after reconnecting.
- No feature becomes unusable or degraded due to lack of connectivity.

## 6. Improve confidence, quality, and revisit flow

### Story 15: Revisit old notes with context

As a user, I want to reopen older notes and understand their place in the network, so that my past thinking remains useful instead of becoming forgotten clutter.

Acceptance criteria:

- Notes retain their collections, connections, and metadata over time.
- The user can see a note’s relationship to surrounding ideas.
- A note view includes history or context cues such as date, related items, and collections.
- Old notes remain easy to revisit and reframe.

### Story 16: Clean up and refine the forest

As a user, I want to identify notes that are stale, disconnected, or duplicated, so that I can keep my knowledge base useful and coherent.

Acceptance criteria:

- The user can review notes that are disconnected from any collection or connection.
- Duplicate or near-duplicate notes can be flagged or reconciled.
- Cleanup tools suggest weakly connected or orphaned notes.
- The user remains in control of final edits and deletions.

## 7. Experience and interface expectations

### Story 17: Feel calm while working with information

As a user, I want the app to feel calm, tactile, and non-intrusive, so that my thinking remains comfortable rather than overwhelmed by too much UI chrome.

Acceptance criteria:

- The interface supports atmospheric modes such as day, twilight, and night.
- There is strong information density without visual clutter.
- Animations are subtle and purposeful rather than distracting.
- The layout remains readable for long reading and thinking sessions.

### Story 18: Build trust through a clear mental model

As a user, I want the app to make its structure understandable at a glance, so that I can learn quickly and feel confident using it.

Acceptance criteria:

- The visual language communicates notes, collections, and connections clearly.
- Core actions are discoverable without reading extensive help.
- Users can understand their “forest” structure after a short session.
- The system supports both quick capture and deep exploration without requiring different tools.

## Design principle carried forward

The strongest product direction remains:

- A note is not just a place to write; it is a node in a network.
- A collection is not just a folder; it is a living area of relevance.
- A connection is not a metadata field; it is an active relationship that shapes discovery.

This principle should continue to guide future stories, feature work, and UI decisions.

## Open product question to keep in mind

Should note creation always require an explicit connection, or should there be a deliberate exception for quick captures that are later attached to the forest? This decision affects the balance between frictionless capture and the principle that ideas should be grounded in context.
