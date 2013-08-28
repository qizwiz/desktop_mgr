class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :type_id
      t.string :target_key

      t.timestamps
    end
  end
end
