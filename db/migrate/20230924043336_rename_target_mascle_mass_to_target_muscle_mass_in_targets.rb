class RenameTargetMascleMassToTargetMuscleMassInTargets < ActiveRecord::Migration[6.0]
  def change
    rename_column :targets, :target_mascle_mass, :target_muscle_mass
  end
end
