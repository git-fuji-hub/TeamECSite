$(function() {
	$(".check").click(function() {
		var ck_count = $("input:checked").length;
		if (ck_count == 0) {
			$('#btn').prop("disabled", true);
		} else {
			$('#btn').prop("disabled", false);
		}
	});
});

$(function() {
	$('#btn').click(function() {
		$('.cart').attr('action', 'DeleteCartAction');
		$('.cart').submit();
	});
	$('#btn2').click(function() {
		$('.cart').attr('action', 'SettlementConfirmAction');
		$('.cart').submit();
	});
});