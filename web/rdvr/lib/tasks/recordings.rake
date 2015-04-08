namespace :recordings do
  desc "Begins any needed recordings. Designed to be run once a minute."
  task run: :environment do
    # For each show, calculate all possible recordings that start in +- 60 seconds.
    # Then, determine if a recording has been made or is in progress for that recording,
    # if not, start one.

    Show.all.each do |show|
        # Calculate when the next recording should be
        next_occurence = nil

        if Time.now.utc < show.start
          # The show has never been recorded and is scheduled to start in the future.
          next_occurence = show.start
        elsif show.weekly
          # The show's start date is in the past. If weekly, determine the next occurence.
          next_occurence = show.start + 1.week
          loop do
            break if Time.now.utc < next_occurence
          end
        end

        if next_occurence
          puts "Next occurence of #{show.title} is #{next_occurence}"
        else
          puts "No future occurences of #{show.title} are scheduled"
        end

        # TODO: This logic only catches the start time of a show. If a start time is missed
        #       it will not start recording, e.g. a server reboot causes this task to miss the
        #       first two minutes of a three hour show. It should begin recording nonetheless in
        #       that scenario but currently does not.
        now = Time.now.utc
        if ((now + 60) > next_occurence) and ((now - 60) < next_occurence)
          # It is time to begin a recording. First check to see if one is in progress, else start it.
          if(Recording.where("show_id = ? and created_at < ? and created_at > ?", show.id, Time.now.utc, Time.now.utc - 60).length == 0)
            # No recording for this show began in the last minute. Start one.
            puts "Need to start a recording ..."
            r = Recording.new
            r.save
          else
            # A recording for this show began in the last minute. Do nothing.
            puts "A recording is already running."
          end
        else
          # It is not time to begin a recording.
          puts "Will not begin a recording. Show is not for another #{(next_occurence - now) / 3600 / 24} day(s)."
        end
    end
  end

end
