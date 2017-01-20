stage('Build') {
    node ('docker') {
        checkout scm
        sh 'make build'
    }
}