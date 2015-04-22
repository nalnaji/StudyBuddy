module KickInactiveUsersJob
  @queue = :my_job_queue
  def self.perform()
    User.all.each do |user|
      if user.last_buddy_poll_time < 2.minutes.ago.to_i then
        user.chats.each do |chat|
          user.chats.delete(chat)
        end
      end
    end
  end
end
