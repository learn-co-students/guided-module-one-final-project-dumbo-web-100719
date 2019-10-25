class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.timestamp
      t.string :category
      t.string :description
    end
  end
end
