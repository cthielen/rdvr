require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{Dir.home}/.rdvr/db.sqlite",
  :wait_timeout => 0.25,
  :timeout => 250
)

unless File.exist?("#{Dir.home}/.rdvr/db.sqlite")
  require File.dirname(__FILE__) + '/schema.rb'
  schema = Schema.new
  schema.create
end
