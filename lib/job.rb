class Job

  attr_reader :company, :description, :firstline, :id

  def initialize(id, company, firstline, description)
    @id = id
    @company = company
    @firstline = firstline
    @description = description
  end

  # def firstline
  # end

end
