tinyMCEPopup.requireLangPack();

var InsertImageDialog = {
    init : function() {
    },
};

tinyMCEPopup.onInit.add(InsertImageDialog.init, InsertImageDialog);

$(function(){
    var images_url = "/admin/images.json?order=_desc&scope=gallery"
    $.get(images_url, function(data){
        $(data).each(function(){
            var obj = $(this)[0];
            var img = '<img src="'+obj.image.thumbnail.url+'" alt="'+obj.title+'" data-original-url="'+obj.image.optimized.url+'" />';
            $('.images').append(img);
        });
        $('.images').removeClass('loading');
    }, "json");
    $('.images img').live('click', function(e){
        var url     = $(this).attr("data-original-url");
        var title   = $(this).attr("alt");
        var img_tag = '<img src="'+url+'" alt="'+title+'" />'
        tinyMCEPopup.editor.execCommand('mceInsertContent', false, img_tag);
        tinyMCEPopup.close();
    });
});
