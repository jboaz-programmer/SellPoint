<!DOCTYPE html>
<html>

<head>
    <!-- TABLES CSS CODE -->
    <?php include"comman/code_css_form.php"; ?>
    <!-- </copy> -->
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <?php include"sidebar.php"; ?>
        <?php
      
	if(!isset($ac_name)){
      $ac_name=$q_id=$ac_code=$opening_balance=$ac_memo=$main_id=$new_balance="";
  }
 ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                   Account Head
                    <small>Add/Update Account Head</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="<?php echo $base_url; ?>country">Account Head List</a></li>
                    <li class="active">Account Head</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- Horizontal Form -->
                        <div class="box box-info ">
                            <div class="box-header with-border">
                                <h3 class="box-title">Please Enter Valid Data</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form class="form-horizontal" id="account-form" onkeypress="return event.keyCode != 13;">
                                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>"
                                    value="<?php echo $this->security->get_csrf_hash();?>">
                                <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">
                                <div class="box-body">

                                    <div class="row">
                                        <div class="col-md-6">

                                            <div class="form-group">
                                                <label for="country_name" class="col-sm-2 control-label">A/C Code<label
                                                        class="text-danger">*</label></label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control input-sm" id="ac_code"
                                                        name="ac_code" placeholder="" value="<?php print $ac_code; ?>" autofocus>
                                                    <span id="ac_code" style="display:none" class="text-danger"></span>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="col-md-6">

                                            <div class="form-group">
                                                <label for="country_name" class="col-sm-2 control-label">Balance </label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control input-sm" id="opening_balance"
                                                        name="opening_balance" placeholder="" value="<?php print $new_balance; ?>" autofocus>
                                                    <span id="opening_balance" style="display:none" class="text-danger"></span>
                                                </div>
                                            </div>
                                        </div>

                                            <div class="form-group col-md-6">
                                            <label for="main_id" class="col-sm-2 control-label">Main Account </label>
                                            <div class="col-sm-8">
                                            <select class="form-control select2" id="main_id" name="main_id"  style="width: 100%;"  value="<?php print $main_id; ?>">
                                                <?php
                                                $query1="select * from db_account_main";
                                                $q1=$this->db->query($query1);
                                                if($q1->num_rows($q1)>0)
                                                    {  echo '<option value="">-Select-</option>'; 
                                                        foreach($q1->result() as $res1)
                                                    { 
                                                        $selected = ($main_id==$res1->id)? 'selected' : '';
                                                        echo "<option $selected value='".$res1->id."'>".$res1->ac_title."</option>";
                                                    }
                                                    }
                                                    else
                                                    {
                                                    ?>
                                                <option value="">No Records Found</option>
                                                <?php
                                                }
                                                ?>
                                            </select>
                                            </div>
                                            <span id="brand_id_msg" style="display:none" class="text-danger"></span>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label for="country_name" class="col-sm-2 control-label">A/C Name <label class="text-danger">*</label></label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="form-control input-sm" id="ac_name"
                                                            name="ac_name" placeholder="" value="<?php print $ac_name; ?>" autofocus>
                                                        <span id="ac_name" style="display:none"
                                                            class="text-danger"></span>
                                                    </div>
                                                </div>


                                            </div>


                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label for="country_name" class="col-sm-2 control-label">Memo </label>
                                                    <div class="col-sm-8">
                                                        <textarea type="text" class="form-control input-sm" id="ac_memo"
                                                            name="ac_memo" id="ac_memo"><?php print $ac_memo; ?></textarea>

                                                        <span id="ac_code" style="display:none"
                                                            class="text-danger"></span>
                                                    </div>
                                                </div>


                                            </div>

                                        </div>


                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <div class="col-sm-8 col-sm-offset-2 text-center">
                                            <!-- <div class="col-sm-4"></div> -->
                                            <?php
                      if($ac_name!=""){
                           $btn_name="Update";
                           $btn_id="update";
                          ?>
                                            <input type="hidden" name="q_id" id="q_id" value="<?php echo $q_id;?>" />
                                            <?php
                      }
                                else{
                                    $btn_name="Save";
                                    $btn_id="save";
                                }
                      
                                ?>

                                            <div class="col-md-3 col-md-offset-3">
                                                <button type="button" id="<?php echo $btn_id;?>"
                                                    class=" btn btn-block btn-success"
                                                    title="Save Data"><?php echo $btn_name;?></button>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="<?=base_url('dashboard');?>">
                                                    <button type="button"
                                                        class="col-sm-3 btn btn-block btn-warning close_btn"
                                                        title="Go Dashboard">Close</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.box-footer -->
                            </form>
                        </div>
                        <!-- /.box -->

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->

            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <?php include"footer.php"; ?>


        <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->
    <!-- SOUND CODE -->
    <?php include"comman/code_js_sound.php"; ?>
    <!-- TABLES CODE -->
    <?php include"comman/code_js_form.php"; ?>

    <script src="<?php echo $theme_link; ?>js/account-head.js"></script>
    <!-- Make sidebar menu hughlighter/selector -->
    <script>
        $(".<?php echo basename(__FILE__,'.php');?>-active-li").addClass("active");
    </script>

</body>

</html>