 
**Table of contents**
- [Process reengineering by use of resource aware simulation](#process-reengineering-by-use-of-resource-aware-simulation)
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
  - [Aim:](#aim)
    - [Primary Aim](#primary-aim)
    - [Secondary Aim](#secondary-aim)
  - [Tooling](#tooling)
    - [Simulation software](#simulation-software)
      - [ABS](#abs)
      - [Colored Petri-nets (CPN)](#colored-petri-nets-cpn)
    - [Process mining tools](#process-mining-tools)
      - [PRoM](#prom)
      - [PM4PY](#pm4py)
  - [Related works](#related-works)
  - [Novelty](#novelty)
- [Deliverables](#deliverables)
  - [App](#app)
  - [ABS compiler](#abs-compiler)
- [Concepts:](#concepts)
  - [Process mining](#process-mining)
    - [Process reengineering](#process-reengineering)
    - [Petri net](#petri-net)
    - [Model simulation](#model-simulation)
    - [Process mining and simulation](#process-mining-and-simulation)
      - [Discrete event simulation](#discrete-event-simulation)
      - [Continuous simulation](#continuous-simulation)
      - [Parallel discrete event simulation](#parallel-discrete-event-simulation)
    - [Process analysis](#process-analysis)
      - [Performance analysis](#performance-analysis)
      - [Bottleneck analysis](#bottleneck-analysis)
      - [Key performance indicators (KPI)](#key-performance-indicators-kpi)
- [Definitions](#definitions)
- [Resources](#resources)

 ----
## Process reengineering by use of resource aware simulation
 
**Demonstrate how one can use process mining and model simulation to create more efficient process models by use of a simple web interface.** By simulating process flows we can get insights into process perforence before it is deployed in a real system. 

The project builds on the concept of [process reengineering](#process-reengineering) as put forth by Prof&#46;dr&#46;ir&#46; Wil van der Aalst, which uses the event log to enhance the process model.

"Through simulation experiments various “what if” questions can be answered and redesign alternatives can be compared with respect to key performance indicators." - [Source]((https://dl.acm.org/doi/pdf/10.5555/3275382.3275386))


**Resource aware?**  
Designing a process model without taking into account the dynamics of the environment in which it is deployed might lead to unforseen consequences. A process can be understood as a sequence of activities. An activity can be atomic or composed of multiple other activities. These activities often have strict depencencies on resources that are subject to change, such as human capital or machinery. Any change in the availability of one of these resources might lead to unwanted consequences such as delays and complete halts. Alternatively, having abundant resources will prevent the aforementioned, but lead to greater costs for the same throughput, i.e lower efficiencies. 

The ideal process lies within these two outer limits, ensuring the most amount of uptime and the least amount of wastage. This problem is addressed differently depending on how critial the throughput time is. 

By use of model simulation it is possible to finess the model compositon until it meets the required performance metrics.

The fundamental problem being that we create process models with the expectation that we always have the required resources to execute the modeled activities. In the event where these are not available then there will be delays and halts, and in the event where these are always available then there will be wastage. When processes become large and complex it can become very expensive to keep throwing resources at them to ensure uptime. 

In this project i will address this problem via a web application. More about this [here](#app)


**Main artefact**   

The main artefact of this project will be a web based tool that is used to bridge this gap between process mining and simulation. By making it easy to simulate a given process model we can gather performance metrics and get insights into potential issues before the model is deployed. 

**Problemspace:**  
Rigid and dependale process models are unvaluable tools in critical environments. They allow for strict planning and act as a source of reference for stakeholders and give structure to complex activities. However, they can also lead to inefficiencies and lost profits due to this exact rigidness. 

Having a single process model designed to handle all scenarios is likely impossible. The undeniable trade-off of [granular processes](#granular-process) is that there might exist a scenario where the [process itself becomes counter-productive](#fallacy-of-granular-processes). This can be combated by desinging a process which allows for more flexibility and is more generic, otherwise known as a [coarse process](#coarse-process). However, these also have their [downsides](#fallacy-of-coarse-process)


>This project does not intend to solve the tremendous task of finding the perfect model, but rather provide a [tool](#app) that can be used to aid in the design of a single model that is applicable to many scenarios, or a set of models that are applicable to a set of scenarios. 

    
### Research questions
   > strict RQs are in the works..
Current draft..:  
1. How can simulatons be used to verify the outcome of a process model?  
2. How can simulatons be used to improve a real life process model?  
3. What simulation algorithms exist, and what scenarios are they fit for?    
4. What process discovery algorithms exist, and what scenarios are they fit for?  

### Current progress and problems
Todos and otherwise are tracked [here](https://github.com/hpl002/Masters_Public/projects/1)

## Background
    
### Why (Project usefulness)

**Extract from initial proposal:**

> We can mention one example from treatment of age-related macular degeneration in the eye clinic at Haukeland University Hospital. By analyzing patient data, it was found that in some cases it takes less than 15 minutes to provide the necessary injection, and in other cases it takes as much as 45 minutes. **Based on the data, nurses were trained to handle the easy cases, while specialists handled the more complex cases. It reduced the workload for the specialists, and it was possible to provide services to more patients without compromising the quality.** With this arrangement of training nurses with responsibilities that requires relatively lower competence, it was possible to provide better services at reduced cost, as specialists could do more complex tasks. However, **there is a lack of tool support for this kind of careflow analysis in the hospital, even though it is very important for the management and planning of resources, and to improve the service quality.**

We can simplify this process into the following basic [petri net](#pretri-net):

![](./resources/PN-1.svg)

This process could be resolved by adding a two new actions. A classification action where it is determined if the patient is a demanding or a easy case. And secondly a treatment step where the easy cases can be handled. 

![](./resources/PN-2.svg)
 

> Provided that the process has been given a new a path we can expect improvements in the time spent in place P3 and P4. However, we now have to also consider the time spent to diagnose the patient in P2.


### Process design

Process design and modeling is widespread and used in both business and academia. We therefore have techniques and specifications that are unique to their respective domain. In this project i not focus on a specific notation, but rather [petri nets](#petri-net).  

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
Wide, flexible.  
Process is so coarse (generic) that it allows for too much flexibility. This leads to unceirtanty and can make the process difficult to follow. Also leads to many altering process flows which then results in poor event logs. Having a ill defined process can have the same results as having no process definition at all.

 
#### The "sweetspot"
A perfect combination of granularity and coarseness is perhaps unobtainable, but the sweetspot is having granularity and flexibility where they are needed. Some activities need to be very detailed, while others rely on there being some flexibility. This knowledge is obtained through domain experience,trial, and error.


### Aim:
The project has two aims, these are:
#### Primary Aim
Create a web based tool that allows for quick and easy simulation of process models in a interative manner.

#### Secondary Aim
Demonstrate how existing process models can be improved by use of the tool.  

Verify or dismiss the effect of the implemented model changes by running accurate simulations on the enhanced models.  

> ...the “Achilles heel of process mining” is the fact that it is backward-looking. Process mining can be used to diagnose problems (e.g., bottlenecks or non-compliance) and predict the paths taken by running process instances (i.e., cases), but it cannot be used to answer “what if” questions and explore radical redesigns. Given the above, it is very natural to combine process mining and simulation.   
> 
> Source: [PROCESS MINING AND SIMULATION: A MATCH MADE IN HEAVEN!](https://dl.acm.org/doi/pdf/10.5555/3275382.3275386)


### Tooling
#### Simulation software

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
> There exists multiple works on process mining and simulation. These run simulations on a extended version of petri nets, namely the [Colored Petri-net](https://en.wikipedia.org/wiki/Coloured_Petri_net).   


### Novelty 
The fundamental problem of process optimization is far from new. This is an issue with its own field devoted to it [Business Process Re-engineering](https://en.wikipedia.org/wiki/Business_process_re-engineering). 

## Deliverables  
### App
Feature set:
- Upload event log and translate this into a process model.
    - Allows for the user to select the process discovery algorithm to be used
  - Upload process model directly
- View the resulting petri net
- Edit the resulting petri net by adding or removing places or transitions
- Run simulation by selecting one of the available simulation methods
- Run process analysis that fetches key performance indicators (KPI)

> The web application is packaged in a easy to use interface that is designed for quick iteration. This again allows us to explore model alternatives with quick succession.


### ABS compiler
Translates a process model to something that can run on ABS.  
 

## Concepts:

  ### Process mining
  #### Process reengineering
  *Process Reengineering (PR): improving or extending the model based on event data. Like for conformance checking, both an event log and a process model are used as input. However, now the goal is not to diagnose differences. **The goal is to change the process model.** For example, it is possible to “repair” the model to better reflect reality. **It is also possible to enrich an existing process model with additional perspectives.** For example, replay techniques can be used to show bottlenecks or resource usage. **Process reengineering yields updated models.** These models can be used to improve the actual processes.* - Wil Van der Aalst
  [Source](https://www.researchgate.net/project/Responsible-Event-Driven-Process-Improvement-REDPI)


#### Petri net
A petri net is one of several mathematical modelling languages used for describing distributed systems. Contraty to its more advanced descendants, petri nets are very basic and only model places and transitions.

#### Model simulation
#### Process mining and simulation
the simulatons run on the model and share state witht the model. The simulations have direct effect on each other.

If we have some activity that has a capacity of 3 and then a fourth resource tries to start the activity then this hinderence must be reflected in simulation. 

Resource restrictions are implemented by use of delays.

A simulation is a continious flow throughe events, but at each event the state is delayed


How is the delay calculated?
How is the delay related to resource capacity?

An activity has a capacity



##### Discrete event simulation
  "... models the operation of a system as a discrete sequence of events in time. Each event occurs at a particular instant in time and marks a change of state in the sytem. Between the consecustive events, no change in the system is assumed to occur; thus the simulation can directly jump tot teh " - [source](https://en.wikipedia.org/wiki/Discrete-event_simulation)

##### Continuous simulation
https://en.wikipedia.org/wiki/Continuous_simulation

##### Parallel discrete event simulation

 

 
#### Process analysis
##### Performance analysis
##### Bottleneck analysis
##### Key performance indicators (KPI)

 
## Definitions  
**Bottom-up process redesign**
Redesigning some process by looking at process data 

**Top-down process redesign**
Redesigning some process by looking at process documentation            

## Resources
**Literature:**
1. [PROCESS MINING AND SIMULATION: A MATCH MADE IN HEAVEN!](https://dl.acm.org/doi/pdf/10.5555/3275382.3275386)  
2. [A Generic Framework for Context-AwareProcess Performance Analysis](https://www.researchgate.net/publication/309228794_A_Generic_Framework_for_Context-Aware_Process_Performance_Analysis)  
**Other:**  
1. [ProcessMining.org](<https://[github.com/camunda](http://processmining.org/)>)  
2. [PM4PY](https://pm4py.fit.fraunhofer.de/)  
3. [BPMN Miner](https://github.com/hpl002/BPMN-Miner)

 

 