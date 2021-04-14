class AddProgrammingLanguageToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :programming_language, :string
  end
end
