module Postcodes
  module Query
    def query(postcode)
      query_postcode(postcode)
    end

    private

    def query_postcode(postcode)
      postcode = remove_whitespace(postcode)
      response = Excon.get("https://api.postcodes.io/postcodes?q=#{postcode}")

      process_response(response) do |r|
        return r['result'].map do |result|
          Postcodes::Postcode.new(result['result'])
        end
      end
    end

    def remove_whitespace(string)
      string.gsub(/\s+/, '')
    end

    def process_response(response, &block)
      unless response.status == 404
        yield JSON.parse(response.body)
      end
      nil
    end
  end
end
