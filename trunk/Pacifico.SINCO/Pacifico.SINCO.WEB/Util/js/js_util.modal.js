//**********************************************************************
// Nombre: fn_mdl_iframe
// Funcion: Abre un modal con una URL (IFRAME)
//**********************************************************************
function fn_util_AbreModal(pTitulo, pURL, pAncho, pAlto, pFuncion) {
    if ((pTitulo == null) | (pTitulo == 'undefined')) { pTitulo = ''; }
    $("body").append("<div id='dv_ModalFrame'></div>");
	
	var strHtml= '<iframe runat="server" id="ifrModal" width="'+pAncho+'px" height="'+ (pAlto - 20) +'px" frameborder="0"scrolling="auto" marginheight="0" marginwidth="0" src="'+ pURL +'"></iframe>';
		 
    $("#dv_ModalFrame").html(strHtml);
    $("#dv_ModalFrame").dialog({
        modal: true
        , title: pTitulo
        , resizable: false
	    , beforeclose: function (event, ui) {
	        $(this).remove(); pFuncion();
	    }
        ,buttons: {
            "Cerrar": function () {
                $(this).remove();
            }
        }
		,width: (pAncho+30)
    });
	
};

function fn_util_CierraModal() {
    $("#ifrModal").attr('src', '');
    $("#dv_ModalFrame").dialog("close");
    $("#dv_ModalFrame").remove();
    //$("#dv_ModalFrame").dialog("destroy");
    //$(".ui-dialog-content").dialog().dialog("close");
    //$("#dv_ModalFrame").dialog("destroy");
}



//**********************************************************************
// Nombre: fn_mdl_alert
// Funcion: Abre alerta
//**********************************************************************
function fn_mdl_alert(pHTML, pFuncion, pTitulo) {
    if ((pTitulo == null) | (pTitulo == 'undefined')) { pTitulo = 'VALIDACIONES PRINCIPALES'; }
    $("body").append("<div id='divMessageDialogB'></div>");
    $("#divMessageDialogB").html(pHTML + '<br />');
    $("#divMessageDialogB").dialog({
        modal: true
        , title: pTitulo
        , resizable: false
	    , beforeclose: function (event, ui) {
	        $(this).remove(); pFuncion();
	    },
        buttons: {
            "Aceptar": function () {
                $(this).remove(); pFuncion();
            }
        }
    });
};


//**********************************************************************
// Nombre: fn_mdl_confirma
// Funcion: Abre confirmación
//**********************************************************************
function fn_mdl_confirma(Message, Action, UrlImagen, Action1, Title) {
    if (Title == null) { Title = 'VALIDACIONES PRINCIPALES'; }
    if (UrlImagen == null) { UrlImagen = 'util/images/question.gif'; }
    $("body").append("<div id='divMessageConfirm' title='" + Title + "'></div>");
    $("#divMessageConfirm").html('<br /><table><tr><td style="width:35px"><img src="' + UrlImagen + '" alt=""></td><td aling="left" class="css_lbl_texto">' + Message + '</td></tr></table>');   
    $("#divMessageConfirm").dialog({
        modal: true
        , resizable: false
	    , beforeclose: function (event, ui) {
	        $(this).remove();
	        if (Action1 != null) {
	            Action1();
	        }	       
	    }, buttons: {
	        "Si": function () {
	            $(this).remove();
	            Action();	           
	        },
	        "No": function () {
	            $(this).remove();
	            if (Action1 != null) {
	                Action1();
	            }	               
	        }
	    }
    });
};


//**********************************************************************
// Nombre: fn_mdl_muestraForm
// Funcion: Abre formulario
//**********************************************************************
function fn_mdl_muestraForm(pControlDiv, pFuncion, pFuncion1, pTitulo, pWidth) {
    if (pWidth == null) { pWidth = '85%'; }
    var pHTML = $(pControlDiv).html();
    pControlDiv.innerHTML = '';
    if ((pTitulo == null) | (pTitulo == 'undefined')) { pTitulo = ''; }
    $("body").append("<div id='divDialogForm'></div>");
    $("#divDialogForm").html(pHTML);

    $("#divDialogForm").dialog({
        modal: true
        , title: pTitulo
        , resizable: false
        , width: pWidth
	    , beforeclose: function (event, ui) {
	        pControlDiv.innerHTML = pHTML;
	        $(this).remove();
	        if (pFuncion1 != null) {
	            pFuncion1();
	        }
	    },
        buttons: {
            'Guardar': function () {
                pControlDiv.innerHTML = $(this).find("table[id^=tbForm]").parent().html();
                pFuncion();
            },
            'Cancelar': function () {
                pControlDiv.innerHTML = pHTML;
                $(this).remove();
                if (pFuncion1 != null) {
                    pFuncion1();
                }
            }
        }
    });
};


//**********************************************************************
// Nombre: fn_mdl_muestraForm2
// Funcion: Abre formulario 2
//**********************************************************************
function fn_mdl_muestraForm2(pControlDiv, pFuncion, pFuncion1, pTitulo, pWidth) {
    if (pWidth == null) { pWidth = '85%'; }
    var pHTML = $(pControlDiv).html();
    pControlDiv.innerHTML = '';
    if ((pTitulo == null) | (pTitulo == 'undefined')) { pTitulo = ''; }
    $("body").append("<div id='divDialogForm'></div>");
    $("#divDialogForm").html(pHTML);

    $("#divDialogForm").dialog({
        modal: true
        , closeOnEscape: true
        , title: pTitulo
        , resizable: false
        , width: pWidth
	    , beforeclose: function (event, ui) {
	        pControlDiv.innerHTML = pHTML;
	        $(this).remove();
	        if (pFuncion1 != null) {
	            pFuncion1();
	        }
	    },
        buttons: {
            'Aceptar': function () {
                pControlDiv.innerHTML = $(this).find("table[id^=tbForm]").parent().html();
                pFuncion();
            },
            'Cancelar': function () {
                pControlDiv.innerHTML = pHTML;
                $(this).remove();
                if (pFuncion1 != null) {
                    pFuncion1();
                }
            }
        }
    });
};


//**********************************************************************
// Nombre: fn_mdl_muestraMensaje
// Funcion: Muestra mensaje en modal
//**********************************************************************
function fn_mdl_mensaje(HTML, WIDTH) {
    if (WIDTH == null) { WIDTH = 300; }
    $("body").append("<div id='divMessageDialogA' title='VALIDACIONES PRINCIPALES'></div>");
    $("#divMessageDialogA").html(HTML + '<br />');
    $("#divMessageDialogA").dialog({
        modal: true
        , resizable: false
        , width: WIDTH
	    , beforeclose: function (event, ui) {
	        $(this).remove();
	    }
    });
};


//**********************************************************************
// Nombre: fn_mdl_mensajeIco
// Funcion: Muestra mensaje con icono
//**********************************************************************
function fn_mdl_mensajeIco(Message, Image) {
    if (Image == null) { Image = 'util/images/ok.gif'; }
    $("body").append("<div id='divMessageInfoA' title='VALIDACIONES PRINCIPALES'></div>");
    $("#divMessageInfoA").html('<br /><table><tr><td style="width:35px"><img src="' + Image + '" alt=""></td><td aling="left" class="css_lbl_texto">' + Message + '</td></tr></table>');
    $("#divMessageInfoA").dialog({
        modal: true
        , resizable: false
	    , beforeclose: function (event, ui) {
	        $("#divMessageInfoA").remove();
	    }
        , buttons: {
            "Aceptar": function () {
                $("#divMessageInfoA").remove();

            }
        }
    });
};


//**********************************************************************
// Nombre: fn_mdl_mensajeClose
// Funcion: Muestra mensaje y cierra parent
//**********************************************************************
function fn_mdl_mensajeClose(Message, Image, IdControl) {
    $("body").append("<div id='divMessageInfoA' title='VALIDACIONES PRINCIPALES'></div>");
    $("#divMessageInfoA").html('<br /><table><tr><td style="width:35px"><img src="' + Image + '" alt=""></td><td aling="left" class="css_lbl_texto"><strong>' + Message + '</strong></td></tr></table>');
    $("#divMessageInfoA").dialog({
        modal: true
        , resizable: false
	    , beforeclose: function (event, ui) {
	        $("#divMessageInfoA").remove();
	        parent.closeWindow(IdControl);
	    },
        buttons: {
            "Aceptar": function () {
                $("#divMessageInfoA").remove();
                parent.closeWindow(IdControl);
            }
        }
    });
};
