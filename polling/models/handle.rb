require 'cgi'

class Handler
  def getter
    f = open("./models/comments.txt", "r")
    res = ""
    f.each {|line|
      res += "<p>"+ Time.now + " :" + CGI.escapeHTML(line) + "</p>"
    }
    f.close
    return res
  end

  def writer(comment)
    f = open("./models/comments.txt", "w")
    f.write(comment)
    f.close
  end
end
