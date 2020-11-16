pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Pull AWX images from docker.io') {
             steps {
                sh '''
                df -h
                '''
             }
        }
        stage('decrypt vaults, get SSH keys ansible') {
              steps {
                   withCredentials([file(credentialsId: 'ansiblevault', variable: 'AV')]) {
                       sh '''
                       ansible-vault decrypt inventory/group_vars/all/vault.yml --vault-password-file=$AV
                       '''
                   }
                   withCredentials([sshUserPrivateKey( keyFileVariable: "AOT", credentialsId: "ansible_OT", usernameVariable: "ansible" )]) {
                        sh '''
                        if [ ! -f ~/.ssh/id_ansible ]; then
                        touch ~/.ssh/id_ansible
                        cp \$AOT ~/.ssh/id_ansible
                        chmod 0600 ~/.ssh/id_ansible
                        fi
                        '''
                   }
              }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

