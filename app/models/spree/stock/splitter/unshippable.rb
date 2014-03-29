module Spree
  module Stock
    module Splitter
      class Unshippable < Base
        def split(packages)
          split_packages = []
          packages.each do |package|
            split_packages += split_by_unshippable(package)
          end
          return_next split_packages
        end

        private
        def split_by_unshippable(package)
          unshippables = Hash.new { |hash, key| hash[key] = [] }
          package.contents.each do |item|
            unshippables[item.variant.unshippable?] << item
          end
          hash_to_packages(unshippables)
        end

        def hash_to_packages(unshippables)
          packages = []
          unshippables.each do |id, contents|
            packages << build_package(contents)
          end
          packages
        end
      end
    end
  end
end
