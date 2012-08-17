## Local Development

Development of this codebase requires node.js. [Install it](http://nodejs.org/dist/v0.8.6/node-v0.8.6.pkg) if you don't have it already.

```make setup``` to install the dependencies.

```make build``` to compile the latest site from the```.coffee```, ```.styl``` and ```jade``` files.

```make watch``` to compile on file change during development.

``` make deploy``` to deploy the static site in ```public/``` S3.
