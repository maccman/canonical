module Canonical
  module CanonicalHelper
    def canonical(options = nil)
      href = url_for(options) if options
      href ||= request.request_uri.split('?').first
      href = "#{request.protocol}#{request.host_with_port}#{href}" unless href =~ /^\w+:\/\//
      tag(:link, :rel => 'canonical', :href => href)
    end
  end
end
