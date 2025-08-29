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
      // 

      //total purchase amt
      $q9=$this->db->query("SELECT COALESCE(SUM(b.qty*a.purchase_price),0) AS  opening_stock_price   FROM db_items AS a , db_stockentry AS b WHERE a.id=b.item_id");
      $opening_stock_price=$q9->row()->opening_stock_price;

      //total purchase amt
      $q4=$this->db->query("SELECT COALESCE(SUM(a.tax_amt),0) AS tax_amt FROM db_purchaseitems as a,db_purchase as b where a.purchase_id=b.id and b.purchase_status='Received'");
      $purchase_tax_amt=$q4->row()->tax_amt;

      //total purchase amt
      $q1=$this->db->query("SELECT COALESCE(SUM(grand_total),0) AS pur_total FROM db_purchase where purchase_status='Received'");
      $pur_total=$q1->row()->pur_total;
      $pur_total-=$purchase_tax_amt;

      //Other Charge of Purchase entry
      $q10=$this->db->query("SELECT COALESCE(SUM(other_charges_amt),0) AS other_charges_amt FROM db_purchase where purchase_status='Received'");
      $pur_other_charges_amt=$q10->row()->other_charges_amt;

      //Disount purchase entry
      $q13=$this->db->query("SELECT COALESCE(SUM(a.discount_amt),0) AS discount_amt FROM db_purchaseitems as a,db_purchase as b where a.purchase_id=b.id and b.purchase_status='Received'");
      $purchase_discount_amt=$q13->row()->discount_amt;

      //if($purchase_discount_amt==0){
        $q14=$this->db->query("SELECT COALESCE(SUM(tot_discount_to_all_amt),0) AS tot_discount_to_all_amt FROM db_purchase where purchase_status='Received'");
        $purchase_discount_amt+=$q14->row()->tot_discount_to_all_amt;
      //}

      //purchase Paid Amount
      $purchase_paid_amount=$this->db->query("SELECT COALESCE(SUM(paid_amount),0) AS paid_amount FROM db_purchase")->row()->paid_amount;

      //total purchase return amt
      $q5=$this->db->query("SELECT COALESCE(SUM(tax_amt),0) AS tax_amt FROM db_purchaseitemsreturn");
      $purchase_return_tax_amt=$q5->row()->tax_amt;

      //total purchase return amt
      $q6=$this->db->query("SELECT COALESCE(SUM(grand_total),0) AS pur_total FROM db_purchasereturn");
      $pur_return_total=$q6->row()->pur_total;
      $pur_return_total-=$purchase_return_tax_amt;

      //Other Charge of Purchase return entry
      $q11=$this->db->query("SELECT COALESCE(SUM(other_charges_amt),0) AS other_charges_amt FROM db_purchasereturn");
      $pur_return_other_charges_amt=$q10->row()->other_charges_amt;

      //Disount purchase return entry
      $q15=$this->db->query("SELECT COALESCE(SUM(discount_amt),0) AS discount_amt FROM db_purchaseitemsreturn");
      $purchase_return_discount_amt=$q15->row()->discount_amt;

      //if($purchase_return_discount_amt==0){
        $q16=$this->db->query("SELECT COALESCE(SUM(tot_discount_to_all_amt),0) AS tot_discount_to_all_amt FROM db_purchasereturn");
        $purchase_return_discount_amt+=$q16->row()->tot_discount_to_all_amt;
     // }
      //Purchase Return Paid Amount
      $purchase_return_paid_amount=$this->db->query("SELECT COALESCE(SUM(paid_amount),0) AS paid_amount FROM db_purchasereturn")->row()->paid_amount;


      //total sales amt
      $q2=$this->db->query("SELECT COALESCE(SUM(a.tax_amt),0) AS tax_amt FROM db_salesitems as a,db_sales as b where a.sales_id=b.id and b.sales_status='Final'");
      $sales_tax_amt=$q2->row()->tax_amt;

      //Other Charge of Sales entry
      $q10=$this->db->query("SELECT COALESCE(SUM(other_charges_amt),0) AS other_charges_amt FROM db_sales where sales_status='Final'");
      $sal_other_charges_amt=$q10->row()->other_charges_amt;

      //Disount sales entry
     /* $q13=$this->db->query("SELECT COALESCE(SUM(a.discount_amt),0) AS discount_amt FROM db_salesitems as a,db_sales as b where a.sales_id=b.id and b.sales_status='Final'");
      $sales_discount_amt=$q13->row()->discount_amt;
*/
      //if($sales_discount_amt==0){
        $q14=$this->db->query("SELECT COALESCE(SUM(tot_discount_to_all_amt),0) AS tot_discount_to_all_amt FROM db_sales where sales_status='Final'");
        $sales_discount_amt=$q14->row()->tot_discount_to_all_amt;
    //  }

      //Total SAles amount
      $query6="SELECT COALESCE(sum(grand_total),0) AS tot_sal_grand_total FROM db_sales where sales_status='Final'";
      $sal_total=$this->db->query($query6)->row()->tot_sal_grand_total;
      //$sal_total-=$sales_tax_amt;

      //sales Paid Amount
      $sales_paid_amount=$this->db->query("SELECT COALESCE(SUM(paid_amount),0) AS paid_amount FROM db_sales")->row()->paid_amount;

      //total sales return amt
      $q5=$this->db->query("SELECT COALESCE(SUM(tax_amt),0) AS tax_amt FROM db_salesitemsreturn");
      $sales_return_tax_amt=$q5->row()->tax_amt;

      //total sales return amt
      $q6=$this->db->query("SELECT COALESCE(SUM(grand_total),0) AS sal_total FROM db_salesreturn");
      $sal_return_total=$q6->row()->sal_total;
      $sal_return_total-=$sales_return_tax_amt;

      //Other Charge of Sales return entry
      $q11=$this->db->query("SELECT COALESCE(SUM(other_charges_amt),0) AS other_charges_amt FROM db_salesreturn");
      $sal_return_other_charges_amt=$q10->row()->other_charges_amt;

      //Disount sales return entry
      $q15=$this->db->query("SELECT COALESCE(SUM(discount_amt),0) AS discount_amt FROM db_salesitemsreturn");
      $sales_return_discount_amt=$q15->row()->discount_amt;

     // if($sales_return_discount_amt==0){
        $q16=$this->db->query("SELECT COALESCE(SUM(tot_discount_to_all_amt),0) AS tot_discount_to_all_amt FROM db_salesreturn");
        $sales_return_discount_amt+=$q16->row()->tot_discount_to_all_amt;
     // }

      //sales Return Paid Amount
      $sales_return_paid_amount=$this->db->query("SELECT COALESCE(SUM(paid_amount),0) AS paid_amount FROM db_salesreturn")->row()->paid_amount;

      //total expense amt
      $q3=$this->db->query("SELECT COALESCE(SUM(expense_amt),0) AS exp_total FROM db_expense");
      $exp_total=$q3->row()->exp_total;

      //total purchase due
      $q3=$this->db->query("SELECT COALESCE(SUM(purchase_due),0) AS purchase_due FROM db_suppliers");
      $purchase_due_total=$q3->row()->purchase_due;

      //total purchase due
      $q3=$this->db->query("SELECT COALESCE(SUM(purchase_return_due),0) AS purchase_due FROM db_suppliers");
      $purchase_return_due_total=$q3->row()->purchase_due;

      //total sales due
      $q3=$this->db->query("SELECT COALESCE(SUM(sales_due),0) AS sales_due FROM db_customers");
      $sales_due_total=$q3->row()->sales_due;

      //total sales return due
      $q3=$this->db->query("SELECT COALESCE(SUM(sales_return_due),0) AS return_due FROM db_customers");
      $sales_return_due_total=$q3->row()->return_due;



      $q1=$this->db->query("
        SELECT b.tax_amt,b.item_id,a.item_name,COALESCE(sum(b.sales_qty),0) as sales_qty,a.purchase_price,
          COALESCE(SUM(c.tot_discount_to_all_amt),0) as tot_discount_amt,
            COALESCE(SUM(total_cost),0) as total_cost
        FROM db_items as a, db_salesitems as b, db_sales as c
        WHERE 
        c.id=b.sales_id
        and
        a.id=b.item_id 
        and
        c.sales_status='Final'
        
        GROUP BY item_id
      ");
    
    if($q1->num_rows()>0){
      $i=0;
      $tot_purchase_price=0;
      $tot_sales_cost=0;
      $gross_profit=0;
      $tot_purchase_return_price=0;
      $tot_sales_return_price=0;
      $tot_sales_qty=0;
      $tot_purchase_return_qty=0;
      $tot_sales_return_qty=0;
      $grand_profit=0;
      $tot_net_profit=0;
      foreach ($q1->result() as $res1) {
        /*Purchase Return Quantity*/
        $purchase_return_qty=$this->db->query("
            SELECT COALESCE(sum(return_qty),0) as return_qty
            FROM db_purchaseitemsreturn
            WHERE 
            item_id =".$res1->item_id)->row()->return_qty;

        /*Sales Return Quantity*/
        $q3=$this->db->query("
            SELECT COALESCE(sum(total_cost),0) as total_cost,COALESCE(sum(return_qty),0) as return_qty
            FROM db_salesitemsreturn
            WHERE 
            item_id =".$res1->item_id);
        $sales_return_total_cost=$q3->row()->total_cost;
        $sales_return_qty=$q3->row()->return_qty;
        
        $qty = $res1->sales_qty-$sales_return_qty;
        $purchase_price = $res1->purchase_price * $qty;

        $total_cost = ($res1->total_cost - $sales_return_total_cost);
        //$purchase_return_price = $res1->purchase_price*$purchase_return_qty;
        $profit = $total_cost - $purchase_price;

        $tax_amt = $res1->tax_amt/$res1->sales_qty;

          //$net_profit =$profit-($tax_amt*$qty);
          $net_profit =$profit;//Correct way updated on 26-06-2020

        $gross_profit+=$profit;
        $tot_net_profit+=$net_profit;
      }      
      $gross_profit -= $sales_discount_amt;
      $tot_net_profit -= $sales_discount_amt;
    }
    else{
      $gross_profit=0;
      $tot_net_profit=0;
    }
    $tot_net_profit -=$exp_total;//Correct way updated on 26-06-2020


    
 ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?=$page_title;?>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active"><?=$page_title;?></li>
      </ol>
    </section>

    <section class="content">
        <div class="row">
          <!-- right column -->
          <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info ">
              <div class="box-header with-border">
                <h3 class="box-title">Please Enter Valid Information</h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form class="form-horizontal" id="report-form" onkeypress="return event.keyCode != 13;">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>"
                  value="<?php echo $this->security->get_csrf_hash();?>">
                <div class="box-body">
                  <div class="form-group">
                    <label for="from_date" class="col-sm-2 control-label"><?= $this->lang->line('from_date'); ?></label>

                    <div class="col-sm-3">
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" id="from_date" name="from_date"
                          value="<?php echo show_date(date('d-m-Y'));?>" readonly>

                      </div>
                      <span id="from_date_msg" style="display:none" class="text-danger"></span>
                    </div>
                    <label for="to_date" class="col-sm-2 control-label"><?= $this->lang->line('to_date'); ?></label>
                    <div class="col-sm-3">
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" id="to_date" name="to_date"
                          value="<?php echo show_date(date('d-m-Y'));?>" readonly>

                      </div>
                      <span id="to_date_msg" style="display:none" class="text-danger"></span>
                    </div>

                  </div>
                 
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                  <div class="col-sm-8 col-sm-offset-2 text-center">
                    <div class="col-md-3 col-md-offset-3">
                      <button type="button" id="view" class=" btn btn-block btn-success" title="Save Data">Show</button>
                    </div>
                    <div class="col-sm-3">
                      <a href="<?=base_url('dashboard');?>">
                        <button type="button" class="col-sm-3 btn btn-block btn-warning close_btn"
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

      <section class="content">
        <div class="row">
          <!-- right column -->
          <div class="col-md-12">

            <div class="box">
              <div class="box-header">
                <h3 class="box-title">Records Table</h3>
                <button type="button" class="btn btn-info pull-right btnExport"
                  title="Download Data in Excel Format">Excel</button>
              </div>
              <!-- /.box-header -->
              <div class="box-body table-responsive no-padding">
                <thead>
                <table id="report-data" class="table table-bordered table-striped" width="100%">
                                    <thead class="bg-primary ">
                                        <tr>
                                            <th>Account</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyid">

                                    </tbody>
                                    
                                </table>


              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
          </div>
        </div>
      </section>
  
  
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


<script src="<?php echo $theme_link; ?>js/sheetjs.js" type="text/javascript"></script>
<script>
    function convert_excel(type, fn, dl) {
      var elt = document.getElementById('report-data');
      var wb = XLSX.utils.table_to_book(elt, {
        sheet: "Sheet JS"
      });
      return dl ?
        XLSX.write(wb, {
          bookType: type,
          bookSST: true,
          type: 'base64'
        }) :
        XLSX.writeFile(wb, fn || ('Balance-sheet-Report.' + (type || 'xlsx')));
    }
    $(".btnExport").click(function (event) {
      convert_excel('xlsx');
    });
  </script>

<script src="<?php echo $theme_link; ?>js/report-balance-sheet.js"></script>
<!-- Make sidebar menu hughlighter/selector -->
<script>$(".<?php echo basename(__FILE__,'.php');?>-active-li").addClass("active");</script>
    
    
</body>
</html>
