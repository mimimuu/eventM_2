class ParticipantsController < ApplicationController

  def new
    @events = Event.includes(:user).order('date ASC, start_time ASC, end_time ASC')
    @participants = []
    @events.each do |event|
      @existing_participant = event.participants.find_by(user_id: current_user.id) || event.participants.create(user: current_user, attendance_id: 3)
      @participants << @existing_participant
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @participant = @event.participants.find_by(user_id: current_user.id)
    if @participant.present?
      if @participant.update(participant_update_params)
        redirect_to new_participant_path, notice: 'RSVP successfully submitted.'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def participant_update_params
    params.require(:participant).permit(:attendance_id)
  end

end