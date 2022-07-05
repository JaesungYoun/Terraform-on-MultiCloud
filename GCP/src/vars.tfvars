#provider
provider_gcp = {
  project     = "js-project-347001"
  credentials = "js-project-347001-45e179a75fd6.json"
  zone     = "asia-northeast3-a"
}


instance_count = 2

network = "default"

instance = [{
  name         = "js-linux"
  machine_type = "e2-medium"
  image = "centos-7"
  email = "jsjsjs@js-project-347001.iam.gserviceaccount.com"

},
{
    name = "js-windows"
    machine_type = "e2-medium"
    image = "windows-2016"
    email = "zonp-640@zcontest-296204.iam.gserviceaccount.com"
}

]


