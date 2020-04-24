<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Ajax Example</title>
    <script>
        let request = new XMLHttpRequest();
        function searchInfo() {
            let name = document.userform.studentname.value;
            let url = "/index?val=" + name;
            try {
                request.onreadystatechange = function () {
                    if (request.readyState === 4) { // && request.status === 200) {
                        var val = request.responseText;
                        document.getElementById("myLocation").innerHTML = val;
                    }
                };
                request.open("GET", url);
                request.send();

            } catch (e) {
               alert("Unable connect to server");
            }
        }
    </script>
</head>
<body>
<h1>Student search</h1>
<form name="userform">
    <input type="text" name="studentname" onkeyup="searchInfo()">
</form>

<span id="myLocation"></span>

</body>
</html>
