


function setTooltip(btn, message) {
    $(btn).tooltip('show')
        .attr('data-original-title', message)
        .tooltip('show');
}

function hideTooltip(btn) {
    setTimeout(function() {
        $(btn).tooltip('hide');
    }, 1000);
}

$('button').tooltip({
    trigger: 'click',
    placement: 'bottom'
});


// Clipboard



$(document).ready(function () {

    var clipboard = new Clipboard('button');

    clipboard.on('success', function(e) {
        setTooltip(e.trigger, 'Copied!');
        hideTooltip(e.trigger);
    });

    clipboard.on('error', function(e) {
        setTooltip(e.trigger, 'Failed!');
        hideTooltip(e.trigger);
    });
});