class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votetable, polymorphic: true
end
