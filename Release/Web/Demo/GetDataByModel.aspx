<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox" %>
<%@ Import Namespace="MuaModel.muabox" %>
<%@ Import Namespace="MuaBox._Config" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>通过模型获取指定ID的歌手信息</title>
    <style type="text/css">
    span { color: #0000ff; }
    </style>
</head>
<body>

    <%
        MySqlParameter[] mySqlParameter = new MySqlParameter[1];
        
        mySqlParameter[0] = new MySqlParameter("@id_artist", MySqlDbType.Int32);
        mySqlParameter[0].Value = 16;

        artist[] artistes = DbHelper.GetModelData<artist>(mySqlParameter);

        if (artistes != null)
        {
            foreach (artist artist in artistes)
            {
                Response.Write("<p>artist id: [<span>" + artist.id_artist + "</span>] artist name: [<span>" + artist.artist_name + "</span>]</p>");
            }
        }
    %>

</body>
</html>
