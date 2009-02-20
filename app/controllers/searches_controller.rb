class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.xml
  def index
    @searches = Search.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.xml
  def show
    @search = Search.find(params[:id])
    @result = @search.search_by_query
    if @result.class==Kanji
      @kanji_readings = @result.get_sorted_readings
    end
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.xml
  def new
    @search = Search.new
    @recent = Search.recent_searches
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search }
    end
  end

  # POST /searches
  # POST /searches.xml
  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save

        format.html { redirect_to(@search) }
        format.xml  { render :xml => @search, :status => :created, :location => @search }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search.errors, :status => :unprocessable_entity }
      end
    end
  end

end
