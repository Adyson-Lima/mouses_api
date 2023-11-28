require 'rails_helper'

RSpec.describe Mouse, type: :model do

  before{@mouse = Mouse.new}

  describe 'testes de preenchimento do model Mouse' do

    it 'mouse_type consegue ser preenchido?' do
      @mouse.mouse_type = "optico"
      expect(@mouse.mouse_type).to eq("optico")
    end

    it 'description consegue ser preenchido?' do
      @mouse.description = "mouse muito comum"
      expect(@mouse.description).to eq("mouse muito comum")
    end

  end

  describe 'testes de validação do model Mouse' do

    it 'Mouse valido com campos obrigatorios preenchidos?' do
      @mouse.mouse_type = 'gamer'
      @mouse.description = 'mouse de alto padrão'
      expect(@mouse).to be_valid
    end

    it 'Mouse invalido com campos obrigatorios não preenchidos?' do
      mouse = Mouse.new
      expect(mouse).to be_invalid
    end

  end

end