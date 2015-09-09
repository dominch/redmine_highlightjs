function updateCodes() {
    $('pre code:not(.hljs)').each(function(i, block) {
        if (!$(this).hasClass('nohighlight')) { 
            $(this).html($.trim($(this).html()));
            hljs.highlightBlock($(this)[0]);
            $(this).parent().show();
        }
    });
    $('pre:not(:has(code))').each(function(i, block) {
        $(this).html($.trim($(this).html()));
        $(this).addClass('addPadding')
        $(this).show()
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
