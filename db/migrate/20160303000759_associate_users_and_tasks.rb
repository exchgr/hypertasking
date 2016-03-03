class AssociateUsersAndTasks < ActiveRecord::Migration
  def change
    create_table :users_tasks, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :tasks, index: true
    end
  end
end
