pipeline {
  agent { label 'WORKSTATION' }

  stages {
    stage('vpc') {
      steps {
        sh '''
          cd vpc
          make dev-apply
        '''
      }
    }

    stage('db') {
      steps {
        sh '''
          cd db
          make dev-apply
        '''
      }
    }
    stage('ALB') {
      steps {
        sh '''
          cd alb
          make dev-apply
        '''
      }
    }
  }
}
