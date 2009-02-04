class KanjisController < ApplicationController
  # GET /kanjis
  # GET /kanjis.xml
  def index
    @kanjis = Kanji.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kanjis }
    end
  end

  # GET /kanjis/1
  # GET /kanjis/1.xml
  def show
    @kanji = Kanji.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kanji }
    end
  end

  # GET /kanjis/new
  # GET /kanjis/new.xml
  def new
    @kanji = Kanji.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kanji }
    end
  end

  # GET /kanjis/1/edit
  def edit
    @kanji = Kanji.find(params[:id])
  end

  # POST /kanjis
  # POST /kanjis.xml
  def create
    @kanji = Kanji.new(params[:kanji])

    respond_to do |format|
      if @kanji.save
        flash[:notice] = 'Kanji was successfully created.'
        format.html { redirect_to(@kanji) }
        format.xml  { render :xml => @kanji, :status => :created, :location => @kanji }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kanji.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kanjis/1
  # PUT /kanjis/1.xml
  def update
    @kanji = Kanji.find(params[:id])

    respond_to do |format|
      if @kanji.update_attributes(params[:kanji])
        flash[:notice] = 'Kanji was successfully updated.'
        format.html { redirect_to(@kanji) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kanji.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kanjis/1
  # DELETE /kanjis/1.xml
  def destroy
    @kanji = Kanji.find(params[:id])
    @kanji.destroy

    respond_to do |format|
      format.html { redirect_to(kanjis_url) }
      format.xml  { head :ok }
    end
  end
end
