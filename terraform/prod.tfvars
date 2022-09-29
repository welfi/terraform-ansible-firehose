# Simple name with only alpha characters
app_name = "daredata_test"
# you should have manually created this key during the setup
ssh_key_name = "key_2"
# these stages can be anything you'd like though prod / dev / staging are common
stage = "dev"
# usually does not need to be a a big instance - you'd be suprised with what you
# can do with a small instance
instance_type = "t2.micro"
# the elastic ip address that you manually created in the AWS console
http_server_elastic_ip_allocation_id = "eipalloc-02991a7ae6776f8ea"
