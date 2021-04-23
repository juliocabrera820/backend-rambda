class RemoveLessonNumberFromLessons < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :lesson_number, :integer
  end
end
