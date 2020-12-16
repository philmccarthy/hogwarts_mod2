class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_by_name, -> { order(:name) }
end
