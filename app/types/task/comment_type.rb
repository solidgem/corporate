class Task::CommentType < Task::Comment
  extend Enumerize
  include BaseType

  enumerize :date_correction, in: %w[0 1 2], default: '0'

  def date_correction
    @date_correction
  end

  def date_correction=(v)
    self.date -= v.to_i
    @date_correction = v
  end
end
