 import json  
import boto3  
def lambda_handler(event, context):  
    variable=boto3.client('ec2')  
    instance=variable.describe_instances(Filters=[{'Name': 'tag:Name', 'Values': ['INSTANCES-1']}])  
    #instance=variable.describe_instances(Filters=[{'Name': 'instance-type', 'values':['stopped']}])  
    
    print("output is:",instance)  
    return {  
      'statusCode': 200,  
      'body': json.dumps("hello" )  
    }
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
         {'Reservations': [{'Groups': [],
            'Instances': [{'AmiLaunchIndex': 0,
            'ImageId': 'ami-051f0947e420652a9',
            'InstanceId': 'i-03e7cf9e407ff29b1',
            'InstanceType': 't2.micro',
            'KeyName': 'Jaga-singapore',
            'LaunchTime': datetime.datetime(2022, 9, 24, 17, 13, 53, tzinfo=tzlocal()),
            'Monitoring': {'State': 'disabled'},
            'Placement': {'AvailabilityZone': 'ap-southeast-1a',
        'GroupName': '',
        'Tenancy': 'default'},
            'PrivateDnsName': 'ip-172-31-41-253.ap-southeast-1.compute.internal',
            'PrivateIpAddress': '172.31.41.253',
            'ProductCodes': [],
            'PublicDnsName': 'ec2-13-212-200-33.ap-southeast-1.compute.amazonaws.com',
            'PublicIpAddress': '13.212.200.33',
            'State': {'Code': 16, 'Name': 'running'},
            'StateTransitionReason': '',
            'SubnetId': 'subnet-0c1651f2a0131e6c1',
            'VpcId': 'vpc-0d040263aa71e4833',
            'Architecture': 'x86_64',
            'BlockDeviceMappings': [{'DeviceName': '/dev/sda1', 'Ebs': {'AttachTime': datetime.datetime(2022, 9, 24, 17, 13, 54, tzinfo=tzlocal()), 'DeleteOnTermination': True, 'Status': 'attached', 'VolumeId': 'vol-0e7d0d890b123bfca'}}],
            'ClientToken': '',
            'EbsOptimized': False, 'EnaSupport': True,
            'Hypervisor': 'xen',
            'NetworkInterfaces': [{'Association': {'IpOwnerId': 'amazon', 'PublicDnsName': 'ec2-13-212-200-33.ap-southeast-1.compute.amazonaws.com', 'PublicIp': '13.212.200.33'},
            'Attachment': {'AttachTime': datetime.datetime(2022, 9, 24, 17, 13, 53, tzinfo=tzlocal()), 'AttachmentId': 'eni-attach-063cc09c476815a6d', 'DeleteOnTermination': True, 'DeviceIndex': 0, 'Status': 'attached', 'NetworkCardIndex': 0},
            'Description': '',
            'Groups': [{'GroupName': 'launch-wizard-2', 'GroupId': 'sg-0ce7c07564fd85d6c'}], 'Ipv6Addresses': [],
            'MacAddress': '06:29:dd:a7:05:e8',
            'NetworkInterfaceId': 'eni-02020a61f5aac0f1c',
            'OwnerId': '290657181642',
            'PrivateDnsName': 'ip-172-31-41-253.ap-southeast-1.compute.internal',
            'PrivateIpAddress': '172.31.41.253',
            'PrivateIpAddresses': [{'Association': {'IpOwnerId': 'amazon',
                                                    'PublicDnsName': 'ec2-13-212-200-33.ap-southeast-1.compute.amazonaws.com',
                                                    'PublicIp': '13.212.200.33'},
                                    'Primary': True,
                                    'PrivateDnsName': 'ip-172-31-41-253.ap-southeast-1.compute.internal',
                                    'PrivateIpAddress': '172.31.41.253'}],
            'SourceDestCheck': True,
            'Status': 'in-use',
            'SubnetId': 'subnet-0c1651f2a0131e6c1',
            'VpcId': 'vpc-0d040263aa71e4833',
            'InterfaceType': 'interface'}],
            'RootDeviceName': '/dev/sda1',
            'RootDeviceType': 'ebs',
            'SecurityGroups': [{'GroupName': 'launch-wizard-2',
            'GroupId': 'sg-0ce7c07564fd85d6c'}],
            'SourceDestCheck': True,
            'Tags': [{'Key': 'Name', 'Value': 'INSTANCES-1'}],
            'VirtualizationType': 'hvm',
            'CpuOptions': {'CoreCount': 1, 'ThreadsPerCore': 1},
            'CapacityReservationSpecification': {'CapacityReservationPreference': 'open'},
            'HibernationOptions': {'Configured': False},
            'MetadataOptions': {'State': 'applied',
                'HttpTokens': 'optional',
                'HttpPutResponseHopLimit': 1,
                'HttpEndpoint': 'enabled',
                'HttpProtocolIpv6': 'disabled',
                'InstanceMetadataTags': 'disabled'},
            'EnclaveOptions': {'Enabled': False},
            'PlatformDetails': 'Red Hat Enterprise Linux',
            'UsageOperation': 'RunInstances:0010',
            'UsageOperationUpdateTime': datetime.datetime(2022, 9, 24, 17, 13, 53, tzinfo=tzlocal()),
            'PrivateDnsNameOptions': {'HostnameType': 'ip-name',
                'EnableResourceNameDnsARecord': True,
                'EnableResourceNameDnsAAAARecord': False}}],
            'OwnerId': '290657181642',
            'ReservationId': 'r-06cf94e52ead02876'}],
        'ResponseMetadata': {'RequestId': 'f639c56e-2152-4c89-bbf7-9fd2de5419e6',
            'HTTPStatusCode': 200,
            'HTTPHeaders': {'x-amzn-requestid': 'f639c56e-2152-4c89-bbf7-9fd2de5419e6',
                'cache-control': 'no-cache, no-store',
                'strict-transport-security': 'max-age=31536000; includeSubDomains',
                'vary': 'accept-encoding',
                'content-type': 'text/xml;charset=UTF-8',
                'transfer-encoding': 'chunked',
                'date': 'Sat, 24 Sep 2022 18:33:27 GMT',
                'server': 'AmazonEC2'},
            'RetryAttempts': 0}
        }