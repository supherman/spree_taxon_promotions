class CreateSpreeTaxonsPromotionRules < ActiveRecord::Migration
  def change
    create_table :spree_taxons_promotion_rules do |t|
      t.integer :taxon_id
      t.integer :promotion_rule_id
    end

    add_index :spree_taxons_promotion_rules, :taxon_id
    add_index :spree_taxons_promotion_rules, :promotion_rule_id
  end
end
