require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Array View
            class ArrayView < Html::AbstractCollectionView
              for_entity ::Array

              def glyph
                "\u279B"
              end

              protected

              def enumerator
                instance.each_with_index.map { |value, idx| [idx, value] }
              end

              def format_key(key)
                "[#{key.inspect}]"
              end
            end
          end
        end
      end
    end
  end
end
