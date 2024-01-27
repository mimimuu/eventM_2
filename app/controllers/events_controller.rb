class EventsController < ApplicationController
  def index
  end

  def new
    @events = Event.new
  end
end
