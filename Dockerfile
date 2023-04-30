#change this to yout image
FROM ghcr.io/chandra447/lambda-deploy:v1.2

#Set AWS credentials
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_region

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV filenameordirectory deployment.py
ENV functionName test

#configure awscli with the passed in credentials
RUN aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID} && \
    aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} && \
    aws configure set region ${AWS_region}

# Copy the file which has to used
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#pass in the file name or directory
ENTRYPOINT ["/entrypoint.sh","-c","${filenameordirectory}","${functionName}"]



