(function($) {
    console.log('jQuery started');
    $(function () {
        console.log('Document ready started')
        $('a[rel="details"]').on('click', function(e) {
            e.preventDefault();
            e.stopPropagation();

            var $card = $(this).parent().parent().parent().parent();
            var $modalContent = $card.clone();
            
            $modalContent.find('.card-text').hide();
            $modalContent.find('a[rel="details"]').hide();
            $modalContent.find('.card-details').removeClass('d-none');
            $modalContent.find('.d-flex.justify-content-between').hide();
            $modalContent.find('figure').addClass('text-center');
            
            modalTemplate = `
            <div class="modal fade" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Fake title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body"></div>
                    </div>
                </div>
            </div>
            `;

            $modal = $(modalTemplate);
            //$modal.find('.modal-body').html($modalContent);
            $modalContent.children().appendTo($modal.find('.modal-body'));
            $modal.find('.modal-title').text($card.find('.card-text').text());
            $('body').append($modal);
            console.log($modal);
            $modal.modal();

        });
    });
})(jQuery);


