require 'spec_helper'

describe ApplicationHelper do
  describe "flash_message" do
    describe "notice" do
      subject { flash_message(:notice, "test") }

      it "returns alert-success" do
        subject.should == "<p class=\"alert alert-success\">test</p>"
      end
    end

    describe "alert" do
      subject { flash_message(:alert, "test") }

      it "returns alert-warning" do
        subject.should == "<p class=\"alert alert-warning\">test</p>"
      end
    end

    describe "error" do
      subject { flash_message(:error, "test") }

      it "returns alert-danger" do
        subject.should == "<p class=\"alert alert-danger\">test</p>"
      end
    end
  end
end
