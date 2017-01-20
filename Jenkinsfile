stage('Build Base Images') {
    def imagesToBuild = [
        "ubuntu-server-16.04"
    ]

    def stepsForParallel = [:]

    for (int i = 0; i < imagesToBuild.size(); i++) {
        def imageName = imagesToBuild.get(i)
        stepsForParallel["Build ${imageName}"] = buildImage(imageName)
    }

    parallel stepsForParallel
}

stage('Build Final Images') {
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

def buildImage(imageName) {
    return {
        node('docker') {
            sh 'cd ' + imageName + ' && make build'
        }
    }
}

stage('Publish') {
    def imagesToPublish = [
        "ubuntu-server-16.04",
        "ubuntu-nginx-phpdev-7.0",
        "network-lead"
    ]

    for (int i = 0; i < imagesToPublish.size(); i++) {
        def imageName = imagesToPublish.get(i)

        node('docker') {
            sh 'cd ' + imageName + ' && make publish'
        }
    }
}