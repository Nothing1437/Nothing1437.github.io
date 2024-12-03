<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学院官网</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="fixed-top.css">
    <link rel="stylesheet" href="script.js">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <!-- 引入Slick轮播CSS文件 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    
    <style type="text/css">
        /* 响应式样式 */
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
            .header .logo img {
                max-height: 70px;
                margin-right: 6px;
            }
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

<!-- 首页轮播图 -->
<section id="hero-slider" class="hero-slider">
    <div class="container-md" data-aos="fade-in">
        <div class="row justify-content-center"> <!-- 使用Bootstrap居中对齐 -->
            <div class="col-10 col-md-8"> <!-- 控制轮播图容器宽度 -->
                <div class="slider" id="xyslider">
                    <div id="slideBox" class="slideBox">
                        <div class="hd">
                            <ul>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                        <div class="bd">
                            <ul>
                                <li><img src="/S3E1FinalEx/upload/article/images/index1/aadb098e-06d9-43d9-9dcb-3b56040f7b2b.jpg" alt="Image 1"/></li>
                                <li><img src="/S3E1FinalEx/upload/article/images/index2/5c3a3356-2cf3-43fa-995a-d7ac2521b7af.jpg" alt="Image 2"/></li>
                                <li><img src="/S3E1FinalEx/upload/article/images/index3/ee752bea-7290-4427-873e-fa062526262e.jpg" alt="Image 3"/></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    /* 设置轮播容器大小和居中 */
    #slideBox {
        width: 100%;
        max-width: 1200px; /* 可根据需要设置最大宽度 */
        margin: auto;
        overflow: hidden;
    }

    /* 设置图片统一大小，并在容器内居中显示 */
    #slideBox .bd ul li img {
        width: 100%;
        height: 400px; /* 统一高度 */
        object-fit: cover; /* 保证图片覆盖容器 */
        display: block;
        margin: auto;
    }
</style>


<!-- 引入jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 引入Slick的JavaScript文件 -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
    $(document).ready(function(){
        // 使用Slick初始化轮播
        $('#slideBox .bd ul').slick({
            infinite: true,          // 无限循环
            slidesToShow: 1,         // 每次显示1张图片
            slidesToScroll: 1,       // 每次滚动1张
            autoplay: true,          // 自动播放
            autoplaySpeed: 3000,     // 每3秒切换一次
            dots: true,              // 显示底部的圆点导航
            arrows: true             // 显示左右箭头
        });
    });
</script>

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

<!-- 主要板块展示 -->
<style>
    /* 设置整体的板块容器 */
    .sections {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }

    /* 学院新闻板块占左三分之一宽度，并独占一行 */
    .section-news {
        flex: 0 0 33%; /* 左三分之一宽度 */
        background-color: #e0f7e9; /* 浅绿色背景 */
        padding: 20px;
        box-sizing: border-box;
        margin-bottom: 20px; /* 给下方板块留出间距 */
    }
    
    .section-images {
        flex: 0 0 60%; /* 图片区域占三分之一宽度 */
        background-color: #f1f8f5;
        padding: 20px;
        box-sizing: border-box;
        margin-bottom: 20px;
    }

    /* 图片设置宽度为容器的三分之一 */
    .image-container img {
        width: 48%; /* 每个图片占容器宽度的三分之一 */
        height: auto;
        object-fit: cover;
    }

    /* 其他板块占二分之一宽度，每行两个 */
    .section {
        flex: 0 0 48%; /* 每个板块占据二分之一宽度 */
        background-color: #f1f8f5; /* 浅绿色背景 */
        padding: 20px;
        box-sizing: border-box;
        margin-bottom: 20px; /* 给下方板块留出间距 */
    }

    /* 标题样式 */
    .section h2 {
        background-color: #24936E; /* 深绿色标题背景 */
        color: white;
        padding: 10px;
        border-radius: 5px;
        margin-top: 0;
        margin-bottom: 10px;
        text-align: center;
    }
    
    .card-group {
    display: flex;
    justify-content: space-between;
    gap: 20px; /* 图片间距 */
}

.card {
    flex: 1;
    text-align: center;
}

.card img {
    width: 100%; /* 保证图片自适应宽度 */
    height: 200px; /* 设置固定高度，必要时调整 */
    object-fit: cover; /* 保持比例覆盖容器 */
}

.card-body {
    margin-top: 10px; /* 让文字与图片有间距 */
}

.card-title a {
    color: #24936E; /* 链接颜色 */
    text-decoration: none; /* 去掉下划线 */
    font-size: 14px;
}

.card-title a:hover {
    text-decoration: underline; /* 鼠标悬停时显示下划线 */
}
</style>




<section class="sections">
    <!-- 学院新闻板块，保持左三分之一宽度并独占一行 -->
<div class="section-news">
    <div class="section-header">
        <h2 data-type="学院新闻">学院新闻</h2>
        <a href="/S3E1FinalEx/NewsList.jsp" class="news-button" onclick="redirectToNewsList(this)">
            <i class="bi bi-list" style="font-size:24px; color:green;"></i>
        </a>
    </div>
    <ul>
        <li><a href="/S3E1FinalEx/TestNews.jsp">新闻标题1</a></li>
        <li><a href="/S3E1FinalEx/TestNews.jsp">新闻标题2</a></li>
        <li><a href="#">新闻标题3</a></li>
        <li><a href="#">新闻标题4</a></li>
    </ul>
</div>


    
    
    <div class="section-images">
        <div class="row" id="xwhd"  frag="窗口301" portletmode="simpleNews" configs="{'c28':'500','c14':'1','c1':'1','c29':'1','c39':'300','c38':'100','c21':'0','c4':'1','c6':'20','c9':'0','c12':'0','c30':'0','c37':'1','c31':'0','c16':'1','c27':'480','c15':'0','c32':'','c5':'_blank','c40':'1','c17':'0','c19':'yyyy-MM-dd','c33':'500','c2':'序号,标题,发布时间,图片','c23':'1','c41':'240','c22':'0','c7':'1','c13':'200','c43':'0','c24':'240','c35':'-1:-1','c3':'2','c8':'1','c44':'0','c25':'320','c34':'300','c18':'yyyy-MM-dd','c20':'0','c42':'320','c10':'50','c11':'1','c36':'0','c26':'1'}" contents="{'c2':'0', 'c1':'/学院新闻'}">
                            
                                <div class="card-group d-flex">
    <div class="col d-flex flex-column align-items-center mb-6" style="flex: 1; margin: 5px;">
        <div class="card h-100">
            <a href="/S3E1FinalEx/TestNews.jsp">
                <img src="https://jsjxy.shiep.edu.cn/_upload/article/images/b1/13/bfca5fe043838bd4b924cfe65090/4194244d-2812-4eca-8c96-a2989bac1e54.jpg" class="card-img-top" alt="..." />
            </a>
            <div class="card-body text-center">
                <span class="card-title" style="font-size: 14px;">
                    <a href='/S3E1FinalEx/TestNews1.jsp' target='_blank' title='砥砺奋进，共话时代青年责任—计算机学院开展“一站式”学生社区之“我与校领导面对面”活动'>
                        砥砺奋进，共话时代青年责任
                    </a>
                </span>
            </div>
        </div>
    </div>
    
    <div class="col d-flex flex-column align-items-center mb-6" style="flex: 1; margin: 5px;">
        <div class="card h-100">
            <a href="/ee/12/c972a257554/page.htm">
                <img src="/S3E1FinalEx/upload/article/images/index2/5c3a3356-2cf3-43fa-995a-d7ac2521b7af.jpg" class="card-img-top" alt="..." />
            </a>
            <div class="card-body text-center">
                <span class="card-title" style="font-size: 14px;">
                    <a href='/ee/12/c972a257554/page.htm' target='_blank' title='中国计算机学会分布式计算与系统专委走进上海电力大学活动成功举办'>
                        中国计算机学会分布式计算活动
                    </a>
                </span>
            </div>
        </div>
    </div>
</div>

                            
                        </div>
    </div>

    <!-- 其他六个板块，二分之一宽度，每行两个板块 -->
    <div class="section">
        <h2>教务通知</h2>
        <ul>
            <li><a href="#">通知标题1</a></li>
            <li><a href="#">通知标题2</a></li>
            <li><a href="#">通知标题3</a></li>
            <li><a href="#">通知标题4</a></li>
            <li><a href="#">通知标题5</a></li>
        </ul>
    </div>
    <div class="section">
        <h2>通知公告</h2>
        <ul>
            <li><a href="#">公告标题1</a></li>
            <li><a href="#">公告标题2</a></li>
            <li><a href="#">公告标题3</a></li>
            <li><a href="#">公告标题4</a></li>
            <li><a href="#">公告标题5</a></li>
        </ul>
    </div>
    <div class="section">
        <h2>研究生教学</h2>
        <ul>
            <li><a href="#">教学动态1</a></li>
            <li><a href="#">教学动态2</a></li>
            <li><a href="#">教学动态3</a></li>
            <li><a href="#">教学动态4</a></li>
            <li><a href="#">教学动态5</a></li>
        </ul>
    </div>
    <div class="section">
        <h2>学术讲座</h2>
        <ul>
            <li><a href="#">讲座安排1</a></li>
            <li><a href="#">讲座安排2</a></li>
            <li><a href="#">讲座安排3</a></li>
            <li><a href="#">讲座安排4</a></li>
            <li><a href="#">讲座安排5</a></li>
        </ul>
    </div>
    <div class="section">
        <h2>学生工作</h2>
        <ul>
            <li><a href="#">活动安排1</a></li>
            <li><a href="#">活动安排2</a></li>
            <li><a href="#">活动安排3</a></li>
            <li><a href="#">活动安排4</a></li>
            <li><a href="#">活动安排5</a></li>
        </ul>
    </div>
    <div class="section">
        <h2>招聘信息</h2>
        <ul>
            <li><a href="#">招聘信息1</a></li>
            <li><a href="#">招聘信息2</a></li>
            <li><a href="#">招聘信息3</a></li>
            <li><a href="#">招聘信息4</a></li>
            <li><a href="#">招聘信息5</a></li>
        </ul>
    </div>
</section>


<!-- 底部 -->
<footer>
    <p>学院官网 © 2024</p>
</footer>
</body>
</html>
