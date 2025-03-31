<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>마법의 계산기</title>
</head>
<body>
    <pre>결과는 <%= request.getAttribute("result") %></pre>

    <section>
        <form action="anime" method="post">
            <label>이름 : <input name="title"></label>
            <label>설명 : <input name="description"></label>
            <button>등록</button>
        </form>
    </section>
</body>
</html>