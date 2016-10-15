require_relative '../test_helper'
require 'yaml'

describe "App" do

  describe "initialization" do

    before :each do
      @yml = YAML.load_file('test/fixtures/.pandora.yml')
      @file = Pandora::Models::File.new(@yml)
    end

    it "should have the correct number of apps" do
      assert @file.apps.count == 2
    end

  end

end