------------------------------ MODULE RootSpec ------------------------------
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
\* Modification History
\* Last modified Fri Dec 01 13:21:19 CST 2023 by jbrinkmann
\* Created Fri Dec 01 13:13:20 CST 2023 by jbrinkmann
