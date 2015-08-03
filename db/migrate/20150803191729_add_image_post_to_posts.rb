class AddImagePostToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :imagepost, :string
  end
end
