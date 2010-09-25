require "css/parser"
require "css/printer"

class ParserController < ApplicationController
  def new
    @css = ""
    @rows = 20
  end

  def create
    if params[:css].empty?
      redirect_to :action => "new" 
    else
      @parsed = CSS::Parser.new.parse(params[:css])
      @css = CSS::Printer.new.format_all(@parsed)
      @rows = @css.count("\n") + 1
      render :new
    end
  end

end
