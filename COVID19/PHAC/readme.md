# Overview

The Public Health Agency of Canada (PHAC) produced a mathematical model purporting to test the effects of delaying a second dose of COVID-19  vaccine in the setting of vaccine shortages. The model is described in a [MedXR article](https://www.medrxiv.org/content/medrxiv/early/2021/04/10/2021.04.07.21255094.full.pdf) although code is *not* given. However, the assumptions of the model are well stated, and in this subdirectory I will try to create a working approximation to their model.

I am entirely unsure how much effort (and *ability*) that I will be able to bring to this task, however.

## Overview of the model

The authors describe the model as having several characteristics:

- age-stratified
- deterministic
- compartmental

Let's deal with these areas and I'll record my initial thoughts:

### Age-stratified

I assume that this is the case for several reasons:

- age is clearly the most important factor overall in risks of COVID-19 
- there is a reasonable literature documenting its role (including Canada, whose data sources generally available usually have reasonable data in this regard; data about other comorbidities and factors (including, amazingly enough, *__sex__*) seem very hard to find.

Presumably, if there were more sources of information both in terms of disease incidence in relation to other factors and what the incidence of those factors is in Canada (again, this may be difficult to obtain).

### deterministic

A classic type of model in the 'modeling world'. What this means (I believe), is that this is not a probability based model but one that is dependent on the parameters it is given. Wikipedia's definition:

> A deterministic model is one in which every set of variable states is uniquely determined by parameters in the model and by sets of previous states of these variables; therefore, a deterministic model always performs the same way for a given set of initial conditions.

This seems a perfectly reasonable type of model to choose - certainly easier to code and analyze, perhaps less likely to mirror reality. It is *very* dependent on the parameters chosen.

### Compartmentalized

By this, I believe, the authors mean that they are keeping the analysis restricted to the groups they have defined, ignoring interactions *between* groups. To be honest, I am very uncomfortable with this aspect of the model as I think the very obvious fact is that there *are* interactions between the groups. I'll have to think about this more, and flesh it out more.

Basically, however, this is a *traditional* epidemiological model - one that results in a series of linear equations, rather than the stochastic models that seem to be gaining increasing favor and impetus in the world of epidemiology.


## Plan of attack

I have not formalized a plan at this point, but I do have an inchoate overall plan:

- obtain the base article
- extract the tables of information
    - save these
    - convert them to a useful format
- choose a language for coding (I suspect Python initially)
- BEGIN!


Certainly there are lots of additional choices that will have to be made, but it should, at least, be an *interesting* exercise.


