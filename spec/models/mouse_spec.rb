require 'rails_helper'

RSpec.describe Mouse, type: :model do

  before{@mouse = Mouse.new}

  describe 'testes de preenchimento do model Mouse' do

    it 'mouse_type consegue ser preenchido?' do
      @mouse.mouse_type = "optico"
      expect(@mouse.mouse_type).to eq("optico")
    end

    it 'description consegue ser preenchido?' do
      @mouse.description = ""
      expect(@mouse.description).to eq("mouse muito comum")
    end

  end

end