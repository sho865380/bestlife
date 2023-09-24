class ChangeColumnsInPhysicals < ActiveRecord::Migration[6.0]
  def change
    change_column :physicals, :weight, 'float USING CAST(weight AS float)'
    change_column :physicals, :body_percentage, 'float USING CAST(body_percentage AS float)'
    change_column :physicals, :mascle_mass, 'float USING CAST(mascle_mass AS float)'
  end
end
