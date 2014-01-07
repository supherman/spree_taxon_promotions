require 'spec_helper'

describe Spree::Promotion::Rules::Taxon do
  describe 'eligible?' do
    let!(:taxon) { create(:taxon) }
    let!(:product) { create(:product, name: 'foo', taxons: [taxon]) }

    before do
      rule = Spree::Promotion::Rules::Taxon.create taxons: [taxon]
      order = create(:order)
      create(:line_item, order: order, variant: product.master)
    end

    specify 'the promotion is eligible is one product of an order is in the given taxon' do
      expect(rule.eligible?(order.reload)).to be_true
    end
  end
end