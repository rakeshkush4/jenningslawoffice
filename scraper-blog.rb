require 'open-uri'
require 'nokogiri'
require 'fileutils'
require 'date'
require 'uri'
require 'reverse_markdown'

# Define the base URL and the output directory
base_url = 'https://www.jenningslawoffice.com/'
output_directory = '_blogposts'

# Create the output directory if it doesn't exist
FileUtils.mkdir_p(output_directory)

# Function to sanitize file names
def sanitize_filename(filename)
  filename.downcase.gsub(/[\/\\:\*\?"<>\| ]/, '-')
end

# Function to get blog post URLs from a page
def get_blog_post_urls(page_url)
  puts "Fetching blog post URLs from: #{page_url}"
  begin
    doc = Nokogiri::HTML(URI.open(page_url))
    urls = doc.css('.main-content-container.blog-content a').map { |link| link['href']&.strip }.uniq.compact
    puts "Found #{urls.size} URLs on #{page_url}"
    urls
  rescue OpenURI::HTTPError => e
    puts "Error fetching URLs from #{page_url}: #{e.message}"
    []
  rescue => e
    puts "An unexpected error occurred: #{e.message}"
    []
  end
end

# Function to scrape and save blog post content with enhanced Markdown conversion
def scrape_blog_post(url, output_directory)
  puts "Scraping blog post: #{url}"
  begin
    clean_url = url.strip
    uri = URI.parse(clean_url)

    doc = Nokogiri::HTML(URI.open(uri))
    title = doc.css('h1').text.strip
    content_html = doc.css('.main-content-container.blog-content').to_html.strip

    # Configure ReverseMarkdown for better output
    ReverseMarkdown.config do |config|
      config.unknown_tags = :bypass
      config.github_flavored = true
    end

    # Convert the HTML content to Markdown
    content_markdown = ReverseMarkdown.convert(content_html)
    content_markdown = content_markdown.gsub(/\n{3,}/, "\n\n")

    # Extract metadata
    titletag = doc.at_css('title')&.text&.strip || 'No Title'
    description = doc.at_css('meta[name="description"]')&.[]('content')&.strip || 'No Description'

    # Extract categories
    category_links = doc.css('a[rel="category tag"]')
    categories = category_links.map { |link| link.text.strip.split.map(&:capitalize).join(' ') }

    # Extract the date from <time> or fallback to today's date
    date = doc.at_css('time')&.[]('datetime') || Date.today.to_s
    date = Date.parse(date).strftime('%Y-%m-%d') rescue Date.today.strftime('%Y-%m-%d')

    # Create permalink based on URL structure
    path = uri.path.chomp('/').split('/').reject(&:empty?)
    if path.size >= 4
      date_part = path[0..2].join('/')
      slug = path[3..-1].join('-')
      permalink = "/#{date_part}/#{slug}"
    else
      permalink = "/#{path.join('/')}"
    end

    # Generate front matter for the Markdown file
    front_matter = <<-FRONTMATTER
---
titletag: "#{titletag}"
description: "#{description}"
title: "#{title}"
#{'categories:' if categories.any?}
#{categories.map { |category| "  - #{category}" }.join("\n") unless categories.empty?}
date: #{date}
permalink: "#{permalink}"
sitemap: true
layout: post
---
FRONTMATTER

    # Save the Markdown content to a file
    filename = sanitize_filename("#{title.downcase.tr(' ', '-')}.md")
    file_path = File.join(output_directory, filename)
    File.open(file_path, 'w') do |file|
      file.write("#{front_matter}\n\n#{content_markdown}")
    end
    puts "Saved blog post to #{file_path}"
  rescue URI::InvalidURIError => e
    puts "Invalid URL: #{e.message}"
  rescue OpenURI::HTTPError => e
    puts "Error scraping blog post from #{url}: #{e.message}"
  rescue => e
    puts "An unexpected error occurred while scraping #{url}: #{e.message}"
  end
end

# Function to handle pagination
def handle_pagination(page_url, output_directory, base_url)
  loop do
    post_urls = get_blog_post_urls(page_url)
    break if post_urls.empty?

    post_urls.each do |post_url|
      full_post_url = URI.join(base_url, post_url.strip).to_s
      scrape_blog_post(full_post_url, output_directory)
    end

    # Find the next page URL
    begin
      doc = Nokogiri::HTML(URI.open(page_url))
      next_page = doc.at_css('.pagination .alignright a')
      if next_page
        page_url = URI.join(base_url, next_page['href']).to_s
        puts "Moving to next page: #{page_url}"
      else
        break
      end
    rescue OpenURI::HTTPError => e
      puts "Error handling pagination on #{page_url}: #{e.message}"
      break
    rescue => e
      puts "An unexpected error occurred during pagination: #{e.message}"
      break
    end
  end
end

# Function to get category URLs from a page
def get_category_urls(page_url, base_url)
  puts "Fetching category URLs from: #{page_url}"
  begin
    doc = Nokogiri::HTML(URI.open(page_url))
    category_links = doc.css('a[href^="/blog/category/"]').map { |link| link['href']&.strip }.uniq.compact
    category_links.map { |link| URI.join(base_url, link).to_s }.uniq
  rescue OpenURI::HTTPError => e
    puts "Error fetching category URLs from #{page_url}: #{e.message}"
    []
  rescue => e
    puts "An unexpected error occurred: #{e.message}"
    []
  end
end

# Function to scrape all category pages
def scrape_all_category_pages(category_urls, output_directory, base_url)
  category_urls.each do |category_url|
    handle_pagination(category_url, output_directory, base_url)
    inner_category_urls = get_category_urls(category_url, base_url)
    scrape_all_category_pages(inner_category_urls, output_directory, base_url) unless inner_category_urls.empty?
  end
end

# Define initial category URLs before calling the function
initial_category_urls = [
  'https://www.gratlantalaw.com/blog/'
]

# Start scraping all category pages
scrape_all_category_pages(initial_category_urls, output_directory, base_url)
