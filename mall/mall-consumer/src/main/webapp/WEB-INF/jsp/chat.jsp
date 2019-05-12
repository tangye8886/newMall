<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font_Icon/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chat.css">

</head>
<body>

<div class="chatContainer">
    <div class="chatBtn">
        <i class="iconfont icon-xiaoxi1"></i>
    </div>
    <div class="chat-message-num">1</div>
    <div class="chatBox" ref="chatBox">
        <div class="chatBox-head">
            <div class="chatBox-head-one">
                THT商城
                <div class="chat-close" style="margin: 10px 10px 0 0;font-size: 14px">关闭</div>
            </div>
            <div class="chatBox-head-two">
                <div class="chat-return">返回</div>
                <div class="chat-people">
                    <div class="ChatInfoHead">
                        <img src="" alt="头像"/>
                    </div>
                    <div class="ChatInfoName">这是用户的名字，看看名字到底能有多长</div>
                </div>
                <div class="chat-close">关闭</div>
            </div>
        </div>
        <div class="chatBox-info">
            <div class="chatBox-list" ref="chatBoxlist">
                <div class="chat-list-people">
                    <div><img src="${pageContext.request.contextPath}/images/icon01.png" alt="头像"/></div>
                    <div class="chat-name">
                        <p>商城客服</p>
                    </div>
                    <div class="message-num">1</div>
                </div>
            </div>
            <div class="chatBox-kuang" ref="chatBoxkuang">
                <div class="chatBox-content">
                    <div class="chatBox-content-demo" id="chatBox-content-demo">

                        <div class="clearfloat">
                            <div class="author-name">
                                <small class="chat-date">2017-12-02 14:26:58</small>
                            </div>
                            <div class="left">
                                <div class="chat-avatars"><img src="${pageContext.request.contextPath}/images/icon01.png" alt="头像"/></div>
                                <div class="chat-message">
                                   你好亲，有什么需要帮助的呢？<br/>
								   快捷键可以快速自动回复哦：<br/>
											输入 1/快递：快递问题 <br/>
											输入 2/质量：质量问题<br/>
											输入 3/整理：是否正品<br/>
											输入 4/码数：码数问题<br/>
											输入 5/保修：保修时间<br/>
                                </div>
                            </div>
                        </div>

                       
                    </div>
                </div>
                <div class="chatBox-send">
                    <div class="div-textarea" contenteditable="true"></div>
                    <div>
                        <button id="chat-biaoqing" class="btn-default-styles">
                            <i class="iconfont icon-biaoqing"></i>
                        </button>
                        <label id="chat-tuxiang" title="发送图片" for="inputImage" class="btn-default-styles">
                            <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                   name="file" id="inputImage" class="hidden">
                            <i class="iconfont icon-tuxiang"></i>
                        </label>
                        <button id="chat-fasong" class="btn-default-styles"><i class="iconfont icon-fasong"></i>
                        </button>
                    </div>
                    <div class="biaoqing-photo">
                        <ul>
                            <li><span class="emoji-picker-image" style="background-position: -9px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -120px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -120px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -120px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -120px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -120px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -120px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -154px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -154px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -154px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -154px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -154px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -154px;"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script>

    screenFuc();
    function screenFuc() {
        var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
        //屏幕小于768px时候,布局change
        var winWidth = $(window).innerWidth();
        if (winWidth <= 768) {
            var totalHeight = $(window).height(); //页面整体高度
            $(".chatBox-info").css("height", totalHeight - topHeight);
            var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
            //中间内容高度
            $(".chatBox-content").css("height", infoHeight - 46);
            $(".chatBox-content-demo").css("height", infoHeight - 46);

            $(".chatBox-list").css("height", totalHeight - topHeight);
            $(".chatBox-kuang").css("height", totalHeight - topHeight);
            $(".div-textarea").css("width", winWidth - 106);
        } else {
            $(".chatBox-info").css("height", 495);
            $(".chatBox-content").css("height", 448);
            $(".chatBox-content-demo").css("height", 448);
            $(".chatBox-list").css("height", 495);
            $(".chatBox-kuang").css("height", 495);
            $(".div-textarea").css("width", 260);
        }
    }
    (window.onresize = function () {
        screenFuc();
    })();
    //未读信息数量为空时
    var totalNum = $(".chat-message-num").html();
    if (totalNum == "") {
        $(".chat-message-num").css("padding", 0);
    }
    $(".message-num").each(function () {
        var wdNum = $(this).html();
        if (wdNum == "") {
            $(this).css("padding", 0);
        }
    });


    //打开/关闭聊天框
    $(".chatBtn").click(function () {
        $(".chatBox").toggle(10);
    })
    $(".chat-close").click(function () {
        $(".chatBox").toggle(10);
    })
    //进聊天页面
    $(".chat-list-people").each(function () {
        $(this).click(function () {
            var n = $(this).index();
            $(".chatBox-head-one").toggle();
            $(".chatBox-head-two").toggle();
            $(".chatBox-list").fadeToggle();
            $(".chatBox-kuang").fadeToggle();

            //传名字
            $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

            //传头像
            $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        })
    });

    //返回列表
    $(".chat-return").click(function () {
        $(".chatBox-head-one").toggle(1);
        $(".chatBox-head-two").toggle(1);
        $(".chatBox-list").fadeToggle(1);
        $(".chatBox-kuang").fadeToggle(1);
    });

    //      发送信息
    $("#chat-fasong").click(function () {
		var myDate = new Date;
		var year = myDate.getFullYear(); //获取当前年
		var mon = myDate.getMonth() + 1; //获取当前月
		var date = myDate.getDate(); //获取当前日
		var hour = myDate.getHours();
		var minutes = myDate.getMinutes() ;
		var seconds = myDate.getSeconds();
		var week = myDate.getDay();
		var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
		var time = year + "年" + mon + "月" + date + "日" + weeks[week]+hour+":"+minutes+":"+seconds;
        var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
        if (textContent != "") {
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">"+time+"</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
                "<div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon02.png\" alt=\"头像\" /></div> </div> </div>");
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        }
		if(textContent==1 || textContent=="快递")
		{

			 $(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\"><small class=\"chat-date\">"+time+"</small></div>"
				+"<div class=\"left\"> <div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\"/></div>"
				+"<div class=\"chat-message\">"
				+"本商城默认都是发顺丰快递，大概2天内就能送到您手中，亲耐心等待哦。"
				+"</div></div></div>"
			 );	
				
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
			
		}
		if(textContent==2 || textContent=="质量")
		{

			 $(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\"><small class=\"chat-date\">"+time+"</small></div>"
				+"<div class=\"left\"> <div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\"/></div>"
				+"<div class=\"chat-message\">"
				+"本商城所有商品都是质量有保证的，质量上乘的。本店已加入消费者保障协会，请亲放心挑选。"
				+"</div></div></div>"
			 );	
				
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
			
		}
		if(textContent==3 || textContent=="正品")
		{

			 $(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\"><small class=\"chat-date\">"+time+"</small></div>"
				+"<div class=\"left\"> <div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\"/></div>"
				+"<div class=\"chat-message\">"
				+"本商城所有商品都是正品保障，正规渠道来源，每件商品都有唯一编码哦。"
				+"</div></div></div>"
			 );	
				
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
			
		}
		if(textContent==4 || textContent=="码数")
		{

			 $(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\"><small class=\"chat-date\">"+time+"</small></div>"
				+"<div class=\"left\"> <div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\"/></div>"
				+"<div class=\"chat-message\">"
				+"衣服码数都是正常标准码数，亲按平时购买的码数挑选即可。"
				+"</div></div></div>"
			 );	
				
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
			
		}
		if(textContent==5 || textContent=="保修")
		{

			 $(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\"><small class=\"chat-date\">"+time+"</small></div>"
				+"<div class=\"left\"> <div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\"/></div>"
				+"<div class=\"chat-message\">"
				+"本商城的电子产品都是有保修服务的，一般都是质保两年，15天内产品有故障支持退换货哦"
				+"</div></div></div>"
			 );	
				
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
			
		}
		if(textContent>5)
		{

			 $(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\"><small class=\"chat-date\">"+time+"</small></div>"
				+"<div class=\"left\"> <div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\"/></div>"
				+"<div class=\"chat-message\">"
				+"抱歉，找不到您要寻找的问题，可以直接拨打商城热线0768-888888888咨询哦"
				+"</div></div></div>"
			 );	
				
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
			
		}
    });

    //      发送表情
    $("#chat-biaoqing").click(function () {
        $(".biaoqing-photo").toggle();
    });
    $(document).click(function () {
        $(".biaoqing-photo").css("display", "none");
    });
    $("#chat-biaoqing").click(function (event) {
        event.stopPropagation();//阻止事件
    });

    $(".emoji-picker-image").each(function () {
        $(this).click(function () {
            var bq = $(this).parent().html();
            console.log(bq)
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"> " + bq + " </div> " +
                "<div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            //发送后关闭表情框
            $(".biaoqing-photo").toggle();
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        })
    });

    //      发送图片
    function selectImg(pic) {
        if (!pic.files || !pic.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var images = evt.target.result;
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"><img src=" + images + "></div> " +
                "<div class=\"chat-avatars\"><img src=\"${pageContext.request.contextPath}/images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        };
        reader.readAsDataURL(pic.files[0]);

    }


</script>

</body>
</html>
