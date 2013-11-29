class Show < ActiveRecord::Base
  has_many :recordings, :dependent => :destroy
end
