<?php
include_once('includes/functions.php');
date_default_timezone_set('Asia/Kolkata');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;

$sql_query = "SELECT id, name FROM category ORDER BY id ASC";
$db->sql($sql_query);

$res = $db->getResult();
$sql_query = "SELECT value FROM settings WHERE variable = 'Currency'";
$pincode_ids_exc = "";
$db->sql($sql_query);

$res_cur = $db->getResult();
if (isset($_POST['btnAdd'])) {
    if (ALLOW_MODIFICATION == 0 && !defined(ALLOW_MODIFICATION)) {
        echo '<label class="alert alert-danger">This operation is not allowed in demo panel!.</label>';
        return false;
    }
    if ($permissions['products']['create'] == 1) {
        $error = array();
        $pincode_type = (isset($_POST['product_pincodes']) && $_POST['product_pincodes'] != '') ? $db->escapeString($fn->xss_clean($_POST['product_pincodes'])) : "";   
        if($pincode_type == "all"){
            $pincode_ids = NULL; 
        }else{
           
            if(empty($_POST['pincode_ids_exc'])){
                $error['pincode_ids_exc'] = "<label class='label label-danger'>Select pincodes!.</label>";
            }else{
                $pincode_ids = $fn->xss_clean_array($_POST['pincode_ids_exc']);
                $pincode_ids = implode(",", $pincode_ids);   
            }
        }
        $name = $db->escapeString($fn->xss_clean($_POST['name']));
        $seller_id = $db->escapeString($fn->xss_clean($_POST['seller_id']));
        $tax_id = (isset($_POST['tax_id']) && $_POST['tax_id'] != '') ? $db->escapeString($fn->xss_clean($_POST['tax_id'])) : 0;
        $return_days = (isset($_POST['return_days']) && $_POST['return_days'] != '') ? $db->escapeString($fn->xss_clean($_POST['return_days'])) : 0;
        $slug = $function->slugify($db->escapeString($fn->xss_clean($_POST['name'])));
        $category_id = $db->escapeString($fn->xss_clean($_POST['category_id']));
        $subcategory_id = (isset($_POST['subcategory_id']) && $_POST['subcategory_id'] != '') ? $db->escapeString($fn->xss_clean($_POST['subcategory_id'])) : 0;
       // $serve_for = $db->escapeString($fn->xss_clean($_POST['serve_for']));
        $description = $db->escapeString($fn->xss_clean($_POST['description']));
       // $manufacturer = (isset($_POST['manufacturer']) && $_POST['manufacturer'] != '') ? $db->escapeString($fn->xss_clean($_POST['manufacturer'])) : '';
      //  $made_in = (isset($_POST['made_in']) && $_POST['made_in'] != '') ? $db->escapeString($fn->xss_clean($_POST['made_in'])) : '';
        $indicator = (isset($_POST['indicator']) && $_POST['indicator'] != '') ? $db->escapeString($fn->xss_clean($_POST['indicator'])) : '0';
       // $return_status = (isset($_POST['return_status']) && $_POST['return_status'] != '') ? $db->escapeString($fn->xss_clean($_POST['return_status'])) : '0';
       // $cancelable_status = (isset($_POST['cancelable_status']) && $_POST['cancelable_status'] != '') ? $db->escapeString($fn->xss_clean($_POST['cancelable_status'])) : '0';
      //  $till_status = (isset($_POST['till_status']) && $_POST['till_status'] != '') ? $db->escapeString($fn->xss_clean($_POST['till_status'])) : '';
        //$is_approved = (isset($_POST['is_approved']) && $_POST['is_approved'] != '') ? $db->escapeString($fn->xss_clean($_POST['is_approved'])) : 1;

        // get image info
        $image = $db->escapeString($fn->xss_clean($_FILES['image']['name']));
        $image_error = $db->escapeString($fn->xss_clean($_FILES['image']['error']));
        $image_type = $db->escapeString($fn->xss_clean($_FILES['image']['type']));

        // create array variable to handle error
        

        if (empty($name)) {
            $error['name'] = " <span class='label label-danger'>Required!</span>";
        }
        
        if (empty($tax_id)) {
            $error['tax_id'] = " <span class='label label-danger'>Required!</span>";
        }

      //  if ($cancelable_status == 1 && $till_status == '') {
        //    $error['cancelable'] = " <span class='label label-danger'>Required!</span>";
       // }

        if (empty($category_id)) {
            $error['category_id'] = " <span class='label label-danger'>Required!</span>";
        }

      //  if (empty($description)) {
           // $error['description'] = " <span class='label label-danger'>Required!</span>";
      //  }


        // common image file extensions
        $allowedExts = array("gif", "jpeg", "jpg", "png");

        // get image file extension
        error_reporting(E_ERROR | E_PARSE);
        $extension = end(explode(".", $_FILES["image"]["name"]));

        if ($image_error > 0) {
            $error['image'] = " <span class='label label-danger'>Not uploaded!</span>";
        } else {
            // $mimetype = mime_content_type($_FILES["image"]["tmp_name"]);
            // if (!in_array($mimetype, array('image/jpg', 'image/jpeg', 'image/gif', 'image/png'))) {
            //     $error['image'] = " <span class='label label-danger'>Image type must jpg, jpeg, gif, or png!</span>";
            // }
            $result = $fn->validate_image($_FILES["image"]);
            if ($result) {
                $error['image'] = " <span class='label label-danger'>Image type must jpg, jpeg, gif, or png!!!</span>";
            }
        }
        $error['other_images'] = '';
        if ($_FILES["other_images"]["error"][0] == 0) {
            for ($i = 0; $i < count($_FILES["other_images"]["name"]); $i++) {
                $_FILES["other_images"]["type"][$i];
                if ($_FILES["other_images"]["error"][$i] > 0) {
                    $error['other_images'] = " <span class='label label-danger'>Images not uploaded!</span>";
                } else {
                    // $mimetype = mime_content_type($_FILES["other_images"]["tmp_name"][$i]);
                    // if (!in_array($mimetype, array('image/jpg', 'image/jpeg', 'image/gif', 'image/png'))) {
                    //     $error['other_images'] = " <span class='label label-danger'>Image type must jpg, jpeg, gif, or png!</span>";
                    // }
                    $result = $fn->validate_other_images($_FILES["other_images"]["tmp_name"][$i], $_FILES["other_images"]["type"][$i]);
                    if ($result) {
                        $error['other_images'] = " <span class='label label-danger'>Image type must jpg, jpeg, gif, or png!</span>";
                    }
                }
            }
        }

        if (!empty($name) && !empty($category_id)  && empty($error['other_images']) && empty($error['image'])  &&  empty($error['pincode_ids_inc'])) {

            // create random image file name
            $string = '0123456789';
            $file = preg_replace("/\s+/", "_", $_FILES['image']['name']);

            $image = $function->get_random_string($string, 4) . "-" . date("Y-m-d") . "." . $extension;

            // upload new image
            $upload = move_uploaded_file($_FILES['image']['tmp_name'], 'upload/images/' . $image);
            $other_images = '';
            if (isset($_FILES['other_images']) && ($_FILES['other_images']['size'][0] > 0)) {
                //Upload other images
                $file_data = array();
                $target_path = 'upload/other_images/';
                for ($i = 0; $i < count($_FILES["other_images"]["name"]); $i++) {

                    $filename = $_FILES["other_images"]["name"][$i];
                    $temp = explode('.', $filename);
                    $filename = microtime(true) . '-' . rand(100, 999) . '.' . end($temp);
                    $file_data[] = $target_path . '' . $filename;
                    if (!move_uploaded_file($_FILES["other_images"]["tmp_name"][$i], $target_path . '' . $filename))
                        echo "{$_FILES['image']['name'][$i]} not uploaded<br/>";
                }
                $other_images = json_encode($file_data);
            }

            $upload_image = 'upload/images/' . $image;

            // insert new data to product table
            $sql = "INSERT INTO products (name,tax_id,seller_id,slug,category_id,subcategory_id,image,other_images,description,indicator,manufacturer,made_in,return_status,cancelable_status, till_status,type,pincodes,is_approved,return_days) VALUES('$name','$tax_id','$seller_id','$slug','$category_id','$subcategory_id','$upload_image','$other_images','$description','$indicator','','','0','0','','$pincode_type','$pincode_ids','1','$return_days')";
            //echo $sql;
           // var_dump($sql);
            $db->sql($sql);
            $product_result = $db->getResult();
            if (!empty($product_result)) {
                $product_result = 0;
            } else {
                $product_result = 1;
            }

            $sql = "SELECT id from products ORDER BY id DESC";
            $db->sql($sql);
            $res_inner = $db->getResult();
            if ($product_result == 1) {
                //if ($_POST['type'] == 'packet') {
                   // $packate_measurement = $db->escapeString($fn->xss_clean($_POST['packate_measurement']));
                     $product_id = $db->escapeString($res_inner[0]['id']);
                       // $type = $db->escapeString($fn->xss_clean($_POST['type']));
                      //  $measurement = $db->escapeString($fn->xss_clean($_POST['packate_measurement'][$i]));
                      //  $measurement_unit_id = $db->escapeString($fn->xss_clean($_POST['packate_measurement_unit_id'][$i]));

                        $price = $db->escapeString($fn->xss_clean($_POST['packate_price']));
                        $discounted_price = !empty($_POST['packate_discounted_price']) ? $db->escapeString($fn->xss_clean($_POST['packate_discounted_price'])) : 0;
                        $serve_for = $db->escapeString($fn->xss_clean($_POST['packate_serve_for']));
                       // $stock = $db->escapeString($fn->xss_clean($_POST['packate_stock'][$i]));
                       // $serve_for = ($stock == 0 || $stock <= 0) ? 'Sold Out' : $serve_for;
                      //  $stock_unit_id = $db->escapeString($fn->xss_clean($_POST['packate_stock_unit_id'][$i]));

                        $sql = "INSERT INTO product_variant (product_id,price,discounted_price,serve_for) VALUES('$product_id','$price','$discounted_price','$serve_for')";
                        $db->sql($sql);
                        $product_variant = $db->getResult();
                   
                    if (!empty($product_variant)) {
                        $product_variant = 0;
                    } else {
                        $product_variant = 1;
                    }
              //  } 
            }
            if ($product_result == 1 && $product_variant == 1) {
                $error['add_menu'] = "<section class='content-header'>
                                                <span class='label label-success'>Product Added Successfully</span>
                                                <h4><small><a  href='products.php'><i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Products</a></small></h4>
                                                 </section>";
            } else {
                $error['add_menu'] = " <span class='label label-danger'>Failed</span>";
            }
        }
    } else {
        $error['check_permission'] = " <section class='content-header'> <span class='label label-danger'>You have no permission to create product</span></section>";
    }
}
?>
<section class="content-header">
    <h1>Add Product</h1>
    <?php echo isset($error['add_menu']) ? $error['add_menu'] : ''; ?>
    <ol class="breadcrumb">
        <li><a href="home.php"><i class="fa fa-home"></i> Home</a></li>
    </ol>

</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php if ($permissions['products']['create'] == 0) { ?>
                <div class="alert alert-danger">You have no permission to create product.</div>
            <?php } ?>
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Add Product</h3>
                </div>
                <div class="box-header">
                    <?php echo isset($error['cancelable']) ? '<span class="label label-danger">Till status is required.</span>' : ''; ?>
                </div>

                <!-- /.box-header -->
                <!-- form start -->
                <form id='add_product_form' method="post" enctype="multipart/form-data">
                    <?php
                    $sql = "SELECT * FROM unit";
                    $db->sql($sql);
                    $res_unit = $db->getResult();
                    ?>
                    <div class="box-body">
                        <div class="row">
                        <div class="form-group">
                            <div class='col-md-6'>
                                <label for="exampleInputEmail1">Product Name</label> <i class="text-danger asterik">*</i><?php echo isset($error['name']) ? $error['name'] : ''; ?>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                           <!-- <div class='col-md-4'> -->
                              <!--   <label class="control-label" for="seller_id">Seller</label><i class="text-danger asterik">*</i>
                                <?php // $db->sql("SET NAMES 'utf8'");
                                 // $sql = "SELECT id,name FROM seller ORDER BY id + 0 ASC";
                               //  $db->sql($sql);
                               // $sellers = $db->getResult();
                                ?>
                                <select id='seller_id' required name="seller_id" class='form-control'>
                                    <option value=''>Select Seller</option>
                                    <?php //foreach ($sellers as $row) { ?>
                                        <option value='<? // = $row['id'] ?>'><? //= $row['name'] ?></option>
                                    <?php // } ?>
                                </select> -->
                                <input type="hidden" class="form-control" name="seller_id" value="1" required>
                           <!--  </div> -->
                            <?php $db->sql("SET NAMES 'utf8'");
                            $sql = "SELECT * FROM `taxes` ORDER BY id DESC";
                            $db->sql($sql);
                            $taxes = $db->getResult();
                            ?>
                            <div class='col-md-6'>
                                <label class="control-label " for="taxes">Tax</label>
                                <select id='tax_id' name="tax_id" class='form-control'>
                                    <option value=''>Select Tax</option>
                                    <?php foreach ($taxes as $tax) { ?>
                                        <option value='<?= $tax['id'] ?>'><?= $tax['title'] . " - " . $tax['percentage'] . " %" ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                       <!--  <label for="type"><br>Type</label> -->
                        <?php // echo isset($error['type']) ? $error['type'] : ''; ?>
                        <!-- <div class="form-group">
                            <label class="radio-inline"><input type="radio" name="type" id="packate" value="packet" checked>Packet</label>
                            <label class="radio-inline"><input type="radio" name="type" id="loose" value="loose">Loose</label>
                        </div> -->
                        <hr>
                      <!--  <div id="packate_div" style="display:none">  -->
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group packate_div">
                                        <label for="price">Price (<?= $settings['currency'] ?>):</label> <i class="text-danger asterik">*</i><input type="number" step="any" min='0' class="form-control" name="packate_price" id="packate_price" required />
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group packate_div">
                                        <label for="discounted_price">Discounted Price(<?= $settings['currency'] ?>):</label>
                                        <input type="number" step="any" min='0' class="form-control" name="packate_discounted_price" id="discounted_price" />
                                    </div>
                                </div>
                               
                                <div class="col-md-2">
                                    <div class="form-group packate_div">
                                        <label for="qty">Status:</label>
                                        <select name="packate_serve_for" class="form-control" required>
                                            <option value="Available">Available</option>
                                            <option value="Sold Out">Sold Out</option>
                                        </select>
                                    </div>
                                </div>
                               
                            </div>
                       <!--  </div> -->

                       
                        <div id="variations">
                        </div>
                        <hr>
                       
                        <div class="form-group">
                            <label for="category_id">Category :</label> <i class="text-danger asterik">*</i><?php echo isset($error['category_id']) ? $error['category_id'] : ''; ?>
                            <select name="category_id" id="category_id" class="form-control" required>
                                <option value="">--Select Category--</option>
                                <?php if ($permissions['categories']['read'] == 1) { ?>
                                    <?php foreach ($res as $row) { ?>
                                        <option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
                                <?php }
                                } ?>
                            </select>
                            <br />
                        </div>
                        <div class="form-group">
                            <label for="subcategory_id">Sub Category :</label>
                            <select name="subcategory_id" id="subcategory_id" class="form-control">
                                <option value="">--Select Sub Category--</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Product Type :</label>
                            <select name="indicator" id="indicator" class="form-control">
                                <option value="0">--Select Type--</option>
                                <option value="1">Veg</option>
                                <option value="2">Non Veg</option>
                            </select>
                        </div>
                      <!--   <div class="form-group">
                            <label for="">Manufacturer :</label>
                            <input type="text" name="manufacturer" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Made In :</label>
                            <input type="text" name="made_in" class="form-control">
                        </div> -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="product_pincodes">Delivery Places :</label><i class="text-danger asterik">*</i>
                                    <select name="product_pincodes" id="product_pincodes" class="form-control" required>
                                        <option value="">Select Option</option>
                                        <option value="included">Pincode Included</option>
                                        <option value="excluded">Pincode Excluded</option>
                                        <option value="all">Includes All</option>
                                    </select>
                                    <br />
                                </div>
                            </div>
                            <div class="col-md-4 pincodes">
                                <div class="form-group ">
                                    <label for='pincode_ids_exc'>Select Pincodes <small>( Ex : 100,205, 360 <comma separated>)</small></label><?php echo isset($error['pincode_ids_exc']) ? $error['pincode_ids_exc'] : ''; ?>
                                    <select name='pincode_ids_exc[]' id='pincode_ids_exc' class='form-control' placeholder='Enter the pincode you want to allow delivery this product' multiple="multiple">
                                        <?php $sql = 'select id,pincode from `pincodes` where `status` = 1 order by id desc';
                                        $db->sql($sql);
                                        $result = $db->getResult();
                                        foreach ($result as $value) {
                                        ?>
                                            <option value='<?= $value['id'] ?>'><?= $value['pincode'] ?></option>
                                        <?php } ?>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                          <!--   <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Is Returnable? :</label><br>
                                    <input type="checkbox" id="return_status_button" class="js-switch">
                                    <input type="hidden" id="return_status" name="return_status">
                                </div>
                            </div>
                            <div class="col-md-3" id="return_day" style="display:none">
                                <div class="form-group">
                                    <label for="return_day">Max Return Days :</label>
                                    <input type="number" step="any" min="0" class="form-control" placeholder="Number of days to Return" name="return_days" id="return_days" />
                                </div>
                            </div> 
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Is cancel-able? :</label><br>
                                    <input type="checkbox" id="cancelable_button" class="js-switch">
                                    <input type="hidden" id="cancelable_status" name="cancelable_status">
                                </div>
                            </div>
                            <div class="col-md-3" id="till-status" style="display:none">
                                <div class="form-group">
                                    <label for="">Till which status? :</label> <i class="text-danger asterik">*</i> <?php // echo isset($error['cancelable']) ? $error['cancelable'] : ''; ?><br>
                                    <select id="till_status" name="till_status" class="form-control">
                                        <option value="">Select</option>
                                        <option value="received">Received</option>
                                        <option value="processed">Processed</option>
                                        <option value="shipped">Shipped</option>
                                    </select>
                                </div>
                            </div> -->
                        </div>
                        <div class="form-group">
                            <label for="image">Main Image : <i class="text-danger asterik">*</i>&nbsp;&nbsp;&nbsp;*Please choose square image of larger than 350px*350px & smaller than 550px*550px.</label><?php echo isset($error['image']) ? $error['image'] : ''; ?>
                            <input type="file" name="image" id="image" required>
                        </div>
                        <div class="form-group">
                            <label for="other_images">Other Images of the Product: *Please choose square image of larger than 350px*350px & smaller than 550px*550px.</label><?php echo isset($error['other_images']) ? $error['other_images'] : ''; ?>
                            <input type="file" name="other_images[]" id="other_images" multiple>
                        </div>
                        <div class="form-group">
                            <label for="description">Description :</label> <? //php echo isset($error['description']) ? $error['description'] : ''; ?>
                            <textarea name="description" id="description" class="form-control" rows="8"></textarea>
                            <script type="text/javascript" src="css/js/ckeditor/ckeditor.js"></script>
                            <script type="text/javascript">
                                CKEDITOR.replace('description');
                            </script>
                        </div>
                   <!--      <div class="row">
                            <div class="form-group col-md-4">
                                <div class="form-group">
                                    <label class="control-label">Product Status</label>
                                    <div id="status" class="btn-group">
                                        <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                            <input type="radio" name="is_approved" value="1"> Approoved
                                        </label>
                                        <label class="btn btn-danger" data-toggle-class="btn-danger" data-toggle-passive-class="btn-default">
                                            <input type="radio" name="is_approved" value="2"> Not-Approoved
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <input type="submit" class="btn-primary btn" value="Add" name="btnAdd" />&nbsp;
                        <input type="reset" class="btn-danger btn" value="Clear" id="btnClear" />
                        <!--<div  id="res"></div>-->
                    </div>
                </form>
            </div>
            <!-- /.box -->
        </div>
    </div>
</section>
<div class="separator"> </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script>
    $('#seller_id').on('change', function(e) {
        var seller_id = $('#seller_id').val();
        $.ajax({
            type: 'POST',
            url: "public/db-operation.php",
            data: 'get_categories_by_seller=1&seller_id=' + seller_id,
            beforeSend: function() {
                $('#category_id').html('<option>Please wait..</option>');
            },
            success: function(result) {
                $('#category_id').html(result);
            }
        });
    });

    var changeCheckbox = document.querySelector('#return_status_button');
    var init = new Switchery(changeCheckbox);
    changeCheckbox.onchange = function() {
        if ($(this).is(':checked')) {
            $('#return_status').val(1);
            $('#return_day').show();
        } else {
            $('#return_status').val(0);
            $('#return_day').hide();
            $('#return_day').val('');
        }
    };
    // $('.pincodes').hide();
    $('#pincode_ids_exc').prop('disabled', true);

    $('#product_pincodes').on('change', function() {
        var val = $('#product_pincodes').val();
        if (val == "included" || val == "excluded") {
            $('#pincode_ids_exc').prop('disabled', false);
        } else {
            $('#pincode_ids_exc').prop('disabled', true);
        }
    });
    $('#pincode_ids_exc').select2({
        width: 'element',
        placeholder: 'type in category name to search',

    });
</script>

<script>
    var changeCheckbox = document.querySelector('#cancelable_button');
    var init = new Switchery(changeCheckbox);
    changeCheckbox.onchange = function() {
        if ($(this).is(':checked')) {
            $('#cancelable_status').val(1);
            $('#till-status').show();

        } else {
            $('#cancelable_status').val(0);
            $('#till-status').hide();
            $('#till_status').val('');
        }
    };
</script>
<script>
    $('#pincode_ids_inc').select2({
        width: 'element',
        placeholder: 'type in category name to search',

    });

    if ($('#packate').prop('checked')) {
        $('#packate_div').show();
        $('#packate_server_hide').hide();
        $('.loose_div').children(":input").prop('disabled', true);
        $('#loose_stock_div').children(":input").prop('disabled', true);
    }

    $.validator.addMethod('lessThanEqual', function(value, element, param) {
        return this.optional(element) || parseInt(value) < parseInt($(param).val());
    }, "Discounted Price should be lesser than Price");
</script>

<script>
    var num = 2;
</script>
<script>
    $('#add_product_form').validate({

        ignore: [],
        debug: false,
        rules: {
            name: "required",
            measurement: "required",
            price: "required",
            quantity: "required",
            image: "required",
            category_id: "required",
            stock: "required",
            discounted_price: {
                lessThanEqual: "#price"
            },
            //description: {
              //  required: function(textarea) {
                  //  CKEDITOR.instances[textarea.id].updateElement();
                  //  var editorcontent = textarea.value.replace(/<[^>]*>/gi, '');
                  //  return editorcontent.length === 0;
               // }
          //  },
            pincode_ids_inc: {
                empty: {
                    depends: function(element) {
                        return $("#pincode_ids_exc").is(":blank");
                    }
                }
            }

        }
    });
    $('#btnClear').on('click', function() {
        for (instance in CKEDITOR.instances) {
            CKEDITOR.instances[instance].setData('');
        }
    });
</script>
<script>
    $(document).on('click', '.remove_variation', function() {
        $(this).closest('.row').remove();
    });


    $(document).on('change', '#category_id', function() {
        $.ajax({
            url: "public/db-operation.php",
            data: "category_id=" + $('#category_id').val() + "&change_category=1",
            method: "POST",
            success: function(data) {
                $('#subcategory_id').html("<option value=''>---Select Subcategory---</option>" + data);
            }
        });
    });

    $(document).on('change', '#packate', function() {
        $('#variations').html("");
        $('#packate_div').show();
        $('#packate_server_hide').hide();
        $('.packate_div').children(":input").prop('disabled', false);
        $('#loose_div').hide();
        $('.loose_div').children(":input").prop('disabled', true);
        $('#loose_stock_div').hide();
        $('#loose_stock_unit_id').hide();
        $('#loose_stock_div').children(":input").prop('disabled', true);

    });
    $(document).on('change', '#loose', function() {
        $('#variations').html("");
        $('#loose_div').show();
        $('.loose_div').children(":input").prop('disabled', false);
        $('#loose_stock_div').show();
        $('#loose_stock_div').children(":input").prop('disabled', false);
        $('#packate_server_hide').show();
        $('#packate_div').hide();
        $('.packate_div').children(":input").prop('disabled', true);

    });

    // function validate_amount(value) {
    //     if (parseInt(value) < 0) {
    //         alert('You Can not enter amount less than zero.');
    //     }
    // }
</script>