require File.expand_path("../../../spec_helper", __FILE__)

describe Radiant::Exporter do
  dataset :pages_with_layouts, :users_and_pages
  
  let(:exporter){ Radiant::Exporter }
  let(:exported_content){ exporter.export }
  let(:exported_hash){ YAML::load(exported_content) }
  subject { exporter }
  
  specify{ exported_content.should be_kind_of(String) }
  
  it "should output all exportable_models with pluralized class names as keys" do
    exporter.exportable_models.all? { |c| exported_hash.has_key?(c.to_s.pluralize) }.should be_true
  end
  
  it "should output the models by id as hashes" do
    exported_hash['Pages'][page_id(:home)]['title'].should == pages(:home).title
    exported_hash['Users'][user_id(:admin)]['name'].should == users(:admin).name
  end
  
  its(:exportable_models){ should == [Radiant::Config, User, Page, PagePart, PageField, Layout] }
  its(:template_models){ should == [Layout, Page, PagePart, PageField] }
  its(:ignored_template_attributes){ should == [:lock_version, :created_at, :updated_at, :created_by_id, :updated_by_id] }
  it "should allow setting exportable_models" do
    exporter.exportable_models = [Page]
    exporter.exportable_models.should == [Page]
  end
end