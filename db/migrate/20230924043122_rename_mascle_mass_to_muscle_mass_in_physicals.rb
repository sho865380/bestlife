class RenameMascleMassToMuscleMassInPhysicals < ActiveRecord::Migration[6.0]
  def change
    rename_column :physicals, :mascle_mass, :muscle_mass
  end
end
