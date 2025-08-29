<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Trial_balance extends MY_Controller {
	public function __construct(){
		parent::__construct();
		$this->load_global();
		$this->load->model('account_header_model','account');
	}

	public function index(){
		$this->permission_check('places_view');
		$data=$this->data;
		$data['page_title']="Trial Balance";
		// echo "<pre>";
        // print_r($data);
        // exit();
		$this->load->view('prepare-trial-balance', $data);
	}

    public function list(){
		$this->permission_check('places_view');
		$data=$this->data;
		$data['page_title']="Trial Balance";
		// echo "<pre>";
        // print_r($data);
        // exit();
		$this->load->view('trial-balance-list', $data);
	}

	public function newaccount_main(){
		$this->form_validation->set_rules('ac_title', 'Account Title', 'trim|required');
		$this->form_validation->set_rules('ac_number', 'Account Number', 'trim|required');
		$this->form_validation->set_rules('ac_type', 'Account Type', 'trim|required');
		if ($this->form_validation->run() == TRUE) {
			$result=$this->account->verify_and_save();
			echo $result;
		} else {
			echo "Please Enter Required field.";
		}
	}

	public function update($id){
		$this->permission_check('places_edit');
		$result=$this->account->get_details($id);
		$data=array_merge($this->data,$result);
		$data['page_title']="Account Head";
        // echo "<pre>";
        // print_r($data);
        // exit();
		$this->load->view('account-head', $data);
	}
	public function update_account(){
		
        $this->form_validation->set_rules('ac_title', 'Account Title', 'trim|required');
		$this->form_validation->set_rules('ac_number', 'Account Number', 'trim|required');
		$this->form_validation->set_rules('ac_type', 'Account Type', 'trim|required');

		$this->form_validation->set_rules('q_id', '', 'trim|required');

		if ($this->form_validation->run() == TRUE) {
			$result=$this->account->update_account();
			echo $result;
		} else {
			echo "Please Enter country name.";
		}
	}
	public function add(){
		$this->permission_check('places_add');
		$data=$this->data;
		$data['page_title']="Account With their types";
		$this->load->view('account', $data);
	}

    public function ajax_list()
	{
		$list = $this->account->get_datatables();
		
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $sales) {
			
			$no++;
			$row = array();
			$row[] = '<input type="checkbox" name="checkbox[]" value='.$sales->id.' class="checkbox column_checkbox" >';

			$row[] = $sales->ac_name;
			$row[] = app_number_format($sales->new_balance);

			$row[] = app_number_format($sales->credit);
			$row[] = app_number_format($sales->derbit);
			



			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->account->count_all(),
						"recordsFiltered" => $this->account->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}
	public function update_status(){
		$this->permission_check_with_msg('places_edit');
		$id=$this->input->post('id');
		$status=$this->input->post('status');
		$result=$this->account->update_status($id,$status);
		return $result;
	}

	public function delete_account(){
		$this->permission_check_with_msg('places_delete');
		$id=$this->input->post('q_id');
		$result=$this->account->delete_account($id);
		return $result;
	}
}

