pipeline {
  agent { lable1 'WORKSTATION' }

  stages {
    stage('vpc') {
      sh '''
        cd vpc
        make dev-apply
      '''
    }
    stage('db') {
      sh '''
        cd db
        make dev-apply
      '''
    }
    stage('ALB') {
      sh '''
        cd alb
        make dev-apply
      '''
    }
  }
}
