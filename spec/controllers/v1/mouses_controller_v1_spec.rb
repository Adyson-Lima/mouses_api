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

  describe 'GET /api/v1/mouses/id' do
    it 'Consegue listar um mouse especifico e retornar status 200?' do
      get :show, params: {id: @mouse.id}
      expect(response.body).to include_json(id: @mouse.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/mouses' do
    it 'Consegue criar um mouse e retornar status 201?' do
      post :create, params: {mouse: {mouse_type: 'gamer', description: 'mouse de alto desenpenho'}, format: :json}
      expect(response.body).to include_json(mouse_type: 'gamer')
      expect(response).to have_http_status(201)
    end
  end

end