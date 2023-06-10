#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-west-2"
    }
    stages {
        // stage("Create an EKS Cluster") {
        //     steps {
        //         script {
        //             dir('terraform') {
        //                 sh "terraform init -upgrade"
        //                 sh "terraform apply -auto-approve"
        //             }
        //         }
        //     }
        // }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name etsi-eks-cluster"
                        sh "kubectl apply -f etsi-deployment.yaml"
                        sh "kubectl apply -f etsi-service.yaml"
                    }
                }
            }
        }
    }
}