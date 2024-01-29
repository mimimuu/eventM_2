class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.includes(:user).order('date ASC, start_time ASC, end_time ASC')
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

  def edit
    @event = Event.find(params[:id])
    return redirect_to root_path unless current_user.admin_id == 3
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_update_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user.admin_id == 3 && user_signed_in?
      @event.destroy 
      redirect_to root_path
    end
  end

  private
  def events_params
    params.require(:event).permit(:date, :start_time, :end_time, :place, :spot, :fee, :payer, :booker, :colum).merge(user_id: current_user.id, state_id: 1)
  end

  def events_update_params
    params.require(:event).permit(:date, :start_time, :end_time, :place, :spot, :fee, :payer, :booker, :colum, :state_id).merge(user_id: current_user.id)
  end
end
