require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Dependency View
            class DependencyView < Html::View
              for_entity Aws::Templates::Utils::Dependency::Wrapper

              def delegate
                handler_for(instance.object)
              end

              def nested?
                delegate.nested?
              end

              def glyph
                delegate.glyph
              end

              def to_processed
                delegate.to_processed
              end
            end
          end
        end
      end
    end
  end
end
