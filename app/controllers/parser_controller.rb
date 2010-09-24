require "css/parser"
require "css/printer"

class ParserController < ApplicationController
  def new
    @css = ""
  end

  def create
    @parsed = CSS::Parser.new.parse(params[:css])
    @css = CSS::Printer.new.format_all(@parsed)
    render :new
  end

end
