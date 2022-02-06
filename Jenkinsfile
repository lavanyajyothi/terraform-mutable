pipeline {
  agent { label 'WORKSTATION' }

  environment {
    ACTION  =  "apply"
    ENV     =  "dev"
    SSH     =  credentials('CENTOS_SSH')
  }

  options {
    ansiColor('xterm')
    disableConcurrentBuilds()
  }

  stages {
    stage('vpc') {
      steps {
        sh 'echo ${SSH} >/tmp/out'
        sh '''
          cd vpc
          make ${ENV}-${ACTION}
        '''
      }
    }

    stage('db') {
      steps {
        sh '''
          cd db
          rm -rf mongo-documentdb.tf
          make ${ENV}-${ACTION}
        '''
      }
    }
    stage('ALB') {
      steps {
        sh '''
          cd alb
          make ${ENV}-${ACTION}
        '''
      }
    }
  }
}
