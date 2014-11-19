//**********************************************************************
// Nombre: fn_util_SeteaCalendario
//**********************************************************************
function fn_util_SeteaCalendario(pControlTxt) {
    if ((pControlTxt != null) && ($(pControlTxt).attr("type") == 'text')) {
        pControlTxt.className = '';
        $(pControlTxt).datepicker({ selectOtherMonths: true, changeYear: true, changeMonth: true });
        $(pControlTxt).addClass('css_calendario');
    }
};


//**********************************************************************
// Nombre: fn_util_ValidateControl
//**********************************************************************
function fn_util_ValidateControl(pControl, pMensaje, pTipoSalto, pTextoAdicional) {
    var strMensaje = '';
    var strSaltoLinea = '';
    var strEspacio = '';
    if (pTipoSalto == 1) {
        strSaltoLinea = '<br />';
        strEspacio = '&nbsp;&nbsp;';
    }
    else { strSaltoLinea = '\n'; }

    if (pControl.type == 'select-one') {
        if (pControl.selectedIndex == 0) {
            strMensaje = strMensaje + '- Seleccione ';
            pControl.className = 'css_select_error';
        }
        else { pControl.className = ''; }
    }
    else if ((pControl.type == 'text') || (pControl.type == 'password') || (pControl.type == 'textarea')) {
        if (fn_util_trim(pControl.value) == '') {
            strMensaje = strMensaje + '- Ingrese ';
            pControl.className = 'css_input_error';
        }
        else if ((fn_util_trim(pControl.value) == '0') || (fn_util_trim(pControl.value) == '0.00')) {
            if (parseInt(pControl.value) == 0) {
                strMensaje = strMensaje + '- Ingrese ';
                pControl.className = 'css_input_error';
            }
        }
        else {
            if (pControl.readOnly) {
                pControl.className = 'css_input_inactivo';
            } else {
                pControl.className = '';
            }
        }
    }

    if (strMensaje != '') { strMensaje = strEspacio + pTextoAdicional + strMensaje + pMensaje + strSaltoLinea; }
    return strMensaje;
};




//**********************************************************************
// Nombre: fn_util_MaxLength
//**********************************************************************
function fn_util_MaxLength(pThis, pMaxLong) {
    var int_value, out_value;
    if (pThis.value.length > pMaxLong) {
        in_value = pThis.value;
        out_value = in_value.substring(0, pMaxLong);
        pThis.value = out_value;
        fn_mdl_alert('<br /><br />' + 'La longitud m&aacute;xima es de ' + pMaxLong + ' caract&eacute;res', function () {
            pThis.className = 'input_error';
            pThis.focus();
        });
    } else { pThis.className = ''; }
};



//**********************************************************************
// Nombre: fn_util_CheckAll
//**********************************************************************
function fn_util_CheckAll(pThis, pIdTable, pClassCss) {
    var ocheckboxs = $('table#' + pIdTable + ' tbody').find("input[id*=chk]:checkbox");
    if (pThis.checked) {
        ocheckboxs.map(function (index) {
            $(this).attr("checked", "checked");
            $(this).parent().parent().addClass(pClassCss);

        });
    } else {
        ocheckboxs.map(function (index) {
            $(this).removeAttr("checked");
            $(this).parent().parent().removeClass(pClassCss);
        });
    }
    delete (ocheckboxs);
    ocheckboxs = null;
};


//**********************************************************************
// Nombre: fn_util_RefreshSession
//**********************************************************************
function fn_util_RefreshSession(pUrl) {
    var head = document.getElementsByTagName('head').item(0);
    script = document.createElement('script');
    script.src = pUrl;
    script.setAttribute('type', 'text/javascript');
    script.defer = true;
    head.appendChild(script);
};


//**********************************************************************
// Nombre: fn_util_SelectTR
//**********************************************************************
function fn_util_SelectTR(pThis, pOption) {
    if (pThis != null) {
        var Tr = $(pThis).parent().parent();
        if (pOption == 'S') {
            if (!(pThis.id.indexOf('btn') > -1)) Tr.addClass("selectTR");
        } else {
            if (!(pThis.id.indexOf('btn') > -1)) Tr.removeClass("selectTR");
        }
        delete (Tr); Tr = null;
    }
};


//**********************************************************************
// Nombre: fn_util_Right
//**********************************************************************
function fn_util_Right(str, n) {
    if (n <= 0)
        return '';
    else if (n > String(str).length)
        return str;
    else {
        var iLen = String(str).length;
        return String(str).substring(iLen, iLen - n);
    }
};


//**********************************************************************
// Nombre: fn_util_Left
//**********************************************************************
function fn_util_Left(str, n) {
    if (n <= 0)
        return '';
    else if (n > String(str).length)
        return str;
    else
        return String(str).substring(0, n);
};


//**********************************************************************
// Nombre: fn_util_trim
//**********************************************************************
function fn_util_trim(string) {
    if (string.length > 0) {
        string = $.trim(string);
    } else {
        string = '';
    }
    return string;
};


//**********************************************************************
// Nombre: fn_util_RedondearDecimales
//**********************************************************************
function fn_util_RedondearDecimales(cantidad, decimales) {
    var val = parseFloat(cantidad);
    if (isNaN(val)) { return "0.00"; }
    val = (parseFloat(cantidad)).toFixed(decimales);
    return val;

};


//**********************************************************************
// Nombre: fn_util_SoloNumerosEntero
//**********************************************************************
function fn_util_SoloNumerosEntero(evt) {
    if (window.event) {
        keynum = evt.keyCode;
    }
    else {
        keynum = evt.which;
    }
    if (keynum > 47 && keynum < 58) {
        return true;
    } else {
        return false;
    }
};


//**********************************************************************
// Nombre: fn_util_SoloNumeros
//**********************************************************************
function fn_util_SoloNumeros(e) {
    var rptBol = false;
    if (window.event) {
        keynum = window.event.keyCode;
    }
    else if (window.event) {
        keynum = e.keyCode;
    }
    else {
        keynum = e.which;
    }
	alert(keynum);
    if ((keynum > 47 && keynum < 58) || keynum==8) {
        rptBol = true;
    } else {
        rptBol = false;
    }
    return rptBol;
}


//**********************************************************************
// Nombre: fn_util_SoloNumerosDecimales
//**********************************************************************
function fn_util_SoloNumerosDecimales(e) {
    var rptBol = false;
    if (window.event) {
        keynum = window.event.keyCode;
    }
    else if (window.event) {
        keynum = e.keyCode;
    }
    else {
        keynum = e.which;
    }
	//alert(keynum);
    if ((keynum > 47 && keynum < 58) || keynum==8 || keynum==46) {
        rptBol = true;
    } else {
        rptBol = false;
    }
    return rptBol;
}


//**********************************************************************
// Nombre: fn_util_ValidateEmail
//**********************************************************************
function fn_util_ValidateEmail(Email) {
    re = /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/;
    if (!re.exec(Email)) {
        return false;
    } else {
        return true;
    }
};


//**********************************************************************
// Nombre: fn_util_ValidatePassword
//**********************************************************************
function fn_util_ValidatePassword(Password) {
    re = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,})$/;
    if (!re.exec(Password)) {
        return false;
    } else {
        return true;
    }
}


//**********************************************************************
// Nombre: fn_util_ValidateEmailPuntoComas
//**********************************************************************
function fn_util_ValidateEmailPuntoComas(Emails) {
    var oResult = false;
    if (fn_util_trim(Emails) == '') { return oResult; }
    if (Emails.indexOf(';') > 0) {
        var oEmails = Emails.split(';');
        for (var i = 0; i < oEmails.length; i++) {
            oResult = fValidateEmail(oEmails[i]);
            if (!oResult) { break; }
        }
    } else {
        oResult = fValidateEmail(Emails);
    }
    return oResult;
};


//**********************************************************************
// Nombre: fn_util_ValidateTextoNumero
//**********************************************************************
function fn_util_ValidateTexto(e) {
    var rptBol = false;
    if (window.event) {
        keynum = window.event.keyCode;
    }
    else if (window.event) {
        keynum = e.keyCode;
    }
    else {
        keynum = e.which;
    }
	//alert(keynum);
    if ((keynum > 47 && keynum < 58) || keynum==8 || keynum==46) {
        rptBol = true;
    } else {
        rptBol = false;
    }
    return rptBol;
};


//**********************************************************************
// Nombre: fn_util_ValidateTextoNumero
//**********************************************************************
function fn_util_ValidateTextoNumero(Texto, Minimo) {
    if (Minimo) {
        re = /^([a-zA-Z0-9]{6,})+$/;
    } else {
        re = /^([a-zA-Z0-9])+$/;
    }
    if (!re.exec(Texto)) {
        return false;
    } else {
        return true;
    }
};


//**********************************************************************
// Nombre: fn_util_ValidateTextoNumeroComa
//**********************************************************************
function fn_util_ValidateTextoNumeroComa(Texto) {
    re = /^[a-zA-Z0-9]+([;][a-zA-Z0-9]+)*$/;
    if (!re.exec(Texto)) {
        return false;
    } else {
        return true;
    }
};


//**********************************************************************
// Nombre: fn_util_ValidatePhone
//**********************************************************************
function fn_util_ValidatePhone(Phone) {
    re = /^[0-9]{2,3}-? ?[0-9]{6,7}$/;
    if (!re.exec(Phone)) {
        return false;
    } else {
        return true;
    }
}


//**********************************************************************
// Nombre: fn_util_IsNumeric
//**********************************************************************
function fn_util_IsNumeric(valor) {
    var log = valor.length; var sw = 'S';
    for (x = 0; x < log; x++) {
        v1 = valor.substr(x, 1);
        v2 = parseInt(v1);
        if (isNaN(v2)) { sw = 'N'; break; }
    }
    if (sw == "S") { return true; } else { return false; }
}


//**********************************************************************
// Nombre: fn_util_VerificarDecimal
//**********************************************************************
function fn_util_VerificarDecimal(pThis, pTexto) {
    permitidos = /[^0-9.,]/;
    if (permitidos.test(pThis.value)) {
        fShowAlert('<br /><br />' + 'El campo <strong>' + pTexto + '</strong> solo acepta numeros', function () {
            pThis.className = 'css_input_error';
            pThis.focus();
        });
    } else { pThis.className = ''; }
};


//**********************************************************************
// Nombre: fn_util_VerificarEntero
//**********************************************************************
function fn_util_VerificarEntero(pThis, pTexto, pRemoveClass) {
    permitidos = /[^0-9]/;
    if (permitidos.test(pThis.value)) {
        fShowAlert('<br /><br />' + 'El campo <strong>' + pTexto + '</strong> solo acepta numeros', function () {
            pThis.className = 'input_error';
            pThis.focus();
        });
    } else {
        if ((pRemoveClass != null) && pRemoveClass == true) {
            pThis.className = '';
        }
    }
};


//**********************************************************************
// Nombre: fn_util_ValidarIngreso
//**********************************************************************
function fn_util_ValidarIngreso(CaracteresPermitidos) {
    var key = String.fromCharCode(window.event.keyCode);
    var valid = new String(CaracteresPermitidos);
    var ok = "no";
    for (var i = 0; i < valid.length; i++) {
        if (key == valid.substring(i, i + 1))
            ok = "yes";
    }
    if (ok == "no")
        window.event.keyCode = 0;
};


//**********************************************************************
// Nombre: fn_util_FormatoDecimal
//**********************************************************************
function fn_util_FormatoDecimal(vDecimal) {
    if (vDecimal.value.length == 0) return false;
    vDecimal.value = fn_util_RedondearDecimales(vDecimal.value, 2);

    var nPos = vDecimal.value.indexOf('.');

    if (nPos != -1) {
        var vDec = vDecimal.value.substr(nPos + 1, vDecimal.value.length - nPos);
        switch (vDec.length) {
            case 0:
                vDecimal.value = vDecimal.value + '00';
                break;
            case 1:
                vDecimal.value = vDecimal.value + '0';
                break;
        }
    }
    else {
        vDecimal.value = vDecimal.value + '.00';
    }

};


//**********************************************************************
// Nombre: fn_util_FormatoDecimal
//**********************************************************************
function fn_util_ValidaTecla(e, tipo, textbox) {
	var tecla;
	if (navigator.appName.indexOf("Netscape") != -1) {
		tecla = e.which;
	} else {
		tecla = event.keyCode;
	}
	var key = String.fromCharCode(tecla);
	/*---Mayuscula---*/
	//key = key.toUpperCase();
	if (navigator.appName.indexOf("Netscape") == -1) {
		event.keyCode = key.charCodeAt(0);
	}
	var numeros = "0123456789";
	var especiales = "\"'";
	//var especiales = "'#\xef\xbf\xbd()_;:\xef\xbf\xbd[]{}!\xef\xbf\xbd/?\xef\xbf\xbd``\xef\xbf\xbd\xef\xbf\xbd+\xef\xbf\xbd=&%$*\"";
	var letras = "AaBbCcDdEeFfGgHhIiJjKkLlMmNn\xc3\x91n??OoPpQqRrSsTtUuVvWwXxYyZz??????????";
	
	//backspace delete
	if(tecla == 8){
		return true;
	}

	if (tipo == "letras") {
		if (tecla == 32) {
			return true;
		}
		if (letras.indexOf(key) != -1) {
			return true;
		}
		return false;
	}
	if (tipo == "enteros") {
		if (numeros.indexOf(key) != -1) {
			return true;
		}
		return false;
	}
	if (tipo == "decimales") {
		if (numeros.indexOf(key) != -1) {
			return true;
		}
		var cadena = textbox.value;
		if (cadena.indexOf(".") != -1) {
			return false;
		}
		if (tecla == 46) {
			return true;
		}
		return false;
	}
	if (tipo == "NoNumeros") {
		if (tecla == 32) {
			return true;
		}
		if (numeros.indexOf(key) != -1 || especiales.indexOf(key) != -1) {
			return false;
		}
		return true;
	}
	if (tipo == "especiales") {
		if (tecla == 32) {
			return true;
		}
		if (especiales.indexOf(key) != -1) {
			return false;
		}
		return true;
	}
	if (tipo == "todo") {
		if (tecla == 32) {
			return true;
		}
		if (numeros.indexOf(key) != -1 || especiales.indexOf(key) != -1 || letras.indexOf(key) != -1) {
			return false;
		}
		return true;
	}
}


//**********************************************************************
// Nombre: fn_util_pressEnter
//**********************************************************************
function fn_utilPpressEnter(e, funcion) {
	var tecla;
	if (navigator.appName.indexOf("Netscape") != -1) {
		tecla = e.keyCode;
	} else {
		tecla = event.keyCode;
	}
	var key = String.fromCharCode(tecla);
	if (tecla == 13) {
		eval(funcion);
	}
}
	

//**********************************************************************
// Nombre: fn_util_IsEnterTab
//**********************************************************************
function fn_util_IsEnterTab(nextTab) {
	
	if (window.event) {
        keynum = window.event.keyCode;
    }
    else if (window.event) {
        keynum = e.keyCode;
    }
    else {
        keynum = e.which;
    }
	
	if (keynum == 13) {
		if (null != document.all[nextTab]) {
			document.all[nextTab].focus();
		}
	}
}



//**********************************************************************
//**********************************************************************
// Nombre: Funciones Prototype
//**********************************************************************
//**********************************************************************
var StringBuilderEx = Array;
Array.prototype.append = Array.prototype.push;
Array.prototype.appendFormat = function (pattern) {
    var args = this._convertToArray(arguments).slice(1);
    this[this.length] = pattern.replace(/\{(\d+)\}/g,
        function (pattern, index) {
            return args[index].toString();
        });
};

Array.prototype.appendFormatEx = function (pattern) {
    if (this._parameters == null) {
        this._parameters = new Array();
    }
    var args = this._convertToArray(arguments).slice(1);

    for (var t = 0, len = args.length; t < len; t++) {
        this._parameters[this._parameters.length] = args[t];
    }

    this[this.length] = pattern;
};

Array.prototype._convertToArray = function (arguments) {
    if (!arguments) {
        return new Array();
    }
    if (arguments.toArray) {
        return arguments.toArray();
    }
    var len = arguments.length;
    var results = new Array(len);

    while (len--) {
        results[len] = arguments[len];
    }

    return results;
};

Array.prototype.toString = function () {
    var hasParameters = this._parameters != null;
    hasParameters = hasParameters && this._parameters.length > 0;

    if (hasParameters) {
        var values = this.join("").split('?');
        var tempBuffer = new Array();

        for (var t = 0, len = values.length; t < len; t++) {
            tempBuffer[tempBuffer.length] = values[t];
            tempBuffer[tempBuffer.length] = this._parameters[t];
        }

        return tempBuffer.join("");
    }
    else {
        return this.join("");
    }
};


