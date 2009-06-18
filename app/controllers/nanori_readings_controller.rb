class NanoriReadingsController < ApplicationController
  # GET /nanori_readings
  # GET /nanori_readings.xml
  def index
    @nanori_readings = NanoriReading.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nanori_readings }
    end
  end

  # GET /nanori_readings/1
  # GET /nanori_readings/1.xml
  def show
    @nanori_reading = NanoriReading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nanori_reading }
    end
  end
end
