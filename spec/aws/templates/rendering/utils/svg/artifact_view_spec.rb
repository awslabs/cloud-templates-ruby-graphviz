require 'spec_helper'

describe Aws::Templates::Rendering::Utils::Svg::ArtifactView do
  let(:something) { Aws::Templates::Artifact.new(label: 'rocks') }

  let(:rendered) { Aws::Templates::Rendering::Utils::Svg::Render.format(something) }

  it 'returns expected result' do
    expect { rendered }.not_to raise_error
  end
end
