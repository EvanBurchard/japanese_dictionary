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

  # GET /kanji_readings/new
  # GET /kanji_readings/new.xml
  def new
    @kanji_reading = KanjiReading.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kanji_reading }
    end
  end

  # GET /kanji_readings/1/edit
  def edit
    @kanji_reading = KanjiReading.find(params[:id])
  end

  # POST /kanji_readings
  # POST /kanji_readings.xml
  def create
    @kanji_reading = KanjiReading.new(params[:kanji_reading])

    respond_to do |format|
      if @kanji_reading.save
        flash[:notice] = 'KanjiReading was successfully created.'
        format.html { redirect_to(@kanji_reading) }
        format.xml  { render :xml => @kanji_reading, :status => :created, :location => @kanji_reading }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kanji_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kanji_readings/1
  # PUT /kanji_readings/1.xml
  def update
    @kanji_reading = KanjiReading.find(params[:id])

    respond_to do |format|
      if @kanji_reading.update_attributes(params[:kanji_reading])
        flash[:notice] = 'KanjiReading was successfully updated.'
        format.html { redirect_to(@kanji_reading) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kanji_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kanji_readings/1
  # DELETE /kanji_readings/1.xml
  def destroy
    @kanji_reading = KanjiReading.find(params[:id])
    @kanji_reading.destroy

    respond_to do |format|
      format.html { redirect_to(kanji_readings_url) }
      format.xml  { head :ok }
    end
  end
end
