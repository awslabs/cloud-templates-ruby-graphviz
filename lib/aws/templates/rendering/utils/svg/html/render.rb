require 'aws/templates/utils'
require 'gv'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Render
            class Render < Aws::Templates::Rendering::Render
              include Aws::Templates::Utils::Parametrized

              default background_color: proc { transparent ? 'transparent' : 'oldlace' }

              def self.getter
                as_is
              end

              parameter :background_color,
                        description: 'HTML background color',
                        transform: as_string,
                        constraint: not_nil

              parameter :transparent,
                        description: 'If HTML should be transparent',
                        transform: as_boolean

              parameter :is_compact,
                        description: 'Compact mode',
                        transform: as_boolean

              def formatted_for(rows)
                Html.tag(
                  'table',
                  { border: 0, cellspacing: 0, style: 'rounded' },
                  rows.compact.each_with_index.map { |r, i| r.to_html(i) }.join("\n")
                )
              end

              def simple_row(name, content, level, glyph)
                [
                  Html::Row.new(
                    "#{Html.bold(
                      Html.escape(name)
                    )}: #{content}", glyph, level, background_color
                  )
                ]
              end

              def nested_row(name, content, level, glyph)
                [
                  Html::Row.new(
                    Html.bold(
                      Html.escape(name)
                    ), glyph, level, background_color
                  ),
                  content
                ].flatten
              end
            end
          end
        end
      end
    end
  end
end
