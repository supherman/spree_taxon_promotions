module Spree
  class Promotion
    module Rules
      class Taxon < PromotionRule
        has_and_belongs_to_many :taxons,
                                foreign_key: 'promotion_rule_id',
                                join_table: 'spree_taxons_promotion_rules',
                                class_name: '::Spree::Taxon'

        attr_accessible :taxons, :taxon_ids_string

        def eligible?(order, options = {})
          order.products.any? {|p| Spree::Product.in_taxons(taxons).include?(p) }
        end

        def taxon_ids_string
          taxon_ids.join(',')
        end

        def taxon_ids_string=(s)
          self.taxon_ids = s.to_s.split(',').map(&:strip)
        end
      end
    end
  end
end
