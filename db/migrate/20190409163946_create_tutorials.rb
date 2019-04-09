class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name, default: ''
      t.string :author, null:false
      t.string :subject, null:false
      t.timestamps :created_at, null: false, :default => Time.now
    end
  end
end
