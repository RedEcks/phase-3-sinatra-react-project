class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, :default => false
      t.references :category
    end
  end
end
