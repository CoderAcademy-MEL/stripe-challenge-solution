class CreateUserCourseJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :courses do |t|
      t.index :user_id
      t.index :course_id
    end
  end
end
