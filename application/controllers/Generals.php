<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/*
 *	@author : Ravi kumar dubey
 *  @support: dubey.ravi7@gmail.com
 *	 Inventory Management System
 *  version: 1.0
 */

/**
 * Class dashboard
 *
 * @property CI_Session session
 * @property General General
 * @property Menus Menus
 */
//Extending all Controllers from Core Controller (MY_Controller)
class generals extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();

        if ($this->session->userdata('user_id')) {
            //
        } else {


            redirect(base_url() . 'index.php/Users/login');
        }
    }

    //GET PAGE/CONTROLLER/CONTROLLER-FUNCTION NAME............................
    public function getpage($page)
    {
        $this->session->set_userdata("MENU_ID", $page);
        $group_id = $this->session->userdata("group_id");

        $Page = $this->General->fetch_bysinglecol("MENU_ID", "usr_menu", $page);
        $this->create_breadcrums();

        foreach ($Page as $pagerow) {
            $getPage = $pagerow->MENU_URL;
            //SET SESSION FOR PAGE ID................................................
            $this->session->set_userdata("menu_id", $pagerow->MENU_ID);
        }
        redirect(base_url() . 'index.php/' . $getPage);
    }

    // Creating breadcrumbs
    public function create_breadcrums()
    {

        $row = $this->General->fetch_bysinglecol("MENU_ID", "usr_menu", $this->session->userdata("MENU_ID"));

        foreach ($row as $row_r) {

            if ($row_r->PARENT_ID != 0) {

                $this->session->set_userdata("child_name", $row_r->MENU_TEXT);
                $this->session->set_userdata("child_url", base_url() . "index.php/" . $row_r->MENU_URL);

                $row2 = $this->General->fetch_bysinglecol("MENU_ID", "usr_menu", $row_r->PARENT_ID);

                foreach ($row2 as $row_r2) {

                    $this->session->set_userdata("parent_name", $row_r2->MENU_TEXT);
                }
            } else {
                $this->session->set_userdata("parent_name", $row_r->MENU_TEXT);
            }
        }
    }

    //Add Group....
    public function add_group()
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }

        $this->header();
        $data['group_list'] = $this->General->fetch_records("usr_group");
        $this->load->view('generals/add_group', $data);
        $this->footer();
    }

    // Creating new Group
    public function create_group()
    {

        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $group_name = $this->input->post('group_name');

        $record = $this->General->fetch_maxid("usr_group");

        foreach ($record as $record) {

            echo $MaxGroup = $record->GROUP_ID;
        }


        $group_no = $MaxGroup + 1;

        $data = array(
            "GROUP_ID" => $group_no,
            "GROUP_NAME" => $group_name
        );
        $this->General->create_record($data, "usr_group");
        $this->session->set_flashdata('msg', 'Add Successfully');
        redirect(base_url() . 'Generals/add_group');
    }

    //Edit Group....
    public function edit_group($id)
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $group['groups'] = $this->General->fetch_groupbyid($id);
        $this->header();
        $this->load->view('generals/edit_group', $group);
        $this->footer();
    }

    //Update Group......
    public function update_group()
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $group_name = $this->input->post('group_name');
        $group_id = $this->input->post('group_id');
        $this->General->update_group($group_name, $group_id);

        $this->add_group();
    }

    //Add menu....
    public function addmenu()
    {

        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $this->header();

        $col = "PARENT_ID";
        $tbl = "usr_menu";
        $id = 0;

        $config = array();
        $config["total_rows"] = $this->General->count_all($tbl);
        $config["per_page"] = 5;

        $totalseg = $this->uri->total_segments();

        $config['uri_segment'] = $totalseg;

        $segments_arr = $this->uri->segment_array();

        foreach ($segments_arr as $segments_arrs => $value) {
            if ($value == "page") {
                break;
            } else {
                @$u .= $value . "/";
            }
        }
        $config['base_url'] = base_url() . $u . "/page/";

        $this->pagination->initialize($config);

        $page = ($this->uri->segment($totalseg)) ? $this->uri->segment($totalseg) : 0;
        $data["results"] = $this->General->fetch_countries($config["per_page"], $page, $tbl);
        $data["links"] = $this->pagination->create_links();

        $data['menus'] = $this->General->fetch_bysinglecol($col, $tbl, $id);
        $this->load->view('generals/add_menu', $data);
        $this->footer();
    }

    //Create menu....
    public function create_menu()
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $menu = $this->input->post('MENU_TEXT');
        $url = $this->input->post('MENU_URL');
        $parent = $this->input->post('PARENT_ID');
        $sort = $this->input->post('SORT_ORDER');
        $admin = $this->input->post('admin');
        $userid = $this->session->userdata('user_id');
        $d = date("Y-m-d H:i:s");
        $record = $this->General->fetch_maxid("usr_menu");

        foreach ($record as $record) {

            $MaxGroup = $record->MENU_ID;
        }

        $menu_no = $MaxGroup + 1;

        $data = array(
            "MENU_ID" => $menu_no,
            "MENU_TEXT" => $menu,
            "MENU_URL" => $url,
            "PARENT_ID" => $parent,
            "SORT_ORDER" => $sort,
            "SHOW_IN_MENU" => "1",
            "CREATED_USERID" => $userid,
            "CREATED_DATE" => $d
        );
        $response = $this->General->create_record($data, "usr_menu");
    }

    //Fetch All menus.........
    public function list_menu()
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $menu['menus'] = $this->General->fetch_records("usr_menu");

        $this->header();
        $this->load->view('general/list_menu', $menu);
        $this->footer();
    }

    //Edit Menu....
    public function edit_menu($id)
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }

        $menu['menus'] = $this->General->fetch_menubyid($id);
        $this->header();
        $this->load->view('general/edit_menu', $menu);
        $this->footer();
    }

    //Update Menu....
    public function update_menu()
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }

        extract($_POST);
        $this->General->update_menu();

        $this->list_menu();
    }


    //Add permission.....
    public function add_permission($id)
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        $data['parentnav'] = $this->Menus->fetch_parent_menu();
        $data['Generals'] = $this;
        $data['group_id'] = $id;
        $this->header();
        $this->load->view('generals/add_permission', $data);
        $this->footer();
    }

    // Creating Permissions for a specific group
    public function create_permission()
    {
        $group_id = $this->session->userdata("group_id");
        if ($group_id != 1) {
            $Page = $this->General->check_url_permission_single();
        }
        extract($_POST);
        $group_id = $this->input->post('group_id');

        $menus = $this->Menus->fetch_permission_navi();

        foreach ($menus as $menus) {

            $permission_max = $this->General->fetch_permissionmaxno();

            $permissionMax = $permission_max->PER_ID + 1;

            $d = date("Y-m-d H:i:s");

            $menuid = $menus->MENU_ID;

            if (isset($permission['view'][$menuid])) {

                $view = 1;
            }
            if (!isset($permission['view'][$menuid])) {

                $view = 0;
            }

            if (isset($permission['insert'][$menuid])) {

                $insert = 1;
            }
            if (!isset($permission['insert'][$menuid])) {

                $insert = 0;
            }

            if (isset($permission['update'][$menuid])) {

                $update = 1;
            }
            if (!isset($permission['update'][$menuid])) {
                $update = 0;
            }

            if (isset($permission['delete'][$menuid])) {

                $delete = 1;
            }
            if (!isset($permission['delete'][$menuid])) {

                $delete = 0;
            }



            //check if Menu and Group exist then update row...else insert
            $per_groupmenu = $this->General->fetch_per_groupmenu($group_id, $menus->MENU_ID);
            $permission_row = $this->General->fetch_groupmenu_id($group_id, $menus->MENU_ID);
            $userid = $this->session->userdata('user_id');
            foreach ($permission_row as $permission_row) {

                $permission_id = $permission_row->PER_ID;
            }

            if ($per_groupmenu > 0) {

                $data = array(
                    "PER_SELECT" => $view,
                    "PER_INSERT" => $insert,
                    "PER_UPDATE" => $update,
                    "PER_DELETE" => $delete,
                    "UPDATED_USERID" => $userid,
                    "UPDATED_DATE" => $d
                );

                $this->General->update_permissionrecord($data, "usr_permission", $permission_id);

                $this->session->set_flashdata('msg', 'Updated Successfully');
            } else {

                $data = array(
                    "PER_ID" => $permissionMax,
                    "GROUP_ID" => $group_id,
                    "MENU_ID" => $menus->MENU_ID,
                    "PER_SELECT" => $view,
                    "PER_INSERT" => $insert,
                    "PER_UPDATE" => $update,
                    "PER_DELETE" => $delete,
                    "CREATED_USERID" => $userid,
                    "CREATED_DATE" => $d
                );
                $this->General->create_record($data, "usr_permission");

                $this->session->set_flashdata('msg', 'Add Successfully');
            }
        }


        redirect(base_url() . 'index.php/Generals/add_permission/' . $group_id);
    }

    // Permission checking
    public function checkpermission($id, $group_id)
    {

        $whr = array(

            "GROUP_ID" => $group_id,
            "MENU_ID" => $id

        );

        $this->db->where($whr);
        $this->db->order_by("PER_ID", "ASC");
        $this->db->from('usr_permission');

        return $this->db->count_all_results();
    }
    // Fetch Permissions for records
    public function fetchRecordpermission($id, $group_id)
    {


        $sql = $this->db->query("SELECT * FROM usr_permission WHERE GROUP_ID ='$group_id' AND MENU_ID='$id' ORDER BY PER_ID asc LIMIT 1");
        $r_sql = $sql->result();

        return $r_sql;
    }
    // Fetch child against parent 
    public function fetch_child($parentid)
    {

        $sql = $this->db->query("SELECT * FROM usr_menu WHERE MENU_ID='$parentid' ORDER BY ASC");

        return $sql;
    }

    // Check child menus count
    public function checkchildMenuCount($pmenuid)
    {


        $whr = array(

            "PARENT_ID" => $pmenuid

        );

        $this->db->where($whr);
        $this->db->from('usr_menu');

        return $this->db->count_all_results();
    }

    //Fetch child menu
    public function fetchchildMenu($pmenuid)
    {
        return $this->General->fetch_bysinglecol("PARENT_ID", "usr_menu", $pmenuid);
    }

    /*===== EDIT COMPANY INFO LOAD FORM ======*/
    public function edit_company_info()
    {
        $id = $this->uri->segment(3);
        $data['company_info'] = $this->General->get_company_info();
        $this->header();
        $this->load->view('company/company_information', $data);
        $this->footer();
    }

    /*===== SAVE EDIT COMPANY INFORMATION =====*/
    public function save_edit_info()
    {
        if ($_POST) {
            $config = array(
                array(
                    'field' => 'name',
                    'label' => 'Name',
                    'rules' => 'trim|required'
                ),
                array(
                    'field' => 'email',
                    'label' => 'Email',
                    'rules' => 'trim|required'
                ),
                array(
                    'field' => 'contact',
                    'label' => 'Contact No.',
                    'rules' => 'trim|required'
                ),
                array(
                    'field' => 'address',
                    'label' => 'Address',
                    'rules' => 'trim|required'
                ),
                array(
                    'field' => 'website',
                    'label' => 'Website url',
                    'rules' => 'trim|required'
                )
            );
            $this->form_validation->set_rules($config);
            if ($this->form_validation->run() == false) {
                echo json_encode((["msg_type" => "error", "message" => validation_errors()]));
            } else {
                $id = $this->input->post('id2');
                $this->General->update_company($_POST, $id);
                echo json_encode((["msg_type" => "success", "message" => "Info Updated Successfully"]));
            }
        }
    }

    /*====== CURRENCY SECTION START ======*/
    public function change_currency()
    {
        error_reporting(E_ALL);
        $data['currencies'] = $this->General->fetch_records('currency_settings');
        $data['get_current_currency'] = $this->General->get_current_currency_name();
        $this->header();
        $this->load->view('generals/change_currency', $data);
        $this->footer();
    }

    /*====== SAVE CURRENCY ======*/
    public function save_change_currency()
    {
        if ($_POST) {
            $config = array(
                array(
                    'field' => 'currency_id',
                    'label' => 'Currency',
                    'rules' => 'trim|required'
                )
            );
            $this->form_validation->set_rules($config);
            if ($this->form_validation->run() == false) {
                echo json_encode((["msg_type" => "error", "message" => validation_errors()]));
            } else {
                $this->General->update_currency($_POST);
                echo json_encode((["msg_type" => "success", "message" => "Currency Updated Successfully"]));
            }
        }
    }

    /*===== DEFAULT BACKUP VIEW ======*/
    public function backup()
    {
        $data['bkups'] = directory_map('./backups/', 1);
        $data['pageTitle'] = 'Backup Database';
        $this->header('Backups');
        $this->load->view("generals/backups", $data);
        $this->footer();
    } //--End of Function backup()

    /*===== CREATE BACKUP =====*/
    public function create_backup()
    {
        $result = $this->db->query("SHOW TABLE STATUS")->result();
        $tableinfo = array();
        $totalsize = 0;
        $totalrows = 0;
        foreach ($result as $res) {
            $size = round($res->Data_length / 1000, 2);
            $totalsize += $size;
            $totalrows += $res->Rows;
            $tableinfo['all'][] = (object)array("name" => $res->Name, "size" => $size . " KB", "rows" => $res->Rows);
        }
        $tableinfo['totalSize'] = round(($totalsize / 1000), 2) . " MB";
        $tableinfo['totalRows'] = $totalrows;
        $data['dbtables'] = $tableinfo;
        $this->header('Database Backup');
        $this->load->view("generals/create_backup", $data);
        $this->footer();
    } //--End of Function create_backup()
    /*===== CREATE BACKUP BUTTON ACTION =====*/
    public function create_backup_action()
    {
        $getbackup = $this->input->post('getbackup');
        if (!empty($getbackup)) {
            $tables = $this->input->post('dbtables');
            if (empty($tables)) {
                echo json_encode(array("msg_type" => "error", "message" => "Please Select Table for Backup"));
            } else {
                $this->getBackup($tables);
            }
        }
    } //-- End of Function create_backup_action()

    /*===== GET BACKUP FILE AND SEND SUCCESS MESSAGE ======*/
    public function getBackup($tables)
    {
        $this->load->dbutil();
        $prefs = array(
            'tables' => $tables,
            'format' => 'txt',
            'filename' => 'my_db_backup.sql'
        );
        $backup = $this->dbutil->backup($prefs);
        $db_name = 'backup-on-' . date("Y-m-d-H-i-s") . '.sql';
        $save = 'backups/' . $db_name;
        $this->load->helper('file');
        write_file($save, $backup);
        $redirect_link = base_url('Generals/backup');
        echo json_encode(array("msg_type" => "success", "message" => "Backup Created Successfully", 'redirect_link' => $redirect_link));
    } //-- End of Function getBackup()
    /*===== DOWNLOAD BACKUP FILE OF YOUR DATABASE ======*/
    function download()
    {
        $file = $this->input->get('backup');
        $sql = file_get_contents('backups/' . $file);
        $this->load->helper('download');
        force_download($file, $sql);
    } //-- End of Function download()
}
