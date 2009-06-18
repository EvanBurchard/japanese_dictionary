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
end
