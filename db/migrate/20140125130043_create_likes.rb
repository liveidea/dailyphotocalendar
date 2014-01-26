class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :ip

      t.timestamps
    end
  end
end
