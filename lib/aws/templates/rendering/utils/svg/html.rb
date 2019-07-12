require 'aws/templates/rendering/utils/svg/html/render'
require 'aws/templates/rendering/utils/svg/html/array_view'
require 'aws/templates/rendering/utils/svg/html/hash_view'
require 'aws/templates/rendering/utils/svg/html/parameterized_view'
require 'aws/templates/rendering/utils/svg/html/default_view'
require 'aws/templates/rendering/utils/svg/html/dependency_view'
require 'aws/templates/rendering/utils/svg/html/artifact_view'
require 'aws/templates/rendering/utils/svg/html/composite_view'
require 'cgi'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          #
          # HTML
          module Html
            def self.tag(name, parameters, content)
              %(<#{name} #{tag_parameters(parameters)}>#{content}</#{name}>)
            end

            def self.tag_parameters(parameters)
              parameters.map { |name, value| "#{name}='#{value}'" }.join(' ')
            end

            def self.bold(content)
              tag('b', {}, content)
            end

            def self.escape(obj)
              CGI.escape_html(obj.to_s)
            end
          end
        end
      end
    end
  end
end
