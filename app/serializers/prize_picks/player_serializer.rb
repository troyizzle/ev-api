module PrizePicks
  class PlayerSerializer
    include JSONAPI::Serializer

    attributes :data

    has_many :projections
  end
end
