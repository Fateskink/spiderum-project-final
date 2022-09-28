class Debate < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
