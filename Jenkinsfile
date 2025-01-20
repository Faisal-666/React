node {
  checkout scm
    def image = 'node:16-buster-slim'
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
	    sleep time: 60, unit: 'SECONDS'
	    sh './jenkins/scripts/kill.sh'
	    sh 'chmod +x ./jenkins/scripts/gh-pages.sh && ./jenkins/scripts/gh-pages.sh'
	}
     }
}
