pipeline {
    agent any
    stages {
        stage('create buildconfig') {
            steps {
                sh 'oc apply -f JMS-bc.yaml'
            }
        }

        stage('create build') {
            steps {
                sh 'oc start-build dockerfile-buildconfig -n mq'
            }
        }
    }
}
