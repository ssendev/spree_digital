Spree::Api::VariantsController.class_eval do
  def permitted_variant_attributes
    super << :unshippable
  end
end
