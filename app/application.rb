class Application

  def call(env)
    @resp = Rack::Response.new
    @req = Rack::Request.new(env)

    if !@req.path.match(/items/)
      @resp.write "Route not found"
      @resp.status = 404
    elsif @req.path.match(/items/)
      url_ending = @req.path.split("/").last
      if Item.names.keys.include?(url_ending)
        @resp.write "#{Item.names[url_ending].price}"
      else
        @resp.write "Item not found"
        @resp.status = 400
      end
    end
    # binding.pry
    @resp.finish
  end

end
