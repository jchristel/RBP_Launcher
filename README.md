# RBP Launcher is an application which works in conjunction with Revit Batch Processor


The application enables the user to: 

- run multiple sessions of Revit Batch Processor concurrently in any number of processing groups
- define pre and post process for each processing group
- define an overall pre and post process


## Setup

RBP Launcher expects as an argument a fully qualified file path to a json file which defines the flow to be executed.

A flow consists of:

- list of over all pre script
- list of batch processor scripts
- list of post scripts

- 
