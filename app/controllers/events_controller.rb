class EventsController < ApplicationController
  def index
    @events = Event.order('date DESC, start_time DESC, end_time DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user.admin.id = 3
      @event.destroy 
      redirect_to root_path
    end
  end

  private
  def events_params
    params.require(:event).permit(:date, :start_time, :end_time, :place, :spot, :fee, :payer, :booker, :colum).merge(user_id: current_user.id, state_id: 1)
  end
end
