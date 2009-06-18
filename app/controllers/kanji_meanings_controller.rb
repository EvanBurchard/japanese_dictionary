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
end
