#provider
provider_openstack = {
  user_name = "admin"
  tenant_name = "admin"
  password  = "43420055bffd4338"
  region    = "RegionOne"
  auth_url  = "http://192.168.1.85:5000/v3"
}


key_name = "terra-key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCocZ0ABwd8LcMmEUTor199WREuW4jiCU6N+Dqiw3Q2+HfRXUQXeu8qobQo8JIHEWRvoT1xNWx37sK5B9zey1HMo6k/gRTpjmUVIR+SMBipD/lXczyqA66F9QsLrnQ/9/AJYlQPnAEQwtxLWej39vWt4vNDXBJSPwtSmy22XzU30VliojqZNgsF8E03HEDAX8CFFIlQsbuLENhX6/GAlssgHG4VB7BaE9nmdimGD1hroEiHzXMTrpN6wozEtf0KKYM0MWf2RGpI/LVKWh8LgfVrT8Buine4CsDlOJPVQ+uxPvJ0ctGLakpg8C42oJsTPaDgr3Fpfs83Z+ZAy2z5Xop centos"

#instance_info
linux_instance_count = 1
windows_instance_count = 1
all_instance_count = 2
instance_linux = [{
  name            = "js-linux"
  image        = "centos7"
  flavor_id       = "3"
  security_groups = ["default"]
  user_data = "linux.sh"
}]

instance_windows = [{
  name            = "js-windows"
  image        = "win2012"
  flavor_id       = "3"
  security_groups = ["default","WRA"]
  user_data = "win.ps1"
}]

# volumes
volumes = [
{
  name = "terra-lin-disk"
  size = 4
},
{
  name = "terra-win-disk"
  size = 4
}
]

# networks
networks = {
  private_network = "private-network"
  public_network = "public-network"
}

