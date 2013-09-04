class Event < ActiveRecord::Base
  include HasToken
  include Sendable
  
  has_many :invitations
  
  validates_presence_of :location, :time, :organizer_name, :organizer_email, :token
  validates_uniqueness_of :token
  validate :no_dups
  
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
  
  def no_dups
    if event = Event.where("id != ? AND organizer_email = ? AND created_at > ?", self.id, self.organizer_email, 5.minutes.ago).any?
      errors.add(:base, "You can only create one meetup every 5 minutes.") 
    end
  end
end
