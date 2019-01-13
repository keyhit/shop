class Product < ApplicationRecord
  belongs_to :category

  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON
  
  PRICE = [
    [1, 100],
    [100, 500],
    [500, 1000],
    [1000, 3000],
    [3000, 6000],
    [6000, 8000],
    [8000, 10_000]
  ].freeze
end
