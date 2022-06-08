var userObj;

//用户管理页面上点击删除按钮弹出删除框(userlist.jsp)
function deleteUser(obj){
    $.ajax({
        type:"GET",
        url:"/unnamed/user.do",
        data:{method:"deluser",uid:obj.attr("userid")},
        dataType:"json",
        success:function(data){
            if(data.delResult == "true"){//删除成功：移除删除行
                cancleBtn();
                obj.parents("tr").remove();
            }else if(data.delResult == "false"){//删除失败
                //alert("对不起，删除用户【"+obj.attr("username")+"】失败");
                changeDLGContent("对不起，删除用户【"+obj.attr("username")+"】失败");
            }else if(data.delResult == "notexist"){
                //alert("对不起，用户【"+obj.attr("username")+"】不存在");
                changeDLGContent("对不起，用户【"+obj.attr("username")+"】不存在");
            }
        },
        error:function(data){
            //alert("对不起，删除失败");
            changeDLGContent("对不起，删除失败");
        }
    });
}

function openYesOrNoDLG(){
    $('.zhezhao').css('display', 'block');
    $('#removeUse').fadeIn();
}//打开删除提醒弹窗

function cancleBtn(){
    $('.zhezhao').css('display', 'none');
    $('#removeUse').fadeOut();
}//取消删除 关闭弹窗

function changeDLGContent(contentStr){
    var p = $(".removeMain").find("p");
    p.html(contentStr);
}//设置弹窗文字

$(function(){
    //通过jquery的class选择器（数组）
    //对每个class为viewUser的元素进行动作绑定（click）
    /**
     * bind、live、delegate
     * on
     */
    $(".viewUser").on("click",function(){
        //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
        var obj = $(this);
        window.location.href="/unnamed/user.do?method=view&uid="+ obj.attr("userid");
    });//点击查看用户

    $(".modifyUser").on("click",function(){
        var obj = $(this);
        window.location.href="/unnamed/user.do?method=modify&uid="+ obj.attr("userid");
    });//点击修改用户

    $('#no').click(function () {
        cancleBtn();
    });//若选择no，则关闭弹窗

    $('#yes').click(function () {
        deleteUser(userObj);
    });//若选择yes，給后端发送请求

    $(".deleteUser").on("click",function(){
        userObj = $(this);
        changeDLGContent("你确定要删除用户【"+userObj.attr("username")+"】吗？");
        openYesOrNoDLG();
    });//点击删除用户会发生的事件

    /*$(".deleteUser").on("click",function(){
        var obj = $(this);
        if(confirm("你确定要删除用户【"+obj.attr("username")+"】吗？")){
            $.ajax({
                type:"GET",
                url:path+"/jsp/user.do",
                data:{method:"deluser",uid:obj.attr("userid")},
                dataType:"json",
                success:function(data){
                    if(data.delResult == "true"){//删除成功：移除删除行
                        alert("删除成功");
                        obj.parents("tr").remove();
                    }else if(data.delResult == "false"){//删除失败
                        alert("对不起，删除用户【"+obj.attr("username")+"】失败");
                    }else if(data.delResult == "notexist"){
                        alert("对不起，用户【"+obj.attr("username")+"】不存在");
                    }
                },
                error:function(data){
                    alert("对不起，删除失败");
                }
            });
        }
    });*/
});