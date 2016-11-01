require "postcodes_io/version"
require "postcodes_io/lookup"
require "postcodes_io/query"
require "postcodes_io/postcode"

module Postcodes
  class IO
    include Lookup
    include Query
  end
end
