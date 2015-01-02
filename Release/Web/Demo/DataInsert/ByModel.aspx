<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox" %>
<%@ Import Namespace="MuaModel.muabox" %>
<%@ Import Namespace="MuaBox._Config" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>使用模型新增数据</title>
</head>
<body>

    <% 
        artist artist = new artist();

        artist.artist_name = "周杰伦";

        PageProcess pageProcess = new PageProcess(typeof(artist), artist, PageProcessMode.DataInsert);

        pageProcess.Execute();
        
    %>

</body>
</html>
