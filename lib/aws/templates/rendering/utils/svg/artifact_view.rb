require 'aws/templates/utils'
require 'gv'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          #
          # Artifact view
          class ArtifactView < View
            using Templates::Utils::Dependency::Refinements
            for_entity Aws::Templates::Artifact

            def html_parameters
              { is_compact: parent.is_compact }
            end

            def to_processed
              graph_node
            end

            def build_edges
              edge.each do |h|
                graph.edge(
                  nil,
                  graph_node,
                  h.to_processed,
                  style: 'bold', penwidth: 5, color: 'transparent',
                  id: "#{name}@#{h.name}"
                )
              end
            end

            def edge
              # rubocop:disable Style/SymbolProc
              instance.parameters_map.values
                      .select { |v| v.dependency? }
                      .map { |v| v.links.to_a }
                      .flatten
                      .uniq
                      .map { |o| handler_for(o) }
              # rubocop:enable Style/SymbolProc
            end
          end
        end
      end
    end
  end
end
