# generate bootstapped token for kubeadm
resource "random_string" "kubeadm_token1" {
  length  = "6"
  special = false
  upper   = false
}

resource "random_string" "kubeadm_token2" {
  length  = "16"
  special = false
  upper   = false
}

data "template_file" "kubeadm_token" {
  template = "$${v1}.$${v2}"

  vars {
    v1 = "${random_string.kubeadm_token1.result}"
    v2 = "${random_string.kubeadm_token2.result}"
  }
}