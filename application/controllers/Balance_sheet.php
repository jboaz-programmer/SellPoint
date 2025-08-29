<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Balance_sheet extends MY_Controller {
	public function __construct(){
		parent::__construct();
		$this->load_global();
		$this->load->model('Account_main_model','account');
	}

	public function index(){
		$this->permission_check('places_view');
		$data=$this->data;
		$data['page_title']="Balance Sheet";
		// echo "<pre>";
        // print_r($data);
        // exit();
		$this->load->view('prepare-balance-sheet', $data);
	}

	public function list(){
		$this->permission_check('places_view');
		$data=$this->data;
		$data['page_title']="Balance Sheet";
		// echo "<pre>";
        // print_r($data);
        // exit();
		echo $this->account->get_categories();

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
		
        // print_r($list);
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $country) {
			$no++;
			$row = array();
			$row[] = $country->ac_code;
			$row[] = $country->ac_title;
			$row[] = $country->ac_number;
			$row[] = $country->ac_type;
						
			         $str2 = '<div class="btn-group" title="View Account">
										<a class="btn btn-primary btn-o dropdown-toggle" data-toggle="dropdown" href="#">
											Action <span class="caret"></span>
										</a>
										<ul role="menu" class="dropdown-menu dropdown-light pull-right">';

											if($this->permissions('places_edit'))
											$str2.='<li>
												<a title="Edit Record ?" href="account/update/'.$country->id.'">
													<i class="fa fa-fw fa-edit text-blue"></i>Edit
												</a>
											</li>';

											if($this->permissions('places_delete'))
											$str2.='<li>
												<a style="cursor:pointer" title="Delete Record ?" onclick="delete_country('.$country->id.')">
													<i class="fa fa-fw fa-trash text-red"></i>Delete
												</a>
											</li>
											
										</ul>
									</div>';			
			$row[] = $str2;

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

