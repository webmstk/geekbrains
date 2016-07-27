class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :progress,  default: 0
      t.string  :content
      t.boolean :completed, default: false
      t.boolean :context,   default: false

      t.timestamps
    end
  end
end
