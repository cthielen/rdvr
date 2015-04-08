# Ensure required recording tools are installed
load 'which.rb'

# Check for fIcy
unless which('fIcy')
  STDERR.puts "Cannot start RDVR: fIcy does not appear to be installed. See README."
  exit(-1)
end

# Check for id3tool
unless which('id3tool')
  STDERR.puts "Cannot start RDVR: id3tool does not appear to be installed. See README."
  exit(-1)
end

