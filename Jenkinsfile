node {
    def image = 'node:16-buster-slim'
    docker.image(image).inside('-p 5000:5000') {
        stage('Build') {
            sh 'npm cache clean --force'
            sh 'npm install'
        }
        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
    }
}
