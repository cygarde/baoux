class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :date_start
      t.date :date_end
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
