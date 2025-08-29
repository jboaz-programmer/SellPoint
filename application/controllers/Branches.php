<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Branches extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Branch_model');
        $this->load->helper('url'); // For redirect()
        $this->load->library('session');
        $this->load_global();
    }
 
    // Show list of branches
    // public function index() {
 
    //     $data['branches'] = $this->Branch_model->get_all_branches();
    //     // Changed this line to load branches.php directly (assuming in views root)
    //     $this->load->view('branches', $data);
    // }
     public function index() {
 
    // Add branches to $this->data
    $this->data['branches'] = $this->Branch_model->get_all_branches();

    // Load the view with full data (theme_link, site_title, etc.)
    $this->load->view('branches', $this->data); // ✅ Now $theme_link is available
}
    

    // Show create branch form and handle POST
    public function create() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = [
                'name' => $this->input->post('name'),
                'location' => $this->input->post('location')
            ];
            $this->Branch_model->insert_branch($data);
            $this->session->set_flashdata('success', 'Branch created successfully!');
            redirect('branches');
        } else {
            $this->load->view('branches/create');
        }
    }

    // Edit existing branch
    public function edit($id) {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = [
                'name' => $this->input->post('name'),
                'location' => $this->input->post('location')
            ];
            $this->Branch_model->update_branch($id, $data);
            $this->session->set_flashdata('success', 'Branch updated successfully!');
            redirect('branches');
        } else {
            $data['branch'] = $this->Branch_model->get_branch($id);
            $this->load->view('branches/edit', $data);
        }
    }

    // Delete branch
    public function delete($id) {
        $this->Branch_model->delete_branch($id);
        $this->session->set_flashdata('success', 'Branch deleted successfully!');
        redirect('branches');
    }
}
