- [Project description:](#project-description)
- [Why (Project usefulness)](#why-project-usefulness)
- [Novelty](#novelty)
  - [Aim applied to scenario](#aim-applied-to-scenario)
  - [Aim:](#aim)
    - [Primary Aim](#primary-aim)
    - [Secondary Aim](#secondary-aim)
  - [Expansion](#expansion)
  - [Method](#method)
- [Algorithm](#algorithm)
- [Definitions:](#definitions)
- [Resources](#resources)

## Project description:
   Create an algorithm capable of creating a more effective process model provided a semantic process log, ontology, and resource model. This algorithm will be demonstrated on a hospital department setting. Here we will measure the performance of some existing careflow and compare this to the enhanced careflow, as outputted by the algorithm.

## Why (Project usefulness)

**Extract from initial proposal:**

> We can mention one example from treatment of age-related macular degeneration in the eye clinic at Haukeland University Hospital. By analyzing patient data, it was found that in some cases it takes less than 15 minutes to provide the necessary injection, and in other cases it takes as much as 45 minutes. **Based on the data, nurses were trained to handle the easy cases, while specialists handled the more complex cases. It reduced the workload for the specialists, and it was possible to provide services to more patients without compromising the quality.** With this arrangement of training nurses with responsibilities that requires relatively lower competence, it was possible to provide better services at reduced cost, as specialists could do more complex tasks. However, **there is a lack of tool support for this kind of careflow analysis in the hospital, even though it is very important for the management and planning of resources, and to improve the service quality.**

## Novelty 
**Pending verification**  
Thus far i confirm the following:  
There exists very few works on semantic enrichment of process logs.  
There exists very few works on automatic process model enhancements, and even fewer that take this semantic approach.  
There does not exist a work that investigates careflow enhancement with this process mining approach.  



### Aim applied to scenario

Locate bottlenecks in a care flow and resolve these by better utilizing the available resources.  
E.g: Highly specialized workers are assigned cases that demand this expertise, while less specialised worker are assigned the less demanding cases.


### Aim:

The project has two aims, these are:

#### Primary Aim

Demonstrate how one can semantically enhance a process log and then use this to decompose a overworked task into smaller fragments which can then be carried out by less specialized workers. The decomposing technique respects the required competence level of all sub-tasks and also available resources. Only sub-tasks that can be filled by available workers will be implemented.

#### Secondary Aim

Verify or dismiss the effect of the implemented model changes by running accurate simulations on the enhanced model.

> the “Achilles heel of process mining” is the fact that it is backward-looking. Process mining can be used to diagnose problems (e.g., bottlenecks or non-compliance) and predict the paths taken by running process instances (i.e., cases), but it cannot be used to answer “what if” questions and explore radical redesigns. Given the above, it is very natural to combine process mining and simulation. [1]


### Expansion

While splitting a larger activity into smaller sub-activities might alone increase efficiencies, we could also investigate if there are any obvious identifiers that separate the more demanding patient from the less demanding patients. 

> This is an expansion that i could investigate if the data allows it. Likely a very solvable classification problem.

### Method

The demonstrated method will require that i semantically annotate a process log. 

This log is then passed into the algorithm, which is the main artefact of this project.

The Algorithm takes a semantic process log, ontology, and resource model as input and returns two petri-nets.
1 - The original petri-net without any enhancements
2 - The modified petri-net with enhancements

We can then run process log on the original petri-net and collect performance metrics that will act as a benchmark.
We can then run a simulated process log on the modified petri-net and collect metrics that will be used to compare to the benchmark.

This is built on the assumption that one will be able to accurately and fairly simulate events that can be run on the new petri-net. There might be deviances from the created simulation and a real case scenario, this is unavoidable shortcoming. We cannot guarantee that the simulation matches a real life scneario, but i will research and employ existing techniques that attempt to combat this shortcoming.
 

## Algorithm
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
3. **Ontology**
   1. a way of showing the properties of a subject area and how they are related, by defining a set of concepts and categories that represent the subject - [Source](<https://en.wikipedia.org/wiki/Ontology_(information_science)>)
   2. The ontology will have to describe the relationship between a position (nurse / doctor / surgeon) and available activities.
   3. It will also need to encompass the sub-activities which a main activity is built of.

## Resources

[ProcessMining.org](<https://[github.com/camunda](http://processmining.org/)>)  
[PM4PY](https://pm4py.fit.fraunhofer.de/)  
[BPMN Miner](https://github.com/hpl002/BPMN-Miner)

 

 