node {
  checkout scm
    def image = 'timbrul31/node-alpine-git:16'
    docker.image(image).inside('-p 3000:3000') {
	environment {
	    PUBLIC_URL = 'https://Faisal-666.github.io/React'
	    GITHUB_TOKEN = credentials('j-github-token')
	    GUTHUB_REPOSITORY = 'Faisal-666/React'
	}
	stage('Build') {
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
	    sh 'chmod +x ./jenkins/scripts/gh-pages.sh && ./jenkins/scripts/gh-pages.sh'
    }
}
