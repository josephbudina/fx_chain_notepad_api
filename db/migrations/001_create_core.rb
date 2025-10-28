Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :email, null: false, unique: true
      String :name, null: false
      String :password_digest, null: false
      String :avatar_url
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index :email, unique: true
    end

    create_table(:bands) do
      primary_key :id
      String :name, null: false
      Integer :owner_id, null: false
      foreign_key [:owner_id], :users, key: :id, on_delete: :cascade
      jsonb :settings, null: false, default: Sequel.pg_jsonb({})
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end

    create_table(:band_memberships) do
      primary_key :id
      foreign_key :band_id, :bands, on_delete: :cascade
      foreign_key :user_id, :users, on_delete: :cascade
      String :role, null: false, default: "member"
      unique [:band_id, :user_id]
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end

    create_table(:notes) do
      primary_key :id
      foreign_key :band_id, :bands, on_delete: :cascade
      foreign_key :author_id, :users, on_delete: :set_null
      String :title, null: false
      text :body
      text :plaintext
      String :tags, null: false, default: ""
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index :band_id
      index :author_id
    end

    create_table(:attachments) do
      primary_key :id
      foreign_key :note_id, :notes, on_delete: :cascade
      String :kind, null: false #photo|audio file
      String :filename, null: false
      String :content_type, null: false
      Integer :size_bytes
      String :s3_key, null: false
      Integer :duration_ms
      jsonb :meta, null: false, default: Sequel.pg_jsonb({})
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index :note_id
    end

    create_table(:rehearsal_logs) do
      primary_key :id
      foreign_key :band_id, :bands, on_delete: :cascade
      Date :date, null: false
      String :location
      text :goals
      text :outcomes
      foreign_key :note_id, :notes, on_delete: :set_null
      jsonb :attendees, null: false, default: Sequel.pg_jsonb([])
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end

	  create_table(:events) do
      primary_key :id
      foreign_key :band_id, :bands, on_delete: :cascade
      foreign_key :creator_id, :users, on_delete: :set_null
      String :title, null: false
      text :description
      DateTime :starts_at, null: false
      DateTime :ends_at, null: false
      String :timezone, null: false, default: "America/Los_Angeles"
      String :location
      String :rrule # null unless recurring
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index :band_id
      index :starts_at
    end

    create_table(:event_attendees) do
      primary_key :id
      foreign_key :event_id, :events, on_delete: :cascade
      foreign_key :user_id, :users, on_delete: :cascade
      String :status, null: false, default: "invited" # invited|accepted|declined
      String :calendar_push_status, null: false, default: "pending" # pending|pushed|failed
      String :external_event_id # per-user event id in their calendar
      unique [:event_id, :user_id]
    end

    create_table(:calendar_accounts) do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade
      String :provider, null: false # apple_local|google|microsoft
      text :access_token # nullable for apple_local (iOS EventKit local write)
      text :refresh_token
      DateTime :expires_at
      jsonb :scopes, null: false, default: Sequel.pg_jsonb([])
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index [:user_id, :provider], unique: true
    end

    create_table(:activity_events) do
      primary_key :id
      foreign_key :band_id, :bands, on_delete: :cascade
      foreign_key :actor_id, :users, on_delete: :set_null
      String :kind, null: false # note_created, comment, attachment_added, event_created, event_updated
      Integer :subject_id # note_id or event_id
      String :subject_type # Note|Event
      jsonb :data, null: false, default: Sequel.pg_jsonb({})
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      index :band_id
    end

    create_table(:invites) do
      primary_key :id
      foreign_key :band_id, :bands, on_delete: :cascade
      String :email, null: false
      String :role, null: false, default: "member"
      String :token, null: false, unique: true
      DateTime :accepted_at
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
