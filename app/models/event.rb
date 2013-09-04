class Event
  include MongoMapper::Document
  
  key :location, String, required: true
  key :time, Time, required: true
  key :organizer_name, String, required: true
  key :organizer_email, String, required: true
  
  many :invitations
  
  def time_string=(time_string)
    self.time = Chronic.parse(time_string)
  end
  
  def time_string
    self.time.strftime("%Y-%m-%d %H:%I")
  end
end