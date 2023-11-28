class Mouse < ApplicationRecord
  validates :mouse_type, :description, presence: true
end
