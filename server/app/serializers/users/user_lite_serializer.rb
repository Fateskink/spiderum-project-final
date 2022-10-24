module Users
  class UserLiteSerializer < ActiveModel::Serializer
    attributes :image_url,
               :name
  end
end
