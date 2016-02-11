require "countries/version"

require 'iso3166'

class Country < ISO3166::Country

  # Returns eg. [{ id: 'GBR', name: 'United Kingdom'}, ..., { id: 'ITA', name: 'Italy'}, ...]
  def self.iso3_to_dropdown(starting_countries = nil)
    starting_countries ||= {
      'United Kingdom' => 'GBR',
    }
    countries = starting_countries.merge(Country::Alpha3_NameIndex)
    countries.map do |v,k|
      { id: k, name: v }
    end
  end

end
