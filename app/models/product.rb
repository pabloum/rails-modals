class Product < ApplicationRecord
  validates :name, presence: true
  scope :published, -> {where(published: true)}

  def word_count
    name.split(" ").length
  end

  def margin
    (price - cost)/cost * 100
  end

  def stock_status
    if quantity > 0
      return true
    else
      return false
    end
  end
end
