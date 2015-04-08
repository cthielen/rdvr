class CronService
  # Updates the crontab for whatever user RDVR is running as.
  # Will remove the lines beginning and ending with the comment
  # sentinels "### RDVR BEGIN ###" ... "###  RDVR END  ###"
  # first if they exist. This allows RDVR to remove its own oudated
  # crontab commands without affecting any of the user's other
  # crontab entries.
  def update_cron

  end
end

