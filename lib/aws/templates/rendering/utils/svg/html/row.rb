require 'aws/templates/utils'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            # Row
            class Row < Html::Render
              attr_reader :content
              attr_reader :glyph
              attr_reader :level
              attr_reader :color

              def initialize(content, glyph, level, color)
                @content = content
                @glyph = glyph
                @level = level
                @color = color
              end

              def to_html(port)
                Html.tag(
                  'tr', {}, row_attrs(port)
                )
              end

              def font_attrs
                Html.tag(
                  'font',
                  {
                    color: 'black',
                    face: 'courier'
                  },
                  "#{' ' * level}#{glyph}#{content}"
                )
              end

              def row_attrs(port)
                Html.tag(
                  'td',
                  {
                    port: "f#{port}",
                    bgcolor: color,
                    border: 0,
                    align: 'left'
                  },
                  font_attrs
                )
              end
            end
          end
        end
      end
    end
  end
end
