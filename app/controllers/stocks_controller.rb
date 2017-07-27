class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])         #find in d database
      @stock ||= Stock.new_from_lookup(params[:stock])      #find in ol stocks
    end
    if @stock
      render partial: 'lookup'
      else
        render status: :not_found, nothing: true
    end
  end
end