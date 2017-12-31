class CreateFactTags < ActiveRecord::Migration[5.1]
  def change
    create_table :fact_tags do |t|
      t.references :fact, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
