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
    puts "#{@doc.css(".comment").count} job postings found"
    puts ""
    # @doc.css('div:not(.reply)').map do |comment|
    @doc.css(".comment").each_with_index.map do |comment, i|
      id = i
      company = comment.css(".c00").first.text.match(/.*\|/) unless comment.css(".c00").first === nil || comment.css(".c00").first === "" || !comment.css(".c00").first.text.include?('|')
      firstline = comment.css(":not(p)").first.text[0...20]
      description = comment.css(":not(p)").first.text unless comment.css(".c00").first === nil || !comment.css(".c00").first.text.include?('|')
      job = Job.new(id, company, firstline, description)
      puts "#{i+1} #{job.company}" unless job.company === ""\
    end
  end

  # Create jobs

  # Search doc to populate jobs hash

end
