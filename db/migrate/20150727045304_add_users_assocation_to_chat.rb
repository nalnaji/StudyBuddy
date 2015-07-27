class AddUsersAssocationToChat < ActiveRecord::Migration
  def self.up
    add_column :users, :chat_id, :integere
    add_index 'users', ['chat_id'], :name => 'user_chat_id'
  end

  def self.down
    remove_column :users, :chat_id
  end
end
