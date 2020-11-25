class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :description
      t.date :date_start
      t.date :date_end
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
