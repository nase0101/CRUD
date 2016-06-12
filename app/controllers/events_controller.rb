class EventsController < ApplicationController
  def index
    #@events = Event.all
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save

    redirect_to events_url
  end

  def show
    @event = Event.find(params[:id])
    @page_title = @event.name
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to event_url(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end

end
