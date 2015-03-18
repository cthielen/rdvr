#!/usr/bin/env ruby

require 'rdvr'
require 'mechanize'
require 'open-uri'
# require 'taglib'

show = Show.find_or_create_by_title('The Mystery Lesson')

show.artist = "Daniel Spicer"
show.description = "The Mystery Lesson is a radio show presented by Daniel Spicer. It specialises in avant-garde improvised music including free-jazz, Improv, Noise and underground sounds."
show.genre = "Improvision"
show.weekly = nil
show.duration = nil
show.save

agent = Mechanize.new
page = agent.get("http://mysterylesson.posthaven.com/")
existing_files = show.recordings.map{|r| r.filename}

(page/"div#main article.post a.posthaven-file-download").each_with_index do |episode, i|
  link = episode.attributes['href']
  filename = link.to_s[link.to_s.rindex('/')+1..link.to_s.length]
  if existing_files.include? filename
    #puts "Skipping #{filename}, already downloaded."
  else
    #print "Downloading #{filename} ..."
    
    open(link) do |f|
      open("#{ENV['RDVR_RECORDINGS_DIR']}/#{filename}", "wb") { |mp3| mp3.write f.read }
    end
    
    #print " done.\n"
    
    r = Recording.new
    r.show = show
    r.started = Time.now
    # TagLib::FileRef.open("#{ENV['RDVR_RECORDINGS_DIR']}/#{filename}") do |fileref|
    #   properties = fileref.audio_properties
    #   puts properties.length
    # end
    r.title = filename
    r.finished = nil
    r.filename = filename
    r.save
  end
end
