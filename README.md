# RBP Launcher is an application which works in conjunction with Revit Batch Processor


The application enables the user to: 

- run multiple sessions of Revit Batch Processor concurrently in any number of processing groups
- define pre and post process for each processing group
- define an overall pre and post process


## Setup

RBP Launcher expects as an argument a fully qualified file path to a json file which defines the flow to be executed.

A flow consists of:

- list of over all pre scripts
- list of batch processor scripts
- list of post scripts

### Pre-Scripts

These scripts run at the very start of the flow, before any batch processor block is executed.

```json
"pre script": [
    {
      "python version": "IronPython",
      "script file path": "C:\\Users\\janchristel\\Documents\\GitHub\\SampleCodeRevitBatchProcessor\\VS\\RBP Launcher\\Tests\\PythonScripts\\empty.py",
      "script arguments": ""
    },
    {
      "python version": "IronPython",
      "script file path": "C:\\Users\\janchristel\\Documents\\GitHub\\SampleCodeRevitBatchProcessor\\VS\\RBP Launcher\\Tests\\PythonScripts\\no_args.py",
      "script arguments": ["arg1 value 1", "arg2 value 2"]
    }
  ]
```

Each pre script block consists of three arguments:

| key | values|
|-----|-------|
| "python version" | "IronPyhton" ( uses the latest iron python version installed ) or "3.10" to indicate c-python version 3.10 |
| "script file path" | Fully qualified file path to python script to be executed |
| "script arguments" | Can be blank "" or omitted, or a list of arguments: ["arg1 value 1", "arg2 value 2"] | 

### Batch Processor Script block

These are the Revit batch processor blocks to be executed. The blocks are executed in the order as defined in the .json file and each block will wait for the previous block to be finished before it starts.

```json
"batch processor scripts": [
    {
      "start_interval": 20,
      "pre script": {
        "python version": "IronPython",
        "script file path": "your\\path\\here\\test.py"
      },
      "post script": {
        "python version": "IronPython",
        "script file path": "your\\path\\here\\test.py"
      },
      "setting files": [
        "my/file/path",
        "my/file/path",
        "my/file/path"
      ]
    },
    {
      "start_interval": 20,
      "pre script": {
        "python version": "IronPython",
        "script file path": "your\\path\\here\\test.py"
      },
      "post script": {
        "python version": "3.10",
        "script file path": "your\\path\\here\\test.py"
      },
      "setting files": [
        "my/file/path",
        "my/file/path"
      ]
    }
  ]
```

Each batch processor script block consists of four arguments:

| key | values|
|-----|-------|
| "start_interval" | the time, in seconds, between start of batch processor instances |
| "pre script" | A pre - script block, executed before any batch processor session in this block is started |
| "post script" | A post - script block, executred after all batch processor sessions in this block are finished |
| "setting files" | A list of settings files, one for each instance of Revit Batch Processor to be started concurrently |

### Post-Scripts

These scripts run at the very end of the flow, after all batch processor block are executed.

```json
"post script": [
    {
      "python version": "3.10",
      "script file path": "your\\path\\here\\test.py"
    },
    {
      "python version": "3.10",
      "script file path": "your\\path\\here\\test.py",
      "script arguments": [ "arg1 value 1", "arg2 value 2" ]
    }
  ]
```

Each post script block consists of three arguments:

| key | values|
|-----|-------|
| "python version" | "IronPyhton" ( uses the latest iron python version installed ) or "3.10" to indicate c-python version 3.10 |
| "script file path" | Fully qualified file path to python script to be executed |
| "script arguments" | Can be blank "" or omitted, or a list of arguments: ["arg1 value 1", "arg2 value 2"] | 


### Complete samples

Using the samples above, a complete json file is shown below.

```json
{
  "pre script": [
    {
      "python version": "IronPython",
      "script file path": "your\\path\\here\\test.py",
      "script arguments": ""
    },
    {
      "python version": "IronPython",
      "script file path": "your\\path\\here\\test.py",
      "script arguments": ["arg1 value 1", "arg2 value 2"]
    }
  ],
  "batch processor scripts": [
    {
      "start_interval": 20,
      "pre script": {
        "python version": "IronPython",
        "script file path": "your\\path\\here\\test.py"
      },
      "post script": {
        "python version": "IronPython",
        "script file path": "your\\path\\here\\test.py"
      },
      "setting files": [
        "my/file/path",
        "my/file/path",
        "my/file/path"
      ]
    },
    {
      "start_interval": 20,
      "pre script": {
        "python version": "IronPython",
        "script file path": "your\\path\\here\\test.py"
      },
      "post script": {
        "python version": "3.10",
        "script file path": "your\\path\\here\\test.py"
      },
      "setting files": [
        "my/file/path",
        "my/file/path"
      ]
    }
  ],
  "post script": [
    {
      "python version": "3.10",
      "script file path": "your\\path\\here\\test.py"
    },
    {
      "python version": "3.10",
      "script file path": "your\\path\\here\\test.py",
      "script arguments": [ "arg1 value 1", "arg2 value 2" ]
    }
  ]
}
```

Note:

Pre and Post script nodes can be omitted. A minimal json file containing just a Revit Batchprocessor block sample:

```json
{
  "batch processor scripts": [
    {
      "start_interval": 20,
      "setting files": [
        "my/file/path",
        "my/file/path",
        "my/file/path"
      ]
    }
  ]
}
```
