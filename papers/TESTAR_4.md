# testar – scriptless testing through graphical user interface

```JSON
@article{4,
author = {Vos, Tanja E. J. and Aho, Pekka and Pastor Ricos, Fernando and Rodriguez-Valdes, Olivia and Mulders, Ad},
title = {testar – scriptless testing through graphical user interface},
journal = {Software Testing, Verification and Reliability},
volume = {31},
number = {3},
pages = {e1771},
keywords = {test automation, graphical user interface, model inference, monkey testing, artificial intelligence},
doi = {https://doi.org/10.1002/stvr.1771},
url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/stvr.1771},
eprint = {https://onlinelibrary.wiley.com/doi/pdf/10.1002/stvr.1771},
note = {e1771 stvr.1771},
abstract = {Summary Covering all the possible paths of the graphical user interface (GUI) with test scripts would take too much effort and result in serious maintenance issues. We propose complementing scripted testing with scriptless test automation using the open-source testar tool. This paper gives a comprehensive overview of testar and its latest extensions together with the ongoing and future research. With this paper, we hope we can help and encourage other researchers to use testar for their GUI testing-related research and pave the way for an international research agenda in GUI testing built upon stable and open-source infrastructure.},
year = {2021}
}
```

## INTRODUCTION
Software systems are getting ever more completx
More platforms and devices to test
Due to CI testers do not have that much time for testing as previous
GUI testing is more challenging to automate [4]
GUI testing ofteen resulting beingi carried out manually which is a expensice and laborious task.
Manually recording or writing test sciprts for all the possible paths si too much effore and have serious maintenance issues [9,10,11,12,13]
TEST* is a scriptless approach for completely automated test generation. 

## SCRIPT-BASED GUI TEST AUTOMATION
[21] classification based on test automation on SUT

GUI testing based on pre-recorded scripts. Lots of maintainance. test oracle is correct behaviour of the recorded version. 

maintenance effort bad for return of 
investment ROI. 

**Test oracles -> check the correctness of any value in any specific state of the GUI.**

### 2.2
Model-Based GUI testing (MBGT). Requires a model of the GUI. Higher level of abstraction that the GUI itself. Modeling language is hard.

### 2.3
Some static approaches based on source code analysis, but it is difficult to capture dynamic behaviour of the GUI without executing it. 

## 3 scriptless gui test automation
Monkey testing -> randomy exercising a SUT by means of an automated test tool [47]. Test cases are generated each time during testing.
generated test not saved, only interested in sequences that find failures.
*This is the reason why scriptless testing does not require test case maintenance*
[48,47] explains two different types of test monkeys: 1)  dumb monnkeys, just test it randomly. 2) Smart monkeys, have basic understanding of the GUI -> may use model which guides them and help to make decisions as to which actions to execute. 

### 3.1
Big companies are using dub or ignoratn monkeys to test application and are able to find bugs. Not all researchers are convinced of the effectiveness and usefulness of random testing. 

*even the most effective testing technique is inefficient compared to random testing if generating a test case takes relatively too long.* conclusion from [64]

Challenge is random testing is the test oracle. Only did it crash or not. When a crash or error is found, it might result in a very long sequence of action of randomly distributed clicks. Hard to debug since, in thoery, the monkey can run for days. 

### 3.2 - Smart test monkeys
[66] found out that the time to create a crash is shorther when the monkey is aware of the enviornment aka see the widgets on the screen. 
can be done by technical API/ layouts and the widgets of the gui. Another way is image recognition. 

Smart monkeys usually need to have knowledge about the SUT. Give hte monkey a state diagram. but that goed long way toward model-based GUI testing. 

section 6.3 for more info

## 4 TESTAR
open source tool, automated testing wihtout scripts -> smart monkey testing tool. See figure 1 for the testar testing cycle. 

### 4.1 obtaining the GUI state
widgets are structured in a hierachy (figure 2). TESTAR interactes with the widgets through the accessibility APIs at the Operating System Level (which allow computer useage for people with disabilities). 
Those APIs gather information about each visible widget, TESTAR queries their property values. 

state, widget and action are taggable. Tags are pairs of (property name, value). 

### 4.2 deriving a set of actions
After having GUI's current state, testar will derive a set of availabel actions. Those actions are widgets that a user can do stuff with (page 11 under figure 5).

Actions in Testar are MouseMove, MouseDown and MouseUp. Also CompoundAction but that is a aggregate sequence of actions above. 

### 4.3 Select and execuite one of these actions. 
Default action of TESTAR is random selection. Having a set of action in the given state *s* say: A(s). Select one and end up in *s'*. Sequences are generated in s -a-> s' -a'-> s'' -a''-> ... etc. until stopping condition. Example is failure found. Or a limit in the sequence. (number_of_sequences) or (number_of_actions)

### 4.4 Representation of state and actions
stable id is assigende to each unique state and action. Abstraction fuction is configurable in test settings of TESTAR. ABX_prop { role, title, position, enabled}. Hash is created as ID

### 4.5 Evaluate the new states to find failures
TESTar has some build in oracles like a crash/freeze or a suspicious title in any of the GUI widgets. Or in WEB 404 etc. 
A tester can create oracles and create add them into the tool. 

### 4.6 Runtime execution and modes
Main class -> entry point. tester can define own protocol: *A TESTAR protocol is a Java class that is responsible for executing the different parts of test sequence loop as depicted in Figure 1. The code in the protocol class gets compiled at runtime.*

Four modes of runtime execution (the big buttons) see page 16.

### 4.7 Test results.
Different information is stored in folders: logs/screenshots/HTML report with flow of actions. Replayable sequences for the TESTAR program.

### 4.8 Comparing TESTAR to other similar tools
--

## 5 Addig memory to the monkey: state models.
only parts of the widget tree is put into the model that has been visited. Errors are also put into the model. Models might need to be validated for correctness. 
*When models are created for different versions of the same SUT, the difference between the versions can be detected by
comparing the models [67].* check section 5.3

### 5.1 Active learning of state models
models are like maps in the GUI. OrientDB. 

Top layer is an abstract state model of the SUT. built incrementally based on multiple test runs. 
Middle layer is a concrete state model of the SUT. change in application name of version will not  automatically update both layers. Concrete layer can not be attached to the abstract layers of two different models. 
Bottom layer -> management layer. Descrips TESTAR executions. 

each entity is either a node or an edge. Nodes in the abstract layer represents an abstract state
edges represetn abstract actions. 

abstract state and concreate state signifuy nothing more than the identiefier that is calculated by TESTAR for a givin visual state in the SUT. WHen all properties of a widget is used -> concrete stat identief. subset of properties used -> abstract state identifier. 
Management layer contains meta-information about a test run. 

Abstract layer is kept in memory for fast access. 

*An important part of inferring these abstract state models is selecting a suitable level of abstraction. If the level of abstraction is too low, the resulting abstract layer of the state model might have too many states to be practically useful. However, if the level of abstraction is too high, the model might become non-deterministic and therefore unpredictable, for example, when used for driving the action selection.*

### 5.2 Visualisation

TESTar comes with a custom state model visualisation. In the generated model (figure 10) runs are visible. Thumbs-ups means the test run was succesfull and deterministic (executed action always ended up in the same state).  Quicks indicates something is wrong or model is non-deterministric. 

Figure 11 shows a visualisation of the enitre state model graph. More information about he model can be viewed in a side panel. Down side is that the visualisation can become too big.

### 5.3 Model comparison for automated change detection
Must read: [67] Aho & al. 

### 5.4 Test adequacy indicators

### 5.5 Offline oracles
Offline oracles perform their evaluation on stored test data asynchonously after testing. on-the-fly or online oracles performs evaluation on the current state of the SUT during testing
Offline oracles -> queries to the graph database. Can test properties about (combined) test sequences. 

## 6 Adding intelligence to the monkey
more actions means bigger sequence space -> more time until crash
Challenge is to keep the search space as small as possible but as large as necessary for finding faults. Three action types:

- Deriving sensible actions: do an action on a widget that makes sence. Click on button, fill textbox with text etc. 
- Deriving top level actions: widget at the top of the layout hierachy are more likely to lead to actions. internally define property z-index is used. Higher z-indexes are higher on the stack
- Deriving new actions: look at the current state and compare with previous state. 

### 6.2 Filter actions
It is good to tell testar what not todo. Filtering will redurce save time during test execution. 
- Regular expression filter (see Example 7)
- Using the click-filter: during spy mode widgets are blacklisted. Make sure the correct abstract identifier is used.
- Programmatic filtering: Programmer add code to the SUT program so TESTAR will skip the widget.

### 6.3 Triggering Pre-specified actions
Something something has to be finished in order to enable TESTAR, for example a login screen. It is possible to use a compound action to setup a predefined action before testar will start testing. See Example 9 for Compund action.

### 6.4 Advanced Action Selection
For to do next is very important. 

- 6.4.1 Reinforcement-learning
Based on rewards and discount. If rewards for new actions is higher, learning the model goes into doing new actions.
- 6.4.2 Ant colony

(seems promising)
- 6.4.3 Evolving action selection mechanism
- 6.4.4 Prioritization and model-based search for unvisited actions

## 7 Industrail case studies

## 8 Future research directions

Appium used for mobile application [68]

## 9 Conclusions




