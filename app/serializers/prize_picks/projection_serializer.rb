module PrizePicks
  class ProjectionSerializer
    include JSONAPI::Serializer

    attributes :data

    belongs_to :player

    attribute :data do |object|
      { **object }
    end
  end
end
