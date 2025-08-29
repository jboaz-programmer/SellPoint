<?php
class Branch_model extends CI_Model {

    public function get_all_branches() {
        return $this->db->get('branches')->result();
    }

    public function get_branch($id) {
        return $this->db->get_where('branches', ['id' => $id])->row();
    }

    public function insert_branch($data) {
        return $this->db->insert('branches', $data);
    }

    public function update_branch($id, $data) {
        $this->db->where('id', $id);
        return $this->db->update('branches', $data);
    }

    public function delete_branch($id) {
        return $this->db->delete('branches', ['id' => $id]);
    }
}
