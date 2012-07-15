class Status
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :exercise
  # embeds_many :records

  field :current, :type => Integer
end
