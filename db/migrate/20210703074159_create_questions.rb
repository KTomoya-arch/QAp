class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :question_id
      t.string :title
      t.text :content
      t.boolean :resolved
      t.integer :user_id

      t.timestamps
    end
  end
end
