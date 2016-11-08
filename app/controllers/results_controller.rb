class ResultsController < ApplicationController
  before_action :set_search
  before_action :set_results
  before_action :set_alternatives
  before_action :set_result, only: [:show]

  def index
  end

  def show
  end

  private

  def set_search
    @search = Search.find(params[:search_id])
  end

  def set_results
    @results = @search.results.where(word: params[:word])
  end

  def set_alternatives
    @alternatives = @search.results.group(:word).count
  end

  def set_result
    @result = @search.result.select{ |r| r.id == params[:id]}
  end
end
