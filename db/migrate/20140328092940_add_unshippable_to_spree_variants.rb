class AddUnshippableToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :unshippable, :boolean
  end
end
