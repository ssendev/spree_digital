require 'spec_helper'

describe Spree::Variant do

  context "#destroy" do
    let(:variant) { create(:variant) }
    let!(:digital) { create(:digital, variant: variant) }

    it "should destroy associated digitals by default" do
      # default is false
      Spree::DigitalConfiguration[:keep_digitals] = false

      Spree::Digital.count.should == 1
      variant.digitals.present?.should be_true
      variant.deleted_at = Time.now
      variant.deleted?.should be_true
      variant.save!
      expect { digital.reload.present? }.to raise_error
      Spree::Digital.count.should == 0
    end

    it "should conditionally keep associated digitals" do
      Spree::DigitalConfiguration[:keep_digitals] = true

      Spree::Digital.count.should == 1
      variant.digitals.present?.should be_true
      variant.deleted_at = Time.now
      variant.save!
      variant.deleted?.should be_true
      expect { digital.reload.present? }.to_not raise_error
      Spree::Digital.count.should == 1
    end
  end

  context "#save" do
    let(:variant) { create(:variant) }

    it "should set unshippable?" do
      variant.unshippable?.should be_false
      variant.unshippable = true
      variant.save!
      variant.unshippable?.should be_true
    end
  end
end
