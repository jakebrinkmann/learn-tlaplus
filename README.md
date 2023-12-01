# Learn TLA+

- [A Primer On Formal Verification And TLA+]
- [The TLA+ Toolbox]

[A Primer On Formal Verification And TLA+]: https://jack-vanlightly.com/blog/2023/10/10/a-primer-on-formal-verification-and-tla
[The TLA+ Toolbox]: https://lamport.azurewebsites.net/tla/toolbox.html


    git clone git@github.com:tlaplus/tlaplus.git
    git clone git@github.com:jackfoxy/SpecifyingSystemsWithContents.git

    brew tap homebrew/cask-versions
    brew install --cask tla-plus-toolbox

    open '/Applications/TLA+ Toolbox.app'


```tla
\* Filename: RootSpec.tla
------------------------------- MODULE RootSpec -------------------------------
EXTENDS Naturals


VARIABLES hour, minute, second

Init ==
    /\ hour = 0
    /\ minute = 0
    /\ second = 0

Tick ==
    /\ hour' = IF second = 59 /\ minute = 59
               THEN IF hour = 23
                    THEN 0
                    ELSE hour + 1
               ELSE hour
    /\ minute' = IF second = 59
                 THEN IF minute = 59
                      THEN 0
                      ELSE minute + 1
                 ELSE minute
    /\ second' = IF second = 59
                 THEN 0
                 ELSE second + 1

Next ==
    Tick


=============================================================================
```


```tla
\* Filename: ModelName/MC.tla
---- MODULE MC ----
EXTENDS RootSpec, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
SillyInvariant == second /= 30

----
=============================================================================
```
