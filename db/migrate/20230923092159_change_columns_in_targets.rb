class ChangeColumnsInTargets < ActiveRecord::Migration[6.0]
  def change
    change_column :targets, :target_body_percentage, 'float USING CAST(target_body_percentage AS float)'
    change_column :targets, :target_mascle_mass, 'float USING CAST(target_mascle_mass AS float)'
  end
end
