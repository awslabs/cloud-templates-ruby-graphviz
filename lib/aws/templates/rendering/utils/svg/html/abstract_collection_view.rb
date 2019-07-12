require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Abstract Collection View
            class AbstractCollectionView < Html::View
              def nested?
                true
              end

              def to_processed
                enumerator.map { |key, value| mapper(key, value) }.flatten.compact
              end

              protected

              def mapper(name, value)
                view = handler_for(value, level + 5)
                content = view.to_processed
                row(view, content, name, level)
              end

              def row(view, content, name, level)
                if view.nested?
                  parent.nested_row(format_key(name), content, level, view.glyph)
                else
                  parent.simple_row(format_key(name), content, level, view.glyph)
                end
              end

              def enumerator
                raise 'Must be overriden'
              end

              def format_key
                raise 'Override array subclass'
              end
            end
          end
        end
      end
    end
  end
end
