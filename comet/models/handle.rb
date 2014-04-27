require 'cgi'
require 'json'

class Handler
  def getter
    f = open("./models/comments.txt", "r")
    res = Array.new
    res2 = Hash.new
    f.each {|line|
      tmp = line.split("::")
      res.push({"name" => tmp[0], "date" => tmp[1], "comment" => tmp[2].sub("\n", "")})
    }
    f.close
    res2['line'] = res
    return res2
  end

  def writer(name, comment)
    f = open("./models/comments.txt", "a")
    f.write(CGI.escapeHTML(name) + "::" + Time.now.to_s[0..-7] + "::" + CGI.escapeHTML(comment) + "\n")
    f.close
  end

  def get_timestamp
    f = "./models/comments.txt"
    s = File.stat(f)
    return s.mtime
  end
end
