class RehearsalLog < Sequel::Model(:rehearsal_logs)
  many_to_one :band
  many_to_one :note
end
