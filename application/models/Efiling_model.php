<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Efiling_model extends CI_Model {
    
    function user() {
        parent::Model();
    }
    
    function get_single_table($table){
        $this->db->where('status', '1');
        $query = $this->db->get($table);
        $data = $query->result();
        return $data;
    }

    
    function  ia_data_list($table,$array,$col,$order){
        $this->db->where_not_in($col,$array) ;
        $this->db->from($table);
        $this->db->order_by($order,'ASC');
        $query = $this->db->get();
        return $query->result();
    }
    

    
    function  ia_dataIN_list($table,$array,$col,$order){
        $this->db->where_in($col,$array) ;
        $this->db->from($table);
        $this->db->order_by($order,'ASC');
        $query = $this->db->get();
        return $query->result();
    }
    
    

    function data_list($table){
        $this->db->from($table);
        $query = $this->db->get();
        // echo $str = $this->db->last_query();
        return $query->result();
    }
    
    
    
    function getColumn($table,$requestcolumn,$col,$id){
        $this->db->select($requestcolumn);
        $this->db->from($table);
        $this->db->where($col,$id);
        return $this->db->get()->row()->$requestcolumn;
    }
    
    
    function data_list_wherelimit($table,$column,$val){
		 echo "adsf";die;
        $this->db->from($table);
        $this->db->where($column,$val);
        $this->db->order_by('id','DESC');
        $this->db->limit('1');
        $query = $this->db->get();
        $data = $query->result();
		
        return $data;
    }
    
    
    function data_list_mulwhere($table,$array){
        $this->db->where($array);
        $this->db->from($table);
        $query = $this->db->get();
        // echo $str = $this->db->last_query();
        return $query->result();
    }


    
    function data_list_where($table,$col,$id){
        $data=$this->db->select('*')
        ->get_where($table,[$col=>$id])
        ->result();
        return $data;
    }
    


    function select_in($table,$arr){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($arr);
        $query = $this->db->get();
        $data = $query->result();
      //  echo $str = $this->db->last_query();die;
        return $data;
    }
    
    function update_data_where($table, $where, $data){
        $this->db->where($where);
        $query = $this->db->update($table, $data);
     //  echo $str = $this->db->last_query();die;
        return $query;
    }
    

    function getdistric($table,$col){
        $this->db->from($table);
        $this->db->where('state_id', $col);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }
    
    
    function insert_query($table, $data){
        $query = $this->db->insert($table, $data);
        return $query;
    }
    
    function edit_data($table,$col, $id){
        $query = $this->db->get_where($table, array($col=>$id));
        $data = $query->row();
        return $data;
    }
    
    function update_data($table, $data, $idname, $id){
        $this->db->where($idname, $id);
        $query = $this->db->update($table, $data);
        return $query;
    }
    
    function delete_event($table, $col, $id){
        $this->db->where($col, $id);
        $delqu = $this->db->delete($table);
        return $delqu;
        
    }

    
    function createSlug($slug) {
        $lettersNumbersSpacesHyphens = '/[^\-\s\pN\pL]+/u';
        $spacesDuplicateHypens = '/[\-\s]+/';
        $slug = preg_replace($lettersNumbersSpacesHyphens, '', $slug);
        $slug = preg_replace($spacesDuplicateHypens, '-', $slug);
        $slug = trim($slug, '-');
        return mb_strtolower($slug, 'UTF-8');
    }
    

    public function countRow($table,$column){
        $query = $this->db->query("SELECT count($column)  FROM $table");
        return $query->result();
    }

}
?>