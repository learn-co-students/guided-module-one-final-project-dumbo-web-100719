class CreatePerson < ActiveRecord::Migrate[5.2]
  def change
    create_table :persons do
      t.string :name
      t.integer :age 
    end
  end
end
