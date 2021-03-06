<%@page import="wz.service.BestPostBiz"%>
<%@page import="wz.model.BestPost"%>
<%@page import="wz.model.Post"%>
<%@page import="wz.service.PostBiz"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("username") == null){
	response.sendRedirect("/edit-project/login.jsp");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>浏览我的文章</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <jsp:include page="/pages/header.jsp"/>
   
   <div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=path%>/pages/change-info.jsp">更改个人信息</a></li>
                <li role="presentation" ><a href="<%=path%>/pages/user_create_discuss.jsp">新建文章分类</a></li>
                <li role="presentation" class="active"><a href="<%=path%>/pages/mypost.jsp">我的公开文章</a></li>
                <li role="presentation"><a href="<%=path%>/pages/myprivatepost.jsp">我的私有文章</a></li>
                <li role="presentation"><a href="<%=path+"/publish_post.jsp"%>">新建文章</a></li>
                <li role="presentation"><a href="<%=path+"/publish_private_post.jsp"%>">新建私有文章</a></li>
                <li role="presentation"><a href="<%=path%>/pages/records.jsp">精华文章申请记录</a></li>

            </ul>
        </div>

        <div class="col-md-9">

            <ul class="list-group">
                <a class="list-group-item active">
                    我的文章
                </a>

               <% ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                  	   PostBiz postBiz = (PostBiz)context.getBean("postBiz");
                  	   String pageNumStr = request.getParameter("page");
                  	   int pageNum = 1;
                  	   if (pageNumStr != null)
                  	   pageNum = Integer.parseInt(pageNumStr);
                  	   List<Post> posts = postBiz.getPostByUserId((Integer)session.getAttribute("userId"),pageNum,10);
                  	    BestPostBiz bestPostBiz = (BestPostBiz)context.getBean("bestPostBiz");
                  	   for (Post post:posts){
                  	  
                  	  
                %>
               
                <div class="list-group-item">
                    <a href="<%=path%>/pages/post.jsp?postId=<%=post.getId()%>&&page=1" style="color:grey">
                        <h4 class="list-group-item-heading" style="color:black">[<%=post.getTitle() %>]</h4>
                        <%=post.getSubSubForum().getTitle()%>
                    </a>
                    
                    <a href="<%=path%>/userPostdelete.action?postId=<%=post.getId() %>" style="float: right">删除&nbsp;</a>
                    <a href="<%=path%>/editpost.action?postId=<%=post.getId()%>" style="float: right">编辑&nbsp;</a>
                    <a href="<%=path%>/pubToPri.action?postId=<%=post.getId()%>" style="float: right">设置私有&nbsp;</a>
                    <%if (post.getPostType() == 0 && !bestPostBiz.isExist(post.getId())) {%>
                    <a href="<%=path%>/applybest.action?postId=<%=post.getId()%>" style="float: right">申请精华&nbsp;</a>
                    <%} %>
                    <p style="float: right;margin-right: 50px">浏览量:<%=post.getViewNum()%>&nbsp;评论量:<%=post.getReplyNum()%>&nbsp;发表日期:<%=post.getTime()%></p>
                </div>
 				<%} %>
            </ul>
            
   <ul class="pagination pagination-lg" style="float:right">
<% if (pageNum>1) { int pageIndex = pageNum -1;%>
    <li><a href="<%=path+"/pages/mypost.jsp?page="+pageIndex%>">&laquo;</a></li>
    <%}
    	if (pageNum<=5){
    		for (int i=1; i<=5; i++){
    		if (pageNum == i){
     %>
    <li class="active"><a href="<%=path+"/mypost.jsp?page="+i%>"><%=i%></a></li>
    <%}else {
     %>
    <li><a href="<%=path+"/pages/mypost.jsp?page="+i%>"><%=i%></a></li>
    <%}
    if (i ==5){
    %>
     <li><a href="<%=path+"/pages/mypost.jsp?page="+6%>">&raquo;</a></li>
   <%}}}
    if (pageNum >5){
    int maxPage = pageNum+1;
    for (int i=4; i>=0; i--){
    	int pageIndex = pageNum - i;
    	if (i==0){
     %>
     <li class="active"><a href="<%=path+"/pages/mypost.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
   
    <%}else {%>
     <li class=""><a href="<%=path+"/pages/mypost.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
     <%}}%>
      <li><a href="<%=path+"/pages/mypost.jsp?page="+maxPage%>">&raquo;</a></li>
    <%}%>
    
   
</ul><br>

        </div>
    </div>
</div>



  </body>
</html>
