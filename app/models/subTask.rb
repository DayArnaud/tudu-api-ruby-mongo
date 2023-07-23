class SubTask
    include Mongoid::Document
    include Mongoid::Timestamps

    field :description, type: String
    field :check, type: Boolean
  
    embedded_in :parent_task, class_name: 'Task', inverse_of: :subtasks
end
  