class RemoveQuestionIdFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :question_id, :integer
  end
end
