require 'breadcrumbs_on_rails'

module MicrodataBreadcrumbs
  module Microdata
    class Builder < BreadcrumbsOnRails::Breadcrumbs::Builder
      def render
        @elements.collect(&method(:render_element)).join(@options[:separator] || " &raquo; ")
      end

      def render_element(element)
        url = (compute_path(element).present? ? compute_path(element) : '#')
        subcontent = @context.content_tag(:span, compute_name(element), :itemprop => 'name')
        content = @context.link_to_unless_current(subcontent, url, :itemprop => 'item')
        @context.content_tag(:li, content, itemscope: "", itemprop: "itemListElement", itemtype: "http://schema.org/ListItem")
      end
    end
  end
end