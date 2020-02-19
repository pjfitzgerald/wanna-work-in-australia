require 'open-uri'
require 'nokogiri'
require 'rmagick'
include Magick

def scraper(*states)
  url_array = []
  states.each do |state| 
    url = "http://i-wanna-work-in-australia.webflow.io/regions/#{state}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('div.w-col-small-4 img').each do |element|
      url_array << element.attribute('src').value
    end
  end
  return url_array
end

def img_saver(images) #pass an array as arg
  images.each do |image_url|
    puts image_url
    # image = Magick::ImageList.new
    # urlimage = open(image_url)
    # image.from_blob(urlimage.read)
    # image.write("/home/patrick/Desktop/#{urlimage}")
  end
end

img_saver(scraper("victoria", "new-south-wales", "queensland", "south-australia", "western-australia", "northern-territory", "tasmania", "act"))

