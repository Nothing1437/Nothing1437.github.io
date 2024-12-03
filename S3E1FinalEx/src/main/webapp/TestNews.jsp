<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="dao.ArticleDao" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="fixed-top.css">
    <title>文章展示</title>
    
    <style type="text/css">
        @media (max-width: 1279px) {
            .navbar {
                padding: 0;
                z-index: 9997;
            }
            .navbar ul {
                    display: none;
                    position: absolute;
                    inset: 55px 15px 15px 15px;
                    padding: 10px 0;
                    margin: 0;
                    border-radius: 10px;
                    background-color: #24936E;
                    overflow-y: auto;
                    transition: 0.3s;
                    z-index: 9998;
             }
        }
    </style>
    
    <style>
        .article-container {
            width: 90%;          
            max-width: 1200px;   
            margin: 0 auto;      
            padding: 0 5%;       
            box-sizing: border-box; 
        }
    </style>
</head>
<body>
<!-- 顶部导航栏 -->
 <!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center fixed-top" style="background:linear-gradient(to left, rgb(21, 153, 87), rgb(21, 87, 153));height:100px">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-between" frag="面板101">
            <a href="https://jsjxy.shiep.edu.cn/" class="logo d-flex align-items-center">
                <img src="/S3E1FinalEx/upload/article/images/index/logonew_1.png" style="width:6%; height:auto;" ><img  src="/S3E1FinalEx/upload/article/images/index/logonew_2.png"style="width:15%; height:auto;">
            </a>
    <nav>
        <ul>
            <li><a href="#">首页</a></li>
            <li><a href="#">学院新闻</a></li>
            <li><a href="#">教务通知</a></li>
            <li><a href="#">通知公告</a></li>
            <li><a href="#">研究生教学</a></li>
            <li><a href="#">学术讲座</a></li>
            <li><a href="#">学生工作</a></li>
            <li><a href="#">招聘信息</a></li>
            
            
        </ul>
    </nav>
    </div>
</header>

<main id="main">
    <section id="posts" class="posts">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <img src="/S3E1FinalEx/upload/article/images/index/bannernew1.jpg" id="webbanner" width="1300" height="270"/>
                </div>
                <!-- 文章展示区域 -->
                <div class="col-12 article-container">
                    <% 
                        // 从数据库中获取文章内容
                        ArticleDao articleDao = new ArticleDao();
                        String articleContent = articleDao.getArticleContentByID(6); // 获取 ID 为 1 的文章内容

                        if (articleContent != null) {
                            // 输出文章内容到 HTML 页面
                            out.println(articleContent);
                        } else {
                            out.println("<p>未找到文章内容。</p>");
                        }
                    %>
                </div>
            </div>
        </div>
    </section>
</main>


<script type="text/javascript">
            function isMobile() {
				var userAgentInfo = navigator.userAgent;
				var mobileAgents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
				var mobile_flag = false;
				for(var v = 0; v < mobileAgents.length; v++) {
					if(userAgentInfo.indexOf(mobileAgents[v]) > 0) {
						mobile_flag = true;
						break;
					}
				}
				var screen_width = window.screen.width;
				var screen_height = window.screen.height;
				if(screen_width < 500 && screen_height < 800) {
					mobile_flag = true;
				}
				return mobile_flag;
			}
				$(function() {
                    $(".slideBox").slide({
					    mainCell: ".bd ul",
					    effect: "leftLoop",
					    vis: "auto",
					    autoPlay: true,
					    trigger: "mouseover"
				    });
                    $(".position-relative>a").hide();

                    var mobile_flag = isMobile();
                    let isNarrowScreen = window.matchMedia("only screen and (max-width: 760px)").matches;
                    if(mobile_flag) {

                       if(isNarrowScreen){
                         // $(".card .list-group-item  span").remove();
                          $("div.right-part").remove();
                          $(".left-part").css("width","100%");
                          $("#xyslider img").css("height","190px");
                       }
                    }
				});
        </script>
        <style type="text/css">
            .card-img-top {
                width:100%;
                height: 35vh;
                object-fit: cover;
            }
            .zyContainer {
                display: flex; 
            }
            .zyContainer .left-part{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
           }  
            .left-part {
                width: 80%; 
            }
 
            .right-part {
                width: 20%; 
            }
        </style>
        <style>
            .h-100 {
                width: 100%;
                height: 273px;
            }
            .h-100 img {
                    width: auto;
                    height: 242px;
                    max-width: 100%;
           }
        </style>
        <script type="text/javascript">
	        function resizeImage(img) {
                 img.style.width = img.width < img.height ? '100%' : 'auto';
                // img.style.height = img.width < img.height ? 'auto' : '100%';
                  img.style.height ='260px';
             }
        </script>

</body>

<!-- 底部 -->
<footer>
    <p>学院官网 © 2024</p>
</footer>
</html>
