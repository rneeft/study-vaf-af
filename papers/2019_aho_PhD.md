# AUTOMATED STATE MODEL EXTRACTION, TESTING AND CHANGE DETECTION THROUGH GRAPHICAL USER INTERFACE

```JSON
@phdthesis{1,
  author  = "Aho, Pekka",
  title   = "AUTOMATED STATE MODEL EXTRACTION, TESTING AND CHANGE DETECTION THROUGH GRAPHICAL USER INTERFACE",
  school  = "University of Oulu",
  year    = "2019"
}
```

In traditional MBGT, a model of the expected behaviour of the GUI is manually designed with a modelling tool. Then, a test case generation tool is used to generate either abstract or executable test cases from the model. The advantage of such manually created models is that the expected behaviour captured in the model enables generating system-specific automated test oracles.

GUI ripping (Memon, et al., 2003a) and other GUI model extraction or inference approaches, e.g., GUI Driver (Article I) and GuiTam (Miao & Yang, 2010), try to help in creating the GUI models for testing. There have been some static approaches based on source code analysis, but it is difficult to capture the dynamic behaviour of the GUI without executing it. Most dynamic approaches, e.g., GUI Driver (Article I)

When generating test cases from a model extracted from previous GUI version and executing them on the new version, the challenge is that the test cases will not test or notice any new parts of the GUI. The new parts were not in the extracted model, so they cannot be in the generated test cases either

Another challenge is that GUI models extracted from the implementation do not capture expected behaviour. Instead, they capture implemented behaviour that might contain errors, so using them for testing is not so easy or effective. It is difficult to generate good test oracles from extracted models, unless the models have been manually elaborated to include expected behaviour too.

### 1.1.3 Scriptless GUI testing
Random testing can be surprisingly effective. [1] but is can take a long time. biggest challenge is finding correct test oracle. other than crashes, unhandled exceptions or frozen application.

### 1.1.4 Automated GUI change analysis
instead of running test scripts from model of SUT version A in Version B create model voor SUT v1 en voor SUT v2. and compare the models. If changed a check need to take place too see whether the change was intentional or a bug. 
RQ 1

The proposed approach for automated change detection through GUI is
presented in Article IV.

### 1.1.5 Open issues and challenges in automated GUI testing
GUI is slower than unit test, each step you need to wait for the GUI to update [Article IX]

Test oracle's remains an issue  [Barr, Harman, McMinn, Shahbaz & Yoo, 2015].

When to stop testing. [Belli, 2001]

look-and-feel is hard to test. 

## Research questions
nodes are state, edges are actions. 

GUITAM -> GUI Test Automation Model.
HFSM: Hierarchical finite state machines

TESTAR tool generates concrete and abstract state identifiers by calculating a hash of selected widget properties (Rueda et al., 2016). Abstract state identifier is computed based only on Role property of each widget of the state, abstracting all the other widget properties. The abstraction is the same for all kinds of widgets, making it simple, allowing quick comparison, but inflexible.

widgets categorized: Article II
extra category: Articel III

### R2.2.2 RQ 2.2
Check Chapter 1.1.4, how automated change detection addresses the shortcomings of generating test cases from extracted GUI models (fig 2).

Extracted models are based on observed behaviour of an implemented system,
instead of requirement specifications or expected behaviour. Therefore, without elaboration, the extracted models are not well suited for generating test cases and test oracles, as in traditional model-based testing (MBT) (Article VII).

*Reference testing -> test oracles are based on the observed behaviour of an earlier verision of the GUI* 

Article II states that the ultimate goal for automated GUI modelling could be generating humanreadable graphical models containing enough information on a suitable level of abstraction to allow direct comparison to the requirements of the system.

## 3 Summary, conclusions and discussion

### 3.2 conclusions
Based on our results, we claim that dynamic analysis during automated GUI exploration can and should be used for automatically extracting state-based models through GUI of the application.

### 3.3 Furute work

[1] Böhme, M., & Paul, S. (2016). A probabilistic analysis of the efficiency of automated software testing. IEEE Transactions on Software Engineering, 42(4), 345-360. [7289448]. https://doi.org/10.1109/TSE.2015.2487274