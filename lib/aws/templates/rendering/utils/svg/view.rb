require 'aws/templates/utils'
require 'gv'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          #
          # View
          class View < Aws::Templates::Rendering::BasicView
            register_in Svg::Render

            protected

            def graph
              @graph ||= if instance.parent.nil?
                create_graph
              else
                handler_for(instance.parent).subgraph
              end
            end

            def html_parameters; end

            def html
              @html ||= Svg::Html::Render.new(html_parameters)
            end

            def graph_node
              hsh = {
                shape: 'rect',
                label: graph.html(html.format(instance)),
                style: 'bold, filled, rounded', fillcolor: 'oldlace',
                id: name
              }

              hsh[:href] = instance.to_hyperlink if instance.respond_to?(:to_hyperlink)

              graph.node(name, hsh)
            end

            def name
              instance.lookup_path.join('/')
            end

            private

            def create_graph
              graph = GV::Graph.open('g', :directed, :strict)
              graph[:splines] = 'ortho'
              graph
            end
          end
        end
      end
    end
  end
end
