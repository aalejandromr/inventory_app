class Product < ApplicationRecord
  has_one_attached :image

  # The following is needed to support deletion
  attribute :remove_image, :boolean
  after_save -> { image.purge }, if: :remove_image

  rails_admin do
    field :name, :string
    field :price, :float
    field :description, :string
    field :image, :active_storage
  end
end
