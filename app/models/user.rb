class User < Sequel::Model(:users)
  one_to_many :band_memberships
  many_to_many :bands, join_table: :band_memberships

  one_to_many :notes, key: :author_id
  one_to_many :events, key: :creator_id
  one_to_many :calendar_accounts
  one_to_many :activity_events, key: :actor_id

  one_to_many :event_attendances, class: :EventAttendee
  many_to_many :attending_events, class: :Event, join_table: :event_attendees
end
