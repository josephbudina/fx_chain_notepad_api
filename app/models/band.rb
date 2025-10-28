class Band < Sequel::Model(:bands)
  many_to_one :owner, class: :User, key: :owner_id
  one_to_many :band_memberships
  many_to_many :members, class: :User, join_table: :band_memberships

  one_to_many :notes
  one_to_many :rehearsal_logs
  one_to_many :events
  one_to_many :activity_events
end
