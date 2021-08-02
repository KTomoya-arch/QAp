class RemoveResolvedFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :resolved, :boolean
  end
end
