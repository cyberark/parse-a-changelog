#!/usr/bin/env groovy

pipeline {
  agent { label 'executor-v2' }

  options {
    timestamps()
    buildDiscarder(logRotator(numToKeepStr: '30'))
  }

  triggers {
    cron(getDailyCronString())
  }

  stages {

    stage('Validate Changelog'){
        // This stage validates the changelog in this repo.
        steps { sh './validate.sh' }
    }

    stage("Build Docker Image"){
        steps { sh './build.sh' }
    }


    stage('Test') {
      steps {
        sh './test.sh'
      }
      post {
          always{
            junit 'rspec_junit.xml'
          }
      }
    }

    // Only publish to RubyGems if branch is 'master'
    // AND someone confirms this stage within 5 minutes
    stage('Conditional publish to RubyGems and Dockerhub') {
      // Only run this stage when triggered by a tag
      when { tag "v*" }
      steps {
        // The tag trigger sets TAG_NAME as an environment variable

        // Clean up first
        sh '''docker run -i --rm -v $PWD:/src -w /src --entrypoint /bin/sh alpine/git \
            -c "git config --global --add safe.directory /src && \
            git clean -fxd" '''

        sh './publish.sh'

        // Clean up again...
        sh '''docker run -i --rm -v $PWD:/src -w /src --entrypoint /bin/sh alpine/git \
            -c "git config --global --add safe.directory /src && \
            git clean -fxd" '''
        deleteDir()
      }
    }
  }

  post {
    always {
      cleanupAndNotify(currentBuild.currentResult)
    }
  }
}
