$(document).ready(function() {
     
    /* initialize shuffle plugin */
    var $grid = $('#grid');
         
    $grid.shuffle({
        itemSelector: '.item' // the selector for the items in the grid
    });

});

$(document).ready(function() {
$('#filter a').click(function (e) {
 	var $grid = $('#grid');
    e.preventDefault();
         
    // set active class
    $('#filter a').removeClass('active');
    $(this).addClass('active');
         
    // get group name from clicked item
    var groupName = $(this).attr('data-group');
         
    // reshuffle grid
    $grid.shuffle('shuffle', groupName );
});

$('.filter_btn').click(function (e) {
    var $grid = $('#grid');
    e.preventDefault();
         
    // set active class
    $('.filter_btn').removeClass('active');
    $(this).addClass('active');
         
    // get group name from clicked item
    var groupName = $(this).attr('data-group');
         
    // reshuffle grid
    $grid.shuffle('shuffle', groupName );
});

        $('.js-shuffle-search').on('keyup change', function() {
            var $grid = $('#grid');

            var val = this.value.toLowerCase();
            $grid.shuffle('shuffle', function($el, shuffle) {

                // Only search elements in the current group
                if (shuffle.group !== 'all' && $.inArray(shuffle.group, $el.data('groups')) === -1) {
                    return false;
                }

                var text = $.trim( $el.find('.pic-title').attr("title") ).toLowerCase();
                return text.indexOf(val) !== -1;
            });
        });
});