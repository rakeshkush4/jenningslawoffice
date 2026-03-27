module Jekyll
    module FutureFilter
      def remove_future(items)
        items.reject { |item| item.date > Time.now }
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::FutureFilter)  