class CreateFacts < ActiveRecord::Migration[5.1]
  def change
    create_table :facts do |t|
      t.string :title
      t.string :description
      t.boolean :real, default:true
      t.boolean :provable, default: false
      t.string :color

      t.timestamps
    end
  end
end
