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
end
