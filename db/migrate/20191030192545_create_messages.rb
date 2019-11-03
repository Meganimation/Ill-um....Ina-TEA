class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.belongs_to :sender, foreign_key: true
      t.belongs_to :reciever, foreign_key: true


      t.timestamps
    end
  end
end
