class Product < ApplicationRecord
  has_one_attached :image

  rails_admin do
    field :image, :active_storage
  end
end
