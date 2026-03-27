# _plugins/drafts_previews.rb

module Jekyll
  class DraftsFilterGenerator < Generator
    safe true
    priority :low

    def generate(site)
      if ENV['JEKYLL_ENV'] != 'preview'
        site.collections.each do |_label, collection|
          collection.docs.reject! { |doc| doc.data['draft'] }
        end
      end
    end
  end
end
