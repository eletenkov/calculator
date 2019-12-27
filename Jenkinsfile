pipeline {
  
  agent {
	  label 'dev1'
  }

  stages {
    stage("Checkout") {
      steps {
        git credentialsId: 'jenkins-user-ssh-key', url: 'git@github.com:eletenkov/calculator.git', branch: 'master'
      }
    }
 
    stage("Compile") {
      steps {
        sh "./mvnw package"
      }
    }
 
    stage("Unit test") {
      steps {
        sh "./mvnw test"
      }
    }

    stage("Package") {
      steps {
          sh "./mvnw package"
      }
    }
 
    stage("Docker build") {
      steps {
        sh "docker build -t docker.repo.m.s/calculator ."
      }
    }
     
    stage("Docker push") {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-login-password-authentification', 
          usernameVariable: 'DOCKER_USER', 
          passwordVariable: 'DOCKER_PASSWORD')
          ]) 
        {
          sh "docker login --username ${DOCKER_USER} --password ${DOCKER_PASSWORD} https://docker.repo.m.s"
          sh "docker push docker.repo.m.s/calculator"
        }          
      }
    }  
 
    stage("Deploy to staging") {
      steps {
        sh "docker run -d --rm -p 8765:8080 --name calculator mandarin.solutions/calculator"
      }
    }

    stage("Acceptance test") {
      steps {
        sleep 15
        sh "./acceptance_test.sh"
      }
    }
    
  }

  post {
    always {
      sh "docker stop calculator"
    }
  }
}