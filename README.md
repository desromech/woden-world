# Woden World
#### An hyperlinked an open interactive 3D environment.
## Loading in Pharo:

The Woden World client package can be loaded on a standard Pharo 10 image by doing the following in a Playground:
```smalltalk
Metacello new
   baseline: 'WodenWorld';
   repository: 'github://desromech/woden-world';
   onConflictUseIncoming;
   load
```

See the **WDWorldExamples** class for examples on how to use the different client side APIs.
