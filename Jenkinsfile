node {
  checkout scm
    def image = 'node:16-buster-slim'
    def PUBLIC_URL = 'https://faisal-666.github.io/React'
    docker.image(image).inside('-p 3000:3000') {
	stage('Build') {
	    sh 'apt-get update && apt-get install -y git'
            sh 'npm cache clean --force'
            sh 'npm install --force'
        }
        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
	stage('Manual Approval') {
	    input message: 'Lanjutkan ke tahap Deploy?'
	}
	stage('Deploy') {
	    sh './jenkins/scripts/deliver.sh'
	    sleep time: 5, unit: 'SECONDS'
	    sh './jenkins/scripts/kill.sh'
	  withEnc(["PUBLIC_URL"]){
	    sh 'chmod +x ./jenkins/scripts/gh-pages.sh && ./jenkins/scripts/gh-pages.sh'
	  }
	}
     }
}
