
pipeline {
<<<<<<< HEAD
    // Possibilities for agent
    agent any // Runs on any available agent
    agent none // No default agent, each stage must define its own
    agent { label 'linux' } // Runs on an agent labeled 'linux'
    agent { node { label 'windows' } } // Runs on a specific 'windows' node
    agent { 
        docker { 
            image 'maven:3.8.1-jdk-11' // Runs inside a Maven 3.8.1 with JDK 11 Docker container
            args '-v /tmp:/tmp' // Mounts /tmp directory inside the container
        } 
    }
    agent {
        dockerfile {
            filename 'Dockerfile' // Builds an image from a Dockerfile instead of pulling one
            args '-v /tmp:/tmp' // Mounts /tmp directory inside the container
        }
    }

    tools {
        jdk 'JDK-11' // For Java-based applications requiring JDK 11
        maven 'Maven-3.8.5' // For Java projects using Maven
        gradle 'Gradle-7' // For projects using Gradle
        nodejs 'NodeJS-14' // For JavaScript/Node.js applications
        python 'Python-3.9' // For Python-based projects
    }

    environment {
        GLOBAL_VAR = "value" // Available everywhere in the pipeline
        STAGE_SPECIFIC_VAR = "stage_value" // Overridden in specific stages
        DOCKER_IMAGE = "node:16" // Used for dynamic image selection
        AWS_REGION = "us-east-1" // Used in AWS-related stages
        DB_CONNECTION = credentials('db-credentials') // Injects Jenkins credentials
    }

    parameters {
        string(name: 'PARAM1', defaultValue: 'value1', description: 'A string parameter') // Accepts text input
        booleanParam(name: 'FLAG', defaultValue: true, description: 'A boolean parameter') // Accepts true/false
        choice(name: 'CHOICE', choices: ['option1', 'option2'], description: 'A choice parameter') // Provides a dropdown selection
        password(name: 'SECRET', description: 'A sensitive parameter') // Hides input for security reasons
        file(name: 'CONFIG_FILE', description: 'Upload a config file') // Allows file upload as input
    }

    options {
        timeout(time: 10, unit: 'MINUTES') // Fails the pipeline if it exceeds 10 minutes
        buildDiscarder(logRotator(numToKeepStr: '5')) // Keeps only the last 5 builds
        disableConcurrentBuilds() // Prevents multiple builds running at the same time
        skipStagesAfterUnstable() // Stops execution if a stage becomes unstable
        preserveStashes(buildCount: 3) // Keeps stash files for the last 3 builds
    }

    triggers {
        cron('H 12 * * 1-5') // Runs at 12 PM on weekdays
        pollSCM('H/5 * * * *') // Checks for Git changes every 5 minutes
        upstream(upstreamProjects: 'another-job', threshold: hudson.model.Result.SUCCESS) // Triggers when another job succeeds
        githubPush() // Runs on GitHub push events
        bitbucketPush() // Runs on Bitbucket push events
    }
    stages {
        stage('1 Git Checkout') {
            steps {
                git branch: 'main',                   // Specifies the branch to checkout.
                    url: 'https://github.com/user/repo.git', // Git repository URL.
                    changelog: true,                  // Enables changelog generation for the build.
                    credentialsId: 'git-credentials',  // Uses stored Jenkins credentials for authentication.
                    depth: 1,                          // Performs a shallow clone (only latest commit).
                    poll: true,                        // Enables Jenkins polling for changes.
                    submoduleCfg: []                   // Empty submodule configuration (deprecated feature).

                echo "Repository has been checked out successfully."
            }
        }
        stage('2 Setup Environment Variables') {
            environment {
                STAGE_VAR = "stage_value"
                // Variables defined here (inside stage{}) are only available within this stage.
                // They override pipeline-level environment variables if they have the same name.
            }
            steps {
                echo "Environment variables have been set."
            }
        }
        stage('3 Run on Labeled node') {
            agent { label 'linux' } // Runs this stage on an agent with the label 'linux'
            steps {
                echo "Running on a specific labeled agent"
            }
        }
        stage('4 Install Dependencies') {
            // Installs required dependencies before build/test
            // Example: For Node.js, it runs `npm install`
            steps {
                sh 'npm install'  
                echo "Dependencies installed successfully."
            }
        }
        stage('5 Security Scan') {
            // Scans for security vulnerabilities in dependencies, code, or images
            // Example: Using `trivy` to scan a Docker image
            steps {
                sh 'trivy image myapp:latest'  
                echo "Security scan completed."
            }
        }
        stage('6 Static Code Analysis') {
            // Analyzes code quality, security vulnerabilities, and code smells
            // Example: Running SonarQube or ESLint for JavaScript
            steps {
                sh 'sonar-scanner'  // Example: SonarQube analysis
                // sh 'eslint src/'  // Example: ESLint for JS projects
                echo "Static code analysis completed."
            }
        }
        stage('7 Run Unit Tests') {
            // Runs unit tests to validate individual components before integration
            // Example: Running Jest for JavaScript or JUnit for Java
            steps {
                sh 'npm test' // For JavaScript
                // sh 'mvn test' // For Java (Uncomment if needed)
                echo "Unit tests executed."
            }
        }
        stage('8 Conditional Execution Check') {
            when {
                branch 'main'
                // This stage runs only if the branch is 'main'.
                
                not {
                    equals expected: 'develop', actual: env.BRANCH_NAME
                    // This ensures the stage does NOT run if the branch is 'develop'.
                    // The 'not' block negates the condition inside it.
                }
                // The 'when' directive controls conditional execution of the stage.
            }
            steps {
                echo "Conditions met, executing stage..."
            }
        }
        stage('9 Manual Approval') {
            input {
                message "Approve this stage?"
                ok "Proceed"
                // Before executing the stage, manual approval is required.
                // Jenkins will pause the pipeline and show the message: "Approve this stage?" with a "Proceed" button.

                parameters {
                    string(name: 'STAGE_PARAM', defaultValue: 'stage_value', description: 'Stage parameter')
                    // This defines a parameter that must be provided during approval.
                    // The user must enter a string value before proceeding.
                }
            }
            steps {
                echo "Stage approved, proceeding with execution."
            }
        }
        stage('10 parallel stage execution exemple') {  
            parallel {  
                // 'parallel' allows multiple stages to run concurrently.  
                // Each nested stage inside 'parallel' executes simultaneously on available executors.

                stage('Parallel Stage 1') {  
                    steps {  
                        echo "Executing Parallel Stage 1"
                        // This step executes as part of 'Parallel Stage 1'.
                        // Runs independently alongside 'Parallel Stage 2'.
                    }  
                }  

                stage('Parallel Stage 2') {  
                    steps {  
                        echo "Executing Parallel Stage 2"
                        // This step executes as part of 'Parallel Stage 2'.
                        // Runs simultaneously with 'Parallel Stage 1'.
                    }  
                }  
            }  
        }
        stage('11 Run on Specific/Windows Node') {
            agent { node { label 'windows' } } // Assigns this stage to a node with label 'windows'
            steps {
                echo "Running on a specific node"
            }
        }
        stage('12 Run in Custom Workspace') {
            agent {
                node {
                    label 'custom-agent' // Specifies an agent with a custom label
                    customWorkspace '/home/jenkins/workspace' // Uses a custom workspace directory
                }
            }
            steps {
                echo "Running in a custom workspace"
            }
        }
        stage('13 Run in Docker Container') {
            agent {
                docker {
                    image 'node:14' // Uses Node.js 14 Docker image
                    args '-v /app:/app' // Mounts /app directory into the container
                    alwaysPull true // Always pull the latest version of the image
                    reuseNode true // Reuse the workspace for efficiency
                }
            }
            steps {
                echo "Running inside a Docker container"
            }
        }
        stage('13.5 Package Build') {
            steps {
                echo "Starting package build process..."
                
                // Example for Java (Maven)
                sh 'mvn clean package -DskipTests'

                // Example for Node.js
                // sh 'npm run build'

                // Example for Python (Creating a wheel)
                // sh 'python setup.py bdist_wheel'

                echo "Package build completed successfully."
            }
        }
        stage('14 Build and Run from Dockerfile') {
            agent {
                dockerfile {
                    filename 'Dockerfile' // Uses a custom Dockerfile instead of an image
                    dir 'docker-context' // Specifies the directory where the Dockerfile is located
                    additionalBuildArgs '--build-arg ENV=dev' // Adds extra arguments to the build
                    args '-v /data:/data' // Mounts volume inside the container
                    label 'docker-agent' // Runs on an agent with 'docker-agent' label
                }
            }
            steps {
                echo "Running inside a custom Docker container"
            }
        }
        stage('15 Run in Kubernetes Pod') {
            agent {
                kubernetes {
                    yamlFile 'pod-template.yaml' // Uses a Kubernetes pod template
                    yaml '''
                    apiVersion: v1
                    kind: Pod
                    spec:
                      containers:
                      - name: jnlp
                        image: jenkins/inbound-agent
                      - name: builder
                        image: maven:3.8.1
                    '''
                    defaultContainer 'builder' // Runs steps in 'builder' container
                    namespace 'jenkins' // Specifies the Kubernetes namespace
                }
            }
            steps {
                echo "Running in a Kubernetes pod"
            }
        }
        stage('16 Execute Integration Tests') {
            // Executes integration tests to validate end-to-end workflows
            // Example: Running `pytest` for Python integration tests
            steps {
                sh 'pytest tests/integration'  
                echo "Integration tests executed."
            }
        }
        stage('17 Execute Performance Tests') {
            // Runs performance/load tests to check system behavior under stress
            // Example: Using `k6` for load testing
            steps {
                sh 'k6 run load-test.js'  
                echo "Performance tests completed."
            }
        }
        stage('18 Database Migration') {
            // Applies database schema changes before deploying new code
            // Example: Running Flyway or Liquibase for database migrations
            steps {
                sh 'flyway migrate'  // Example: Flyway migration
                // sh 'liquibase update' // Example: Liquibase migration
                echo "Database migration completed."
            }
        }
        stage('19 Terraform Plan & Apply') {
            // Manages infrastructure using Terraform
            // `terraform plan` shows planned changes before applying
            // Requires manual approval before running `terraform apply`
            steps {
                sh 'terraform init && terraform plan'  
            }
            input {
                message "Apply Terraform changes?"
                ok "Apply"
            }
            steps {
                sh 'terraform apply -auto-approve'  
                echo "Infrastructure deployed using Terraform."
            }
        }
        stage('20 Ansible Configuration') {
            // Applies configuration changes using Ansible
            // Example: Running an Ansible playbook
            steps {
                sh 'ansible-playbook -i inventory.ini playbook.yml'  
                echo "Configuration applied using Ansible."
            }
        }
        stage('21 Deploy to Kubernetes') {
            // Deploys the application to a Kubernetes cluster using Helm
            // Example: Deploying a Helm chart with `helm upgrade --install`
            steps {
                sh 'helm upgrade --install myapp ./helm-chart'  
                echo "Application deployed to Kubernetes."
            }
        }
        stage('22 Artifact Upload') {
            // Uploads built artifacts to an artifact repository (e.g., Nexus, S3)
            // Example: Uploading a JAR file to Nexus
            steps {
                sh 'aws s3 cp build.jar s3://my-artifact-bucket/'  // Upload to S3
                // sh 'curl -u user:password -T build.jar https://nexus.example.com/repository/' // Upload to Nexus
                echo "Build artifact uploaded successfully."
            }
        }
        stage('23 Rollback Strategy') {
            // Defines steps to rollback in case of a failed deployment
            // Example: Reverting to a previous Kubernetes deployment or restoring an old artifact
            steps {
                script {
                    def deploymentStatus = sh(script: 'kubectl get deployment my-app -o jsonpath="{.status.availableReplicas}"', returnStdout: true).trim()
                    if (deploymentStatus == "0") {
                        echo "Deployment failed! Rolling back..."
                        sh 'kubectl rollout undo deployment my-app'  // Rollback Kubernetes deployment
                        // sh 'aws s3 cp s3://my-artifact-bucket/previous-build.jar build.jar' // Rollback artifact
                    } else {
                        echo "Deployment successful, no rollback needed."
                    }
=======
    agent any
        stages {
            stage ('First test') {
                steps{
                    sh 'echo "starting the pipeline"'
                    sh 'mkdir mrinalfolder'
                    echo 'test 5 worked'
                    
>>>>>>> parent of 83075ac (error handeling added)
                }
            }
        }
        stage('24 Send Notification') {
            // Notify Team (Slack, Email, etc.)
            // Sends notifications to the team via Slack, Email, or other services
            // Example: Sending a Slack message after the pipeline finishes
            steps {
                slackSend(channel: '#devops-alerts', message: "Pipeline execution completed!")  
                echo "Notification sent to the team."
            }
        }
    }
    post {
        always {
            // Runs no matter what (success, failure, aborted, or unstable)
            echo "Pipeline execution completed. Running cleanup tasks."
            sh 'rm -rf temp_files/' // Example: Cleaning up temporary files
        }

        success {
            // Executes only if the pipeline succeeds
            echo "Pipeline succeeded!"
            slackSend(channel: '#devops-alerts', message: "✅ Pipeline succeeded!") // Notify team
        }

        failure {
            // Executes only if the pipeline fails
            echo "Pipeline failed! Investigating issues..."
            sh 'cat logs/error.log' // Example: Display error logs
            slackSend(channel: '#devops-alerts', message: "❌ Pipeline failed! Check logs.") // Notify team
        }

        unstable {
            // Runs if the pipeline is marked as "unstable" (e.g., some tests failed)
            echo "Pipeline is unstable! Some tests might have failed."
            slackSend(channel: '#devops-alerts', message: "⚠️ Pipeline unstable! Check test reports.") // Notify team
        }

        changed {
            // Executes if the pipeline result changed from the previous run
            echo "Pipeline result changed from last execution!"
            slackSend(channel: '#devops-alerts', message: "🔄 Pipeline result changed!") // Notify team
        }

        aborted {
            // Runs if the pipeline was manually stopped or aborted
            echo "Pipeline was aborted by a user."
            slackSend(channel: '#devops-alerts', message: "⚠️ Pipeline aborted!") // Notify team
        }

        cleanup {
            // Used for final cleanup tasks, even after an aborted pipeline
            echo "Final cleanup tasks executing..."
            sh 'docker system prune -f' // Example: Remove unused Docker images
        }
    }
    Libraries {}
}
