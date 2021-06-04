pipeline {

    agent none

    stages {

        stage("build") {

            steps {
                echo 'building docker image'

                sh """
                    docker build ./ -t api-peliculas
                """
            }
        }
    }
}