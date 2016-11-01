require 'spec_helper'

describe Postcodes::IO do

  let(:base_url) { 'https://api.postcodes.io' }
  let(:stub_query_response) { File.read('spec/fixtures/query_response.json') }

  describe '#query' do

    before :each do
      stub_request(:get, "#{base_url}/postcodes?q=L20")
          .to_return(status: 200, body: stub_query_response)
    end

    let(:input) { 'L20' }
    let(:output) { subject.query(input) }

    it 'requests a postcodes' do
      output
      WebMock.should have_requested(:get, "#{base_url}/postcodes?q=L20")
    end

  end

end
