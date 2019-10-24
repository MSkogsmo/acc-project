import os
import time
from celery import Celery
import subprocess

env=os.environ
CELERY_BROKER_URL=env.get('CELERY_BROKER_URL','redis://localhost:6379'),
CELERY_RESULT_BACKEND=env.get('CELERY_RESULT_BACKEND','redis://localhost:6379')


celery= Celery('tasks',
                broker=CELERY_BROKER_URL,
                backend=CELERY_RESULT_BACKEND)


@celery.task(name='mytasks.benchmark')
def benchmark(x):
    result = subprocess.check_output('echo "tablee({})" | octave'.format(x), shell=True) 
    print(result)
    return result  
    
    
