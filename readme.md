 
**Table of contents**
- [Master thesis project description](#master-thesis-project-description)
  - [Research questions](#research-questions)
  - [Current progress and problems](#current-progress-and-problems)
- [Background](#background)
  - [Why (Project usefulness)](#why-project-usefulness)
  - [Process design](#process-design)
    - [Granular process](#granular-process)
    - [Coarse process](#coarse-process)
    - [Fallacy of granular process](#fallacy-of-granular-process)
    - [Fallacy of coarse process](#fallacy-of-coarse-process)
    - [The "sweetspot"](#the-sweetspot)
    - [Strategies](#strategies)
  - [Aim:](#aim)
    - [Primary Aim](#primary-aim)
    - [Secondary Aim](#secondary-aim)
  - [Tooling](#tooling)
    - [Simulation](#simulation)
      - [ABS](#abs)
      - [Colored Petri-nets (CPN)](#colored-petri-nets-cpn)
    - [Process mining tools](#process-mining-tools)
      - [PRoM](#prom)
      - [PM4PY](#pm4py)
  - [Related works](#related-works)
  - [Novelty](#novelty)
- [Deliverables](#deliverables)
  - [App](#app)
  - [Method](#method)
    - [Activity and resource mapping](#activity-and-resource-mapping)
    - [Simulations with resource dependencies](#simulations-with-resource-dependencies)
    - [Resource conformance through awareness](#resource-conformance-through-awareness)
  - [ABS compiler](#abs-compiler)
- [Examples](#examples)
- [Concepts and definitions:](#concepts-and-definitions)
    - [Petri net](#petri-net)
    - [Model simulation](#model-simulation)
      - [Discrete event simulation](#discrete-event-simulation)
      - [Parallel discrete event simulation](#parallel-discrete-event-simulation)
    - [Process design](#process-design-1)
      - [generic processes](#generic-processes)
      - [set of models](#set-of-models)
      - [resolvement strategies](#resolvement-strategies)
    - [Process analysis](#process-analysis)
      - [Performance analysis](#performance-analysis)
      - [Bottleneck analysis](#bottleneck-analysis)
      - [Clinical Pathway](#clinical-pathway)
      - [Bottom-up process redesign](#bottom-up-process-redesign)
      - [Top-down process redesign](#top-down-process-redesign)
- [Resources](#resources)

 ----
## Master thesis project description
**Demonstrate how one can use process mining and model simulation to create more efficient process models that are also resource aware.** This is made possible by exploring the relationship between resource availability, activity composition, model compostion, and simulation. 

> By introducing the notion of resource availability into model simulaton we can get a greater understanding of where there are too few resources and where there are too many. Thus hopefully reducing costs and increasing efficiency.

**Resource aware?**  
Designing a process model without taking into account the dynamics of the environment in which it is deployed might lead to unforseen consequences. A process can be understood as a sequence of activities. An activity can be atomic or composed of multiple other activities. These activities often have strict depencencies on resources that are subject to change, such as human capital or machinery. Any change in the availability of one of these resources might lead to unwanted consequences such as delays and complete halts. Alternatively, having abundant resources will prevent the aforementioned, but lead to lower efficiencies. 

The ideal process lies within these two outer limits, ensuring the most amount of uptime and the least amount of wastage. This problem is addressed differently depending on how critial the throughput time is. 

The fundamental problem being that we create process models with the expectation that we always have the required resources to execute the modeled activities. In the event where these are not available then there will be delays and halts, and in the event where these are always available then there will be wastage. When processes become large and complex it can become very expensive to keep throwing resources at them to ensure uptime. 

In this project i will address this problem via two methods:
1. [creating new process models via resource awareness](#resource-conformance-through-awareness)
   1. Aid the user in understanding the relationship between modeled activities and the resources that these consume. This allows us to test a new resource pool against a annotated model to see if they align. Here we are adressing questions such as:
      1. Where are resources of type T used in this model?
      2. Given a new resource pool P, how well does it align with my model?
         1. Are activities short staffed, and where?
         2. Are activities over staffed, and where?
         3. 
2. [Running simulations with resource restrictions](#simulations-with-resource-dependencies) allows for the creation of event logs that mock real world scenarios with varying resource availability. This again allows us to locate potential resource issues. Here we are adressing questions such as:  
   1. What effects will having too few of a resource have on my process flow? 
      1. To what extent is the throughput time increased?
      2. Where is it increased?
      3. Can this effect be mitigated by restructuring?
    
  The running of simulations that also have the notion of resources demand that the resource model has been annotated with activities and resources. This means that the method "steps" have to occur in the aforementioned order.



**Main artefact**   

The main artefact of this project will be a web based tool that is used to bridge this gap between process mining and simulation, while also including the notion of resource awareness. By making it easy to simulate a given process model we can gather performance metrics and get insights into potential issues before the model is deployed. [It has been shown that performance issues can be caused by a lack of resource capacity](#why-project-usefulness). We can therefore try to avoid these issues by addressing this resource availability when creating new models. 


**Problemspace:**  
Rigid and dependale process models are unvaluable tools in critical environments. They allow for strict planning and act as a source of reference for stakeholders and give structure to complex activities. However, they can also lead to inefficiencies and lost profits due to this exact rigidness. 

Having a single process model designed to handle all scenarios is likely impossible. The undeniable trade-off of [granular processes](#granular-process) is that there might exist a scenario where the [process itself becomes counter-productive](#fallacy-of-granular-processes). This can be combated by desinging a process which allows for more flexibility and is more generic, otherwise known as a [coarse process](#coarse-process). However, these also have their [downsides](#fallacy-of-coarse-process)


>This project does not intend to solve the tremendous task of finding the perfect model, but rather provide a [tool](#app) that can be used to aid in the design of a single model that is applicable to many scenarios, or a set of models that are applicable to a set of scenarios. 

The best way to prepare for a future scenario is to run a simulation of it. While we cannot predict how the scenario will manifest itself in the real world, we can try to make safe assumptions about it. Exaggeration might even be a useful quality. By preparing for worst case scenarios we can become more resilient to other scenarios that are not as extreme.

The result of this effort will be a web application that can be used to run simulations of process models generated from event logs. The primary feature of this application is that of resource awareness. By creating a direct relationship between some activity and its required resources, we can alter or create a new model that is forced to conform to this restriction. The resulting model can then be tested by running a series of simulations on it. From these simulation we can deduce performance metrics that can then be used to impact model design.

    

    
### Research questions
   > strict RQs are in the works..


   The fundamental question that will be answered is:  
   1. What efficiency metrics can we expect when combining a process model **M** and a resource pool **P**.
      > This is intended to highlight activities that easily become bottlenecks, and also other activities that can become completely unavailable because of their strict dependency on some scarce resource.  
   **E.g:** A process is highly dependent on the availability of x-ray machines. What side effect might we expect if this resource suddenly becomes scarce, and the process flow remains the same?
   
This method will allow for the modeling of future scenarios, which can then be used to impact the design of the baseline process model.

The method will be demonstrated by use of mock scenarios. The primary scenario being that of clinical pathways in a hospital setting. Other well known project cases from literature will also be used as examples.

In a hospital setting we can assume that the primary aim is to provide quality services for the most amount of patients. I.e a fundamental performance problem that is not unique to this particular domain.
 
   > **TLDR**; reolve bottlenecks, optimize resource usage, and provide proof via simulation.

### Current progress and problems
Todos and otherwise are tracked [here](https://github.com/hpl002/Masters_Public/projects/1)

## Background
    
### Why (Project usefulness)

**Extract from initial proposal:**

> We can mention one example from treatment of age-related macular degeneration in the eye clinic at Haukeland University Hospital. By analyzing patient data, it was found that in some cases it takes less than 15 minutes to provide the necessary injection, and in other cases it takes as much as 45 minutes. **Based on the data, nurses were trained to handle the easy cases, while specialists handled the more complex cases. It reduced the workload for the specialists, and it was possible to provide services to more patients without compromising the quality.** With this arrangement of training nurses with responsibilities that requires relatively lower competence, it was possible to provide better services at reduced cost, as specialists could do more complex tasks. However, **there is a lack of tool support for this kind of careflow analysis in the hospital, even though it is very important for the management and planning of resources, and to improve the service quality.**

The tool could be used to help alleviate this bottleneck. Firstly we would model the current process model and run simulations on it to gather baseline metrics. From this we would be able to locate the aforementioned bottleneck. We could then try to resolve the bottleneck by following one of the many different [resolvement strategies](#resolvement-strategies). For example, by breaking the task down into atomic tasks which can then be handled by less skilled workers, which are more abundant. 

However, this would also require that we have the necessary resources for such a reorganization. By first creating a definition of our resource pool and then mapping these definitions to our activities we can get a understanding of where our resources are utilized and what resources we have available. We can then reorganize accordingly, ensuring that we have the needed resources to fill the new activities, if not then this could lead to new issues.

We then run new process simulations on the model to gather new metrics which would allow us to quantify what effect the alteration have had. Through iteration we can find a model that resolves the initial issue, does not lead to new problems, and also is executable based on the resources that we have available.

### Process design

Process design and modeling is widespread and used in both business and academia. We therefore have techniques and specifications that are unique to their respective domain. In this project i not focus on a specific notation, but rather [petri nets](#petri-net).  

*When designing a new process, should we aim to create a process that covers all scenarios and is very generic or should we aim to create a process that is very specific and covers a subset of scenarios with great detail ?*  

#### Granular process
Also known as a narrow process.
Process with smaller pieces. Not flexible, but detailed.

#### Coarse process
Also known as a wide process.
Process with many large chunks. Not detailed, but flexible.

#### Fallacy of granular process
Narrow, detailed, rigid, strict.  
Process is so granular (detailed) that it allows for no flexibility. This hampers all efficiency the second some unaccounted event occurs. If one single activity stops then this can causes delays in all dependent activities.

 
#### Fallacy of coarse process
Wide, flexible, 
Process is so coarse (generic) that it allows for too much flexibility. This leads to unceirtanty and can make the process difficult to follow. Also leads to many altering process flows which then results in poor event logs. Having a ill defined process can have the same results as having no process definition at all.

 
#### The "sweetspot"
A perfect combination of granularity and coarseness is perhaps unobtainable, but the sweetspot is having granularity and flexibility where they are needed. Some activities need to be very detailed, while others rely on there being some flexibility. This knowledge is obtained through domain experience,trial, and error.

#### Strategies
Are there strategies which allow for the quick altering of processes. Perhaps a dynamic process.  
We could for example have a collection of processes which are very similar, but with slight alterations that reflect the change in need and resources.

One wide model vs set of narrow models. 
How easy and doable is it to change change resource modle. Can these be hotswapped? 



### Aim:
The project has two aims, these are:
#### Primary Aim
Demonstrate how one can effectively use simulation and the notion of resource availability to create a more effective and less error-prone proces models via selected example cases. Error prone here being understood as a scenario where we have unwanted side effects because of poor model design.
#### Secondary Aim
Verify or dismiss the effect of the implemented model changes by running accurate simulations on the enhanced models.
> the “Achilles heel of process mining” is the fact that it is backward-looking. Process mining can be used to diagnose problems (e.g., bottlenecks or non-compliance) and predict the paths taken by running process instances (i.e., cases), but it cannot be used to answer “what if” questions and explore radical redesigns. Given the above, it is very natural to combine process mining and simulation.   
> 
> Source: [PROCESS MINING AND SIMULATION: A MATCH MADE IN HEAVEN!](https://dl.acm.org/doi/pdf/10.5555/3275382.3275386)


### Tooling
TODO:
What efforts have been made with CPN?   
Why use ABS?  
what process mining tools exist  
#### Simulation
##### ABS
##### Colored Petri-nets (CPN)

#### Process mining tools
##### PRoM
##### PM4PY

### Related works
TODO: 
WHAT WORKS EXST ON PROCESS MINING AND SIMULATION     
DISCRETE EVENT SIMULATION  
NON-DISCRETE EVENT SIMULATION  
WORKS THAT USE ABS  
WORKS THAT USE CPN  
> There exists multiple works on process mining and simulation. These run simulations on an extended version of petri nets, namely the [Colored Petri-net](https://en.wikipedia.org/wiki/Coloured_Petri_net).   

WORKS ON MODELING PROCESS AVAILABILITY   

### Novelty 
The fundamental problem of process optimization is far from new. This is an issue with its own field devoted to it [Business Process Re-engineering](https://en.wikipedia.org/wiki/Business_process_re-engineering). 

## Deliverables  
### App
The web application acts as a framework and facilitator of these two methods. 
> simple app comprised of three containerized applications, a interface and two services.
1. A web interface
2. process mining service running Process Mining for Python(PM4PY)
3. simulation service running the core version of the Abstract Behavioral Specification(ABS)  


**Features:**
1. upload a process log and get this translated to a visual process model.
2. run simulation of this model and get back a event log
3. Create a list of activities and resources. Map resources to activities. Map activities to model events
4. get an overview of the resource usage of the model (what resources are being used and what activities are they being used in)
5. upload file containing updated resource availability and get notified if this breaches or conforms to the model
6. Upload file containing updated model and get notified if this breaches or conforms to the available resources
7. get back key performance indicators of the model (unsure if this calculation is universal for all models. If it requires finess to make it fit to ach model then its unfeasible)



### Method

#### Activity and resource mapping
Once the user has uploaded a event log, then they are presented with the resulting process model. Based on this model they are tasked with creating a set of disccrete activities which are then mapped to the modeled events. The user then creates a list of resource elements which are mapped to the activity. This results in the following relationship:

``` bash
Modeled event <- Activity(One or more) <- Resource(One or more)
```

> A single event can be comprised of one or multiple activities. A single activity can be comprised of one or multiple resources.


#### Simulations with resource dependencies
Make the connection between formal methods, simulation, and ABS.


The tool can be used to simulate a new process model. The resulting event log can then be analized in a external process mining tool such as PRoM or Fluxicon Disco.

1. Upload event log to application
2. Event log is translated to process model
3. User then has to perform [Activity and resource mapping](#activity-and-resource-mapping)
4. Process model is [compiled](ABS-compiler) into simulation that can run on ABS.
5. Simulation runs and a new process model is returned.
6. We perform our analysis, gather new knowledge, and reflect this in the improved process model.
7. We can then iterate the same procedure again to get a updated event log for our updated model.

#### Resource conformance through awareness
Here we use the application to create relationships between events, actions, and resources. With these relationships we can check that any new model is in accordance with our resource pool and vice versa.



### ABS compiler
Translates a process model to something that can run on ABS.  
 

## Examples
> demonstrate the usefulness of the proposed tool and its methods
 
 

## Concepts and definitions:
#### Petri net
A petri net is one of several mathematical modelling languages used for describing distributed systems. Contraty to its more advanced descendants, petri nets are very basic and only model places and transitions.

#### Model simulation
##### Discrete event simulation
##### Parallel discrete event simulation

#### Process design
##### generic processes
##### set of models
##### resolvement strategies
decompose a comlpex task into smaller atomic tasks  
add more resources  
move the task  
restructure the task  

 
#### Process analysis
##### Performance analysis
##### Bottleneck analysis

 
##### Clinical Pathway

##### Bottom-up process redesign
Redesigning some process by looking at process data 

##### Top-down process redesign
Redesigning some process by looking at process documentation            

## Resources
[PROCESS MINING AND SIMULATION: A MATCH MADE IN HEAVEN!](https://dl.acm.org/doi/pdf/10.5555/3275382.3275386)  
[ProcessMining.org](<https://[github.com/camunda](http://processmining.org/)>)  
[PM4PY](https://pm4py.fit.fraunhofer.de/)  
[BPMN Miner](https://github.com/hpl002/BPMN-Miner)

 

 