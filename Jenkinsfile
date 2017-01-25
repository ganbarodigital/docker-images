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

stage('Dep 1 Images') {
    buildImages(imagesToBuild[1])
}

stage('Dep 2 Images') {
    buildImages(imagesToBuild[2])
}

stage('Dep 3 Images') {
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
