# Evolution of Automated Regression Testing of Software Systems Through the Graphical User Interface

```json
@inproceedings{91d97e711f3148938fa1f40b030e35e0,
title = "Evolution of Automated Regression Testing of Software Systems Through the Graphical User Interface",
abstract = "Increasing and more ubiquitous use of mobile and Web applications with graphical user interfaces (GUIs) places more stringent requirements on the software{\textquoteright}s quality. Automated testing is used to ensure the quality but testing through the software{\textquoteright}s GUI is challenging and therefore a research topic that has grown during the last decade. However, despite of the evolution of automated GUI-based testing methods and tools, its industrial adoption has been limited. In this paper, we present a synthesis of the evolution of GUI-based test automation and propose a classification for methods and tools for automated regression through the GUI.",
keywords = "Graphical user interface, automated GUI testing, software systems, classification, categorization, state-of-the-art",
author = "Pekka Aho and Emil Al{\'e}groth and Oliveira, {Rafael A. P} and Vos, {Tanja E. J.}",
year = "2016",
month = may,
language = "English",
isbn = "9781612084817",
pages = "16--21",
editor = "Sofiane Hamrioui and {Lloret Mauri}, Jaime",
booktitle = "ACCSE 2016",
publisher = "International Academy, Research, and Industry Association (IARIA)",
note = "First International Conference on Advances in Computation, Communications and Services , ACCSE 2016 ; Conference date: 22-05-2016 Through 26-05-2016",
}
```

## Introduction
manual gui-based testing is tedious laborious [1].  Requires lot of time. 

## Evolution

C&R (or R&R) one of the earliest method of GUI testing. Usally each test case is a session of manual interaction and has to be recorded separately. 
Next step in the evolution is automated GUI testing. Goal was to reuse parts of test cases to create new test cases and reduce maintenance effor. 
When MBT was introduced, it was adopted into automated GUI testing. 
MBGT (model-based GUI testing). First models were created manually and the used to create abstract test cases and generated abstract test scases have to be mapped or transformed into a lower level of abstraction to get concrete executable test cases than can be automatically executed against the SUT. Expertise of formal moddeling was required to work with the models. 

In recent years the model abstraction, also called model inference, has been widely used to automatd extract GUI models for testing purposes. With the work of [Ad Mulder] model intefence has been implemented into TESTAR. 

First static analysis on the, down side no dynamic behavior. Dynamic analysis use the interaction of the GUI 

 At the start model are created manually.  