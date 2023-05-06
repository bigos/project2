class Api::V1::TextsController < ApplicationController

  # https://iliabylich.github.io/2015/06/07/apipie-amazing-tool-for-documenting-your-rails-api.html

  # GET /api/v1/texts(.:format)
  api! 'List of Texts'
  def index
    @texts = Text.all
    render json: @texts
  end

  # GET /api/v1/texts/:id(.:format)
  api! 'Show Text'
  param :id, :number, desc: 'id of the requested Text'
  def show
    @text = Text.find(params[:id])
    render json: @text
  end
end
