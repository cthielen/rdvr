require "rdvr/version"

Bundler.require(:default)

# Ensure rdvr data directory exists
`mkdir ~/.rdvr >& /dev/null`

# Load supporting code and models
require "rdvr/database"
require "rdvr/models/recording"
require "rdvr/models/show"
require "rdvr/which.rb"
require "rdvr/schema.rb"

module Rdvr
  # Ensures the necessary command-line tools are installed
  def self.check_requirements
    # Certain environment variables must be defined for configuration to work correctly
    if ENV['RDVR_RECORDINGS_DIR'].nil?
      puts "You must define the environment variable RDVR_RECORDINGS_DIR to point to"
      puts "a valid directory in order to store recordings."
      return false
    end
    
    unless File.directory?(ENV['RDVR_RECORDINGS_DIR'])
      puts "You have defined RDVR_RECORDINGS_DIR but the directory either doesn't exist"
      puts "or is not accessible."
      return false
    end
    
    if ENV['RDVR_RECORDINGS_DIR_URL'].nil?
      puts "You must define the environment variable RDVR_RECORDINGS_DIR_URL as"
      puts "the HTTP-accessible location of RDVR_RECORDINGS_DIR."
      return false
    end
    
    # fIcy is used to rip the stream
    if which('fIcy') == nil
      puts "You do not appear to have fIcy installed. Please correct this."
      puts "A copy of fIcy is located in the tools/ directory of this script's source distribution."
      return false
    end
    # fResync is recommended by fIcy before tagging
    if which('fResync') == nil
      puts "You do not appear to have fResync installed. Please correct this."
      puts "A copy of fResync (included with fIcy) is located in the tools/ directory of this script's source distribution."
      return false
    end
    # id3tool is used to tag the MP3s
    if which('id3tool') == nil
      puts "You do not appear to have id3tool installed. Please correct this."
      puts "A copy of id3tool is located in the tools/ directory of this script's source distribution."
      return false
    end
    
    return true
  end
  
  abort unless check_requirements
end
