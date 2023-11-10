Skeleton diagram of YAML 

![Untitled-Copy of Page-1](https://github.com/vedansh-377/GithubActionsDemo/assets/110664790/0e388d9a-c16c-4c98-addc-43bc89c1f3e6)

# GithubActionsDemo
Description about the steps in YAML:- 

Name  Deploy S3 Bucket

- **aws s3api create-bucket --bucket lex-demo-123 --region us-west-1 --create-bucket-configuration LocationConstraint=us-west-1**  : The aws s3api create-bucket command is used to create an Amazon S3 bucket via the AWS Command Line Interface (CLI)
  
**Breakdown**: aws s3api create-bucket: Initiates the command to create an S3 bucket.-bucket lex-demo-123: Specifies the name of the bucket to be created, in this case, "lex-demo-123". Replace this with your desired bucket name.
--region us-west-1: Specifies the AWS region where the bucket will be created, in this case, "us-west-1". Change this to your preferred region.

Name Upload Image to S3

-  **aws s3 cp WhiteSaucePasta.jpg s3://lex-demo-123**  :  The command aws s3 cp WhiteSaucePasta.jpg s3://lex-demo-123 is used to copy a file named WhiteSaucePasta.jpg from a github repo to an Amazon S3 bucket named lex-demo-123.

**Breakdown**: aws s3 cp: Initiates the command to copy files to and from Amazon S3.
WhiteSaucePasta.jpg: Specifies the file you want to copy. Replace this with the actual path to your file on your local system.
s3://lex-demo-123: Specifies the destination for the file. This is the Amazon S3 bucket named lex-demo-123. The file will be uploaded to this bucket.

Name Deploy Lambda fucntion 

- **aws lambda create-function --function-name PastaOrderFunction --runtime python3.8 --role arn:aws:iam::115941228118:role/service-role/PastaOrderFunction-role-kf02fxax --handler lambda_function.lambda_handler --zip-file fileb://PastaOrderFunction-195f7a38-883c-43a0-a8f3-007559e8df72.zip --region ap-northeast-3**

**Breakdown**: aws lambda create-function: Initiates the command to create an AWS Lambda function.
--function-name PastaOrderFunction: Specifies the name of the Lambda function to be created, in this case, "PastaOrderFunction". Replace this with your desired function name.
--runtime python3.8: Specifies the runtime for the Lambda function. In this case, it's using Python 3.8. Modify this according to the runtime you want.
--role arn:aws:iam::115941228118:role/service-role/PastaOrderFunction-role-kf02fxax: Specifies the Amazon Resource Name (ARN) of the IAM role that AWS Lambda assumes to execute the function. Replace this with the appropriate IAM role ARN.
--handler lambda_function.lambda_handler: Specifies the name of the method (handler) within your Lambda function that Lambda calls to start the execution. Adjust this based on your Lambda function structure.
--zip-file fileb://PastaOrderFunction-195f7a38-883c-43a0-a8f3-007559e8df72.zip: Specifies the location of the deployment package of the Lambda function. In this case, it's a ZIP file named "PastaOrderFunction-195f7a38-883c-43a0-a8f3-007559e8df72.zip".
--region ap-northeast-3: Specifies the AWS region where the Lambda function will be created, in this case, "ap-northeast-3". Adjust this to your preferred region.

Name : Export and lex bot in @artifacts

- **aws lexv2-models create-export --resource-specification "{\"botExportSpecification\": {\"botId\": \"ANSUSIV0FR\", \"botVersion\": \"1\"}}" --file-format LexJson --region us-east-1**

**Breakdown**: aws lexv2-models create-export: Initiates the command to create an export for an Amazon Lex V2 resource.
--resource-specification "{\"botExportSpecification\": {\"botId\": \"ANSUSIV0FR\", \"botVersion\": \"1\"}}": Specifies the resource specification for the export, including the bot ID and version.
--file-format LexJson: Specifies the format in which the exported data will be stored, in this case, Lex JSON format.
--region us-east-1: Specifies the AWS region where the export will be created, in this case, "us-east-1". Adjust this to your preferred region.

- **aws lexv2-models describe-export --export-id $export_id --region us-east-1**

  **Breakdown**: aws lexv2-models describe-export: Initiates the command to retrieve information about an export for an Amazon Lex V2 resource.
--export-id $export_id: Specifies the unique identifier (export ID) for the export you want to describe. The $export_id variable should be replaced with the actual export ID you are interested in.
--region us-east-1: Specifies the AWS region where the export is located, in this case, "us-east-1". Adjust this to match the region where your export resides.

  Name : Upload Bot, update and build the lex bot
- **aws lexv2-models create-upload-url --region us-east-1**: It will return **ImportId and UploadURL** 
- **aws lexv2-models start-import --import-id "$import_id" --resource-specification "{\"botImportSpecification\": {\"botName\": \"deploymentBot\",\"roleArn\": \"arn:aws:iam::115941228118:role/aws-servicerole/lexv2.amazonaws.com/AWSServiceRoleForLexV2Bots_ECVNQFI8F8M\",\"dataPrivacy\": {\"childDirected\": false},\"idleSessionTTLInSeconds\": 600}}" --merge-strategy "FailOnConflict" --region us-east-1**
: It will import the lex bot on aws 
- **aws lexv2-models describe-import --import-id "$import_id" --region us-east-1** : It will give the status of import of LEXBOT
# Now will configure the lambda function
- **aws lexv2-models update-bot-alias --bot-alias-id "$botAliasId" --bot-alias-name "$botAliasName" --bot-alias-locale-settings "{\"en_US\":{\"enabled\":true,\"codeHookSpecification\":{\"lambdaCodeHook\":{\"lambdaARN\":\"arn:aws:lambda:us-east-1:115941228118:function:PastaOrderFunction\",\"codeHookInterfaceVersion\":\"1.0\"}}}}" --bot-id "$botid" --bot-version "$botVersion" --region us-east-1**
: It will configure the lamda fucntion

- **aws lexv2-models build-bot-locale --bot-id "$botid" --bot-version "$botVersion" --locale-id "en_US" --region us-east-1** : It will the build the Lex Bot on  AWS console.


