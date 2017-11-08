class Job

  attr_reader :company, :description, :firstline, :id

  def initialize(options = {})
    @id = options[:id]
    @company = options[:company]
    @firstline = options[:firstline]
    @description = options[:description]
  end

  # def firstline
  # end

end
