# Public facing repository, Master.

## Project description:

Demonstrate how one can semantically enhance a process log and then use this to decompose a task into smaller fragments which can then be carried out by less specialized workers. This will result in better resource allocation and higher efficiencies.

### Extract from initial proposal:

> We can mention one example from treatment of age-related macular degeneration in the eye clinic at Haukeland University Hospital. By analyzing patient data, it was found that in some cases it takes less than 15 minutes to provide the necessary injection, and in other cases it takes as much as 45 minutes. Based on the data, nurses were trained to handle the easy cases, while specialists handled the more complex cases. It reduced the workload for the specialists, and it was possible to provide services to more patients without compromising the quality. With this arrangement of training nurses with responsibilities that requires relatively lower competence, it was possible to provide better services at reduced cost, as specialists could do more complex tasks. However, there is a lack of tool support for this kind of careflow analysis in the hospital, even though it is very important for the management and planning of resources, and to improve the service quality.

## Aim applied to scenario

Locate bottlenecks in a care flow and resolve these by better utilizing the available resources. E.g: Highly specialized workers are assigned cases that demand this expertise, while less specialised worker are assigned the less demanind cases.

## Mehod

The method will be demonstrated by performing an experiment using a mock scenario. This allows us us to gather performance metrics on a process model before and after implementing the model improvements.

These steps are structured and governed by a BPMN model which is run on Camunda (https://camunda.com/). Camunda allows us to create a strict BPMN model which governs the experiment, while also connecting activities to all events in the model. Each activtity can then have a custom interface attributed to it, thus streamlining the entire process model improvement activity.

## Limitations

Fully automating the process model activity will likely be difficult as this would require us to have some strict definition of what qualifies as a bottleneck, and we would also have to determine to what degree we want to decompose a task, while also respecting the available resources.
