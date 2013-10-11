require 'json'
require 'rest_client'
require 'open-uri'
require 'prawn'
require 'pry'


#reddit_json = (`curl www.reddit.com/.json`)
#reddit_json = open('wwww.reddit.com/.json')
#reddit_json = Patron.get('www.reddit.com/.json')
reddit_hash = JSON.parse(RestClient.get('http://reddit.com/.json'))
reddit_data = reddit_hash["data"]
reddit_children = reddit_hash["data"]["children"]

story = reddit_children.first # --> TESTING FOR ONE STORY
story_data = story["data"]
story_title = story_data["title"]
story_url = story_data["url"]
story_thumbnail = story_data["thumbnail"]
story_18 = story_data["over_18"]

reddit_children.each do |story|

	

	if !story_18
		Prawn::Document.generate('reddit.pdf') do |pdf|
			pdf.text story_title
			pdf.text "URL: #{story_url}"
			pdf.text open(story_url)
		end
	end
end

# def nsfw_filter(reddit_hash)
# 	accepted_mat = []
# 	reddit_hash["data"]["children"].each do |entry|
# 		accepted_mat << entry if entry["data"]["over_18"] == false
# 	end
# end
# reddithtml = File.new("reddit.html")

def html_push(reddit_hash)

	reddit_hash["data"]["children"].each do |entry|

	
		puts	"<html>"
		puts	"  <head>"
		puts	"  </head>"
		puts	"  <body>"
		puts	"    <ul>"
		puts	"      <li>"
		puts	"        <a href='#{reddit_hash["data"]["children"][entry]["data"]["url"]}'>"
		puts	"            <h1>#{reddit_hash["data"]["children"][entry]["data"]["title"]}</h1>"
		puts	"            <img src='#{reddit_hash["data"]["children"][entry]["data"]["thumbnail"]}' />"
		puts	"            <h4>Upvotes: </p>"
		puts	"            <p>#{reddit_hash["data"]["children"][entry]["data"]["ups"]}</h4>"
		puts	"            <p>Downvotes:</p>"
		puts	"            <h4>#{reddit_hash["data"]["children"][entry]["data"]["downs"]}</h4>"
		puts	"        </a>"
		puts	"      </li>"
		puts	"      ."
		puts	"      ."
		puts	"      ."
		puts	"      <li>"
		puts	"        <a href='#{reddit_hash["data"]["children"][entry]["data"]["url"]}'>"
		puts	"            <h1>#{reddit_hash["data"]["children"][entry]["data"]["title"]}</h1>"
		puts	"            <img src='#{reddit_hash["data"]["children"][entry]["data"]["thumbnail"]}' />"
		puts	"            <h4>Upvotes:</h4>"
		puts	"            <p>#{reddit_hash["data"]["children"][entry]["data"]["ups"]}</p>"
		puts	"            <h4>Downvotes:</h4>"
		puts	"            <p>#{reddit_hash["data"]["children"][entry]["data"]["downs"]}</p>"
		puts	"        </a>"
		puts	"      </li>"
		puts	"    </ul>"
		puts	"  </body>"
		puts	"</html>"
	end
end

binding.pry