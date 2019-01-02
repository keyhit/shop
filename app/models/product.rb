class Product < ApplicationRecord
  belongs_to :category

  PRICE = [[1, 100],   [100, 500], [500, 1000], [1000, 3000], [3000, 6000], [6000, 8000], [8000, 10000]]
end
