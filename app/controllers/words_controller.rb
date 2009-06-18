class WordsController < ApplicationController
  # GET /words
  # GET /words.xml
  def index
    @words = Word.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
    end
  end

  # GET /words/1
  # GET /words/1.xml
  def show
    @word = Word.find(params[:id])
    @kanji_in_readings = @word.kanji_in_readings
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @word }

    end
  end
end
