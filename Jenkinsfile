stage('Build Base Images') {
    parallel ubuntu-server-16.04: {
        node ('docker') {
            checkout scm
            sh 'cd ubuntu-server-16.04 && make build'
        }
    }
}

stage('Build Final Images') {
    parallel ubuntu-nginx-phpdev-7.0: {
        node('docker') {
            sh 'cd ubuntu-nginx-phpdev-7.0 && make build'
        }
    }
}

stage('Publish') {
    node ('docker') {
        sh 'cd ubuntu-server-16.04 && make publish'
        sh 'cd ubuntu-nginx-phpdev-7.0 && make publish'
    }
}