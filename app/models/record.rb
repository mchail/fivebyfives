class Record
  include Mongoid::Document
  include Mongoid::Timestamps

  # embedded_in :status
  belongs_to :user
  has_many :lines

  field :weight, :type => Integer
  field :pass, :type => Boolean
end
