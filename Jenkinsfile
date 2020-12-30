node ('master')
 {
  
    def maven = tool name: "maven-3.6.3"
  
      echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
  
   properties([ buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '2')), pipelineTriggers([githubPush()])])
  
    stage('SCM'){
        git branch: 'dev', credentialsId: '3137dfee-c53a-40b6-a42c-c5c9ad467f1b', url: 'https://github.com/sanjeethmallesh/maven-web-application.git'
    }
    
    stage('BUILD'){
        sh "${maven}/bin/mvn clean package"
    }
    
    stage('SONAR'){
        sh "${maven}/bin/mvn sonar:sonar"
    }
    
    stage('ARTIFACT'){
        sh "${maven}/bin/mvn deploy"
    }
    
    stage('DEPLOY'){
        sshagent(['881b1f67-af1a-4b09-b79b-6b82c3d4ce48']) {
            sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@54.159.147.43:/usr/local/tomcat9/webapps/"
        }
    }
 
  /*
 stage("ExecuteSonarQubeReport")
 {
 sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 
 stage("UploadArtifactsintoNexus")
 {
 sh "${mavenHome}/bin/mvn deploy"
 }
 
  stage("DeployAppTomcat")
 {
  sshagent(['423b5b58-c0a3-42aa-af6e-f0affe1bad0c']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war  ec2-user@15.206.91.239:/opt/apache-tomcat-9.0.34/webapps/" 
  }
 }
 
 stage('EmailNotification')
 {
 mail bcc: 'devopstrainingblr@gmail.com', body: '''Build is over

 Thanks,
 Mithun Technologies,
 9980923226.''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'Build is over!!', to: 'devopstrainingblr@gmail.com'
 }
 */
 
 }
