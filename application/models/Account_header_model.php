<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_header_model extends CI_Model {

	var $table = 'db_account_header';
	var $column_order = array('ac_name','status'); //set column field database for datatable orderable
	var $column_search = array('ac_name','status'); //set column field database for datatable searchable 
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
		// $this->db->where('updated_at', '2021-02-17');
		$query = $this->db->get();
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
		$query=$this->db->query("select * from db_account_header where upper(ac_name)=upper('$ac_name')");
		if($query->num_rows()>0){
			return "Country Name already Exist.";
			
		}
		else{
			$now = date('Y-m-d');

			$query1="insert into db_account_header(ac_code,ac_name,opening_balance,new_balance,updated_at,created_at,ac_memo,status,main_id) values('$ac_code','$ac_name','$opening_balance','$opening_balance','$now','$now','$ac_memo',1,'$main_id')";
			if ($this->db->simple_query($query1)){
					$this->session->set_flashdata('success', 'Success!! New Country Name Added Successfully!');
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
		$query=$this->db->query("select * from db_account_header where upper(id)=upper('$id')");
		if($query->num_rows()==0){
			show_404();exit;
		}
		else{
			$query=$query->row();
			$data['q_id']=$query->id;
			$data['ac_code']=$query->ac_code;
			$data['ac_name']=$query->ac_name;
			$data['new_balance']=$query->new_balance;
			$data['ac_memo']=$query->ac_memo;
			
			return $data;
		}
	}
	public function update_account(){
		//Filtering XSS and html escape from user inputs 
		extract($this->security->xss_clean(html_escape(array_merge($this->data,$_POST))));
		
		//Validate This country already exist or not
		$query=$this->db->query("select * from db_account_header where upper(ac_name)=upper('$ac_name') and id<>$q_id");
		if($query->num_rows()>0){
			return "Account Name already Exist.";
			
		}
		else{
			
			$query = $this->db->select('db_account_header.*');
			$this->db->from('db_account_header');
			$this->db->where('db_account_header.id', $q_id);
			$last= $this->db->get();
			$q5 = $last->result();


			$new_balance=$q5[0]->new_balance;
			$opening_balance2=$q5[0]->opening_balance;
			$credit=$q5[0]->credit;
			$opening_balance=$opening_balance2 + $opening_balance;
			$new_balance = $new_balance + $opening_balance;
			$credit = $credit + $opening_balance;
			$now = date('Y-m-d');

			//   echo "<pre>";
            //     print_r($q5);
            //     exit;

			
			$query1="update db_account_header set ac_code='$ac_code', ac_name='$ac_name',opening_balance='$opening_balance', new_balance='$new_balance', updated_at='$now', credit='$credit' ,ac_memo='$ac_memo' where id=$q_id";
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
        $query1="delete from db_account_header where id=$id";
        if ($this->db->simple_query($query1)){
            echo "success";
        }
        else{
            echo "failed";
        }
	}


}
