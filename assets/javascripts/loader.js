function updateCodes() {
    $('table.syntaxhl th.line-num').remove();
    $('table.syntaxhl').each(
            function(i, block) {
                var parentBlock = $(this).parent()
                var code = '';
                var line = 0;
                $(this).find('td pre').each(
                        function(i, block) {
                            line++;

                            var html = $(this).html()
                            if (!html.trim()) html = "\n"
                            code += html
//                            code += '<span class="lineNumber">' + line
//                                    + '</span>' + $(this).html()
                        })
                $(this).remove()
                parentBlock.append('<pre class="block rounded"><code>' + code
                        + '</code></pre>')
            });
    $('pre code:not(.hljs)').each(function(i, block) {
        if (!$(this).hasClass('nohighlight')) {
            $(this).html($.trim($(this).html()));
            hljs.highlightBlock($(this)[0]);
            // numberLines($(this).parent()[0])
            $(this).parent().show();
        }
    });
    $('pre:not(:has(code))').each(function(i, block) {
        if ($(this).parent().hasClass('line-code')) {
            return;
        }
        $(this).html($.trim($(this).html()));
        $(this).addClass('addPadding')
    });
    $('pre').show();
}

$(document).ready(function() {
    updateCodes();
    setInterval(function() {
        updateCodes();
    }, 5000);
    $(document).ajaxComplete(function() {
        updateCodes();
    });
});
