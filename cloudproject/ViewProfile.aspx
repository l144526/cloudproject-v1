<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="cloudproject.ViewProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Css/custom.css" rel="stylesheet" />
</head>
<body>

    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="Home.aspx" style="padding-top: 0px;">
            <img src="images/logo/hover_logo.svg" height="25" />
        </a>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <form runat="server" class="form-inline my-2 my-lg-0 ml-auto">
                <a href="EditProfile.aspx">
                    <asp:Button CssClass="btn btn-outline-success my-2 my-sm-0" ID="edit_profile_button" runat="server" Text="Edit Profile" OnClick="Unnamed_Click" />
                </a>
            </form>
        </div>
    </nav>
    <main role="main" class="container">
        <div class="jumbotron">
            <div class="d-flex align-items-center">
                <div class="p-2">
                    
                   <img src="images/default_avatar.svg" class="rounded-circle ml-4 border border-success"  height="300" width="300">
                    </div>
                <div class="p-2" style="margin-left:35px">
                    <div class="media-body">
                        <h3 class="mt-0 text-success"><asp:label runat="server" ID="name_label"></asp:label></h3>
                        <p><asp:label runat="server" ID="Email_adress"></asp:label></p>
                    </div>
                </div>
            </div>

        </div>


    </main>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
</body>
</html>
