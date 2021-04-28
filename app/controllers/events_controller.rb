class EventsController < ApplicationController
  def index
    @event = Event.all
    @user = User.find_by(id: session[:userid])
  end

  def new
    @event = Event.new 
  end

  def create
    @event = Event.new(event_params)
    if @event.save
        redirect_to events_path, notice: "Successfully Created A New Event!!!"
    else
        render :new
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def register
    @event = Event.find_by(id: params[:event_id])
  end

  def pay 
    @event = Event.find_by(id: params[:event_id])
    @user = User.find_by(id: session[:userid])
  end

  def confirm
    @user = User.find_by(id: session[:userid])
  end

  private
  def event_params
    params.require(:event).permit(:name, :host, :location, :time, :description)
  end
end
