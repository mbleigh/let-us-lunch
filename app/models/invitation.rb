class Invitation < ActiveRecord::Base
  include HasToken
  include Sendable
  
  belongs_to :event
  
  validates_presence_of :email, :event_id, :token
  validates_uniqueness_of :token
  validates_uniqueness_of :email, scope: :event_id
  
  def deliver!
    return false unless event.confirmed?
    EventMailer.invitation(self).deliver
    update_attributes!(sent: true)
  end
end
