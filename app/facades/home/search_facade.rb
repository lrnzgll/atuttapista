# frozen_string_literal: true
module Home
  class SearchFacade
    attr_reader :routes
    def initialize(routes)
      @routes = routes
    end
  end
end
