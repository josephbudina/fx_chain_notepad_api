class EventAttendee < Sequel::Model(:event_attendees)
  many_to_one :event
  many_to_one :user
end
