pipeline {
    agent {dockerfile true }
    environment {
        IBM_ENTITLEMENT_KEY = credentials('ibm_entitlement_key')
        USERNAME            = "michelle.jiang@ibm.com"
        PASSWORD            = credentials('image_openshift_token')
        IMAGE_REPO          = "default-route-openshift-image-registry.itzroks-663002388p-fxba7u-6ccd7f378ae819553d37d5f2ee142bd6-0000.au-syd.containers.appdomain.cloud"
    }
    stages {
        stage('Build Image') {
            steps {
                echo 'Build Image'
                sh "docker login -u $USERNAME -p $PASSWORD $IMAGE_REPO"
                sh "docker build --tag $IMAGE_REPO/mq/testing ."
            }
        }
        stage('Push Image') {
            steps {
                echo 'Push Image to Repository'
                sh "docker push $IMAGE_REPO/mq/testing"
            }
        }
    }
}
