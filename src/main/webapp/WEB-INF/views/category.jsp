<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/6770b2fa5e.js" crossorigin="anonymous"></script>
    <script><%@include file="/WEB-INF/js/Category.js"%></script>

    <script src="https://kit.fontawesome.com/6770b2fa5e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/users.css" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

</head>
<body>





<a href=<%=request.getContextPath()%>> Back to home</a>
<br/>
<form method="post">
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Category name" aria-label="Enter category name"
               aria-describedby="button-addon2" name="categoryName">
        <div style="margin-right: 5px ; width: 300px">
            <input type="submit" name="create" value="Create Category" class="btn btn-primary">
        </div>
    </div>
</form>

<ol>
    <c:forEach items="${categories}" var="catagory">
        <li>
            <div>
                <c:out value="Category id: ${catagory.id}  Category name: ${catagory.name}"/>

                <form action="categories/delete" method="post">
                    <button type="button" value="Delete" class="btn btn-danger" data-toggle="modal"
                            data-target="#exampleModal" onclick="setIdForDelete('${catagory.id}');
                            setNameForDelete('${catagory.name}')"> Delete </button>
                </form>

            </div>
        </li>
    </c:forEach>
</ol>


<!-- Delete Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%--Span tagine id istifade etmekle js funksiyasi ile html deyer oturulur--%>
                <h3>Are you sure to delete <span id="nameForDelete"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                <form action="categories/delete" method="post">
                    <%--id inputuna "idForDelete" id`sinden istifade etmekle js funksiyasi ile yuxaridaki delete duymesini click`leyende id deyeri oturulur--%>
                    <input type="hidden" name="id" value="" id="idForDelete">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
