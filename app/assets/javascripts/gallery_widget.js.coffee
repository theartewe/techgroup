window.add_gallery_after = (selector) ->
    $(selector).after """<li class="text optional">
                           <div id="gallery-widget">
                             <ul id="carousel" class="jcarousel-skin-tango"></ul>
                             <p class="inline-hints">(<strong>ADDING IMAGE</strong>: Set cursor to the except or body text input, then click on image you want to insert)</p>
                           </div>
                         </li>"""

    url     = "/admin/images.json"
    params  = {}
    $.get url, params, (data) ->

        _.each data, (el) ->
            url             = el.image.thumbnail.url
            optimized_url   = el.image.optimized.url
            title           = el.title
            $('#gallery-widget ul').append """<li>
                                                <img src="#{url}" alt="#{title}"
                                                     width=200
                                                     height=160 data-url="#{optimized_url}" />
                                              </li>"""

        $('#carousel').jcarousel()

    $('#carousel img').live 'click', (e) ->
        url     = $(this).attr('data-url')
        title   = $(this).attr('alt')
        img_tag = """<img src="#{url}" alt="#{title}" />"""

        tinyMCE.activeEditor.execCommand("mceInsertContent", false, img_tag);
