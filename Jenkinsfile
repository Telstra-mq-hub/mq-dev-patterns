pipeline {
    agent any
    stages {
        stage('create image') {
            steps {
                sh 'oc apply -f JMS-bc.yaml'
            }
        }
    }
}
