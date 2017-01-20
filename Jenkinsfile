stage('Build Base Images') {
    parallel ubuntu-server-1604: {
        node ('docker') {
            checkout scm
            sh 'cd ubuntu-server-16.04 && make build'
        }
    }
}

stage('Build Final Images') {
    parallel network-lead: {
        node('docker') {
            sh 'cd network-lead && make build'
        }
    },
    parallel ubuntu-nginx-phpdev-70: {
        node('docker') {
            sh 'cd ubuntu-nginx-phpdev-7.0 && make build'
        }
    }
}

stage('Publish') {
    node ('docker') {
        sh 'cd ubuntu-server-16.04 && make publish'
        sh 'cd network-lead && make publish'
        sh 'cd ubuntu-nginx-phpdev-7.0 && make publish'
    }
}