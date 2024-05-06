# LibchessEngine
A UCI compatible chess engine made using libchess. This is not meant to be tested for ELO, it is essentially a testbed for libchess development.

Shared hash table approach is in search-sht.cpp

Root splitting approach is in search-rs.cpp


search optimisations that are commented out; 
Killer Move Heuristic: This technique prioritizes moves that previously caused beta-cutoffs. (https://en.wikipedia.org/wiki/Killer_heuristic) 
Transposition Tables (TT): These tables store previously evaluated positions to avoid redundant calculations.
Late Move Reductions (LMR): This technique reduces the depth of less-promising moves.
Null Move Pruning: This technique assumes that if a side can afford to "pass" and still be fine, other moves should also be pruned.