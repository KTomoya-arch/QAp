class RemoveContentIdFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :content_id, :integer
  end
end
