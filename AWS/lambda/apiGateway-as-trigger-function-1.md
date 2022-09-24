api-gateway endpoint: https://p62oosd04j.execute-api.ap-southeast-1.amazonaws.com/default/api-function  
import json  
first_num=0  
sec_num=0  

def lambda_handler(event, context):  
    return {  
        'statusCode': 200,  
        'body': json.dumps(event)  
    } 
    
### this will show the input provided to the lambda function
    
    
---------------------------------------------------------------------    
    
    
    

#### to do the test ,by providing test events choose api-gateway templete,so you can see what type of value/input is provided for the event variable


----------------------------------------------------------------------------



### so now to pass input via api-gateway ,we can use postman to give input as get or post ... ,alternatively for the learning purpose i did add this to apigateway endpoint   
#### https://p62oosd04j.execute-api.ap-southeast-1.amazonaws.com/default/api-function?firsts_num=30&sec_num=30  
and modified functions to this,   so we got return as 
### 900

import json  
first_num=0  
sec_num=0  

def lambda_handler(event, context):  
    first_num=int(event['queryStringParameters']['firsts_num'])  
    sec_num=int(event['queryStringParameters']['sec_num'])  
    return {  
        'statusCode': 200,  
        'body': json.dumps(first_num*sec_num )   
    }
