def imagesToBuild = [
    [
        "ubuntu-server-16.04"
    ],
    [
        "network-lead",
        "ubuntu-nginx"
    ],
    [
        "ubuntu-nginx-phpdev-7.0"
    ],
    [
        "wordpress-dev"
    ]
]

stage('Base Image') {
    buildImages(imagesToBuild[0])
}

stage('1 Dep Images') {
    buildImages(imagesToBuild[1])
}

stage('2 Dep Images') {
    buildImages(imagesToBuild[2])
}

stage('3 Dep Images') {
    buildImages(imagesToBuild[3])
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
            sh 'cd ' + env.WORKSPACE + '/' + imageName + ' && make build publish'
        }
    }
}
