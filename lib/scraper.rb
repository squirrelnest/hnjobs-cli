class Scraper

  attr_accessor :doc

  def initialize(url)
    @doc = Nokogiri::HTML(open(url)) # Assign nokogiri output to variable
  end

  # Create jobs

  # Search doc to populate jobs hash

end
