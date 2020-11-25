class CreateAsks < ActiveRecord::Migration[6.0]
  def change
    create_table :asks do |t|
      t.string :ask
      t.string :ask_type
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
