class KanjiMeaningsController < ApplicationController
  # GET /kanji_meanings
  # GET /kanji_meanings.xml
  def index
    @kanji_meanings = KanjiMeaning.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kanji_meanings }
    end
  end

  # GET /kanji_meanings/1
  # GET /kanji_meanings/1.xml
  def show
    @kanji_meaning = KanjiMeaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kanji_meaning }
    end
  end

  # GET /kanji_meanings/new
  # GET /kanji_meanings/new.xml
  def new
    @kanji_meaning = KanjiMeaning.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kanji_meaning }
    end
  end

  # GET /kanji_meanings/1/edit
  def edit
    @kanji_meaning = KanjiMeaning.find(params[:id])
  end

  # POST /kanji_meanings
  # POST /kanji_meanings.xml
  def create
    @kanji_meaning = KanjiMeaning.new(params[:kanji_meaning])

    respond_to do |format|
      if @kanji_meaning.save
        flash[:notice] = 'KanjiMeaning was successfully created.'
        format.html { redirect_to(@kanji_meaning) }
        format.xml  { render :xml => @kanji_meaning, :status => :created, :location => @kanji_meaning }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kanji_meaning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kanji_meanings/1
  # PUT /kanji_meanings/1.xml
  def update
    @kanji_meaning = KanjiMeaning.find(params[:id])

    respond_to do |format|
      if @kanji_meaning.update_attributes(params[:kanji_meaning])
        flash[:notice] = 'KanjiMeaning was successfully updated.'
        format.html { redirect_to(@kanji_meaning) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kanji_meaning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kanji_meanings/1
  # DELETE /kanji_meanings/1.xml
  def destroy
    @kanji_meaning = KanjiMeaning.find(params[:id])
    @kanji_meaning.destroy

    respond_to do |format|
      format.html { redirect_to(kanji_meanings_url) }
      format.xml  { head :ok }
    end
  end
end
