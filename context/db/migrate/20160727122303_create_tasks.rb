class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text       :content,   null: false
      t.integer    :progress,  null: false, default: 0
      t.boolean    :completed,              default: false
      t.boolean    :context,                default: false

      t.references :user
      # t.integer    :user_id,   null: false, index: true

      t.timestamps
    end

    # add_index :tasks, :user_id
  end
end
