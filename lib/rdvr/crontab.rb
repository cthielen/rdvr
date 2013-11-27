# Used by 'whenever' gem to update crontab

# Load supporting code and models
require 'rdvr'

def generate_cronjob(show)
  cron_timestamp = "#{show.start.min} #{show.start.hour} * * #{show.dotw}"

  command = "rdvr-record #{show.id}"
  [cron_timestamp, command]
end

Show.all.each do |s|
  cron_info = generate_cronjob(s)
  every cron_info[0] do
    command cron_info[1]
  end
end

