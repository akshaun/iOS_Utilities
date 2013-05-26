# iOS_Utilities #


This repository contains a grab bag of usefull classes and categories that I used in most of my projects.


## Stack Tracer ##

Stack tracer is a quick-and-dirty tool for answering the question "why is this method being called?"  Just drop the following line of code into the method in question...

	[[StackTracer sharedInstance] log:nil];

...and your log will show you a condensed stack trace as of the time of the call.