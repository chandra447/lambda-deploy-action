#change this to yout image
FROM ghcr.io/chandra447/lambda-deploy:v1.2

#Set AWS credentials
ARG aws_access_key_id
ARG aws_secret_access_key
ARG aws_region

ENV AWS_ACCESS_KEY_ID=$aws_access_key_id
ENV AWS_SECRET_ACCESS_KEY=$aws_secret_access_key
ENV filenameordirectory deployment.py
ENV functionName test

#configure awscli with the passed in credentials
RUN aws configure set aws_access_key_id ${aws_access_key_id} && \
    aws configure set aws_secret_access_key ${aws_secret_access_key} && \
    aws configure set region ${aws_region}

# Copy the file which has to used
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#pass in the file name or directory
ENTRYPOINT ["/entrypoint.sh","-c","${filenameordirectory}","${functionName}"]



