require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Parameterized View
            class ParameterizedView < Html::AbstractCollectionView
              for_entity Aws::Templates::Utils::Parametrized::Nested

              def glyph
                "\u27A2"
              end

              protected

              def mapper(name, value)
                return super if (name.to_s != 'parent') && (name.to_s != 'root')

                parent.simple_row(name, Html.escape(value.to_s), level, "\u27AA")
              end

              def enumerator
                instance.parameters_map.reject { |_, value| value.nil? }
              end

              def format_key(name)
                name.to_s
              end
            end
          end
        end
      end
    end
  end
end
