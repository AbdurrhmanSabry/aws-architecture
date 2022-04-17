import json
import boto3
from datetime import datetime

def lambda_handler(event, context):
    
    ses = boto3.client('ses')
    environment = event['Records'][0]['s3']['object']['key']
    formatedTime =  datetime.now().strftime("%d/%m/%Y %H:%M:%S")
  
    if "dev" in environment:
        environmentName = "Development"
    elif "prod" in environment:
        environmentName = "Production"
    else: 
        environmentName = "Default"

    body = f"""
       There was a change to the following infrastructure in the following environment:
       {environmentName}
       that happened in the following time:
       {formatedTime}
        
    """

    ses.send_email(
       Source = 'exampla@exampla.com',
       Destination = {
           'ToAddresses': [
               'exampla@exampla.com'
           ]
       },
       Message = {
           'Subject': {
               'Data': 'Change in infastructure',
               'Charset': 'UTF-8'
           },
           'Body': {
               'Text':{
                   'Data': body,
                   'Charset': 'UTF-8'
               }
           }
       }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps(body)
    }
