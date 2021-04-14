class CreateJoinTableCourseTopic < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :topics do |t|
      # t.index [:course_id, :topic_id]
      # t.index [:topic_id, :course_id]
    end
  end
end
