class CalendarAccount < Sequel::Model(:calendar_accounts)
  many_to_one :user
end
