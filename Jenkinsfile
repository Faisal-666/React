node {
    def image = 'node:16-buster-slim'
    docker.image(image).inside('-p 3000:3000') {
        stage('Build') {
            sh 'npm cache clean'
            sh 'npm install'
        }
        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
	stage('Deploy') {
	    sh './jenkins/scripts/deliver.sh'
	    input message: 'Dah kelar menggunakan React App? (Klik "proceed" untuk mengakhiri)'
	    sh './jenkins/scripts/kill.sh'
	}
    }
}
