# https://github.com/spree/spree/issues/1439
require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class Unshippable < Spree::Calculator::Shipping::FlatRate
      def self.description
        Spree.t(:unshippable, scope: 'digital')
      end

      def compute(object=nil)
        self.preferred_amount
      end

      def available?(package)
        package.contents.all? { |content| content.variant.unshippable? }
      end
    end
  end
end
