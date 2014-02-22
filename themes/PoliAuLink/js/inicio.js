function loadContent(e)
{
    var n = $(this).find('li.active a');
    if (n.attr('href') == '#tab1'){
        $('#tab1').load('AjaxInicioSesion');
    } else if (n.attr('href') == '#tab2') {
        $('#tab2').load('AjaxRecuperar');
    } else if (n.attr('href') == '#tab3'){
         $('#tab3').load('AjaxRegistro');
    }

}