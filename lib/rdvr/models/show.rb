class Show < ActiveRecord::Base
  has_many :recordings, :dependent => :destroy
  
  def print_info
    puts "\tTitle      : '#{self.title}'"
    puts "\tArtist     : '#{self.artist}'"
    puts "\tDescription: '#{self.description}'"
    puts "\tGenre      : '#{self.genre}'"
    puts "\tWeekly?    : '#{self.weekly}'"
    puts "\tStart      : '#{self.start}'"
    puts "\tDuration   : '#{self.duration}'"
    puts "\tHost       : '#{self.host}'"
    puts "\tPort       : '#{self.port}'"
    puts "\tURL        : '#{self.url}'"
  end
end
