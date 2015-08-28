class TaskType < Task
  include BaseType

  attr_accessor :actor

  validates :actor, presence: true
  validates :project, inclusion: { in: :available_projects, allow_nil: true }

  def available_projects
    ProjectPolicy::Scope.new(actor, Project).resolve
  end
end
