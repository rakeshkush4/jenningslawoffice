module Jekyll
  class IgnoreEmptyFrontMatter < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      site.documents.each do |doc|
        doc.data.each do |key, value|
          if value == ""
            doc.data.delete(key)
          end
        end
      end
    end
  end
end
