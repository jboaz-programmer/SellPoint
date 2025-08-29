<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Branch_model');

		$this->load_global();
		if($this->get_current_version_of_db()!=app_version()){ redirect(base_url('updates/update_db'),'refresh'); }
	}
	public function dashboard_values($branch_id = null){
		$this->load->model('dashboard_model');//Model
		$data=$this->dashboard_model->breadboard_values($branch_id);//Model->Method
		return $data;
	}
	public function test(){
		$this->permission_check('items_category_add');
		$data=$this->data;
		$data['page_title']=$this->lang->line('category');
		$this->load->view('test.php', $data);
	}
	// public function index()
	// {	
		
	// 	$data1=$this->data;
	// 	$data2=$this->dashboard_values();
	// 	$data=array_merge($data1,$data2);
	// 	$data['page_title']=$this->lang->line('dashboard');
		
	// 	if(!$this->permissions('dashboard_view')){
	// 		$this->load->view('role/dashboard_empty',$data);
	// 	}
	// 	else{
	// 		$this->load->view('dashboard',$data);
	// 	}
		
	// }
public function index()
{
    $data1 = $this->data;

    // Get selected branch from GET or session
    $selected_branch_id = $this->input->get('branch_id') ?? $this->session->userdata('branch_id');

    // Pass selected branch to dashboard values
    $data2 = $this->dashboard_values($selected_branch_id);
    $data  = array_merge($data1, $data2);

    // Load Branches for dropdown
    $this->load->model('Branch_model');
    $this->data['branches'] = $this->Branch_model->get_all_branches();

    // Add session/user info
    $data['inv_username'] = $this->session->userdata('inv_username');
    $data['branch_id']    = $selected_branch_id;
    $data['branch_name']  = $this->session->userdata('branch_name');
    $data['role_name']    = $this->session->userdata('role_name');

    $data['page_title'] = $this->lang->line('dashboard');

    $data = array_merge($this->data, $data);

    if (!$this->permissions('dashboard_view')) {
        $this->load->view('role/dashboard_empty', $data);
    } else {
        $this->load->view('dashboard', $data);
    }
}


	
}
