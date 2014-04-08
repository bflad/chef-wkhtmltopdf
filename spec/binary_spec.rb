require 'spec_helper'

describe 'wkhtmltopdf::binary' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end
