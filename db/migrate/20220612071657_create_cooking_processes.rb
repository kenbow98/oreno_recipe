class CreateCookingProcesses < ActiveRecord::Migration[6.1]
  def change
    create_table :cooking_processes do |t|

      t.timestamps
    end
  end
end
