class Product < ActiveRecord::Base
  acts_as_product

  def covers_urls(version: nil)
    path = 'fallback/product_default.png'
    ActionController::Base.helpers.image_path path
  end

  def cover_url_or_default(index: 0, version: nil)
    path = 'fallback/product_default.png'
    ActionController::Base.helpers.image_path path
  end

  def description
    nil
  end

  def to_s
    title
  end
end
