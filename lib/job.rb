class Job

  @@all = []

  attr_reader :company, :description, :firstline, :id

  def initialize(options = {})
    @id = options[:id]
    @company = options[:company]
    @firstline = options[:firstline]
    @description = options[:description]
    @@all << self
  end

  def self.find_by_id(id)
    @@all.select { |job| job.id == id - 1 }.first
  end

end
