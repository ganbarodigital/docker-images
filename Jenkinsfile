stage('Build') {
    node ('docker') {
        checkout scm
        sh 'make build'
    }
}

stage('Publish') {
    node ('docker') {
        sh 'make publish'
    }
}