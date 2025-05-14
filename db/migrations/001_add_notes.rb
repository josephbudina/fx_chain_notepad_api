Sequel.migration do
  def up
    create_table(:users) do
      primary_key :id
      String :name
    end
  end

  def down
    drop_table(:users)
  end
end
