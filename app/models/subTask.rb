class SubTask
    include Mongoid::Document
    include Mongoid::Timestamps

    field :description, type: String
    field :isCompleted, type: Boolean, default: false  

    embedded_in :parent_task, class_name: 'Task', inverse_of: :subtasks
end

  