class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.date :start_from
      t.date :leave_on
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
