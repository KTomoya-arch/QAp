class RemoveUserIdFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :user_id, :integer
  end
end
