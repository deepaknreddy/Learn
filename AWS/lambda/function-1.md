when we are creating lambda function we give execution role as Create a new role with basic Lambda permissions (Lambda will create an execution role named <myFunctionName>-role-1s2ogcov, with permission to upload logs to Amazon CloudWatch Logs.)


import json  #this json not required for this program  

def lambda_handler(event, context):  
    #to learn lambda  
    if event['name']=='deepak':  
        return "its my name"  
    if event['weight']==56:  
        return("right weight")   


events:  
{  
  "name": "deepak",  
  "weight": 56  
}  

## result of test:  
A function update is still in progress so the invocation went to the previously deployed code and configuration.  

Test Event Name  
evevnt-1  

Response  
"its my name"  

Function Logs  
START RequestId: 781c737b-43d1-4503-9e12-e73565f11ce6 Version: $LATEST  
END RequestId: 781c737b-43d1-4503-9e12-e73565f11ce6  
REPORT RequestId: 781c737b-43d1-4503-9e12-e73565f11ce6	Duration: 0.88 ms	Billed Duration: 1 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 92.26 ms

Request ID  
781c737b-43d1-4503-9e12-e73565f11ce6

if you dont want anything in events give:  
{  
}
 

