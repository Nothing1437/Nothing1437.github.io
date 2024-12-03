/**
 * 
 */
 function redirectToNewsList(button) {
    // 获取标题的类型
    const type = button.closest('.section-news').querySelector('h2').getAttribute('data-type');
    // 跳转到 NewsList.jsp，并将 type 作为参数
    window.location.href = `/S3E1FinalEx/NewsList.jsp?type=${encodeURIComponent(type)}`;
}
