aws ssm put-parameter \
                --name GIT_SHA \
                --value ${GIT_SHA} \
                --type SecureString \
                --overwrite \
                --region ap-southeast-2
