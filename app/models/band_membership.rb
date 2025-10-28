class BandMembership < Sequel::Model(:band_memberships)
  many_to_one :band
  many_to_one :user
end
