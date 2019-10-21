class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.string :name
      t.integer :intensity
    end
  end
end
