class CreateUserfids < ActiveRecord::Migration
  def change
    create_table :userfids do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :userfids, :slug, unique: true
  end
end
