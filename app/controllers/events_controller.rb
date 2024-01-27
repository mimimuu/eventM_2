class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    binding.pry
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def events_params
    params.require(:event).permit(:date, :start_time, :end_time, :place, :spot, :fee, :payer, :booker, :colum).merge(user_id: current_user.id, state_id: 1)
  end
end
