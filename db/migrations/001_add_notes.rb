Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :name
    end

    create_table(:notes) do
      primary_key :id
      String :title
      Text :body
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:users)
    drop_table(:notes)
  end
end
