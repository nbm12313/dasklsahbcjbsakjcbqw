def createVirtualMachine(cpuCores, ramCapacity, diskCapacity, isoPath) {
    // Terraform 설정 파일 디렉토리로 이동
    dir('terraform') {
        // Terraform 초기화
        sh 'terraform init'

        // Terraform 변수 파일 생성
        writeFile file: 'terraform.tfvars', text: """
            cpu_cores = ${cpuCores}
            ram_capacity = ${ramCapacity}
            disk_capacity = ${diskCapacity}
            iso_path = "${isoPath}"
        """

        // Terraform 배포
        sh 'terraform apply -auto-approve'
        
        // 가상 머신의 RDP 접속 정보 추출
        def rdpInfo = [
            ipAddress: '...',
            port: '...',
            username: '...',
            password: '...'
        ]
        return rdpInfo
    }
}

pipeline {
    agent any

    parameters {
        string(name: 'cpuCores', defaultValue: '', description: 'Number of CPU cores')
        string(name: 'ramCapacity', defaultValue: '', description: 'RAM capacity in GB')
        string(name: 'diskCapacity', defaultValue: '', description: 'Disk capacity in GB')
        string(name: 'isoPath', defaultValue: 'var/jenkins_home/workspace/hostings/window_server_2019.iso', description: 'Path to the ISO file')
    }

    stages {
        stage('Create VM') {
            steps {
                script {
                    // 파이프라인 매개변수로부터 스펙 정보를 받아옵니다.
                    def cpuCores = params.cpuCores
                    def ramCapacity = params.ramCapacity
                    def diskCapacity = params.diskCapacity
                    def isoPath = params.isoPath

                    // 가상 머신 생성 및 RDP 정보 추출
                    def rdpInfo = createVirtualMachine(cpuCores, ramCapacity, diskCapacity, isoPath)

                    // RDP 정보를 필요한 방식으로 전송하거나 처리합니다.
                    // 예를 들어, 이메일을 통해 RDP 정보를 전송하는 등의 로직을 추가할 수 있습니다.
                }
            }
        }
        stage('Send RDP Info') {
            steps {
                script {
                    def rdpIP = env.RDP_IP
                    def rdpPort = env.RDP_PORT
                    def rdpUsername = env.RDP_USERNAME
                    def rdpPassword = env.RDP_PASSWORD

                    // RDP 정보를 필요한 방식으로 전송하거나 처리합니다.
                    // 예를 들어, 이메일을 통해 RDP 정보를 전송하는 등의 로직을 추가할 수 있습니다.
                }
            }
        }
    }
}