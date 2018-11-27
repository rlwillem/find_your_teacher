$(function(){

	//スマホグローバルアコーディオン
	$("#header nav h1").on('click', function() {
		$(this).next().slideToggle("250");
		$(this).toggleClass("active");
		
		//$("#overlay").toggleClass("overlay_on");
		
		$("main").toggleClass("page_opa");
		$("main").toggleClass("page_opa_out",true)
		$("footer").toggleClass("page_opa");
		$("footer").toggleClass("page_opa_out",true)
	});					


//$(window).scroll(function () {
	$(window).on('scroll load', function(){
		//100pxスクロールしたら
		if ($(this).scrollTop() > 100) {
				//フェードインで表示
				$('#header').addClass("header_hide");
		} else {
				$('#header').removeClass("header_hide");
		}
 });
		 

/*	
//上に戻るボタン表示
	
	$("#pagetop").hide();
	$(window).scroll(function () {
		//100pxスクロールしたら
		if ($(this).scrollTop() > 100) {
				//フェードインで表示
				$('#pagetop').fadeIn(300);
		} else {
				$('#pagetop').fadeOut(150);
		}
});
*/				


//ページスクロール
	$(function(){
		$('a[href^=#]').click(function(){
			var speed = 450;
			var href= $(this).attr("href");
			var target = $(href == "#" || href == "" ? 'html' : href); 
			var position = target.offset().top + 0;
			$("html, body").animate({scrollTop:position}, speed, "linear").css('opacity', '.6').animate({'opacity': '1'}, speed, "linear");
			//$('body').css('opacity', '.1').animate({'opacity': '1'}, ' speed ');
			return false;
		});
	});
	
	/*$('a[href^=#]').on('click', function(e){
		e.preventDefault();
		$('html, body').animate({
			scrollTop: 600,
			opacity: 0
		}, 400, function() {
			$('html, body').animate({
				opacity: 1,
				scrollTop: 0
			}, 400);
		});
	});*/


//アコーディオン
	$(function(){
		$(".accordion").click(function(){
			$(this).next().slideToggle("250");
			$(this).toggleClass("open");
		});
	});
/*
//スマホグローバルアコーディオン
	$("header#header_global nav ul").css("display","none");
	$("#nav_global h1").click(function(){
		$("#nav_global ul").slideToggle("250");
		$(this).next().slideToggle("250");
		$(this).toggleClass("active");
	});
*/

			

//ソーシャルボタン　lineページアドレス取得
	var url = location.href ;
	$(function(){
		var url = location.href ;
		$('.line .line-it-button').attr('data-url',url);
	});

//ソーシャルボタン　twitter吹き出しリンク
	$(function(){
		//var get_url = $(location).attr('href');
		//var get_host = $(location).attr('hostname');
		var get_path = $(location).attr('pathname');
		var site_dmain = 'www.acky.info';
		var full_url = site_dmain + get_path;
		$('.tw .comm a').attr('href','//twitter.com/search?q='+full_url);
	});
	
	
//外部リンクを自動でblankに	
	$(function(){
		/*$('a[href^="//"]').attr('target','_blank');*/
		$('a[href*="//"]').not('[href*="'+location.hostname+'"]').attr({	target:"_blank"});
		$('a[href$=pdf]').attr({target:"_blank"});
	});


//画像hoverでの丸い背景
	$(function(){
		$('.img_a .img').append('<div><span></span></div>');
	});



//アナリティクスクリック計測
	/*$("a").click(function(e){
	//$("a").mousedown(function(){
		var ahref = jQuery(this).attr('href');
		if (ahref.indexOf("www.acky.info") != -1 || ahref.indexOf("http") == -1 ){
			ga('send', 'event', 'linkclick', 'click', ahref);
		}else {
			ga('send', 'event', 'outlinkclick', 'click', ahref);
		}
	});*/


//アナリティクスクリック計測
	$(function(){
		//$("a[href$=pdf]").click(function(){
		$("a[href$=pdf]").on('click', function(){
			var path_pdf = $(this).attr('href');
			//var path_pdf = $(this).attr('href').replace('https://www.acky.info/','/');
			ga('send','pageview', path_pdf );
			ga('send','event','download_PDF','pdf', path_pdf );
		});
	});

	$(function(){
		$("a[href$=zip]").mousedown(function(){
		//$("a[href$=zip]").on("click", function(){
			var path_zip = $(this).attr('href');
			ga('send','pageview', path_zip );
			ga('send','event','download_ZIP','zip', path_zip );
		});
	});
	
						
});	