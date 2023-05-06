class Api::V1::TextsController < ApplicationController

  # GET /api/v1/texts(.:format)
  api :GET, '/api/v1/texts(.:format)'
  def index
    @texts = Text.all
    render json: @texts
  end

  # GET /api/v1/texts/:id(.:format)
  api :GET, '/api/v1/texts/:id(.:format)'
  param :id, :number, desc: 'id of the requested Text'
  def show
    @text = Text.find(params[:id])
    render json: @text
  end
end
