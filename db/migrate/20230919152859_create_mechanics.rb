class CreateMechanics < ActiveRecord::Migration[7.0]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
