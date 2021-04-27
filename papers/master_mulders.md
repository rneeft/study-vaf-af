# Inferring state models in TESTAR

```JSON
@phdthesis{1,
  author  = "Mulders, Ad",
  title   = "Inferring state models in TESTAR",
  school  = "The Open University of The Netherlands",
  year    = "2020"
}
```

Ad Mulders

Testar model based testing tool. Test application at GUI level. 

This thesis: State model generation in TESTAR 
abstraction level, using different combinations of Automation API's available attributes [71]
[71]

difficult to create deterministic state models. 

# chapter 1 Introduction

1.1 Graphical user interfaces.
[3] going into CI development

benefits for having a state model: 
- could be verified by expert
- comparing models between versions of the SUT
- can be used to generate better action selection

# main research questions
state modelling (literature study) and practices used in other academic tools
history in the field, history of testar

## Chapter 2

1 CR tools
2 Model based gui testing
3 automated model inference

application current state -> GUI at rest. 

24

[21] example for graduation project.

hashes are states. See Figure 3.2 on page 28

reference of conformance testing.

## Part II State models

state modelling -> Finite State Machine [10]. 

TESTAR terminology: vertces x1,x2 and x3 are called states while the transitions can be called action.
while testar executes, model is build dynamically. meaning that has to be able to correcly identifing the current state of the GUI and the actions it can execute. 

## 4.2 model implementation - a literature study

two caps: first paradigm: models are state based. state is the application at rest .transitions between states indentified as actions. **TESTAR** 

Second paradigm. 

Guitar [47]

state explosion is the main disadvantage in the state based paradigm. 

lack of context is biggest disadvantage in the event based paradigm. main reason is to prevent state explosion. 


## Chapter 5 Providing TESTAR with state modelling capabilities

**Global requirement**
*The model should allow for comparisons between multiple models of different versions of the same software application. This comparison should be possible both realtime/runtime as a test sequence is being executed and offline between two models as a whole.*


**The model should allow for the identification of unique states at a sufficient abstraction level. This means that the state space explosion is avoided, while simultaneously not too much of the traceability and truthfulness of the model [64] is lost.*

**=-> is it possible to improve this by adding hooks into the SUT??**

## Chapter 6 - Model quality and usefulness

Figure 6.1 gives a GREAT exmple of the non-deterministic state. Installing an application and clicking Cancel returns to the previous screen, since is different for each parent screen.

## chapter 7
