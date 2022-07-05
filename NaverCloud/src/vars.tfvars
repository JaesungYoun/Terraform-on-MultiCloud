provider_ncp ={
    
  access_key  = "CACA76B0AB062B72D9DE"
  secret_key  = "42601F9D0867131807DB9EA712947B7860DF937F"
  region      = "KR"
  support_vpc = "true"

}

init_script = [
{
  name = "js-lin"
  content = "#!/bin/bash\nsudo su\necho '1q2w3e4r!' | passwd --stdin root\ncd..\ncd..\ncd tmp\nifconfig > result.txt"
  os_type = "LNX"
}
]


server_count = 2

server = [{
  name = "js-linux"
  os = "SW.VSVR.OS.LNX64.CNTOS.0703.B050" # centos7
},{
  name = "js-win"
  os = "SW.VSVR.OS.WND64.WND.SVR2019EN.B100" # windows 2019
}
]
vpc = {
  name = "js-vpc"
  vpc_ip = "192.168.0.0/24"
}

subnet = {
  name = "js-sub"
  subnet_ip = "192.168.0.0/25"
}

login_key_name = "js-ncloud-key"


