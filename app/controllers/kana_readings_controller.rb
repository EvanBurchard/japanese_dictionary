class KanaReadingsController < ApplicationController
  # GET /kana_readings
  # GET /kana_readings.xml
  def index
    @kana_readings = KanaReading.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kana_readings }
    end
  end

  # GET /kana_readings/1
  # GET /kana_readings/1.xml
  def show
    @kana_reading = KanaReading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kana_reading }
    end
  end
end
