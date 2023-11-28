class Api::V1::MousesController < ApplicationController 

  before_action :set_mouse, only: %i[] # show update destroy

  def index
    @mouses = Mouse.all 
    render json: @mouses
  end

private

def set_mouse
  @mouse = Mouse.find(params[:id])
end

def mouse_params
  params.require(:mouse).permit(:mouse_type, :description)
end

end