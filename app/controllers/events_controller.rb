class EventsController < ApplicationController
  def index
    @events = Event.includes(:user).order('date ASC, start_time ASC, end_time ASC')

    @events.each do |event|
      count = event.count || event.build_count
      attendance = event.participants.where(attendance_id: 1).count
      absence = event.participants.where(attendance_id: 2).count
      undecided = event.participants.where(attendance_id: 3).count
      count.update(attendance:, absence:, undecided:)
    end
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
    @admin_int = 3
    @admin_str = '3'
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    redirect_to root_path unless current_user_admin?
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
    return unless current_user_admin? && user_signed_in?

    if @event.count.valid?
      @event.count.destroy
      if @event.participants.exists?
        @event.participants.destroy_all
        if @event.valid?
          @event.destroy
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
    redirect_to root_path
  end

  private

  def events_params
    params.require(:event).permit(:date, :start_time, :end_time, :place, :spot, :fee, :payer, :booker, :colum).merge(
      user_id: current_user.id, state_id: 1
    )
  end

  def events_update_params
    params.require(:event).permit(:date, :start_time, :end_time, :place, :spot, :fee, :payer, :booker, :colum,
                                  :state_id).merge(user_id: current_user.id)
  end

  def current_user_admin?
    current_user.admin_id == 3 || current_user.admin_id == '3'
  end
end
