class RemoveProvableToFacts < ActiveRecord::Migration[5.1]
  def change
    remove_column :facts, :provable, :boolean
  end
end
