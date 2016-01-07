require "countries/version"

require 'iso3166'

class Country < ISO3166::Country

  ACCEPTED_JURISDICTIONS = [
    'GBR','AUT','AUS','BRB','BEL','BGR','CAN','IMN','CZE','DNK','EST','FIN','FRA',
    'DEU','GRC','HKG','HUN','ISL','ITA','JPN','LVA','LIE','LTU','LUX','NLD','NZL',
    'NOR','PRT','POL','IRL','ROU','SGP','SVK','SVN','ESP','SWE','CHE',
  ]

end
