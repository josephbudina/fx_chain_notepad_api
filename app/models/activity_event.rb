class ActivityEvent < Sequel::Model(:band_memberships)
  many_to_one :band
  many_to_one :actor, class: :User, key: :actor_id
end
