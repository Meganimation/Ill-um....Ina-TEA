class CreateRecievers < ActiveRecord::Migration[5.2]
  def change
    create_table :recievers do |t|
      t.string :name
      t.string :email
      # t.string :image
      t.bigint :facebook_id

      t.timestamps
    end
  end
end
