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
- [ ] 
## erd
<img width="1729" height="1108" alt="Screenshot 2025-10-28 at 4 39 12 PM" src="https://github.com/user-attachments/assets/2e4d40fc-c5a2-42d2-8dba-5322430ca3da" />
