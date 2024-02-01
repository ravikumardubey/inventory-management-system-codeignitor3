<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/*
 *	@author : Ravi kumar dubey
 *  @support: dubey.ravi7@gmail.com
 *	 Inventory Management System
 *  version: 1.0
 */
class Category extends MY_Controller
{
    public function __construct(){
        parent::__construct();
        if ($this->session->userdata('user_id')) {
        } else {
            redirect(base_url() . 'index.php/Users/login');
        }
    }

    // List Categories
    public function list_category(){    
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $data['category'] = $this->General->fetch_records("category");
        $this->header($title = 'Category List');
        $this->load->view('category/list_category', $data);
        $this->footer();
    }

    // Add new category to Databse
    public function insert_category()
    {
        $this->load->library('form_validation');
        extract($_POST);
        $this->form_validation->set_rules('category_name', 'Category Name', 'trim|required|min_length[5]|max_length[12]');
        if ($this->form_validation->run() == FALSE) {
            $this->session->set_flashdata('error', 'Invalid Input');
            redirect(base_url() . 'index.php/category/list_category');
        } else {

            $data = array(
                'category_name' => $this->security->xss_clean($category_name)
            );
            $response = $this->Main_model->add_record('category', $data);
            if ($response) {
                $this->session->set_flashdata('success', 'Record added Successfully..!');
                redirect(base_url() . 'index.php/category/list_category');
            }
        }
    }

    // Update category Details
    public function update_category()
    {
        $cat_id = $this->input->post('cid');

        $this->load->library('form_validation');
        extract($_POST);
        $this->form_validation->set_rules('category_name', 'Category Name', 'trim|required|min_length[5]|max_length[12]');
        if ($this->form_validation->run() == FALSE) {
            $this->session->set_flashdata('error', 'Invalid Input');
            redirect(base_url() . 'index.php/category/list_category');
        } else {

            $data = array(
                'category_name' => $this->security->xss_clean($category_name)
            );
        $where = array('category_id' => $cat_id);
        $this->load->model('Main_model');
        $response = $this->Main_model->update_record('category', $category, $where);
        if ($response) {
            $this->session->set_flashdata('info', 'Record Updated Successfully..!');
            redirect(base_url() . 'index.php/category/list_category');
        }
    }
}
}
