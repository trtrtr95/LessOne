require 'spec_helper'

describe "Pages" do

	let(:title) {"Тестовый сайт"}

  describe "GET /pages" do
    it {should have_content('new')}
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pages_index
      response.status.should be(200)

  end
end
