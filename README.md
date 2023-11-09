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

Name 

