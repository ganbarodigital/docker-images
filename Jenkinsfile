def imagesToBuild = [
    [
        "ubuntu-16.04/ubuntu-server-16.04"
    ],
    [
        // depends on "ubuntu-server-16.04"
        "ubuntu-16.04/network-lead",
		"ubuntu-16.04/ubuntu-apache2-16.04",
        "ubuntu-16.04/ubuntu-nginx-16.04",
        "ubuntu-16.04/ubuntu-openjdk-dev-8",
        "ubuntu-16.04/ubuntu-nodejs-dev-8"
    ],
    [
		// depends on ubuntu-apache2
		"ubuntu-16.04/ubuntu-apache2-phpfpm-dev-7.0",
		"ubuntu-16.04/ubuntu-apache2-modphp-dev-7.0",
        // depends on ubuntu-nginx
        "ubuntu-16.04/ubuntu-nginx-phpdev-7.0"
    ],
    [
        // depends on ubuntu-nginx-phpdev-7.0
        "ubuntu-16.04/ubuntu-nginx-phpfpm-prod-7.0",
        "ubuntu-16.04/ubuntu-nginx-phpfastcgi-prod-7.0",
        "ubuntu-16.04/ubuntu-nginx-wordpress-dev",
        "ubuntu-16.04/ubuntu-apache2-wordpress-dev"
    ],
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
        	sh 'cd ' + env.WORKSPACE + ' && git fetch --tags'
			sh 'cd ' + env.WORKSPACE + ' && git describe'
            sh 'cd ' + env.WORKSPACE + '/' + imageName + ' && make rebuild publish'
        }
    }
}
