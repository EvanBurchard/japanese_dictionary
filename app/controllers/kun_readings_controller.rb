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

  # GET /kun_readings/new
  # GET /kun_readings/new.xml
  def new
    @kun_reading = KunReading.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kun_reading }
    end
  end

  # GET /kun_readings/1/edit
  def edit
    @kun_reading = KunReading.find(params[:id])
  end

  # POST /kun_readings
  # POST /kun_readings.xml
  def create
    @kun_reading = KunReading.new(params[:kun_reading])

    respond_to do |format|
      if @kun_reading.save
        flash[:notice] = 'KunReading was successfully created.'
        format.html { redirect_to(@kun_reading) }
        format.xml  { render :xml => @kun_reading, :status => :created, :location => @kun_reading }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kun_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kun_readings/1
  # PUT /kun_readings/1.xml
  def update
    @kun_reading = KunReading.find(params[:id])

    respond_to do |format|
      if @kun_reading.update_attributes(params[:kun_reading])
        flash[:notice] = 'KunReading was successfully updated.'
        format.html { redirect_to(@kun_reading) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kun_reading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kun_readings/1
  # DELETE /kun_readings/1.xml
  def destroy
    @kun_reading = KunReading.find(params[:id])
    @kun_reading.destroy

    respond_to do |format|
      format.html { redirect_to(kun_readings_url) }
      format.xml  { head :ok }
    end
  end
end
