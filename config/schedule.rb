# every '0 0 28-31 * *' do
#   runner "SendWeeklyEmailJob.perform_now"
# end

every 1.minute do
  runner "GuestsCleanupJob.perform_later"
end
# every 1.minute do
#   runner "Resque.enqueue(GuestsCleanupJob)"
# end