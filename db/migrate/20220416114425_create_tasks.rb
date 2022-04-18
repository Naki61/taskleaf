class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description

      t.timestamps #created_atやupdated_atといった打刻用のカラムが生成される
    end
  end
end
