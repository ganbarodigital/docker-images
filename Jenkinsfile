stage('Base Images') {
    def imagesToBuild = [
        "ubuntu-server-16.04"
    ]

    def stepsForParallel = [:]

    for (int i = 0; i < imagesToBuild.size(); i++) {
        def imageName = imagesToBuild.get(i)
        stepsForParallel[imageName] = buildImage(imageName)
    }

    parallel stepsForParallel
}

stage('Generic Images') {
    def imagesToBuild = [
        "network-lead",
        "ubuntu-nginx-phpdev-7.0"
    ]

    def stepsForParallel = [:]

    for (int i = 0; i < imagesToBuild.size(); i++) {
        def imageName = imagesToBuild.get(i)
        stepsForParallel[imageName] = buildImage(imageName)
    }

    parallel stepsForParallel
}

stage('App Images') {
    def imagesToBuild = [
    ]

    def stepsForParallel = [:]

    for (int i = 0; i < imagesToBuild.size(); i++) {
        def imageName = imagesToBuild.get(i)
        stepsForParallel[imageName] = buildImage(imageName)
    }

    parallel stepsForParallel
}

def buildImage(imageName) {
    return {
        node('docker') {
            checkout scm
            sh 'cd ' + env.WORKSPACE + '/' + imageName + ' && make build'
            sh 'cd ' + env.WORKSPACE + '/' + imageName + ' && make publish'
        }
    }
}
