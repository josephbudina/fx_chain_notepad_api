class Invite < Sequel::Model(:invites)
  many_to_one :band
end
