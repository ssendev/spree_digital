require 'spec_helper'

describe Spree::Api::VariantsController do

  it "has unshippable in permitted attributes" do
    controller.permitted_variant_attributes.should include(:unshippable)
  end

end