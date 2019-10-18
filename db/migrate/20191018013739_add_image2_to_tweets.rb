class AddImage2ToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :image2, :text
  end
end
