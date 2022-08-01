/**
 * 
 */
 
 var IMP = window.IMP;
IMP.init("imp25236148");  

function requestPay() {
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: "merchan_"+new Date().getTime(), 
        name : $("#price").val()+' 포인트',
        amount : $("#price").val() ,
        buyer_email : '${user_Email}',
        buyer_name : '${user_Code}',
    }, function (rsp) { // callback
        if (rsp.success) {
            alert('결제성공');
            window.location = '/point/payment?pay_Price='+rsp.paid_amount;
        } else {
            alert('결제실패');
            window.location = '/point/use';
        }
    });
}

function requestPayK() {
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid: "merchan_"+new Date().getTime(), 
        name : $("#price").val()+' 포인트',
        amount : $("#price").val() ,
        buyer_email : '${user_Email}',
        buyer_name : '${user_Code}',
    }, function (rsp) { // callback
        if (rsp.success) {
            alert('결제성공');
            window.location = '/point/payment?pay_Price='+rsp.paid_amount;
        } else {
            alert('결제실패');
            window.location = '/point/use';
        }
    });
}

function pointAdd(price) {
   var new_price = Number($("#price").val()) + Number(price);
   $("#price").val(new_price);
}

function priceReset() {
   $("#price").val('');
}