class WordMeaningsController < ApplicationController
  # GET /word_meanings
  # GET /word_meanings.xml
  def index
    @word_meanings = WordMeaning.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @word_meanings }
    end
  end

  # GET /word_meanings/1
  # GET /word_meanings/1.xml
  def show
    @word_meaning = WordMeaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @word_meaning }
    end
  end

  # GET /word_meanings/new
  # GET /word_meanings/new.xml
  def new
    @word_meaning = WordMeaning.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @word_meaning }
    end
  end

  # GET /word_meanings/1/edit
  def edit
    @word_meaning = WordMeaning.find(params[:id])
  end

  # POST /word_meanings
  # POST /word_meanings.xml
  def create
    @word_meaning = WordMeaning.new(params[:word_meaning])

    respond_to do |format|
      if @word_meaning.save
        flash[:notice] = 'WordMeaning was successfully created.'
        format.html { redirect_to(@word_meaning) }
        format.xml  { render :xml => @word_meaning, :status => :created, :location => @word_meaning }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @word_meaning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /word_meanings/1
  # PUT /word_meanings/1.xml
  def update
    @word_meaning = WordMeaning.find(params[:id])

    respond_to do |format|
      if @word_meaning.update_attributes(params[:word_meaning])
        flash[:notice] = 'WordMeaning was successfully updated.'
        format.html { redirect_to(@word_meaning) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word_meaning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /word_meanings/1
  # DELETE /word_meanings/1.xml
  def destroy
    @word_meaning = WordMeaning.find(params[:id])
    @word_meaning.destroy

    respond_to do |format|
      format.html { redirect_to(word_meanings_url) }
      format.xml  { head :ok }
    end
  end
end
