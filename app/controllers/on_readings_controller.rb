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

  # GET /on_readings/new
  # GET /on_readings/new.xml
  def new
    @on_reading = OnReading.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @on_reading }
    end
  end

  # GET /on_readings/1/edit
  def edit
    @on_reading = OnReading.find(params[:id])
  end

  # POST /on_readings
  # POST /on_readings.xml
  def create
    @on_reading = OnReading.new(params[:on_reading])

    respond_to do |format|
      if @on_reading.save
        flash[:notice] = 'OnReading was successfully created.'
        format.html { redirect_to(@on_reading) }
        format.xml  { render :xml => @on_reading, :status => :created, :location => @on_reading }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @on_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /on_readings/1
  # PUT /on_readings/1.xml
  def update
    @on_reading = OnReading.find(params[:id])

    respond_to do |format|
      if @on_reading.update_attributes(params[:on_reading])
        flash[:notice] = 'OnReading was successfully updated.'
        format.html { redirect_to(@on_reading) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @on_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /on_readings/1
  # DELETE /on_readings/1.xml
  def destroy
    @on_reading = OnReading.find(params[:id])
    @on_reading.destroy

    respond_to do |format|
      format.html { redirect_to(on_readings_url) }
      format.xml  { head :ok }
    end
  end
end
