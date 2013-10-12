class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.belongs_to :noteable, polymorphic: true
      
      t.timestamps
    end
  end
end
