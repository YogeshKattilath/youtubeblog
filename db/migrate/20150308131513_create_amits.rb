class CreateAmits < ActiveRecord::Migration
  def change
    create_table :amits do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
