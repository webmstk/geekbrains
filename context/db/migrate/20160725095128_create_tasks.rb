class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :progress
      t.string  :content
      t.boolean :completed
      t.boolean :context

      t.timestamps
    end
  end
end
