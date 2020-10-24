### Master thesis project description
- [Project description:](#project-description)
  - [Research questions](#research-questions)
  - [Current progress and problems](#current-progress-and-problems)
- [Background](#background)
  - [Why (Project usefulness)](#why-project-usefulness)
  - [Process design](#process-design)
    - [Fallacy of granular process](#fallacy-of-granular-process)
    - [Fallacy of coarse process](#fallacy-of-coarse-process)
    - [The "sweetspot"](#the-sweetspot)
  - [Resource conscious process design](#resource-conscious-process-design)
  - [Aim:](#aim)
    - [Primary Aim](#primary-aim)
    - [Secondary Aim](#secondary-aim)
  - [Concepts](#concepts)
    - [Petri net](#petri-net)
    - [Model simulation](#model-simulation)
      - [Discrete event simulation](#discrete-event-simulation)
      - [Parallel discrete event simulation](#parallel-discrete-event-simulation)
    - [Process design](#process-design-1)
      - [generic processes](#generic-processes)
      - [set of different](#set-of-different)
      - [resolvement strategies](#resolvement-strategies)
    - [Process analysis](#process-analysis)
      - [Performance analysis](#performance-analysis)
      - [Bottleneck analysis](#bottleneck-analysis)
  - [Tooling](#tooling)
    - [Simulation](#simulation)
      - [ABS](#abs)
      - [Colored Petri-nets (CPN)](#colored-petri-nets-cpn)
    - [Process mining tools](#process-mining-tools)
      - [PRoM](#prom)
      - [PM4PY](#pm4py)
      - [Apromore](#apromore)
  - [Related works](#related-works)
  - [Novelty](#novelty)
- [Deliverables](#deliverables)
  - [Method](#method)
  - [App](#app)
  - [Algorithm](#algorithm)
- [Definitions:](#definitions)
- [Resources](#resources)

 


## Project description:
   **Demonstrate how one can use process mining and model simulation to create more efficient process models that are resource aware.** This is made possible by exploring the relationship between resource availability and activity composition. 

**Resource aware?**  
Designing a process model without taking into account the dynamics of the environemnt in which it is deployed might lead to unforseen consequences. A process can be understood as a sequence of activities. An activity can be atomic or composed of multiple other activities. These activities often have strict depencencies on resources that are subject to change, such as human capital or machinery. Any change in the availability of one of these resources might lead to unwanted consequences, delays, or complete halts. By addressing this weakness we can not only plan and prepare for such an event, but even make conscious choices in our model design to outright avoid them.

**Problemspace:**  
Rigid and dependale process models can be a uvaluable tool in critical environments. They allow for strict planning and act as a source of reference for stakeholders, and structure complex activities. However, they can also lead to inefficiencies and lost profits due to this exact rigidness. 

Having a single process model designed to handle all scenarios is likely impossible. The undeniable trade-off of strict processes is that there might exist a scenario where the [process itself becomes counter-productive](#fallacy-of-strict-processes).

We can attempt to combat this flaw by desinging a [generic model](#generic-model) that covers many scenarios, or by having a [set of models](#set-of-models) that each have been designed to handle specific scenarios and then swapping them when the need arises.

>This project does not intend to solve the tremendous task of finding the perfect model, but rather provide a [tool](#app) that can be used to aid in the design of a single model or a set of models.

The best way to prepare for a future scenario is to run a simulation of it. While we cannot predict how the scenario will manifest itself in the real world, we can try to make safe assumptions about it. Exaguration might even be a useful quality. By preparing for the absolute worst scenario we can become more resilient to other scenarios that are not as extreme.

The result of this effort will be a web application that can be used to run simulations of process models generated from event logs. The primary feature of this application is that of resource awareness. By creating a direct relationship between some activity and its required resources, we can alter or create new model that is forced to conform to this restriction. The resulting model can then be tested by running a series of simulations on it. From these simulation we can deduce performance metrics that can then be used to impact model design.

    

    
### Research questions
   > strict RQs are in the works..


   The fundamental question that will be answered is:  
   1. What efficiency metrics can we expect when combining a process model **M** and a resource pool **P**.
      > This is intended to highlight activities that easily become bottlenecks, and also other activities that can become completely unavailable because of their strict dependency on some scarce resource.  
   **E.g:** A process is highly dependent on the availability of x-ray machines. What side effect might we expect if this resource suddenly becomes scarce, and the process flow remains the same?
   
This method will allow for the modeling of future scenarios, which can then be used to impact the design of the baseline process model.
> The model should be designed so that given a scneario **S**, then we would avoid unwanted consequences **C**.

*Perhaps the method could illustrate how one might dynamically change the high level process model based on day to day resource availability?*

The method will be demonstrated by use of mock scenarios. The primary scenario being that of clinical pathways in a hospital setting. Other well known project cases from literature will also be used as examples.

In a hospital setting we can assume that the primary aim is to provide quality services for the most amount of patients. I.e a fundamental performance problem that is not unique to this particular domain.
 
   > **TLDR**; reolve bottlenecks, optimize resource usage, and provide proof via simulation.

### Current progress and problems
Todos and otherwise are tracked [here](https://github.com/hpl002/Masters_Public/projects/1)

## Background
    
### Why (Project usefulness)

**Extract from initial proposal:**

> We can mention one example from treatment of age-related macular degeneration in the eye clinic at Haukeland University Hospital. By analyzing patient data, it was found that in some cases it takes less than 15 minutes to provide the necessary injection, and in other cases it takes as much as 45 minutes. **Based on the data, nurses were trained to handle the easy cases, while specialists handled the more complex cases. It reduced the workload for the specialists, and it was possible to provide services to more patients without compromising the quality.** With this arrangement of training nurses with responsibilities that requires relatively lower competence, it was possible to provide better services at reduced cost, as specialists could do more complex tasks. However, **there is a lack of tool support for this kind of careflow analysis in the hospital, even though it is very important for the management and planning of resources, and to improve the service quality.**

The tool could be used to help alleviate this bottleneck. Firstly we would model the current process model and run simulations on it to gather baseline  metrics. From this we would be able to locate the aforementioned bottleneck. We could then try to resolve the bottleneck by following one of the many different [resolvement strategies](#resolvement-strategies). For example, by breaking the task down into atomic tasks which can then be handled by less skilled workers. However, this would also require that we have the necessary resources for such a reorganization. By first creating a definition of our resource pool and then mapping these definitions to our activities we can get a understanding of what resources we have available. We can then reorganize accordingly, ensuring that we have the needed resources to fill the new activities, if not then this could lead to new issues.

We then run new process simulations on the model to gather new metrics which would allow us to quantify what effect the alteration had had. Through iteration we can find a model that resolves the initial issue, does not lead to new problems, and also is executable based on the resources that we have available.

### Process design

Process design and modeling is widespread and used in both business and academia. We therefore have techniques and specifications that are unique to their respective domain. In this project i not focus on a specific notation, but rather [petri nets](#petri-net).  

When designing a new process, should we aim to create a process that covers all scenarios and is very generic or should we aim to create a process that is very specific and covers a subset of scenarios with great detail.  

#### Fallacy of granular process

Process is so granular (detailed) that it allows for no flexibility. This hampers all efficiency the second some unaccounted event occurs. If one single activity stops then this can causes delays in all dependent activities.

 
#### Fallacy of coarse process
Process is so coarse (generic) that it allows for too much flexibility. This leads to unceirtanty and can make the process difficult to follow. Also leads to many altering process flows which then results in poor event logs. Having a ill defined process can have the same results as having no process definition at all.

 
#### The "sweetspot"
A perfect combination of granularity and coarseness is perhaps unobtainable, but the sweetspot is having granularity and flexibility where they are needed. Some activities need to be very detailed, while others rely on there being some flexibility. This knowledge is obtained through domain experience,trial, and error.




### Resource conscious process design


### Aim:

The project has two aims, these are:

#### Primary Aim

Demonstrate how one can effectively use simulation and the notion of resource availability to create a more effective and less error-prone proces model. Error prone here being understood as a scenario where we have unwanted side effects because of poor model design and unexpexted .

#### Secondary Aim

Verify or dismiss the effect of the implemented model changes by running accurate simulations on the enhanced model.

> the “Achilles heel of process mining” is the fact that it is backward-looking. Process mining can be used to diagnose problems (e.g., bottlenecks or non-compliance) and predict the paths taken by running process instances (i.e., cases), but it cannot be used to answer “what if” questions and explore radical redesigns. Given the above, it is very natural to combine process mining and simulation [1].


### Concepts

#### Petri net
A petri net is one of several mathematical modelling languages used for describing distributed systems. Contraty to its more advanced descendants, petri nets are very basic and only model places and transitions.

#### Model simulation
##### Discrete event simulation
##### Parallel discrete event simulation

#### Process design
##### generic processes
##### set of different 
##### resolvement strategies
decompose a comlpex task into smaller atomic tasks  
add more resources  
move the task  
restructure the task  

 
#### Process analysis
##### Performance analysis
##### Bottleneck analysis



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
##### Apromore


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
### Method

TODO: visual model showing the different components of the method
      - process log
      - process analysis
      - model improvement
      - iteration:
      - model simulation
      - result analysis
TODO: rewrite method

The demonstrated method will require that i semantically annotate a process log. 

This log is then passed into the algorithm, which is the main artefact of this project.

The Algorithm takes a semantic process log, ontology, and resource model as input and returns two petri-nets.
1 - The original petri-net without any enhancements
2 - The modified petri-net with enhancements

We can then run process log on the original petri-net and collect performance metrics that will act as a benchmark.
We can then run a simulated process log on the modified petri-net and collect metrics that will be used to compare to the benchmark.

This is built on the assumption that one will be able to accurately and fairly simulate events that can be run on the new petri-net. There might be deviances from the created simulation and a real case scenario, this is unavoidable shortcoming. We cannot guarantee that the simulation matches a real life scneario, but i will research and employ existing techniques that attempt to combat this shortcoming.

### App
TODO: 
details about the app to be determined

### Algorithm
TODO: is there even an algo in the new project?
High level description:

1. Semantically annotate process log
2. Identify all bottleneck activities (Automatic Bottleneck Analysis)
   1.  Filter bottleneck activities (There are likely some bottlenecks which are not fit for decomposition, these should be removed)
3.  Intermediary step: Translate process log to petri net
4.  Decompose bottleneck activities into smaller sub-activities 
    1.  (Considerations: Resource availability, resource competences, resource cost)
    2.  Query ontology and get back sub-activities of bottleneck activity.
    3.  Here we should only decompose into activities that are actually available 
         - Cannot decompose into activity that does not have an available resource 
         - Cannot decompose into activity that requires some competence that the available resource does not have
         -  Results in a fitness measure: How far off are we from the optimal case?
         -  The optimal case being that we have all required resources available.
    4.  We want to create a optimal process model that respects the available resources and also cost.
5.  Make the discovered improvements to the petrinet.
6.  Return as petri-net model
 
 
 

## Definitions:

1. **Resource model**
   1. Here understood as a model that tracks all available resources in a hospital or department. In this context this will be limited to those resources which are explicitly relevant. E.g number of nurses, doctors, specialists,etc. Primarily human resources.
2. **Competence model**
   1. A model which defines what competences one needs to complete a given activity. This has a strong correlation to the ontology and might come in the form of an extension. E.g: The formal requirements to take a blood test vs perform surgery. 
3. **Clinica!l Pathway**
      1. Term which goes under many names.  
4. **Bottom-up process redesign**
   1. Redesigning some process by looking at process data 
5. **Top-down process redesign**
   1. Redesigning some process by looking at process documentation
      

## Resources

[ProcessMining.org](<https://[github.com/camunda](http://processmining.org/)>)  
[PM4PY](https://pm4py.fit.fraunhofer.de/)  
[BPMN Miner](https://github.com/hpl002/BPMN-Miner)

 

 