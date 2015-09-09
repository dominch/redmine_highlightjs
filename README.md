# HighlightJS Plugin 

A redmine plugin to highlight code blocks much better than coderay! :) 
135 languages with autodetection feature, 65 color themes, multi language code highlight (like http+json) 
Try Your language and choose best theme for You: https://highlightjs.org/static/demo/

It's very easy to use because it works automatically :) finds blocks of code, detects a language (one or more!), highlights it.

Supported languages and markups in build: 1c accesslog actionscript apache applescript armasm asciidoc aspectj autohotkey autoit avrasm axapta bash brainfuck cal capnproto ceylon clojure clojure-repl cmake coffeescript cpp crystal cs css d markdown dart delphi diff django dns dockerfile dos dust elixir elm ruby erb erlang-repl erlang fix fortran fsharp gams gcode gherkin glsl go golo gradle groovy haml handlebars haskell haxe http inform7 ini irpf90 java javascript json julia kotlin lasso less lisp livecodeserver livescript lua makefile mathematica matlab mel mercury mizar perl mojolicious monkey nginx nimrod nix nsis objectivec ocaml openscad oxygene parser3 pf php powershell processing profile prolog protobuf puppet python q r rib roboconf rsl ruleslanguage rust scala scheme scilab scss smali smalltalk sml sql stata step21 stylus swift tcl tex thrift tp twig typescript vala vbnet vbscript vbscript-html verilog vhdl vim x86asm xml xl xquery zephir


# Install

1. Follow the Redmine plugin installation steps at: http://www.redmine.org/wiki/redmine/Plugins
1. Make sure the plugin installation directory name is <tt>redmine_highlighjs</tt>
1. Restart the server (this will ensure that the CSS file and other assets are copied to the right place)
1. (optional) Configure color theme in Administration -> Plugins -> HighlightJS

# Usage

This plugin will replace existing Coderay highlights, 
You can specify target language like usual: 

<pre><code class="json">
<pre><code class="json">
[
  {
    "title": "apples",
    "count": [12000, 20000],
    "description": {"text": "...", "sensitive": false}
  },
  {
    "title": "oranges",
    "count": [17500, null],
    "description": {"text": "...", "sensitive": false}
  }
]
</code></pre>
</code></pre>

or use autodetection: 

<pre><code>
<pre><code>
[
  {
    "title": "apples",
    "count": [12000, 20000],
    "description": {"text": "...", "sensitive": false}
  },
  {
    "title": "oranges",
    "count": [17500, null],
    "description": {"text": "...", "sensitive": false}
  }
]
</code></pre>
</code></pre>

Autodetection works great with more than one language on the board, like http with appliction/json body: 

<pre><code>
<pre><code>
POST /task?id=1 HTTP/1.1
Host: example.org
Content-Type: application/json; charset=utf-8
Content-Length: 19

{"status": "ok", "extended": true}
</code></pre>
</code></pre>


To disable highlighting altogether use the nohighlight class:

<pre><code class="nohighlight">...</code></pre>

Plugin additionaly trims white lines from start and end so  

<pre><code>
<pre><code>{"status": "ok", "extended": true}</code></pre>
</code></pre>

is equal to: 

<pre><code>
<pre><code>
{"status": "ok", "extended": true}
</code></pre>
</code></pre>

# Build Your own HighlightJS version

If You need subset of supported languages follow instruction on highlightJS site: http://highlightjs.readthedocs.org/en/latest/building-testing.html
Just replace redmine_highlightjs/assets/javascript/highlight.pack.min.js with Your build 

For Your new language definition follow instructions here: http://highlightjs.readthedocs.org/en/latest/language-guide.html

# FAQ: 

### Line numbers? 

No, that probably never happens! http://highlightjs.readthedocs.org/en/latest/line-numbers.html


# License

This plugin is licensed under the GNU GPL v2.  See <tt>COPYRIGHT.txt</tt> and <tt>GPL.txt</tt> for details.

# Project help, bugs

If you need help you can contact the maintainers on the project page on GitHub (https://github.com/dominch/redmine_highlightjs). If you want to report bugs, please open a new issue here: https://github.com/dominch/redmine_highlightjs/issues
