require 'cgi'
require 'json'

class Handler
  def getter
    f = open("./models/comments.txt", "r")
    res = Array.new
    f.each {|line|
      tmp = line.split("::")
      obj = Hash.new
      obj['date'] = tmp[0]
      obj['comment'] = tmp[1]
      res.push(obj)
    }
    f.close
    return res.to_json
  end

  def writer(comment)
    f = open("./models/comments.txt", "a")
    f.write(Time.now.to_s[0..-7] + "::" + CGI.escapeHTML(comment) + "\n")
    f.close
  end
end
