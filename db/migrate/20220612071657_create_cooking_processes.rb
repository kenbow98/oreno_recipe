class CreateCookingProcesses < ActiveRecord::Migration[6.1]
  def change
    create_table :cooking_processes do |t|

      t.integer :recipe_id,   null: false
      t.text    :process,     null: false
      t.timestamps
    end
  end
end
