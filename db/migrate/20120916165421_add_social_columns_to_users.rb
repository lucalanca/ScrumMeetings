class AddSocialColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :facebook_uid	, :string
  	add_column :users, :facebook_token	, :string
  	add_column :users, :twitter_uid		, :string
  	add_column :users, :twitter_token	, :string
  	add_column :users, :github_uid		, :string
  	add_column :users, :github_token	, :string
  end
end
