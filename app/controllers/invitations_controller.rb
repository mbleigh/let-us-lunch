class InvitationsController < ApplicationController
  def accept
    @invitation = Invitation.find_by_token!(params[:id])
    @invitation.update_attributes(response: 'yes')
    redirect_to @invitation.event
  end
  
  def reject
    @invitation = Invitation.find_by_token!(params[:id])
    @invitation.update_attributes(response: 'no')
    redirect_to @invitation.event
  end
end
