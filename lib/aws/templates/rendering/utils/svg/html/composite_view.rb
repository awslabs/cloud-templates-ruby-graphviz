require 'aws/templates/utils'
require 'set'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Composite View
            class CompositeView < Html::ParameterizedView
              for_entity Aws::Templates::Composite
            end
          end
        end
      end
    end
  end
end
