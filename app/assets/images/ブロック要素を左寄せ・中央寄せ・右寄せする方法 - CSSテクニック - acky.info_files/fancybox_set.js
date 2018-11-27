

$(function(){
	
	
			$("a.fancybox").fancybox({
				//'overlayShow'	: false,
				//'transitionIn'	: 'elastic',
				'transitionOut'	: 'none',
				'titlePosition'	: 'inside',
				'overlayColor'		: '#000000',
				'overlayOpacity'	: 0.7,
				'centerOnScroll': true,
			});


			$("a.fancybox_iframe").fancybox({
				'width'				: '95%',
				'height'			: '95%',
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'type'				: 'iframe',
				'overlayColor'		: '#000000',
				'overlayOpacity'	: 0.7,
				'centerOnScroll': true,
			});


});