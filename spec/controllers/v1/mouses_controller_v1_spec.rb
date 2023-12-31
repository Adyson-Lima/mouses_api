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

  describe 'PATCH /api/v1/mouses/id' do
    it 'Consegue atualizar um mouse e retornar status 200?' do
      mouse = Mouse.last
      patch :update, params: {mouse: {mouse_type: 'mecanico', description: 'mouse em desuso'}, id: mouse.id}
      expect(response.body).to include_json(mouse_type: 'mecanico')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/mouses/id' do
    it 'Consegue excluir um mouse e retornar status 204?' do
      mouse = Mouse.last
      delete :destroy, params: {id: mouse.id}
      expect(Mouse.all).not_to include(mouse)
      expect(response).to have_http_status(204)
    end
    
  end

end