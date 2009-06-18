class OnReadingsController < ApplicationController
  # GET /on_readings
  # GET /on_readings.xml
  def index
    @on_readings = OnReading.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @on_readings }
    end
  end

  # GET /on_readings/1
  # GET /on_readings/1.xml
  def show
    @on_reading = OnReading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @on_reading }
    end
  end
end
