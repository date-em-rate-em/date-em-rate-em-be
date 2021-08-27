require 'rails_helper'

RSpec.describe DateEmRateEmBeSchema do
  it 'matches the dumped schema (rails graphql:schema:dump)' do
    aggregate_failures do
      expect(described_class.to_definition).to eq(File.read(Rails.root.join('schema.graphql')))

      expect(described_class.to_json).to eq(File.read(Rails.root.join('schema.json')).strip)
    end
  end
end