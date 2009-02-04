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

  # GET /nanori_readings/new
  # GET /nanori_readings/new.xml
  def new
    @nanori_reading = NanoriReading.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nanori_reading }
    end
  end

  # GET /nanori_readings/1/edit
  def edit
    @nanori_reading = NanoriReading.find(params[:id])
  end

  # POST /nanori_readings
  # POST /nanori_readings.xml
  def create
    @nanori_reading = NanoriReading.new(params[:nanori_reading])

    respond_to do |format|
      if @nanori_reading.save
        flash[:notice] = 'NanoriReading was successfully created.'
        format.html { redirect_to(@nanori_reading) }
        format.xml  { render :xml => @nanori_reading, :status => :created, :location => @nanori_reading }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nanori_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nanori_readings/1
  # PUT /nanori_readings/1.xml
  def update
    @nanori_reading = NanoriReading.find(params[:id])

    respond_to do |format|
      if @nanori_reading.update_attributes(params[:nanori_reading])
        flash[:notice] = 'NanoriReading was successfully updated.'
        format.html { redirect_to(@nanori_reading) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nanori_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nanori_readings/1
  # DELETE /nanori_readings/1.xml
  def destroy
    @nanori_reading = NanoriReading.find(params[:id])
    @nanori_reading.destroy

    respond_to do |format|
      format.html { redirect_to(nanori_readings_url) }
      format.xml  { head :ok }
    end
  end
end
