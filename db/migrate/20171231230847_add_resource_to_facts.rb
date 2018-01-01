class AddResourceToFacts < ActiveRecord::Migration[5.1]
  def change
    add_column :facts, :resource, :string
  end
end
