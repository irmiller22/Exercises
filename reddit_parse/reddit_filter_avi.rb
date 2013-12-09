require 'json'
require 'rest_client'
require 'open-uri'
require 'pry'


# reddit_json = (`curl www.reddit.com/.json`)
# reddit_json = open('wwww.reddit.com/.json')
# reddit_json = Patron.get('www.reddit.com/.json')
reddit_hash = JSON.parse(RestClient.get('http://reddit.com/.json'))
# reddit_data = reddit_hash["data"]
# reddit_children = reddit_hash["data"]["children"]

# story = reddit_children.first --> TESTING FOR ONE STORY



Prawn::Document.generate('reddit.pdf') do |pdf|
	
	reddit_children.each do |story|
		story_data = story["data"]

		story_title = story_data["title"]
		story_url = story_data["url"]
		story_thumbnail = story_data["thumbnail"]
		story_18 = story_data["over_18"]

		if !story_18
			pdf.text story_title
			pdf.text "URL: #{story_url}"
			begin
				pdf.image open(story_thumbnail) if !story_thumbnail.strip.empty? && story_thumbnail.include?(".")
			rescue
				raise story_data.inspect # this inspects the error that we got due to empty thumbnail
			pdf.start_new_page
		end