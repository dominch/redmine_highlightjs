function updateCodes(file_class) {

    $('table.syntaxhl th.line-num').remove();
    $('table.syntaxhl').each(
            function(i, block) {
                var parentBlock = $(this).parent()
                var code = '';
                var line = 0;
                $(this).find('td pre').each(function(i, block) {
                    line++;

                    var html = $(this).html()
                    if (!html.trim())
                        html = "\n"
                    code += html
                })
                $(this).remove()
                if (file_class) {
                    var header = '<pre class="block rounded"><code class="'
                            + file_class + '">'
                } else {
                    var header = '<pre class="block rounded"><code>';
                }
                parentBlock.append(header + code + '</code></pre>')
            });
    $('pre code:not(.hljs)').each(function(i, block) {
        if (!$(this).hasClass('nohighlight')) {
            $(this).html($.trim($(this).html()));
            hljs.highlightBlock($(this)[0]);
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

    var file_class = ''
    if ($('body').hasClass('controller-attachments')) {
        file_class = document.location.toString().split('.').pop()
    }

    updateCodes(file_class);
    setInterval(function() {
        updateCodes(file_class);
    }, 5000);
    $(document).ajaxComplete(function() {
        updateCodes();
    });
});
