<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.tscm.model.BmtBicDTO"%>
<%@ page import="com.tscm.model.BmtPostDTO"%>
<%@ page import="com.tscm.model.BmtUserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/Bamen_Sub/project5/css/myprofile.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <title>바멘텀 | 내 프로필</title>
</head>

<style>
    .edit_btn {
        width: 60px;
        height: 40px;
        margin-left: 1250px;
        margin-top: -50px;
        border: 1px solid gray;
    }
</style>
<div class="page">
    <header id="nav_bar">

        <a href="#"><img src="/Bamen_Sub/bamentum_UI02/src/main/webapp/img/bg-img/로고_투명_흰색.png" width="80px"
                class="Logo"></a>
        <nav>
            <ul>
                <li><a href="#" class="menuLink">바멘텀</a></li>
                <li><a href="#" class="menuLink">내 피드보기</a></li>
                <li><a href="#" class="menuLink">Game</a></li>
                <li><a href="#" class="menuLink">Dream</a></li>
            </ul>

        </nav>
        <div class="nav_others">
            <input class="search_win" type="search" placeholder="검색하기!">
            <input class="submit_btn" type="submit" value="검색">

            <a href="#" class="bic_icon"><img class="bic_icon"
                    src="/Bamen_Sub/bamentum_UI02/src/main/webapp/img/bg-img/bicycle.svg"></a>
    </header>


</div>

<body>

	<%
		Logger LOG = LoggerFactory.getLogger(getClass());
		LOG.debug(" page Start : {} ", "05_myprofile.jsp");
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
		String strNowDate = sdf.format(nowDate);
		LOG.debug(" 날짜포맷 지정후 now {}, strNow {} ", nowDate, strNowDate);

		
		ArrayList<BmtBicDTO> listBic = (ArrayList)session.getAttribute("mp_bic_list");;
		
		if(listBic != null)
		{
			LOG.debug("05_myprofile.jsp - listPost size {} ", listBic.size());
			for(int i=0; i< listBic.size(); i++)
			{
				LOG.debug("05_myprofile.jsp - {} : {} : {} : {}", 
						listBic.get(i).getB_num(), listBic.get(i).getU_email(),
						listBic.get(i).getB_img(), listBic.get(i).getB_model());
			}
			
		}
		else {
			LOG.debug("05_myprofile.jsp - listBic null ");
		}

		ArrayList<BmtPostDTO> listPost = (ArrayList)session.getAttribute("mp_post_list");;
		
		if(listPost != null)
		{
			LOG.debug("05_myprofile.jsp - listPost size {} ", listPost.size());
			for(int i=0; i< listPost.size(); i++)
			{
				LOG.debug("05_myprofile.jsp - {} : {} : {} : {}", 
						listPost.get(i).getP_idx(), listPost.get(i).getU_email(),
						listPost.get(i).getP_content(), listPost.get(i).getP_date());
			}
			
		}
		else {
			LOG.debug("05_myprofile.jsp - listPost null ");
		}
		
		BmtUserDTO dtoUser = (BmtUserDTO)session.getAttribute("mp_user");;
		if(dtoUser != null)
		{
			LOG.debug("05_myprofile.jsp - dtoUser email {}, nick {} ", dtoUser.getU_profile(), dtoUser.getU_nick());
		}
		else
		{
			LOG.debug("05_myprofile.jsp - dtoUser null ");
		}
		
	%>    



    <!-- 프로필 사진 / 이름(닉네임) 표시 -->
    <div class="profile_elements">
    
    
        <img class="profile_pic" src=<%= dtoUser.getU_profile() %> >
 
        <h3 class="profile_name"> <%= dtoUser.getU_nick()%> </h3>

    </div>

    <!-- 정보 수정 버튼 -->
    <input class="edit_btn" type="submit" value="수정">


    <!-- 차대번호 표시 -->
    <h2 class="bic_num_letter">차대번호 : </h2>
    <h3 class="bic_num"> 
    	<%
	  		if(listBic != null)
			{
	  			if(listBic.size() > 0)
	  			{
  		%>
				    <%= listBic.get(0).getB_num() %>
    	<%
	  			}
			}
  		%>
		    
		 
    
    </h3>

    <!-- 게시물 / 팔로워 / 팔로잉 수 표시 -->
    <div class="postn_fol">
        <span>게시물</span> <span style="font-weight: 700;"> <%= listPost.size() %> </span> 
        <span style="margin-left : 100px;">팔로워</span> 
        <span style="font-weight: 700;">250</span> 
        <span style="margin-left : 100px;">팔로잉</span> 
        <span style="font-weight: 700;">274</span>
    </div>



    <!-- 내가 쓴 글 표시 -->
    <%
	if(listPost != null)
	{
		LOG.debug("05_myprofile.jsp - listPost size {} ", listPost.size());
		for(int i=0; i< listPost.size(); i++)
		{
	%>

		    <div class="my_write">
		        <p class="write_content"><%= listPost.get(i).getP_content() %> </p>
		    </div>

    <%
		}
	}
    
	%>

    <div class="ad">

    </div>


    <footer style="border : 1px solid red;">
        <div style="width : 100%; height : 50px; color : black; border : 1px solid gray;">
            바멘텀
        </div>
    </footer>


</body>


</html>