require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Hash View
            class HashView < Html::AbstractCollectionView
              for_entity ::Hash

              def glyph
                "\u2799"
              end

              protected

              def enumerator
                instance
              end

              def format_key(key)
                "{#{key.inspect}}"
              end
            end
          end
        end
      end
    end
  end
end
