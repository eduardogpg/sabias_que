class AddCodeToFact < ActiveRecord::Migration[5.1]
  def change
    add_column :facts, :code, :string
  end
end
