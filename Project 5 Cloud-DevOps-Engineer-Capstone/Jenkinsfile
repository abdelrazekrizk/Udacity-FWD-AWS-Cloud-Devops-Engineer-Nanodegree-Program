node{
   stage('SCM Checkout') {
       git branch: 'main', credentialsId: 'Git_Credentials', url: 'https://github.com/abdelrazekrizk/my-app-1'
   }
   stage('Build Docker Image') {
       sh 'docker build -t abdelrazekrizk/udacity-web:1.0.0 .'
   }
   stage('Push Docker Image') {
     withCredentials([string(credentialsId: 'Docker_Credentials', variable: 'dockerHubPwd')]) {
        sh "docker login -u abdelrazekrizk -p ${dockerHubPwd}"
   }
        sh 'docker push abdelrazekrizk/udacity-web:1.0.0'
   }
   stage('Run docker Container on Dev Server') {
        sh 'docker run -p 8000:80 -d --name my-app abdelrazekrizk/udacity-web:1.0.0'
   }
   stage('lint docker file') {
        sh 'hadolint --config config.yaml Dockerfile'
   }
   stage('Run kubectl Container on Dev Server') {
     withCredentials([kubeconfigFile(credentialsId: 'Kubeconfig_Credentials', variable: 'KUBECONFIG')]) {
        sh 'kubectl apply -f Deployment.yaml'
        sh 'kubectl apply -f Service.yaml'
        } 

    }
}