module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end

    def about_us
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end

    def product_brochures
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end

    def contact_us
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
