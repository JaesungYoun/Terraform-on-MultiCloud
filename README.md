# Terraform-on-MultiCloud

## 1. 테라폼(Terraform) 이란?
테라폼(Terraform)은 프로그램 코드를 통해 인프라 서버를 구축/운영 할 수 있게 해주는 오픈 소스 Infrastructure as Code, IaC 도구(소프트웨어)이다. 
오픈소스로 개발 중인 클라우드 인프라스트럭처 자동화를 지향하는 코드로서의 Infrastructure as Code, IaC 도구이다.
테라폼은 프로그램 코드를 통해 인프라 서버를 구축/운영 할 수 있게 해주는 오픈 소스 소프트웨어 입니다.



테라폼을 사용하면 AWS든, GCP든, NCP든 테라폼이 지원하는 클라우드 플랫폼이라면, 클라우드 인프라 환경을 코드로서 정의해 사용함으로써 동일한 인프라를 재현할 수 있다.


**Infra Provisioning on MultiCloud using Terraform**   

<img src="https://user-images.githubusercontent.com/73388615/177294573-01fb37d0-cc33-41ec-a4a5-713b4057c34c.png" width="200" height="200"/>



## 2. USE

### 1) 



### 2) Terraform 명령어
- init
  - Terraform 구성 파일이 포함된 작업 디렉토리를 초기화하는 데 사용됩니다.
- plan
  - 정의한 코드가 어떤 인프라를 만들게 되는지 미리 예측 결과를 보여줍니다. 단, plan을 한 내용에 에러가 없다고 하더라도, 실제 적용되었을 때는 에러가 발생할 수 있습니다.
- apply
  - 실제로 인프라를 배포하기 위한 명령어입니다. apply를 완료하면, AWS 상에 실제로 해당 인프라가 생성되고 작업 결과가 backend의 .tfstate 파일과 local의 .terraform에 저장됩니다.

