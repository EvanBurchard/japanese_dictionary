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

  # GET /kana_readings/new
  # GET /kana_readings/new.xml
  def new
    @kana_reading = KanaReading.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kana_reading }
    end
  end

  # GET /kana_readings/1/edit
  def edit
    @kana_reading = KanaReading.find(params[:id])
  end

  # POST /kana_readings
  # POST /kana_readings.xml
  def create
    @kana_reading = KanaReading.new(params[:kana_reading])

    respond_to do |format|
      if @kana_reading.save
        flash[:notice] = 'KanaReading was successfully created.'
        format.html { redirect_to(@kana_reading) }
        format.xml  { render :xml => @kana_reading, :status => :created, :location => @kana_reading }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kana_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kana_readings/1
  # PUT /kana_readings/1.xml
  def update
    @kana_reading = KanaReading.find(params[:id])

    respond_to do |format|
      if @kana_reading.update_attributes(params[:kana_reading])
        flash[:notice] = 'KanaReading was successfully updated.'
        format.html { redirect_to(@kana_reading) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kana_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kana_readings/1
  # DELETE /kana_readings/1.xml
  def destroy
    @kana_reading = KanaReading.find(params[:id])
    @kana_reading.destroy

    respond_to do |format|
      format.html { redirect_to(kana_readings_url) }
      format.xml  { head :ok }
    end
  end
end
