1.create s3 event in s3 settings ,and sent the event to lambda function which u want  (this is valid for both add and remove,just that u have to create event for put and pull)
2.back to lambda function,do the following changes  



from __future__ import print_function  
import json  
import boto3  
import time  
def lambda_handler(event, context):  
    path = []  
    print(event)                                              (# this is optional,i used it to see the event )    
    for items in event["Records"]:  
        if items["s3"]["object"]["key"] == "index.html":  
            path.append("/")  
        else:  
            path.append("/" + items["s3"]["object"]["key"])  
    print(path)  
    client = boto3.client('cloudfront')  
    invalidation = client.create_invalidation(DistributionId='E2VGAW95HGFR0P',         (#this is cloudfront distribution id)  
        InvalidationBatch={  
            'Paths': {  
                'Quantity': 1,  
                'Items': path  
        },  
        'CallerReference': str(time.time())  
    })  
