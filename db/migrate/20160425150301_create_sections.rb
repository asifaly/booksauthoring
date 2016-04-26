class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :section_no
      t.references :chapter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
