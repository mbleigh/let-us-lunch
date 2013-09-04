class EventMailer < ActionMailer::Base
  default from: "mbleigh@mbleigh.com"
  
  def confirmation(event)
    @event = event
    
    mail to: event.organizer_email, subject: "Lunch Meetup Created (Confirmation Needed)"
  end
  
  def invitation(invitation)
    @invitation = invitation
    @event = @invitation.event
    mail to: invitation.email, subject: "#{@event.organizer_name} has invited you to lunch"
  end
end
