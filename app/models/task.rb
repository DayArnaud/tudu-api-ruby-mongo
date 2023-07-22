class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :status, type: Integer
  field :expire_date, type: Time
  field :category, type: Integer
  field :parent_id, type: Integer
  belongs_to :user
end
