class AddLastPollTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_buddy_poll_time, :integer
  end
end
