<!DOCTYPE html>
<html>
    <head>
        <title>W3Adda Index Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body bgcolor="grey">
        <form name="frm" action="mailprocess.jsp" method="post">
            <table>
                <tr><td><b><font color="White">To:
                    </td>
                    <td><b><b><input type="text" name="mail" value="Enter Sender Email"/><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="white">Subject:
                    </td>
                    <td>
                        <input type="text" name="sub" value="Enter Subject"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="white">Message Text:
                    </td>
                    <td>
                        <textarea rows="12" cols="80" name="mess"></textarea><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Send">
                    </td>
                    <td>
                        <input type="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>