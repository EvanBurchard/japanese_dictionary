class KanjiReadingsController < ApplicationController
  # GET /kanji_readings
  # GET /kanji_readings.xml
  def index
    @kanji_readings = KanjiReading.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kanji_readings }
    end
  end

  # GET /kanji_readings/1
  # GET /kanji_readings/1.xml
  def show
    @kanji_reading = KanjiReading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kanji_reading }
    end
  end
end
