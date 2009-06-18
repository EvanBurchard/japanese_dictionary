class KunReadingsController < ApplicationController
  # GET /kun_readings
  # GET /kun_readings.xml
  def index
    @kun_readings = KunReading.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kun_readings }
    end
  end

  # GET /kun_readings/1
  # GET /kun_readings/1.xml
  def show
    @kun_reading = KunReading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kun_reading }
    end
  end
end
