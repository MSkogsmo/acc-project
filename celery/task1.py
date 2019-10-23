import os
import time
from oct2py import octave 
from celery import Celery, group
import subprocess

env=os.environ
CELERY_BROKER_URL=env.get('CELERY_BROKER_URL','redis://localhost:6379'),
CELERY_RESULT_BACKEND=env.get('CELERY_RESULT_BACKEND','redis://localhost:6379')


celery= Celery('tasks',
                broker=CELERY_BROKER_URL,
                backend=CELERY_RESULT_BACKEND)


@celery.task(name='mytasks.add')
def add(x):
    result = subprocess.check_output('echo "tablee({})" | octave'.format(x), shell=True) 
    print(result)
    return result  

@celery.task()
def run_benchmark(problem,K,T,r,sig):
    """Run benchmark and return the result as a dictionary"""
    #import function run_methods from TTable.m
    filepaths, runtime, relerr =octave.TTable(problem,K,T,r,sig, nout=3)
    #https://stackoverflow.com/questions/952914/how-to-make-a-flat-list-out-of-list-of-lists
    runtime_list = [item for sublist in runtime.tolist() for item in sublist]
    relerr_list = [item for sublist in relerr.tolist() for item in sublist]
    #merge those three list into a dictionary
    d = {i[0]:list(i[1:]) for i in zip(filepaths,runtime_list, relerr_list)}
    d['problem'] = problem # add key 'problem' to the dictionary
    return d
    
