class Event < ActiveRecord::Base
  include HasToken
  include Sendable
  
  has_many :invitations
  
  validates_presence_of :location, :time, :organizer_name, :organizer_email, :token
  validates_uniqueness_of :token
  
  def time_string=(string)
    self.time = Chronic.parse(string)
  end
  
  def time_string
    self.time.try(:strftime, "%Y-%m-%d %H:%I")
  end
  
  def emails=(emails)
    self.invitations = emails.map{|email| Invitation.new(email: email)}
  end
  
  def emails
    invitations.map(&:email)
  end
  
  def deliver!
    EventMailer.confirmation(self).deliver
    update_attributes!(sent: true)
  end
end
