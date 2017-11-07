require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :doc

  def initialize(url)
    # Assign nokogiri output to variable
    @@doc = Nokogiri::HTML(open(url))
  end

  # Create jobs

  # Search doc to populate jobs hash

end
