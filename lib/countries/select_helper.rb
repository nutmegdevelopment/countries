# CountrySelect - stolen from http://github.com/rails/iso-3166-country-select
module ActionView
  module Helpers
    module FormOptionsHelper

      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_countries, options, html_options)
      end

      def country_options_for_select(selected = nil, priority_countries = nil, reject: ['USA'])
        country_names = ISO3166::Country::Alpha3_Names.reject { |country| country[1].in? reject }
        country_options = "".html_safe

        if priority_countries
          priority_countries = [*priority_countries].map {|x| [x.html_safe,ISO3166::Country::Alpha3_NameIndex[x]] }
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        end

        return country_options + options_for_select(country_names, selected)
      end
    end

    class InstanceTag
      def to_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = options.delete(:selected) || value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_countries),
            options, value
          ), html_options
        )
      end
    end

    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end
