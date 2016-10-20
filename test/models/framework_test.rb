require_relative '../test_helper'

describe "Framework" do
  describe "initialize" do

    context "when all the attributes are right" do
      before :each do
        @framework = Pandora::Models::Framework.new("name", "project.xcodeproj", [])
      end
      it "should have the correct name" do
        assert_equal @framework.name, "name"
      end
      it "should have the correct project path" do
        assert_equal @framework.project_path, "project.xcodeproj"
      end
      it "should have the correct dependencies" do
        assert_equal @framework.dependencies, []
      end
    end

    context "when the project path has a wrong format" do
      it "should raise an error" do
        assert_raises {
          Pandora::Models::Framework.new("name", "asdgasa", [])
        }
      end
    end

  end

  describe "self.from_yml" do

    before :each do
      @yml = {}
      @yml["project_path"] = "project.xcodeproj"
    end

    context "when it doesn't include a project path" do
      it "should assert" do
        @yml.delete "project_path"
        assert_raises {
          Pandora::Models::Framework.from_yml "name", @yml
        }
      end
    end

    context "when it has the correct properties" do
      before :each do
        @framework = Pandora::Models::Framework.from_yml "name", @yml
      end

      it "should have the correct project_path" do
        assert_equal @framework.project_path, "project.xcodeproj"
      end

      it "should have the correct dependencies" do
        assert_equal @framework.dependencies, []
      end
    end

  end
end
