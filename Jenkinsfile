node {
    def image = 'node:16-buster-slim'
    docker.image(image).inside('-p 3000:3000') {
        stage('Build') {
            sh 'npm cache clean --force'
            sh 'npm install --force'
        }
        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
    }
}
