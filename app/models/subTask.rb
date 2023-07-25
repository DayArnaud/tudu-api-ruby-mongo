class SubTask
    include Mongoid::Document
    include Mongoid::Timestamps

    field :description, type: String
  
    embedded_in :parent_task, class_name: 'Task', inverse_of: :subtasks
end
  