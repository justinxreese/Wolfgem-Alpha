require 'net/http'

class WolframQuery

  attr_accessor 	:return, :request_url, :error,
        		:appid, :input, :format, :assumptions # :assumption is an array

  $base_url = 'http://api.wolframalpha.com/v2/query?'
  $valid_formats = %w[image html cell text mathml minput moutput sound wav]
  $NO_APP_ID_ERROR = "Error: No App ID was provided"
  $NO_INPUT_ERROR = "Error: No input was provided"
  $QUERY_FAILURE_ERROR = "Error: Something went wrong sending the request to Wolfram!!!!"

  # Build the API request url with the values assigned to the WolframQuery object
  def build_url
    url = $base_url
    if !self.appid || self.appid.nil? || self.appid.empty?
      self.error = $NO_APP_ID_ERROR 
      return false
    else
      url = url+"appid="+self.appid
    end
    if !self.input || self.input.nil? || self.input.empty?
      self.error = $NO_INPUT_ERROR
      return false
    else
      url = url+"&input="+self.input
    end
    url = url+"&format="+self.format unless self.format.nil? || self.format.empty?
    if self.assumptions
      self.assumptions.each do |assump| 
        url = url+"&assumption="+assump unless assump.nil? || assump.empty?
      end
    end
    self.request_url = url
  end

  # Use the request url created by build_url to make a call to the Wolfram API
  def query
    begin
      self.return = Net::HTTP.get_response(URI.parse(self.request_url)).body
      return self.return
    rescue
      self.error = $QUERY_FAILURE_ERROR
      return false
    end
  end

  # Build the url and send the request in one step
  def go
    self.build_url
    return self.query
  end

end
