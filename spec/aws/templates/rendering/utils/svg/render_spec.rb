require 'spec_helper'
require 'pp'

describe Aws::Templates::Rendering::Utils::Svg::Render do
  let(:structure) do
    Class.new(Aws::Templates::Artifact) do
      parameter :struct, transform: as_object {
        parameter :a
        parameter :b
      }
    end
  end

  let(:something1) do
    klass = Aws::Templates::Composite.new(label: :labelname)

    struct = structure

    klass.components do
      artifact struct, label: 'a', struct: { a: 1, b: 1 }
      artifact struct, label: 'b', struct: { a: 1, b: 1 }
      artifact Aws::Templates::Composite, label: 'c' do
        artifact struct, label: 'd', struct: { a: 1, b: 1 }
        artifact struct, label: 'e', struct: { a: 1, b: 1 }
        artifact Aws::Templates::Composite, label: 'f' do
          artifact struct, label: 'g', struct: { a: 1, b: 1 }
          artifact Aws::Templates::Composite, label: 'h' do
            4.times { |i| artifact struct, label: i, struct: { a: 1, b: 1 } }
          end
          artifact struct, label: 'i', struct: { a: 1, b: 1 }
        end
      end
    end

    return klass
  end

  let(:something2) do
    klass = Aws::Templates::Composite.new(label: :labelname)

    struct = structure

    klass.components do
      artifact Aws::Templates::Composite, label: 'a' do
        artifact struct, label: 'b', struct: { a: 1, b: 1 }
        artifact Aws::Templates::Composite, label: 'c' do
          artifact struct, label: 'd', struct: { a: 1, b: 1 }
          artifact struct, label: 'e', struct: { a: 1, b: 1 }
          artifact Aws::Templates::Composite, label: 'f' do
            artifact struct, label: 'g', struct: { a: 1, b: 1 }
            artifact Aws::Templates::Composite, label: 'h' do
              4.times { |i| artifact struct, label: i, struct: { a: 1, b: 1 } }
            end
          end
          artifact struct, label: 'i', struct: { a: 1, b: 1 }
        end

        artifact struct, label: 'j', struct: { a: 1, b: 1 }
        artifact Aws::Templates::Composite, label: 'k' do
          artifact struct, label: 'l', struct: { a: 1, b: 1 }
          artifact struct, label: 'm', struct: { a: 1, b: 1 }
          artifact Aws::Templates::Composite, label: 'n' do
            artifact struct, label: 'o', struct: { a: 1, b: 1 }
            artifact Aws::Templates::Composite, label: 'p' do
              4.times { |i| artifact struct, label: i, struct: { a: 1, b: 1 } }
            end
            artifact struct, label: 'q', struct: { a: 1, b: 1 }
          end
        end
      end
    end

    klass
  end

  let(:rendered2) do
    described_class.format(something2)
  end

  let(:rendered1) do
    described_class.format(something1)
  end

  it 'returns expected result' do
    expect { rendered1 }.not_to raise_error
  end

  it 'returns expected result for class-based components definition' do
    expect { rendered2 }.not_to raise_error
  end
end
