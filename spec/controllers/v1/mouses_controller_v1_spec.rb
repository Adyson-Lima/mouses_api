require 'rails_helper'

RSpec.describe Api::V1::MousesController, type: :controller do

  before{@mouse = Mouse.create(mouse_type: "fixo", description: "mouse incomum")}

  describe 'GET /api/v1/mouses' do
    it 'Consegue listar todos os mouses e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end