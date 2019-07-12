require 'aws/templates/utils'
require 'gv'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          #
          # Comopsite View
          class CompositeView < View
            using Templates::Utils::Dependency::Refinements

            for_entity Aws::Templates::Composite

            def html_parameters
              { transparent: true }
            end

            def to_processed
              components = instance.artifacts.values

              return subgraph if components.empty?

              invisible_edge

              build_edges if instance.parent.nil?

              subgraph
            end

            def invisible_edge
              components = instance.artifacts.values
              components.inject(nil) do |previous, child|
                current = rendered_for(child)

                unless child.is_a?(Aws::Templates::Composite)
                  graph.edge(nil, previous, current, style: 'invis') unless previous.nil?
                  current
                end
              end
            end

            def subgraph
              @subgraph ||= graph.sub_graph(
                "cluster_#{name}",
                label: graph.html(html.format(instance)),
                labeljust: 'l',
                style: 'filled, bold, rounded',
                gradientangle: 90,
                fillcolor: 'darkorchid:honeydew',
                id: name
              )
            end

            def build_edges
              instance.artifacts.values.each { |o| handler_for(o).build_edges }
            end
          end
        end
      end
    end
  end
end
