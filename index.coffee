fs = require "fs"
text = fs.readFileSync "./blog.md","utf8"
marked = require "marked"
renderer = new marked.Renderer()

#code tag
renderer.codespan = (text) ->
  "<code class=\"command\">#{text}</code>"

#h tag
renderer.heading = (text, level, raw) ->
  "\n\n<h#{level}>#{text}</h#{level}>\n"

#pre tag
renderer.code = (code, lang, escaped) ->
  type = "code"
  if lang
    langtype = lang.split(".")[1]
    if langtype is "js"
      type = "javascript"
    else if langtype is "php"
      type = "php"
    else if langtype is "html"
      type = "html"
    else if langtype is "css"
      type = "css"
    else if langtype is "xml"
      type = "xml"
    # else if langtype is "coffee"
    #   type = "coffeescript" q
  "\n[#{type}]\n#{code}\n[/#{type}]\n\n"

#image tag
renderer.image = (href, title, text) ->
  "<img src=\"#{href}\" alt=\"#{text}\" width=\"655px\" />"

#link tag 外部リンクは_blankで
renderer.link = (href, title, text) ->
  host = href.split("/")[2]
  if host isnt 'liginc.co.jp'
    target = ' target="_blank"'
  "<a href=\"#{href}\"#{target}>#{text}</a>"

console.log marked text, renderer: renderer
