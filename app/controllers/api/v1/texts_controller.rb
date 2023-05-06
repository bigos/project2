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

  api!
  param :text, Hash, required: true do
    param :title, String, 'Title', required: true
    param :link, String, '', required: false
    param :body, String, 'Body of text', required: true
  end
  def create
    @text = Texts.new(text_params)

    if @text.save
      render json: @text, status: :created, location: [@text]
    else
      render json: @text.errors, status: :unprocessable_entity
    end
  end
end
