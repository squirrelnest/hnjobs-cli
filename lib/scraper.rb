require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :doc

  def initialize(url)
    # Assign nokogiri output to variable
    @doc = Nokogiri::HTML(open(url))
  end

  def self.scrape(url)
    @doc = Nokogiri::HTML(open(url))
    puts "#{@doc.css(".comment").length} job postings found"
    puts ""
    # comments = @doc.search('.ind id[text()="5678"] ~ *')
    @doc.css(".comment").map do |comment|
      firstline = comment.css(":not(p)").first.text unless
        comment.css(".c00").first === nil ||
        !comment.css(".c00").first.text.include?('|')
      job = Job.new(firstline)
      puts job.firstline unless job.firstline === ""
    end
  end

  # Create jobs

  # Search doc to populate jobs hash

end
