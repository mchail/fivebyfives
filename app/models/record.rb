class Record
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :status

  field :weight, :type => Integer
  field :pass, :type => Boolean
end
