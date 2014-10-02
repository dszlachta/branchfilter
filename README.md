branchfilter
============

Small shell utility to ease finding and switching git branches

Usage
-------------

`branchf STRING`

Branch Filter finds branches matching provided string and ask which one you
want to checkout to.

Example output
--------------

Single match:
``` 
branchf best
the_best_feature [Y/n]
```

Multiple matches:
```
branchf bug
1: stupid_bug_fixed
2: no_more_bugs
3: I_hate_bugs

Which one? _
```

Installation
------------

Clone this repo and execute `make`.


