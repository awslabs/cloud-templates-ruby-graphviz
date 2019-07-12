require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Default View
            class DefaultView < Html::View
              for_entity ::Object

              def glyph
                "\u2218"
              end

              def to_processed
                Html.escape(instance.to_s)
              end
            end
          end
        end
      end
    end
  end
end
