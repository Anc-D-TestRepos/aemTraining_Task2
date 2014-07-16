
<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>

<%@ page import="aemTraining.taglib.GetNodeChildTag"%>
<%@taglib prefix="nodeTag" uri="http://cqblueprints.com/examples/cqblueprints-examples-taglib"%>


<div id="header">
    <div class="navigation_wrapper">
        <div class="header_navigation topnavigation">
            <div class="first_level_wrapper">

                <ul class="first_level">
					<li class="list_item_first_level">
                        <a class="logo_from_header" href="/content/myContent/nav_page/News.html">
                            <img title="EPAM Systems" src="/apps/aemTraining/resources/images/logo-white.png">
                            <span style="font-size: 9px"></span>
                        </a>
                    </li>
                    <nodeTag:getChild  firstValue="/content/myContent/nav_page/"/>


					<c:forEach items="${firstValue}" var="firstLevel" >

                        <li class="list_item_first_level ">
    
                            <a href='${firstLevel.value}.html'>${firstLevel.key}</a>
    
                        </li>
    
                        <c:if test="${fn:containsIgnoreCase(currentPage.path, firstLevel.key)}">
    
                           <c:set var="secondLevelPath" value="${firstLevel.value}" />
                        </c:if>

                    </c:forEach>

                </ul>
            </div>

        <div class="clr"></div>

            <div class="second_level_wrapper">
            	<ul class="ul_second_level">

                    <nodeTag:getChild  secondValue="${secondLevelPath}"/>

					<c:forEach items="${secondValue}" var="secondLevel" >

         				<li> <a href="${secondLevel.value}.html">${secondLevel.key} </a></li>

					</c:forEach>

               </ul>
            </div>
        </div>
    </div>



