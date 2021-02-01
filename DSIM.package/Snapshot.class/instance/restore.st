accessing
restore
| a |
a := objects associations asArray.
 (a collect: #key) asArray elementsForwardIdentityTo: (a collect: #value) asArray