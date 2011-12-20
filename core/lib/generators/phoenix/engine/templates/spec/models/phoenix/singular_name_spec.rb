require 'spec_helper'

module Phoenix
  describe <%= class_name %> do
    describe "validations" do
      subject do
        FactoryGirl.create(:<%= singular_name %><% if (title = attributes.detect { |a| a.type.to_s == "string" }).present? -%>,
        :<%= title.name %> => "Phoenix CMS"<% end %>)
      end

      it { should be_valid }
      its(:errors) { should be_empty }
<% if title -%>
      its(:<%= title.name %>) { should == "Phoenix CMS" }
<% end -%>
    end
  end
end
