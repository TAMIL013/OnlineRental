<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <title>Document</title>
</head>
 
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
    </script>
    <div class="container mb-1 border border-gray border-bottom-0" style="height: 70px;">
        <ul class="nav nav-tabs mt-4">
            <li class="nav-item"><a class="nav-link active" href="adminUpload.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link " href="">Product</a></li>
            <li class="nav-item"><a href="admintableview" class="nav-link">Table View</a></li>
        </ul>
    </div>
	
	
	
	
    <!-- adding form -->
    <div class="container">
        <div class="row">

            <div class="card">
                <div class="card-body">

                    <form method="POST" enctype="multipart/form-data" action="upload">
                        <div class="form-group mb-3">
                            <label for="categoryid" class="form-label">Category</label>
                            <select class="form-select" id="categoryid" name="category"required>
                                <option selected></option>
                                <option value="Celebration">Celebration</option>
                                <option value="Cinematography">Cinematography</option>
                                <option value="Instruments">Instruments</option>
                                <option value="Tool Kit">Tool Kit</option>
                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label for="mainpicid" class="form-label">Thumbnail Image</label>
                            <input type="file" name="mainpic" id="mainpicid" class="form-control"
                                placeholder="select thumbnail image" required>
                        </div>


                        <div class="form-group mb-3">
                            <label for="subpicid" class="form-label">Image</label>
                            <input type="file" name="subpic" id="subpicid" class="form-control"
                                placeholder="select image" multiple required>
                        </div>
                        <div class="row">
                            <div class="col-6">

                                <div class="form-group mb-3">
                                    <label for="nameid" class="form-label">Product Name</label>
                                    <input type="text" name="name" id="nameid" class="form-control"
                                        placeholder="select name" required>
                                </div>
                            </div>
                            <div class="col-6">

                                <div class="form-group mb-3">
                                    <label for="priceid" class="form-label">Price</label>
                                    <input type="text" id="priceid" name="price" class="form-control"
                                        placeholder="select price" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group mb-3">
                                    <label for="refundid" class="form-label">Refundable Deposit</label>
                                    <input type="text" id="refundid" name="refund" class="form-control"
                                        placeholder="select refund" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group mb-3">
                                    <label for="rentid" class="form-label">Daily Rent</label>
                                    <input type="text" id="rentid" name="rent" class="form-control"
                                        placeholder="select rent" required>
                                </div>

                            </div>
                        </div>
                        <div class="alert alert-secondary" role="alert">
                            Extra Details
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group mb-3">
                                    <label for="modelnumberid" class="form-label">Model Number</label>
                                    <input type="text" name="modelnumber" id="modelnumberid" class="form-control"
                                        placeholder="select modelnumer" required>
                                </div>

                            </div>
                            <div class="col-6">
                                <div class="form-group mb-3">
                                    <label for="colorid" class="form-label">Color</label>
                                    <input type="text" id="colorid" name="color" class="form-control"
                                        placeholder="select color" required>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group mb-3">
                                    <label for="dimensionid" class="form-label">Dimension</label>
                                    <input type="text" id="dimensionid" name="dimension" class="form-control"
                                        placeholder="select Dimension" required>
                                </div>

                            </div>
                            <div class="col-6">

                                <div class="form-group mb-3">
                                    <label for="Weightid" class="form-label">Weight</label>
                                    <input type="text" id="Weightid" name="weight" class="form-control"
                                        placeholder="select Weight" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-9">
                                <div class="form-group mb-3">
                                    <label for="manfuid" class="form-label">Manufacturer</label>
                                    <input type="text" id="manfuid" name="manfu" class="form-control"
                                        placeholder="select Manufacturer" required>
                                </div>

                            </div>
                            <div class="col-3">
                                <div class="form-group">

                                    <button type="submit" id="btnid" class="btn btn-success btn-sm "
                                        style="margin-top: 25%;">submit</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <script src="script.js"></script>
</body>

</html>