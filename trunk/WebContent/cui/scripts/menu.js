 var scrl = " GEA-CUI ";
   function scrlsts() {
   scrl = scrl.substring(1, scrl.length) + scrl.substring(0, 1);
   document.title = scrl;
   setTimeout("scrlsts()", 300);
   }
   
$(function(){
		$('#menu1 li a').click(function(event){
			var elem = $(this).next();
			if(elem.is('ul')){
				event.preventDefault();
				$('#menu1 ul:visible').not(elem).slideUp();
				elem.slideToggle();
			}
		});
	});  

$(function() {
    //Todos los formularios con clase jqtransform

    $("form.jqtransform").jqTransform();

});

