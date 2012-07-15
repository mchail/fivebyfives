class Line
  include Mongoid::Document
  include Mongoid::Timestamps
  field :weight, :type => Integer
  field :duration, :type => String
  field :status, :type => Boolean

  belongs_to :exercise
  belongs_to :record
end
