Spree::Taxon.class_eval do
  has_and_belongs_to_many :promotion_rules, join_table: :spree_taxons_promotion_rules
end