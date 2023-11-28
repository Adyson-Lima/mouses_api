require 'rails_helper'

RSpec.describe Mouse, type: :model do

  before{@mouse = Mouse.new}

  describe 'testes de preenchimento do model Mouse' do

    it 'mouse_type consegue ser preenchido?' do
      @mouse.mouse_type = ""
      expect(@mouse.mouse_type).to eq("optico")
    end

  end

end