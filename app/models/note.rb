class Note < Sequel::Model(:notes)
  many_to_one :band
  many_to_one :author, class: :User, key: :author_id
  one_to_many :attachments
end
