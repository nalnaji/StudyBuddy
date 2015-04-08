class AddLastVisitedChatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_visited_chat, :integer
  end
end
