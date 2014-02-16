class AddAttachmentToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :attachment, :string
  end
end
