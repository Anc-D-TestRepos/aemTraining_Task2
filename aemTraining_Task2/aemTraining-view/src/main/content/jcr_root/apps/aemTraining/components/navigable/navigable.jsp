<%@include file="/libs/foundation/global.jsp"%>


<%@page session="false" %>
<%@ page import="aemTraining.taglib.PageParamTag"%>
<%@taglib prefix="PageTag" uri="http://cqblueprints.com/examples/cqblueprints-examples-taglib"%>

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

                    <c:forEach items="${currentStyle}" var="Level" >
                        <c:if test="${fn:containsIgnoreCase(Level.key, 'rootPath')}">

                            <PageTag:getProp  firstValue="${Level.value}"/>
                            <c:forEach items="${firstValue}" var="LevelTag" >
                                   <li class="list_item_first_level "><a href='${LevelTag.value}.html'>${LevelTag.key}</a>

                                    <c:choose>
                                        <c:when test="${fn:contains(currentPage.path, Level.value)}">
                                            <c:set var="pathForSecMenu" value="${LevelTag.key}" />
                                            <div class="arrow"></div> 
                                        </c:when>
                                        <c:otherwise>
                                        	<div class="notarrow"></div>
                                        </c:otherwise>
                                    </c:choose>
                                	</li>
                

                            </c:forEach>
                
                        </c:if>
                    </c:forEach>


                </ul>
            </div>

        <div class="clr"></div>

            <div class="second_level_wrapper">
                <ul class="ul_second_level">

                   <c:forEach items="${currentStyle}" var="Level2" >
                       <c:set var="childPages" value="multiPath${pathForSecMenu}" />
                        <c:if test="${fn:containsIgnoreCase(Level2.key, childPages)}">
    
                            <c:forEach items="${Level2.value}" var="levelPath" >

                                <PageTag:getProp  secondValue="${levelPath}"/>
                                <c:forEach items="${secondValue}" var="secLevelTag" >

                                    <c:choose>
                                        <c:when test="${ fn:toLowerCase(fn:trim(currentPage.title))== fn:toLowerCase(fn:trim(secLevelTag.key))}">
                                          <li class="current"> <a class="current" href="${secLevelTag.value}.html">${secLevelTag.key} </a></li>
                                        </c:when>
                                        <c:otherwise>

                                        <li> <a href="${secLevelTag.value}.html">${secLevelTag.key} </a></li>
    
                                        </c:otherwise>
                                    </c:choose>
    
                                </c:forEach>

                            </c:forEach>
                        </c:if>
                    </c:forEach>


               </ul>

            </div>
        </div>
    </div>
