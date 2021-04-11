class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.integer :lesson_number
      t.string :title
      t.string :description
      t.string :video_url

      t.timestamps
    end
  end
end
