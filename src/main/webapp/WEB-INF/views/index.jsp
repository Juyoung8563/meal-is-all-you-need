<%@ page import="org.example.mealisallyouneed.model.vo.Anime" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>📖 만화, 애니 추천~ 📖</title>
    <link href="https://fonts.googleapis.com/css2?family=Pretendard&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Pretendard', sans-serif;
        }

        body {
            background-color: #1e1e2f;
            color: #f1f1f1;
            padding: 2rem;
        }

        h1 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            color: #ffffff;
        }

        section {
            max-width: 700px;
            margin: 0 auto 2rem auto;
            background-color: #2a2a40;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        ul {
            list-style: none;
        }

        li {
            background-color: #35354f;
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 8px;
        }

        li form {
            margin-top: 0.5rem;
        }

        input[type="text"], input[type="hidden"] {
            padding: 0.6rem;
            border: none;
            border-radius: 6px;
            width: 100%;
            background-color: #44445e;
            color: #f1f1f1;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        label {
            font-weight: 500;
            font-size: 0.95rem;
        }

        button {
            padding: 0.7rem 1.2rem; /* 좌우 여백 추가로 버튼이 더 넓게 */
            background-color: #4c7fff;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s ease;
            min-width: 80px;
            text-align: center;
        }

        button:hover {
            background-color: #3b6eea;
        }

        time, small {
            color: #bbb;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>
<h1>📖 만화, 애니 추천 받어유 📖</h1>

<section>
    <ul>
        <% for (Anime a : (List<Anime>) request.getAttribute("result")) { %>
        <li>
            <strong><%= a.title() %></strong><br>
            <small><%= a.description() %></small><br>
            <time><%= a.createdAt() %></time><br>
            ♥️ <%= a.votes() %>
            <form method="post" action="vote">
                <input type="hidden" value="<%= a.uuid() %>" name="uuid" />
                <button>추천</button>
            </form>
        </li>
        <% } %>
    </ul>
</section>

<section>
    <form action="anime" method="post">
        <label>
            제목
            <input name="title" type="text" placeholder="예: 귀멸의 칼날">
        </label>
        <label>
            설명
            <input name="description" type="text" placeholder="예: 오니를 물리치는 이야기">
        </label>
        <button>등록</button>
    </form>
</section>
</body>
</html>
