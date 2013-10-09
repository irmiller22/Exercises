require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'pry'

FLATIRON_URL = 'http://students.flatironschool.com/'
# this is a constant; a variable that is supposed to remain static for the duration of the program
# and cannot be changed

def import_student_profiles
	db = SQLite3::Database.new('flatiron.db')
	student_profiles = scrape_student_profiles

	create_student_profile_table(db)

	student_profiles.each do |profile|
		write_student_profile(db, profile)
	end
end

def scrape_student_profiles
	doc = Nokogiri::HTML(open(students_index_url))

	student_urls = parse_student_urls(doc)

	student_urls.map do |url|
		scrape_student_profile_at(url)
	end	
end

def scrape_student_profile_at(url)
	begin
		response = open(url)
		doc = Nokogiri::HTML(response)
	rescue OpenURI::HTTPError => e
		return profile_meta_hash(url, e.io.status[0])
	end
	
	{
		meta: profile_meta_hash(url, response.status[0]),
			student: {
				name: parse_student_name(doc),
				tagline: parse_tagline(doc),
				biography: parse_biography(doc),
				education: parse_education(doc), 
				profile_img_src: parse_profile_pic_url(doc, students_index_url),
				social: {
					facebook_url: parse_facebook_url(doc) ,
					github_url: parse_github_url(doc),
					linkedin_url: parse_linkedin_url(doc),
					twitter_url: parse_twitter_url(doc),
					rss_url: parse_rss_url(doc),
				}
			}
	}

def profile_meta_hash(url, status)
	{ url: url, status: status }
end

def create_student_profile_table(db)
	create_table(db) unless table_exists?(db, 'student_profiles')
end

def write_student_profile(db, student_profile)
	student = student_profile[:student]

	return unless student

	name             = student[:name]
	tagline 				 = student[:tagline]
	biography        = student[:biography]
	education 			 = student[:education]
	profile_img_src  = student[:profile_img_src]
	facebook_url     = student[:social][:facebook_url]
	github_url       = student[:social][:github_url]
	twitter_url      = student[:social][:twitter_url]
	rss_url  				 = student[:social][:rss_url]	

	db.execute("INSErt INTO student_profiles VALUES (?,?,?,?,?,?,?,?,?,?)",
				name,
				tagline,
				biography,
				education,
				profile_img_src,
				facebook_url,
				github_url,
				twitter_url,
				rss_url)
end

def create_table(db)
	db.execute("CREATE TABLE student_profiles (
				name TEXT,
				tagline TEXT,
				biography TEXT,
				profile_img_src TEXT,
				facebook_url TEXT,
				github_url TEXT,
				twitter_url TEXT,
				rss_url TEXT);
	")
end

def table_exists?(db, table_name)
end

def students_index_url
	root_url
end

def root_url
	FLATIRON_URL
end

def parse_student_name
end

def parse_social_url_from_icon_selector(doc, selector)
end

def parse_github_url
end

def parse_twitter_url
end

def parse_linkedin_url
end

def parse_facebook_url
end

def parse_rss_url
end

def parse_tagline
end

def parse_student_urls
end

def parse_education
end

def parse_biography
end

def parse_profile_pic_url
end





