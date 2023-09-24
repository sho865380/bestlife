class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.date :date
      t.date :datetime
      t.float :target_weight
      t.string :target_body_percentage
      t.string :target_mascle_mass
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
