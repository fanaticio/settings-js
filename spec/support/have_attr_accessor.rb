RSpec::Matchers.define :have_attr_accessor do |attribute_name|
  match do |subject|
    subject.respond_to?(attribute_name) && subject.respond_to?("#{attribute_name}=")
  end
end
