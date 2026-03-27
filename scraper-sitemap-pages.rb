require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'reverse_markdown'
require 'json'

def process_url(url, is_blog)
  begin
    html_content = URI.open(url).read
    doc = Nokogiri::HTML(html_content)

    # Extracting metadata
    title = extract_title(url, is_blog)
    puts "Title not found in #{url}" unless title

    layout = 'page'  # Assuming the layout is always 'page'

    titletag = doc.at_css('title')&.text
    puts "Title tag not found in #{url}" unless titletag

    description_element = doc.at_css('meta[name="description"]')
    description = description_element ? description_element['content'].strip : nil
    puts "Description not found in #{url}" unless description

    h1_headline = doc.at_css('h1')&.text
    puts "H1 headline not found in #{url}" if h1_headline.nil?

    # Extract categories (currently a placeholder)
    categories = extract_categories(doc)

    # Extracting and processing body content - update the selector as needed
    # Ensure the selector targets the main content container
    body_html = doc.at_css('.et_builder_inner_content .et_pb_module.et_pb_post_content')&.inner_html # Update selector as necessary
    if body_html
      body_html = remove_h1_tag(body_html)
      body_markdown = ReverseMarkdown.convert(body_html, unknown_tags: :bypass) # Convert HTML to Markdown
    else
      puts "Main content not found in #{url}"
      return # Skip URL if main content is not found
    end

    # Determine the permalink
    permalink = url.sub('https://www.jenningslawoffice.com/', '') 

    # Formatting the Markdown file content
    markdown_content = format_markdown(title, layout, titletag, description, h1_headline, permalink, body_markdown, categories)

    # Define and ensure the directory exists before writing
    directory = is_blog ? '_articles' : '_pages'
    FileUtils.mkdir_p(directory) unless Dir.exist?(directory)

    # Define and write to the new file path
    new_file_name = permalink.split('/').last
    new_file_name = new_file_name.gsub('.html', '') + '.md'
    new_file_path = File.join(directory, new_file_name)

    # Debugging print statement
    puts "Saving file to #{new_file_path}"

    File.write(new_file_path, markdown_content)
  rescue StandardError => e
    puts "Error processing URL #{url}: #{e.message}"
  end
end

def format_markdown(title, layout, titletag, description, h1_headline, permalink, body_markdown, categories)
  front_matter = <<~FRONTMATTER
    ---
    title: "#{title}"
    layout: #{layout}
    titletag: "#{titletag}"
  FRONTMATTER

  front_matter += "description: \"#{description}\"\n" if description
  front_matter += "permalink: \"#{permalink}\"\n"
  front_matter += "h1Headline: \"#{h1_headline}\"\n" if h1_headline

  front_matter += "sitemap: true\n---\n\n"

  front_matter + body_markdown
end

def extract_title(url, is_blog)
  # Extract the title based on the URL
  if is_blog
    url.split('/').last.gsub('.html', '').gsub('-', ' ')
  else
    url.gsub('https://www.jenningslawoffice.com/', '').gsub('-', ' ').gsub('.html', '').gsub('/', ' ').gsub('index', '').gsub('-', ' ').strip
  end
end

def remove_h1_tag(html_content)
  # Remove the h1 tag from the content
  fragment = Nokogiri::HTML.fragment(html_content)
  fragment.at_css('h1')&.remove
  fragment.to_s
end

def extract_categories(doc)
  # Placeholder for extracting categories, adjust based on your HTML structure
  []
end

# Define the URL of the specific page to scrape
url = 'https://www.jenningslawoffice.com/articles/pee-dee-man-not-guilty/'
process_url(url, true)
