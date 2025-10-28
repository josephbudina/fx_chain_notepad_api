class Event < Sequel::Model(:events)
  set_dataset :events

  many_to_one :band
  many_to_one :creator, class: :User, key: :creator_id

  one_to_many :event_attendees
  many_to_many :attendees, class: :User, join_table: :event_attendees
end
