stage('Base Image') {
    def imagesToBuild = [
        "ubuntu-server-16.04"
    ]

    buildImages(imagesToBuild)
}

stage('Dep 1 Images') {
    def imagesToBuild = [
        "network-lead",
        "ubuntu-nginx"
    ]

    buildImages(imagesToBuild)
}

stage('Dep 2 Images') {
    def imagesToBuild = [
        "ubuntu-nginx-phpdev-7.0"
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
