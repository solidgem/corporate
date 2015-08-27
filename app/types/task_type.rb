class TaskType < Task
  include BaseType

  validates :project, inclusion: { in: :available_projects, allow_nil: true }

  def policy
    TaskPolicy.new(creator, self)
  end

  def available_projects
    policy.available_projects
  end
end
