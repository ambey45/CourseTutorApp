class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.integer :course_id
      t.string :name

      t.timestamps
    end
  end
end
