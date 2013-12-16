require 'nokogiri'
require 'open-uri'
require 'pry'

class SiteScraper
	attr_accessor :stories

	def initialize
		@cnn_url = "http://www.cnn.com"
		@mash_url = "http://www.mashable.com/tech"
		@hacker_news = "https://news.ycombinator.com/"
		@ruby_news = "http://www.rubyinside.com"
		@stories ||= {}
	end

	def export_to_db
		db = SQLite3::Database.new("news_links.db")
		create_table(db)
	end

	def create_table(db)
		db.execute("CREATE TABLE IF NOT EXISTS news (
								link TEXT);
							")
	end

	def parse_cnn_link_urls
		cnn_site = Nokogiri::HTML(open(@cnn_url))
		cnn_stories = cnn_site.css("div.cnn_mtt1content ul.cnn_bulletbin li a").collect do |element|
			"#{@cnn_url}#{element.attr("href")}"
		end
		@stories[:cnn] = cnn_stories
	end

	def parse_mash_tech_link_urls
		mash_site = Nokogiri::HTML(open(@mash_url))
		mash_stories = mash_site.css("div.column-content").collect do |element|
			"#{element.css("h1 a").attr("href").text}"
		end
		@stories[:mashable] = mash_stories
	end

	def parse_hacker_news_link_urls
		hacker_news = Nokogiri::HTML(open(@hacker_news))
		hacker_stories = hacker_news.css("tr td.title a").collect do |element|
			"#{element.attr("href")}"
		end
		@stories[:hacker_news] = hacker_stories
	end

	def parse_ruby_news_link_urls
		ruby_news = Nokogiri::HTML(open(@ruby_news))
		ruby_stories = ruby_news.css("div.title h2").collect do |element|
			"#{element.children.attr("href").text}"
		end
		@stories[:ruby_news] = ruby_stories
	end

	def call
		parse_cnn_link_urls
		parse_mash_tech_link_urls
		parse_hacker_news_link_urls
		parse_ruby_news_link_urls
	end

end

scrape = SiteScraper.new
scrape.call	