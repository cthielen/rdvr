class ShowsService
  # Returns a string containing an up-to-date crontab based on the Show objects in the database
  def crontab
    crontab_str = "### RDVR BEGIN ###\n"

    Show.all.each do |show|
      if show.weekly
        cron_timestamp = "#{show.start.min} #{show.start.hour} * * #{show.start.wday}"
        filename = "#{show.artist} - #{show.title} (#{Time.now.strftime('%A %B %d, %Y')}).mp3"
        record_command = "#{which('fIcy')} -M #{show.duration}m -o \"/tmp/#{filename}\" -d #{show.host} #{show.port} #{show.url}"
        crontab_str += "#{cron_timestamp} #{record_command} # record '#{show.title}'\n"
      else
        raise "Non-weekly shows are not (currently) supported."
      end
    end

    crontab_str += "###  RDVR END  ###\n"

    return crontab_str
  end
end

