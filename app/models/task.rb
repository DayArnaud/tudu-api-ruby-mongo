class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :status, type: Integer
  field :expire_date, type: Time
  field :category, type: Integer

  # embedded_in :parent_task, class_name: 'Task', inverse_of: :subtasks
  embeds_many :comment, class_name: 'Comment', inverse_of: :parent_comment
  embeds_many :subtask, class_name: 'SubTask', inverse_of: :parent_task
  belongs_to :user
end
