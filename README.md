# fx_chain_notepad_api

## tickets
# 🎸 Band App – Development Roadmap

## 🧱 MVP Phase – Core Backend

### 1. Database Setup
- [x] Create Postgres database (`band_app_dev` / `band_app_test`).
- [x] Add connection file `app/conn.rb` (Sequel connect + `pg_json` extension).
- [x] Run `001_create_core.rb` migration.
- [x] Verify schema integrity using `\dt` and `\d table_name`.

### 2. Models
- [x] Create models for all core tables using `Sequel::Model(:table_name)`:
  - `user.rb`
  - `band.rb`
  - `band_membership.rb`
  - `note.rb`
  - `attachment.rb`
  - `event.rb`
  - `event_attendee.rb`
- [x] Load models via one-liner in app boot (`app.rb`).
- [ ] Confirm associations work in console (e.g., `Band.first.members`).

### 3. Migrations + Tests
- [x] Add transaction-wrapped RSpec setup (`spec_helper.rb`).
- [x] Write migration rollback test (ensure `down` works cleanly).
- [ ] Add minimal seed/test data script (`db/seed.rb`).

### 4. Notes + Attachments
- [ ] Implement endpoints (or CLI methods) for:
  - Create Note
  - Add Attachment (generate pre-signed upload URL)
  - List Notes (band scoped)
  - Fetch single Note with attachments
- [ ] Store uploaded file metadata in `attachments` table.
- [ ] Integrate S3-compatible storage (Cloudflare R2 or local MinIO).

### 5. Bands + Memberships
- [ ] CRUD for Bands.
- [ ] Invite existing users by email (manual add for now).
- [ ] List members in a band.
- [ ] Handle admin vs member roles (enforced in app logic).

### 6. Events
- [ ] CRUD for Events.
- [ ] Add attendees manually (basic many-to-many link).
- [ ] Query upcoming events by band.

### 7. Auth (Basic)
- [ ] Implement registration/login (JWT or session token).
- [ ] Hash passwords (`bcrypt` or `argon2`).
- [ ] Secure endpoints by user session.

---

## 🧩 Optional – Phase 2 Enhancements

### 8. Rehearsal Logs
- [ ] Add `RehearsalLog` model & API.
- [ ] Link to optional Note for attachments.
- [ ] Add `attendees` JSONB (simple presence list).

### 9. Calendar Integration
- [ ] Implement `CalendarAccount` model if doing Google/Microsoft push.
- [ ] Integrate iOS EventKit for local calendar write (mobile side).
- [ ] Add push job per user (background worker).

### 10. Activity Feed
- [ ] Add `ActivityEvent` model & creation hooks (after note/event create).
- [ ] Create endpoint to fetch latest activity by band.

### 11. Invites
- [ ] Implement invite token generation.
- [ ] Add accept/decline endpoints.
- [ ] Email or share invite link (manual for now).

### 12. Search
- [ ] Implement `ILIKE` search on Notes title/body.
- [ ] Later: switch to Postgres full-text search.

### 13. Deployment
- [ ] Deploy API to Render or Railway (free tier).
- [ ] Migrate DB to Neon (free Postgres).
- [ ] Connect R2 or S3 for file storage.
- [ ] Verify ENV vars (`DATABASE_URL`, `R2_KEY`, etc).

### 14. Frontend Prep (Future Phase)
- [ ] Decide on tech: SwiftUI vs web (JS/HTMX/React).
- [ ] Build read-only views first (Notes, Events, Members).
- [ ] Add write operations incrementally.

### 15. Documentation
- [ ] Write `README.md` explaining app purpose & stack.
- [ ] Add ERD diagram (grid version) to `/docs/`.
- [ ] Document API endpoints and relationships.

## erd
erDiagram
  USERS ||--o{ BAND_MEMBERSHIPS : "is member in"
  BANDS ||--o{ BAND_MEMBERSHIPS : "has members"
  USERS ||--o{ BANDS : "owns via owner_id"

  BANDS ||--o{ NOTES : "has"
  USERS ||--o{ NOTES : "authors"
  NOTES ||--o{ ATTACHMENTS : "has"

  BANDS ||--o{ REHEARSAL_LOGS : "has"
  NOTES ||--o| REHEARSAL_LOGS : "optional link"

  BANDS ||--o{ EVENTS : "has"
  USERS ||--o{ EVENTS : "creates"
  EVENTS ||--o{ EVENT_ATTENDEES : "has attendees"
  USERS ||--o{ EVENT_ATTENDEES : "attends"

  USERS ||--o{ CALENDAR_ACCOUNTS : "links calendars"
  BANDS ||--o{ ACTIVITY_EVENTS : "activity"
  USERS ||--o{ ACTIVITY_EVENTS : "acts"
  BANDS ||--o{ INVITES : "sends"

  USERS {
    int id PK
    string email
    string name
    string password_digest
    string avatar_url
    datetime created_at
    datetime updated_at
  }

  BANDS {
    int id PK
    string name
    int owner_id FK
    jsonb settings
    datetime created_at
    datetime updated_at
  }

  BAND_MEMBERSHIPS {
    int id PK
    int band_id FK
    int user_id FK
    string role
    datetime created_at
    UNIQUE (band_id, user_id)
  }

  NOTES {
    int id PK
    int band_id FK
    int author_id FK
    string title
    text body
    text plaintext
    string tags
    datetime created_at
    datetime updated_at
  }

  ATTACHMENTS {
    int id PK
    int note_id FK
    string kind
    string filename
    string content_type
    int size_bytes
    string s3_key
    int duration_ms
    jsonb meta
    datetime created_at
  }

  REHEARSAL_LOGS {
    int id PK
    int band_id FK
    date date
    string location
    text goals
    text outcomes
    int note_id FK
    jsonb attendees
    datetime created_at
  }

  EVENTS {
    int id PK
    int band_id FK
    int creator_id FK
    string title
    text description
    datetime starts_at
    datetime ends_at
    string timezone
    string location
    string rrule
    datetime created_at
    datetime updated_at
  }

  EVENT_ATTENDEES {
    int id PK
    int event_id FK
    int user_id FK
    string status
    string calendar_push_status
    string external_event_id
    UNIQUE (event_id, user_id)
  }

  CALENDAR_ACCOUNTS {
    int id PK
    int user_id FK
    string provider
    text access_token
    text refresh_token
    datetime expires_at
    jsonb scopes
    datetime created_at
    UNIQUE (user_id, provider)
  }

  ACTIVITY_EVENTS {
    int id PK
    int band_id FK
    int actor_id FK
    string kind
    int subject_id
    string subject_type
    jsonb data
    datetime created_at
  }

  INVITES {
    int id PK
    int band_id FK
    string email
    string role
    string token
    datetime accepted_at
    datetime created_at
    UNIQUE (token)
  }
