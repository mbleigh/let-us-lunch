class EventsController < ApplicationController  
  def new
    @event = Event.new(invitations: [Invitation.new(email: 'example@example.com')])
  end
  
  def create
    Event.transaction do
      Invitation.transaction do
        @event = Event.new(event_params)
        @event.save!
        emails_param.reject(&:blank?).each{|email| Invitation.create!(event: @event, email: email)}
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "Error: #{e.record.errors.full_messages.join(", ")}"
    render action: :new
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def confirm
    @event = Event.find_by_token!(params[:id])
    @event.update_attributes(confirmed: true)
    @event.invitations.each(&:save)
    redirect_to @event
  end
  
  def event_params
    params.require(:event).permit(:location, :time_string, :organizer_name, :organizer_email, :message)
  end
  
  def emails_param
    params.require(:emails)
  end
end
