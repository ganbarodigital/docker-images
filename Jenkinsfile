stage('Base Images') {
    def imagesToBuild = [
        "ubuntu-server-16.04"
    ]

    buildImages(imagesToBuild)
}

stage('Generic Images') {
    def imagesToBuild = [
        "network-lead",
        "ubuntu-nginx-phpdev-7.0"
    ]

    buildImages(imagesToBuild)
}

stage('App Images') {
    def imagesToBuild = [
    ]

    buildImages(imagesToBuild)
}

def buildImages(imageList) {
    def stepsForParallel = [:]

    for (int i = 0; i < imageList.size(); i++) {
        def imageName = imageList.get(i)
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
