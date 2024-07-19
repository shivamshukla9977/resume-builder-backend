class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :title
      t.string :organisation
      t.integer :start_year
      t.integer :finish_year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
