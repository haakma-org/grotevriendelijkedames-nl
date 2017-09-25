pipeline {
  agent any
  triggers {
    cron '@daily'
  }
  stages {
    stage('Preparation') {
      steps {
        // Backup has started
        notifyStarted()
        // Clean workspace
        step([$class: 'WsCleanup', cleanWhenFailure: false])
        // Get code from github.com
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-git', url: 'http://jenkins@github.com/haakma-org/grotevriendelijkedames-nl.git']]]
      }
    }
    stage('Backup grotevriendelijkedames.nl') {
      steps {
        echo "Backup grotevriendelijkedames.nl"
        sh "./grotevriendelijkedames.nl-site/backup/backup_gvd-site.sh"
      }
    }
    stage('Cleanup old backups') {
      steps {
        echo "Cleanup old backups"
        sh "./utils/move_old_backups.sh"
      }
    }
  }
  post {
    success {
      notifySuccess()
    }
    failure {
      notifyFailed()
    }
  }
}

def notifyStarted() {
  slackSend (channel: '#backup', color: '#FFFF00', message: "STARTED: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
def notifySuccess() {
  slackSend (channel: '#backup', color: '#00FF00', message: "SUCCESSFUL: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
def notifyFailed() {
  slackSend (channel: '#backup', color: '#FF0000', message: "FAILED: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
