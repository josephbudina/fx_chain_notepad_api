App.hash_branch("v1:users") do |r|
  r.id do
    r.get {HTTP.ok(UserSerializer.many(UsersRepo.all)) }
  end

  r.on Integer do |id|
    r.get { row = UsersRepo.find(id) or next Http.not_found
            HTTP.ok(UserSerializer.one(row)) }
  end
end
