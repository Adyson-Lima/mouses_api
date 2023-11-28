class Api::V1::MousesController < ApplicationController 

  before_action :set_mouse, only: %i[show] # show update destroy

  def index
    @mouses = Mouse.all 
    render json: @mouses
  end

  def show
    render json: @mouse
  end

  def create
    @mouse = Mouse.new(mouse_params)
    if @mouse.save
      render json: @mouse, status: :created, location: api_v1_mouse_url(@mouse)
    else
      render json: @mouse.errors, status: :unprocessable_entity
    end
  end

private

def set_mouse
  @mouse = Mouse.find(params[:id])
end

def mouse_params
  params.require(:mouse).permit(:mouse_type, :description)
end

end