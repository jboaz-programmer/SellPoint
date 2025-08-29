<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_main_model extends CI_Model {

	var $table = 'db_account_main';
	var $column_order = array('ac_name','ac_title'); //set column field database for datatable orderable
	var $column_search = array('ac_name','ac_title'); //set column field database for datatable searchable 
	var $order = array('id' => 'desc'); // default order 

	private function _get_datatables_query()
	{
		
		$this->db->from($this->table);

		$i = 0;
	
		foreach ($this->column_search as $item) // loop column 
		{
			if($_POST['search']['value']) // if datatable send POST for search
			{
				
				if($i===0) // first loop
				{
					$this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
					$this->db->like($item, $_POST['search']['value']);
				}
				else
				{
					$this->db->or_like($item, $_POST['search']['value']);
				}

				if(count($this->column_search) - 1 == $i) //last loop
					$this->db->group_end(); //close bracket
			}
			$i++;
		}
		
		if(isset($_POST['order'])) // here order processing
		{
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} 
		else if(isset($this->order))
		{
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if($_POST['length'] != -1)
		$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}


	public function get_categories() {
		extract($_POST);
		$from_date=date("Y-m-d",strtotime($from_date));
		$to_date=date("Y-m-d",strtotime($to_date));

		$query = $this->db->get('db_account_main');
		$return = array();
		foreach ($query->result() as $category) {
			$return[$category->id] = $category;
			$return[$category->id]->subs = $this->get_sub_categories($category->id,$from_date,$to_date);
		}

			
		
		if($query->num_rows()>0){
			$i=0;
			$tot_a_amt=0;
			$tot_trial_amt_cr=0;
			$tot_trial_amt_de=0;

			foreach ($query->result() as $category) {
			echo "<tr>
			   <td>$category->ac_title "; 
					if (!empty($category->subs)) {
						echo '<ul>';
						foreach ($category->subs as $sub) {
						echo"	<li>$sub->ac_name</li>";
						} echo '</ul>';
					}
					echo "</td>

					<td>";
					
						 if (!empty($category->subs)) {
							echo "<ul style='list-style-type:none;'>";
							foreach ($category->subs as $sub) {
							echo"<li>".app_number_format($sub->new_balance)."</li>";
							$tot_a_amt+=$sub->new_balance;
							} echo '</ul>';
						}
					echo  "
					</td>

					</tr>
					<tr>
					<td> <ul> <li>Total $category->ac_title </li></ul> </td>
					<td><ul style='list-style-type:none;'> <li style='color:green'>".app_number_format($tot_a_amt)."</li></ul></td>
					</tr>";
					$tot_a_amt = 0;
				}


					
				}
		else{
			echo "<tr>";
			echo "<td class='text-center text-danger' colspan=13>No Records Found</td>";
			echo "</tr>";
		}
		
	    exit;


	}
	
	public function get_sub_categories($category_id,$from_date, $to_date) {
		$this->db->where('main_id', $category_id);
		$this->db->where("(updated_at>='$from_date' and updated_at<='$to_date')");
		$query = $this->db->get('db_account_header');
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}


	public function verify_and_save(){
		//Filtering XSS and html escape from user inputs 
		extract($this->security->xss_clean(html_escape(array_merge($this->data,$_POST))));

		//Validate This country already exist or not
		$query=$this->db->query("select * from db_account_main where upper(ac_title)=upper('$ac_title')");
		if($query->num_rows()>0){
			return "Account Name already Exist.";
			
		}
		else{
			$query1="insert into db_account_main(ac_code,ac_title,ac_type,ac_number) values('$ac_code','$ac_title','$ac_type','$ac_number')";
			if ($this->db->simple_query($query1)){
					$this->session->set_flashdata('success', 'Success!! New Account Added Successfully!');
			        return "success";
			}
			else{
			        return "failed";
			}
		}
	}

	//Get country_details
	public function get_details($id){
		$data=$this->data;
		extract($data);
		extract($_POST);

		//Validate This country already exist or not
		$query=$this->db->query("select * from db_account_main where upper(id)=upper('$id')");
		if($query->num_rows()==0){
			show_404();exit;
		}
		else{
			$query=$query->row();
			$data['q_id']=$query->id;
			$data['ac_code']=$query->ac_code;
			$data['ac_title']=$query->ac_title;
			$data['ac_number']=$query->ac_number;
			$data['ac_type']=$query->ac_type;
			
			return $data;
		}
	}
	public function update_account(){
		//Filtering XSS and html escape from user inputs 
		extract($this->security->xss_clean(html_escape(array_merge($this->data,$_POST))));
		
		//Validate This country already exist or not
		$query=$this->db->query("select * from db_account_main where upper(ac_title)=upper('$ac_title') and id<>$q_id");
		if($query->num_rows()>0){
			return "Account Name already Exist.";
			
		}
		else{
			
			$query1="update db_account_main set ac_code='$ac_code', ac_title='$ac_title',ac_number='$ac_number',ac_type='$ac_type' where id=$q_id";
			if ($this->db->simple_query($query1)){
					$this->session->set_flashdata('success', 'Success!! Account Head Updated Successfully!');
			        return "success";
			}
			else{
			        return "failed";
			}
		}
	}

	public function update_status($id,$status){
		
        $query1="update db_account_header set status='$status' where id=$id";
        if ($this->db->simple_query($query1)){
            echo "success";
        }
        else{
            echo "failed";
        }
	}
	public function delete_account($id){
        $query1="delete from db_account_main where id=$id";
        if ($this->db->simple_query($query1)){
            echo "success";
        }
        else{
            echo "failed";
        }
	}


}
