require_relative '../test_helper'
require 'yaml'

describe "App" do
  describe "initialize" do

    context "when all the attributes are right" do

      before :each do
        @app = Pandora::Models::App.new("test", "test.xcodeproj", "test.xcworkspace", "target", "test", [])
      end

      it "should have the correct name" do
        assert_equal @app.name, "test"
      end

      it "should have the correct project path" do
        assert_equal @app.project_path, "test.xcodeproj"
      end

      it "should have the correct workspace path" do
        assert_equal @app.workspace_path, "test.xcworkspace"
      end

      it "should have the correct target name" do
        assert_equal @app.target_name, "target"
      end

      it "should have the correct test target name" do
        assert_equal @app.test_target_name, "test"
      end

      it "should have the correct dependencies" do
        assert_equal @app.dependencies, []
      end

    end

    context "when the project has a wrong format" do
      it "should raise an error" do
        assert_raises {
          Pandora::Models::App.new("test", "testasdgas", "test.xcworkspace", "target", "test", [])
        }
      end
    end

    context "when the workspace has a wrong format" do
      it "should raise an error" do
        assert_raises {
          Pandora::Models::App.new("test", "xasg.xcodeproj", "testasga", "target", "test", [])
        }
      end
    end

    context "when the dependencies have the wrong format" do
      it "should raise an error" do
        assert_raises {
          Pandora::Models::App.new("test", "ss.xcodeproj", "test.xcworkspace", "target", "test", nil)
        }
      end
    end

  end

  describe "self.from_yml" do

    before :each do
      @yml = {}
      @yml["project_path"] = "asga.xcodeproj"
      @yml["workspace_path"] = "asgas.xcworkspace"
      @yml["target_name"] = "target"
      @yml["test_target_name"] = "test"
    end

    context "when the project path is missing" do
      it "should assert" do
        @yml.delete "project_path"
        assert_raises {
          Pandora::Models::App.from_yml("name", @yml)
        }
      end
    end

    context "when the workspace path is missing" do
      it "should assert" do
        @yml.delete "workspace_path"
        assert_raises {
          Pandora::Models::App.from_yml "name", @yml
        }
      end
    end

    context "when the target name is missing" do
      it "should assert" do
        @yml.delete "target_name"
        assert_raises {
          Pandora::Models::App.from_yml "name", @yml
        }
      end
    end
  end

end
