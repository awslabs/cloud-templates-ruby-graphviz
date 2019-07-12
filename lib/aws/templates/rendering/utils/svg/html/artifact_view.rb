require 'aws/templates/utils'
require 'set'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Artifact View
            class ArtifactView < Html::ParameterizedView
              for_entity Aws::Templates::Artifact

              COMPACT_VIEW_FIELDS = %w[label parent path].to_set.freeze

              protected

              def mapper(name, value)
                super if !parent.is_compact || COMPACT_VIEW_FIELDS.include?(name.to_s)
              end
            end
          end
        end
      end
    end
  end
end
