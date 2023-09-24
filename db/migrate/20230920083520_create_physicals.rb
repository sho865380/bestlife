class CreatePhysicals < ActiveRecord::Migration[6.0]
  def change
    create_table :physicals do |t|
      t.date :date
      t.integer :weight
      t.integer :body_percentage
      t.integer :mascle_mass
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
