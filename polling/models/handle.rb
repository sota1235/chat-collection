require 'cgi'

class Handler
  def getter
    f = open("./models/comments.txt", "r")
    res = ""
    f.each {|line|
      res = line + res
    }
    f.close
    return res
  end

  def writer(comment)
    f = open("./models/comments.txt", "a")
    f.write("<p>" + Time.now.to_s[0..-7] + ":" + CGI.escapeHTML(comment) + "</p>\n")
    f.close
  end
end
