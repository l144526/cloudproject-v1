<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="cloudproject.EditProfile" %>

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

    </nav>
    <main role="main" class="container">
        <div class="jumbotron">
            
            <form runat="server">
                <div class="container" >
                    <h1 class="text-success">Edit Profile</h1>
                    <div class="row" style="margin-top: 35px">
                        
                        <div class="col"><asp:TextBox runat="server" ID="name" CssClass="form-control"  placeholder="Name" autofocus="true"  style="margin-bottom: 10px"/>
                            <asp:TextBox runat="server" type="Password" ID="password" CssClass="form-control" placeholder="New Password" autofocus="true" style="margin-bottom: 15px"/>
                            <asp:Button runat="server" CssClass="btn btn-success ml-auto" type="submit" Text="Update Details" OnClick="Update_Click" />

                        </div>
                        <div class="col">
                        </div>

                    </div>
                </div>

            </form>
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
