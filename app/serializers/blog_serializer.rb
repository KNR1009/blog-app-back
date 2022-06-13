class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :contents
end
