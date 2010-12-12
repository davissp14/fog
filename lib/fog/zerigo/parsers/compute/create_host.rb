module Fog
  module Parsers
    module Zerigo
      module Compute

        class CreateHost < Fog::Parsers::Base

          def reset
            @host = {}
            @response = {}
          end

          def end_element(name)
            case name
            when 'id', 'priority', 'ttl', 'zone-id'
              @host[name] = @value.to_i
            when 'data', 'fqdn', 'host-type', 'hostname', 'notes', 'zone-id', 'created-at', 'updated-at'
              @host[name] = @value
            when 'host'
              @response['host'] = @host
            end
          end

        end

      end
    end
  end
end
