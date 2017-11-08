class Job

  attr_reader :company, :description, :firstline

  def initialize(firstline)
    @company = nil
    @firstline = firstline
    @description = nil
  end

  # def firstline
  # end

end
