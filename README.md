<h1>miniCICDProject</h1>
Jenkins와 ArgoCD를 사용하여 CI/CD 파이프라인을 구축하고 자동으로 간단한 애플리케이션을 배포 해 보았다. 코드를 커밋 하면 Jenkins가 자동으로 빌드, DockerHub에 이미지 배포를 수행,이어서 ArgoCD가 Kubernetes 클러스터에 애플리케이션을 배포 했고, 동시에 빌드 혹은 배포 과정에 문제가 생겼을 시 Discord로 알림을 받아보는 기능까지 구현해 보았다.
<hr>
<h3>디렉토리 구조</h3>

my-app/<br>
├── Dockerfile<br>
├── k8s/<br>
│   ├── pod1.yaml<br>
│   <br>
|── index.html
<hr>
<p align="center">
  <img src="https://github.com/user-attachments/assets/08be8c2f-c72e-440e-aab7-45b1c730797f"/>
  
</p>
처음에 일부러 오타를 내어 BASE IMAGE가 잘못된 도커파일을 가지고 git repository에 커밋을 하고 푸쉬를 하였다.
  <p align="center">
  <img src="https://github.com/user-attachments/assets/8c4e20ed-c3cb-4883-a4b3-2e31f8a81456"/>
</p>
Jenkins도 오류를 감지 하였고,
    <p align="center">
  <img src="https://github.com/user-attachments/assets/63a757cc-c7c5-4771-ad56-b69753347ddd"/>
</p>
Discord Bot에게 알람도 잘 전달이 되었다.
  <p align="center">
  <img src="https://github.com/user-attachments/assets/79839dbb-a832-43b9-8e68-bf5171b7fb47" width="" height=""/>
</p>
그래서 이번에는 오타를 수정하고, git repository에 커밋하고 푸쉬를 하였더니,
  <p align="center">
  <img src="https://github.com/user-attachments/assets/1d3b4f3a-a9d0-405d-b943-cde7c6cc35f3"/>
</p>
Jenkins와 Argocd 모두에게 성공했다고 도착한 걸 볼 수 있었고,
    <p align="center">
  <img src="https://github.com/user-attachments/assets/9afdb50c-1e73-4c14-a488-37cec6b8fd91"/>
</p>
실제로 Jenkins에도 잘 도착하여 Dockerfile을 이용해 이미지를 만들고, DockerHub에 푸쉬하고
  <p align="center">
  <img src="https://github.com/user-attachments/assets/c5bdf3d3-63ab-42bf-a665-c777ede531ed" />
</p>
DockerHub에 이미지가 도착하면,
<p align="center">
  <img src="https://github.com/user-attachments/assets/5d324a68-26e7-41d1-9887-71b16c1a8fde" />
</p>
ArgoCD가 도착한 이미지를 이용하여 Cluster의 Sync를 잘 맞춘 것을 확인해 볼 수 있었다.
