require 'spec_helper'

describe Aws::Templates::Rendering::Utils::Svg::CompositeView do
  let(:structure) do
    Class.new(Aws::Templates::Artifact) do
      parameter :struct, transform: as_object {
        parameter :a
        parameter :b
      }
    end
  end

  let(:render) do
    klass = Aws::Templates::Composite.new(label: :labelname)

    struct = structure

    klass.components do
      artifact struct, label: 'render', struct: { a: 1, b: 1 }
    end

    klass
  end

  let(:rendered) do
    Aws::Templates::Rendering::Utils::Svg::Render.format(render)
  end

  it 'returns expected result' do
    expect { rendered }.not_to raise_error
  end
end
