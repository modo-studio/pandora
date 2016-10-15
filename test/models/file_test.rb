require_relative '../test_helper'
require 'yaml'

describe "App" do

  describe "initialization" do

    before :each do
      @yml = YAML.load_file('test/fixtures/.pandora.yml')
      @file = Pandora::Models::File.new(@yml)
    end

    describe "apps" do
      describe "first app" do
        it "should have the correct name" do
          assert_equal @file.apps[0].name, "iOS"
        end
        it "should have the correct project_path" do
          assert_equal @file.apps[0].project_path, "xxx.xcodeproj"
        end
        it "should have the correct workspace_path" do
          assert_equal @file.apps[0].workspace_path, "xxx.xcworkspace"
        end
        it "should have the correct target_name" do
          assert_equal @file.apps[0].target_name, "xxx"
        end
        it "should have the correct test_target_name" do
          assert_equal @file.apps[0].test_target_name,  "xxx"
        end
        it "should have the correct dependencies" do
          assert_includes @file.apps[0].dependencies, "Playback"
          assert_includes @file.apps[0].dependencies, "Search"
        end
      end

      describe "second app" do
        it "should have the correct name" do
          assert_equal @file.apps[1].name, "tvOS"
        end
        it "should have the correct project_path" do
          assert_equal @file.apps[1].project_path, "xcodeproj"
        end
        it "should have the correct workspace_path" do
          assert_equal @file.apps[1].workspace_path, "yyy.xcworkspace"
        end
        it "should have the correct target_name" do
          assert_equal @file.apps[1].target_name, "xxx"
        end

        it "shouldn't have a test_target_name" do
          assert_nil @file.apps[1].test_target_name
        end

        it "should have the correct dependencies" do
          assert_includes @file.apps[1].dependencies, "Playback"
          assert_includes @file.apps[1].dependencies, "Search"
        end
      end
    end

    describe "frameworks" do
      describe "first framework" do
        it "should have the correct name" do
          assert_equal @file.frameworks[0].name, "Core"
        end
        it "should have the correct project_path" do
          assert_equal @file.frameworks[0].project_path, "Frameworks/Core/Core.xcodeproj"
        end
      end
      describe "second framework" do
        it "should have the correct name" do
          assert_equal @file.frameworks[1].name, "UI"
        end
        it "should have the correct project_path" do
          assert_equal @file.frameworks[1].project_path, "Frameworks/UI/UI.xcodeproj"
        end
      end
      describe "third framework" do
        it "should have the correct name" do
          assert_equal @file.frameworks[2].name, "Playback"
        end
        it "should have the correct project_path" do
          assert_equal @file.frameworks[2].project_path, "Frameworks/Playback/Playback.xcodeproj"
        end
        it "should have the correct dependencies" do
          assert_includes @file.frameworks[2].dependencies, "UI"
          assert_includes @file.frameworks[2].dependencies, "Core"
        end
      end
      describe "fourth framework" do
        it "should have the correct name" do
          assert_equal @file.frameworks[3].name, "Search"
        end
        it "should have the correct project_path" do
          assert_equal @file.frameworks[3].project_path, "Frameworks/Search/Search.xcodeproj"
        end
        it "should have the correct dependencies" do
          assert_includes @file.frameworks[3].dependencies, "UI"
          assert_includes @file.frameworks[3].dependencies, "Core"
        end
      end
    end

  end

end