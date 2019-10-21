class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :description
      t.timestamp :date
      t.string :category
    end
  end
end
