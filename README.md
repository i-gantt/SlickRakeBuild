SlickRakeBuild
==============

This is so slick! Run only builds relevant to changes! Developed for github and teamcity. Hypothetically, we could abstract the systems out. This approach could work given a typical commit (description + changed files) and a means to queue builds (either via api for immediate queuing, or output to a text file for subsequent execution).

Why?
====
* A CI system building a product of moderate size quickly encounters resource constraints on the build system. Packaging, full integration tests, deployment verification tests, can all take a significant amount of time. Traditionally, we solve this by throwing money at the build system or reducing the number of builds. (Tax vs cut?). Let's make that smarter.
* CI implementations implement build chains and triggers by configuration. This ties engineering process to a particular vendor, steals lollipops from children, and has no change control. Code is better than configuration.
* Cause it's cool.

Why not?
========
* If you have automated tests that certify your product for deployment and run with guard, this approach is not for you.