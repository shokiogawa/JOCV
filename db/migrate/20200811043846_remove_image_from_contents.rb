class RemoveImageFromContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contents, :image, :string
  end
end
