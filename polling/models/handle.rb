require 'cgi'
require 'json'

class Handler
  def getter
    f = open("./models/comments.txt", "r")
    res = Array.new
    res2 = Hash.new
    f.each {|line|
      tmp = line.split("::")
      res.push({"date" => tmp[0], "comment" => tmp[1].sub("\n", "")})
    }
    f.close
    res2['line'] = res
    return res2
  end

  def writer(comment)
    f = open("./models/comments.txt", "a")
    f.write(Time.now.to_s[0..-7] + "::" + CGI.escapeHTML(comment) + "\n")
    f.close
  end
end
