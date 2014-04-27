require 'cgi'
require 'json'

class Handler
  def getter
    f = open("./models/comments.txt", "r")
    res = {}
    f.each {|line|
      tmp = line.split("::")
      res[tmp[0]] = tmp[1]
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
