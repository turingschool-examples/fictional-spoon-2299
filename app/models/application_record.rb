class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search_params)
    where("id ILIKE ?", "%#{search_params}%")
  end
end
