class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :status
end
