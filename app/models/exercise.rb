class Exercise
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :statuses

  field :name, :type => String
  field :starting_weight, type: Integer
  field :increment, type: Integer
  field :rotation, type: Integer # (0 or 1 or 2), 0 = all rotations
  field :image_url, :type => String
end
