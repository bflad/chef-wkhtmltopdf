require 'spec_helper'

describe 'wkhtmltopdf::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
