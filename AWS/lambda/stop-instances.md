import json  
import boto3  
def lambda_handler(event, context):  
    variable=boto3.client('ec2')  
    instance=variable.describe_instances(Filters=[{'Name': 'tag:Name', 'Values': ['INSTANCES-1']}])  
    #instance=variable.describe_instances(Filters=[{'Name': 'instance-type', 'values':['stopped']}])  
    id=[]  
    for i in instance['Reservations']:    
        for j in i['Instances']:  
            id.append(j['InstanceId'])     
    variable.stop_instances(InstanceIds=id)  
    return {  
      'statusCode': 200,  
      'body': json.dumps("instances stopped" )  
    }
