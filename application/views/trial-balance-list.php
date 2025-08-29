<!DOCTYPE html>
<html>

<head>
    <!-- TABLES CSS CODE -->
    <?php include"comman/code_css_datatable.php"; ?>
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="<?php echo $theme_link; ?>plugins/datepicker/datepicker3.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <!-- Left side column. contains the logo and sidebar -->

        <?php include"sidebar.php"; ?>


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    <?=$page_title;?>
                    <small>View/Search Sold Items</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active"><?=$page_title;?></li>
                </ol>
            </section>


            <!-- Main content -->
            <?= form_open('#', array('class' => '', 'id' => 'table_form')); ?>
            <input type="hidden" id='base_url' value="<?=$base_url;?>">
            <section class="content">

                <!-- /.row -->
                <div class="row">
                    <!-- ********** ALERT MESSAGE START******* -->
                    <?php include"comman/code_flashdata.php"; ?>
                    <!-- ********** ALERT MESSAGE END******* -->
                    <div class="col-xs-12">
                        <div class="box">
                           
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="example2" class="table table-bordered table-striped" width="100%">
                                    <thead class="bg-primary ">
                                        <tr>
                                            <th class="text-center">
                                                <input type="checkbox" class="group_check checkbox">
                                            </th>
                                            <th>Account Head</th>
                                            <th>New Balance</th>
                                            <th>Credit</th>
                                            <th>Derbit</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                    <tfoot>
                                        <tr class="bg-gray">
                                            <th colspan="2" style="text-align:right">Total</th><!-- 6 -->
                                            <th></th><!-- 7 -->
                                            <th></th><!-- 7 -->
                                            <th></th><!-- 7 -->
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
            <?= form_close();?>
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
    <?php include"comman/code_js_datatable.php"; ?>
    <!-- bootstrap datepicker -->
    <script src="<?php echo $theme_link; ?>plugins/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        //Date picker
        $('.datepicker').datepicker({
            autoclose: true,
            format: 'dd-mm-yyyy',
            todayHighlight: true
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //datatables
            var table = $('#example2').DataTable({

                /* FOR EXPORT BUTTONS START*/
                dom: '<"row margin-bottom-12"<"col-sm-12"<"pull-left"l><"pull-right"fr><"pull-right margin-left-10 "B>>>tip',
                /* dom:'<"row"<"col-sm-12"<"pull-left"B><"pull-right">>> <"row margin-bottom-12"<"col-sm-12"<"pull-left"l><"pull-right"fr>>>tip',*/
                buttons: {
                    buttons: [{
                            extend: 'copy',
                            className: 'btn bg-teal color-palette btn-flat',
                            exportOptions: {
                                columns: [1, 2,3,4]
                            }
                        },
                        {
                            extend: 'excel',
                            className: 'btn bg-teal color-palette btn-flat',
                            exportOptions: {
                                columns: [1, 2,3,4]
                            }
                        },
                        {
                            extend: 'pdf',
                            className: 'btn bg-teal color-palette btn-flat',
                            exportOptions: {
                                columns: [1, 2,3,4]
                            }
                        },
                        {
                            extend: 'print',
                            className: 'btn bg-teal color-palette btn-flat',
                            exportOptions: {
                                columns: [1, 2,3,4]
                            }
                        },
                        {
                            extend: 'csv',
                            className: 'btn bg-teal color-palette btn-flat',
                            exportOptions: {
                                columns: [1, 2,3,4]
                            }
                        },
                        {
                            extend: 'colvis',
                            className: 'btn bg-teal color-palette btn-flat',
                            text: 'Columns'
                        },

                    ]
                },
                /* FOR EXPORT BUTTONS END */

                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
                "responsive": true,
                language: {
                    processing: '<div class="text-primary bg-primary" style="position: relative;z-index:100;overflow: visible;">Processing...</div>'
                },
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "<?php echo site_url('trial_balance/ajax_list')?>",
                    "type": "POST",

                    complete: function (data) {
                        $('.column_checkbox').iCheck({
                            checkboxClass: 'icheckbox_square-orange',
                            /*uncheckedClass: 'bg-white',*/
                            radioClass: 'iradio_square-orange',
                            increaseArea: '10%' // optional
                        });
                        call_code();
                        //$(".delete_btn").hide();
                    },

                },

                //Set column definition initialisation properties.
                "columnDefs": [{
                        "targets": [0, 4], //first column / numbering column
                        "orderable": false, //set not orderable
                    },
                    {
                        "targets": [0],
                        "className": "text-center",
                    },

                ],
                /*Start Footer Total*/
                "footerCallback": function (row, data, start, end, display) {
                    var api = this.api(),
                        data;
                    // Remove the formatting to get integer data for summation
                    var intVal = function (i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                    };
                    var total = api
                        .column(2, {
                            page: 'none'
                        })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                        // console.log(total)
                    var paid = api
                        .column(3, {
                            page: 'none'
                        })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                        var derbit = api
                        .column(4, {
                            page: 'none'
                        })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                   

                    $( api.column(1).footer() ).html('Total');
                    $(api.column(2).footer()).html(app_number_format(total));
                    $(api.column(3).footer()).html(app_number_format(paid));
                    $(api.column(4).footer()).html(app_number_format(derbit));

                },
                /*End Footer Total*/
            });
            new $.fn.dataTable.FixedHeader(table);
        });
    </script>
    <script src="<?php echo $theme_link; ?>js/sales.js"></script>
    <script type="text/javascript">
        function print_invoice(id) {
            window.open("<?= base_url();?>pos/print_invoice_pos/" + id, "_blank",
                "scrollbars=1,resizable=1,height=500,width=500");
        }
    </script>
    <!-- Make sidebar menu hughlighter/selector -->
    <script>
        $(".<?php echo basename(__FILE__,'.php');?>-active-li").addClass("active");
    </script>

</body>

</html>