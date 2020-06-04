function  getBorrowList() {
    $.get('borrow/getBorrowInfo',function (res) {
        $("#maincontain").html(res)
    })
}

function getData(url , data , method) {
    $.ajax({
        url:url,
        data:data,
        method:method,
        success:res=>{
            $('#maincontain').html(res)
        },
        error:res=>{
            alert('err')
            alert(res.responseText)
        }
    })
}

var equit = []
var num = []


function equitArr(box , id , max) {
    var boxid = 'box'+id
    var numid = 'num'+id
    if(box.checked){
        equit.push(id)
        var b = 0
        if(max>80){
            b = parseInt(max / 2)
        }else {
            b = max
        }
        num.push(b)
        $('#'+numid).val(b)
    }else {
        $('#'+numid).val('数量')
        for(var i =0 ;i<equit.length;i++){
            if(equit[i]==id){
                equit.splice(i,1);
                num.splice(i,1);
                break;
            }
        }
    }
}

function numArr(num1 , id , max) {

    var numValue = num1.value

    if (max<numValue){
        alert('error : max borrow number = '+max)
        $(num1).val(max)
        return
    }

    for(var i =0 ;i<num.length;i++){
         if(equit[i]==id){
             num[i]=numValue
             break
         }
    }
}

function borrow(){
    alert("fa")
    $.ajax({
        url:'borrow/goBorrow',
        method:'GET',
        success:function (res) {
            $('#maincontain').html(res)
        }
    })
}