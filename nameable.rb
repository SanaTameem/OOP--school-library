class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} must implement correct_name"
  end
end
