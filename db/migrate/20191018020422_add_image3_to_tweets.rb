class AddImage3ToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :image3, :text
  end
end
