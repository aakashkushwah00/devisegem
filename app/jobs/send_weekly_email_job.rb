class SendWeeklyEmailJob < ApplicationJob
  queue_as :default

# include Sidekiq::Job

  def perform
    # Do something later

    # users = User.where(receive_weekly_email: true)
    # users.sample(users.count / 2).each do |user|
    #   WeeklyMailer.weekly_email(user).deliver_now
    # end
    puts "hello world...."
  end
end
