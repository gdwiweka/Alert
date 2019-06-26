<%-- 
    Document   : data
    Created on : Jun 21, 2019, 10:58:53 AM
    Author     : ASUS
--%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>

    <script>
        function check() {
            if (document.getElementById('regionId').value == "" || document.getElementById('regionName').value == "") {
                Swal.fire('Please Fill Out The Data!');
                return false;
            }
            Swal.fire(
                    'Good job!',
                    'You clicked the button!',
                    'success'
                    );
            return true;

        }
    </script>

    <script>
        function myDelete() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                            )
                }
            })
        }
    </script>

<!--    <script>
        $(document).ready(function () {
            $('#btnSubmit').click(function () {
                $('#myAlert').show('fade');
            });
        });
    </script>-->

    <br><br>
    <%
        List<Region> regions = (List<Region>) session.getAttribute("regions");
        Region region = (Region) session.getAttribute("region");
        boolean isRegionsNull = regions == null;
        if (isRegionsNull) {
            response.sendRedirect("region");
        }
    %>
    <body>
<!--        <div id="myAlert" class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Success!</strong> Data has added succesfully.
        </div>-->
        <div class="container">
            <br>
            <h1 class="text-center">Region</h1>
            <!--name itu name servlet-->
            <form action="region" method="POST">
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <input type="number" id="regionId" class="form-control" placeholder="Enter ID" name="regionId" value="<%=(region != null) ? region.getId() : ""%>"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" id="regionName" class="form-control" placeholder="Enter Name" name="regionName" value="<%=(region != null) ? region.getName() : ""%>"/>
                    </div>
                </div>

                <button type="submit" id="btnSubmit" onclick="return check()" class="btn btn-primary" >Submit</button>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Launch demo modal
                </button>
            </form>

            <br>
            <h2 class="text-center">List Region</h2>
            <table id="data-table" class="table table-striped" border="1">
                <thead class="thead-dark">
                    <tr>
                        <th>No</th>
                        <th>ID </th>
                        <th>Name </th>
                        <th>Country List</th>
                        <th>Action </th>
                    </tr>
                </thead>

                <tbody>
                    <% int j = 1;
                        if (!isRegionsNull) {
                            for (Region region1 : regions) {

                    %>  
                    <tr>
                        <td><%=j++%></td>
                        <td><%=region1.getId()%></td>
                        <td><% out.println(region1.getName());%></td>
                        <%if (region1.getCountryList().isEmpty()) {%>
                        <td>--</td>
                        <td>
                            <a class="btn btn-primary" href="region?action=update&id=<%=region1.getId()%>">update</a>
                            <a class="btn btn-danger" id="myDelete" onClick="myDelete()" href="region?action=delete&id=<%=region1.getId()%>">delete</a>
                        </td>
                        <%} else {%>
                        <td>
                            <%for (int i = 0; i < region1.getCountryList().size(); i++) {%>
                            <%=region1.getCountryList().get(i).getName()%><br>
                            <%}%>
                        </td>
                        <td>
                            <a class="btn btn-primary" href="region?action=update&id=<%=region1.getId()%>">update</a>
                            <a class="btn btn-danger disabled"href="region?action=delete&id=<%=region1.getId()%>">delete</a>
                        </td>
                        <%}%>
                    </tr>
                    <% }
                        }%>
                </tbody>
            </table>
        </div>
    </body>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <%
        session.removeAttribute("regions");
        session.removeAttribute("region");
    %>

</html>
<%@include file="footer.jsp"%>
