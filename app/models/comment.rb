class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :name, type: String
  belongs_to :user
  belongs_to :task
end
