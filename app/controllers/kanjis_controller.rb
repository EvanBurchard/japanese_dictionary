class KanjisController < ApplicationController
  # GET /kanjis
  # GET /kanjis.xml
  def index
    @kanjis = Kanji.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kanjis }
    end
  end

  # GET /kanjis/1
  # GET /kanjis/1.xml
  def show
    @kanji = Kanji.find(params[:id])
    @kanji_readings = @kanji.get_sorted_readings
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kanji }
    end
  end


end
