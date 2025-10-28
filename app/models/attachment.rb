class Attachment < Sequel::Model(:attachments)
  many_to_one :note
  many_to_one :band
end
