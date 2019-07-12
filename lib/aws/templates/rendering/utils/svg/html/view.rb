require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # View
            class View < Aws::Templates::Rendering::BasicView
              register_in Svg::Html::Render

              def glyph
                raise 'glyph must be redefined'
              end

              def nested?
                false
              end

              def parameters
                @parameters ||= 0
              end

              alias level parameters
            end
          end
        end
      end
    end
  end
end
