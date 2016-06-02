set :output, "#{path}/log/cron.log"

every 1.day, at: '08:00 am' do
  rake 'send_alerts'
end
