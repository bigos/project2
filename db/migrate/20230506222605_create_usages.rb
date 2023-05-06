class CreateUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :usages do |t|
      t.references :word, null: false, foreign_key: true
      t.references :text, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
