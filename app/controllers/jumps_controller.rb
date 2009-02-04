class JumpsController < ApplicationController
  # GET /jumps
  # GET /jumps.xml
  def index
    @jumps = Jump.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jumps }
    end
  end

  # GET /jumps/1
  # GET /jumps/1.xml
  def show
    @jump = Jump.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jump }
    end
  end

  # GET /jumps/new
  # GET /jumps/new.xml
  def new
    @jump = Jump.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jump }
    end
  end

  # GET /jumps/1/edit
  def edit
    @jump = Jump.find(params[:id])
  end

  # POST /jumps
  # POST /jumps.xml
  def create
    @jump = Jump.new(params[:jump])

    respond_to do |format|
      if @jump.save
        flash[:notice] = 'Jump was successfully created.'
        format.html { redirect_to(@jump) }
        format.xml  { render :xml => @jump, :status => :created, :location => @jump }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jump.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jumps/1
  # PUT /jumps/1.xml
  def update
    @jump = Jump.find(params[:id])

    respond_to do |format|
      if @jump.update_attributes(params[:jump])
        flash[:notice] = 'Jump was successfully updated.'
        format.html { redirect_to(@jump) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jump.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jumps/1
  # DELETE /jumps/1.xml
  def destroy
    @jump = Jump.find(params[:id])
    @jump.destroy

    respond_to do |format|
      format.html { redirect_to(jumps_url) }
      format.xml  { head :ok }
    end
  end
end
